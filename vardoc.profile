<?php

/**
 * @file
 * Enables modules and site configuration for a Vardoc site installation.
 */

 use Symfony\Component\Yaml\Yaml;
 use Drupal\Core\Form\FormStateInterface;
 use Drupal\vardoc\Config\ConfigBit;
 use Drupal\vardoc\Form\AssemblerForm;
 use Vardot\Entity\EntityDefinitionUpdateManager;
 use Drupal\path_alias\Entity\PathAlias;
 use Drupal\Component\Utility\Environment;

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function vardoc_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  // Add a placeholder as example that one can choose an arbitrary site name.
  $form['site_information']['site_name']['#attributes']['placeholder'] = t('My Official Site Name');

  // Default site email noreply(at)vardot.com.
  $form['site_information']['site_mail']['#default_value'] = 'noreply@vardot.com';
  $form['site_information']['site_mail']['#attributes']['style'] = 'width: 25em;';

  // Default user 1 username should be 'webmaster'.
  $form['admin_account']['account']['name']['#default_value'] = 'webmaster';
  $form['admin_account']['account']['name']['#attributes']['disabled'] = TRUE;
  $form['admin_account']['account']['mail']['#default_value'] = 'webmaster@vardot.com';
  $form['admin_account']['account']['mail']['#description'] = t('In most cases, and for <a target="_blank" href="@link">Vardot</a>’s specific use, we recommend this to always be <em>webmaster@vardot.com</em>.', ['@link' => 'http://vardot.com']);
}

/**
 * Implements hook_install_tasks().
 */
function vardoc_install_tasks(&$install_state) {
  return [
    'vardoc_extra_components' => [
      'display_name' => t('Extra components'),
      'display' => TRUE,
      'type' => 'form',
      'function' => AssemblerForm::class,
    ],
    'vardoc_assemble_extra_components' => [
      'display_name' => t('Assemble extra components'),
      'display' => TRUE,
      'type' => 'batch',
    ],
  ];
}

/**
 * Implements hook_install_tasks_alter().
 */
function vardoc_install_tasks_alter(array &$tasks, array $install_state) {

  // Skip select language step to install it in English as default language.
  unset($tasks['install_select_language']);
  unset($tasks['install_download_translation']);

  $tasks['install_finished']['function'] = 'vardoc_after_install_finished';
}

/**
 * Batch job to assemble vardoc extra components.
 *
 * @param array $install_state
 *   The current install state.
 *
 * @return array
 *   The batch job definition.
 */
function vardoc_assemble_extra_components(array &$install_state) {

  // Default vardoc components, which must be installed.
  $default_components = ConfigBit::getList('configbit/default.components.vardoc.bit.yml', 'install_default_components', TRUE, 'dependencies', 'profile', 'vardoc');

  $batch = [];

  // Install default components first.
  foreach ($default_components as $default_component) {
    $batch['operations'][] = [
      'vardoc_assemble_extra_component_then_install',
      (array) $default_component,
    ];
  }

  // Install selected extra features.
  $selected_extra_features = [];
  $selected_extra_features_configs = [];

  if (isset($install_state['vardoc']['extra_features_values'])) {
    $selected_extra_features = $install_state['vardoc']['extra_features_values'];
  }

  if (isset($install_state['vardoc']['extra_features_configs'])) {
    $selected_extra_features_configs = $install_state['vardoc']['extra_features_configs'];
  }

  // Get the list of extra features config bits.
  $extraFeatures = ConfigBit::getList('configbit/extra.components.vardoc.bit.yml', 'show_extra_components', TRUE, 'dependencies', 'profile', 'vardoc');

  // If we do have selected extra features.
  if (count($selected_extra_features) && count($extraFeatures)) {
    // Have batch processes for each selected extra features.
    foreach ($selected_extra_features as $extra_feature_key => $extra_feature_checked) {
      if ($extra_feature_checked) {

        // If the extra feature was a module and not enabled, then enable it.
        if (!\Drupal::moduleHandler()->moduleExists($extra_feature_key)) {
          // Add the checked extra feature to the batch process to be enabled.
          $batch['operations'][] = [
            'vardoc_assemble_extra_component_then_install',
            (array) $extra_feature_key,
          ];
        }

        if (count($selected_extra_features_configs) &&
            isset($extraFeatures[$extra_feature_key]['config_form']) &&
            $extraFeatures[$extra_feature_key]['config_form'] == TRUE &&
            isset($extraFeatures[$extra_feature_key]['formbit'])) {

          $formbit_file_name = \Drupal::service('extension.list.profile')->getPath('vardoc') . '/' . $extraFeatures[$extra_feature_key]['formbit'];

          if (file_exists($formbit_file_name)) {

            // Added the selected extra feature configs to the batch process
            // with the same function name in the formbit.
            $batch['operations'][] = ['vardoc_save_editable_config_values',
              (array) [
                $extra_feature_key,
                $formbit_file_name,
                $selected_extra_features_configs,
              ],
            ];
          }
        }
      }
    }

    // Hide Wornings and status messages.
    $batch['operations'][] = [
      'vardoc_hide_warning_and_status_messages',
      (array) TRUE,
    ];

    // Fix entity updates to clear up any mismatched entity.
    $batch['operations'][] = [
      'vardoc_fix_entity_update',
      (array) TRUE,
    ];
  }

  // Install selected Demo content.
  $selected_demo_content = [];
  $selected_demo_content_configs = [];

  if (isset($install_state['vardoc']['demo_content_values'])) {
    $selected_demo_content = $install_state['vardoc']['demo_content_values'];
  }

  if (isset($install_state['vardoc']['demo_content_configs'])) {
    $selected_demo_content_configs = $install_state['vardoc']['demo_content_configs'];
  }

  // Get the list of demo content config bits.
  $demoContent = ConfigBit::getList('configbit/demo.content.vardoc.bit.yml', 'show_demo', TRUE, 'dependencies', 'profile', 'vardoc');

  // If we do have demo_content and we have selected demo_content.
  if (count($selected_demo_content) && count($demoContent)) {
    // Have batch processes for each selected demo content.
    foreach ($selected_demo_content as $demo_content_key => $demo_content_checked) {
      if ($demo_content_checked) {

        // If the demo content was a module and not enabled, then enable it.
        if (!\Drupal::moduleHandler()->moduleExists($demo_content_key)) {
          // Add the checked demo content to the batch process to be enabled.
          $batch['operations'][] = [
            'vardoc_assemble_extra_component_then_install',
            (array) $demo_content_key,
          ];
        }

        if (count($selected_demo_content_configs) &&
            isset($demoContent[$demo_content_key]['config_form']) &&
            $demoContent[$demo_content_key]['config_form'] == TRUE &&
            isset($demoContent[$demo_content_key]['formbit'])) {

          $formbit_file_name = \Drupal::service('extension.list.profile')->getPath('vardoc') . '/' . $demoContent[$demo_content_key]['formbit'];
          if (file_exists($formbit_file_name)) {

            // Added the selected development configs to the batch process
            // with the same function name in the formbit.
            $batch['operations'][] = ['vardoc_save_editable_config_values',
              (array) [
                $demo_content_key,
                $formbit_file_name,
                $selected_demo_content_configs,
              ],
            ];
          }
        }
      }
    }

    // Hide warning and status messages.
    $batch['operations'][] = [
      'vardoc_hide_warning_and_status_messages',
      (array) TRUE,
    ];

    // Fix entity updates to clear up any mismatched entity.
    $batch['operations'][] = [
      'vardoc_fix_entity_update',
      (array) TRUE,
    ];

  }

  // Uninstall list of not needed modules after the config had been loaded.
  // To be loaded from a ConfigBit yml file.
  $uninstall_components = ['vardoc_default_content'];

  // Reset timestamp for default content.
  $batch['operations'][] = [
    'vardoc_reset_timestamp_for_default_content',
    (array) TRUE,
  ];

  if (count($uninstall_components) > 0) {
    foreach ($uninstall_components as $uninstall_component) {
      $batch['operations'][] = [
        'vardoc_uninstall_component',
        (array) $uninstall_component,
      ];
    }
  }

  return $batch;
}

/**
 * Batch function to assemble and install needed extra components.
 *
 * @param string|array $extra_component
 *   Name of the extra component.
 */
function vardoc_assemble_extra_component_then_install($extra_component) {
  \Drupal::service('module_installer')->install((array) $extra_component, TRUE);
}

/**
 * Batch function to save editable config values for extra components.
 *
 * @param string|array $extra_component_machine_name
 *   Machine name key of the extra component.
 * @param string|array $formbit_file_name
 *   FormBit file name.
 * @param string|array $editable_config_values
 *   Editable config values.
 */
function vardoc_save_editable_config_values($extra_component_machine_name, $formbit_file_name, $editable_config_values) {
  include_once $formbit_file_name;
  call_user_func_array($extra_component_machine_name . "_submit_formbit", [$editable_config_values]);
}

/**
 * Batch function to fix entity updates to clear up any mismatched entity.
 *
 * Entity and/or field definitions, The following changes were detected in
 * the entity type and field definitions.
 *
 * @param string|array $entity_update
 *   To entity update or not.
 */
function vardoc_fix_entity_update($entity_update) {
  if ($entity_update) {
    \Drupal::classResolver()
      ->getInstanceFromDefinition(EntityDefinitionUpdateManager::class)
      ->applyUpdates();
  }
}


/**
 * Batch function to Install needed modules.
 *
 * @param string|array $install_component
 *   Name of the extra component.
 */
function vardoc_install_component($install_component) {
  if (!\Drupal::moduleHandler()->moduleExists($install_component)) {
    \Drupal::service('module_installer')->install([$install_component], FALSE);
  }
}

/**
 * Batch function to Uninstall list of not needed modules.
 *
 * After the config had been loaded.
 *
 * @param string|array $uninstall_component
 *   Name of the extra component.
 */
function vardoc_uninstall_component($uninstall_component) {
  if (\Drupal::moduleHandler()->moduleExists($uninstall_component)) {
    \Drupal::service('module_installer')->uninstall((array) $uninstall_component, FALSE);
  }
}

/**
 * Batch to reset timestamp for default content.
 *
 * @param string|array $reset
 *   To entity update or not.
 */
function vardoc_reset_timestamp_for_default_content($reset) {

  if ($reset) {
    // Reset timestamp for all file's default content.
    $file_storage = \Drupal::service('entity_type.manager')->getStorage('file');
    $file_ids = $file_storage->getQuery()->accessCheck(FALSE)->execute();
    if (isset($file_ids)
      && is_array($file_ids)
      && count($file_ids) > 0) {

      foreach ($file_ids as $fid) {
        $file = \Drupal::service('entity_type.manager')->getStorage('file')->load($fid);
        if (isset($file)) {
          $file->set('created', \Drupal::time()->getCurrentTime());
          $file->save();
        }
      }
    }

    // Reset timestamp for all Media's default content.
    $media_storage = \Drupal::service('entity_type.manager')->getStorage('media');
    $media_ids = $media_storage->getQuery()->accessCheck(FALSE)->execute();
    if (isset($media_ids)
      && is_array($media_ids)
      && count($media_ids) > 0) {

      foreach ($media_ids as $mid) {
        $media = \Drupal::service('entity_type.manager')->getStorage('media')->load($mid);
        if (isset($media)) {
          $media->set('created', \Drupal::time()->getCurrentTime());
          $media->save();
        }
      }
    }

    // Reset timestamp for all Node's default content.
    $node_storage = \Drupal::service('entity_type.manager')->getStorage('node');
    $node_ids = $node_storage->getQuery()->accessCheck(FALSE)->execute();
    if (isset($node_ids)
      && is_array($node_ids)
      && count($node_ids) > 0) {

      foreach ($node_ids as $nid) {
        $node = \Drupal::service('entity_type.manager')->getStorage('node')->load($nid);
        if (isset($node)) {
          $node->set('created', \Drupal::time()->getCurrentTime());
          $node->save();
        }
      }
    }
  }
}

/**
 * vardoc after install finished.
 *
 * Lunch auto vardoc Tour auto launch after install.
 *
 * @param array $install_state
 *   The current install state.
 *
 * @return array
 *   A renderable array with a redirect header.
 */
function vardoc_after_install_finished(array &$install_state) {

  // Mark all updates by the update helper checklist as successful on install.
  if (\Drupal::moduleHandler()->moduleExists('update_helper_checklist')) {
    $checkList = \Drupal::service('update_helper_checklist.update_checklist');
    $checkList->markAllUpdates();
  }

  // Entity updates to clear up any mismatched entity and/or field definitions
  // And Fix changes were detected in the entity type and field definitions.
  \Drupal::classResolver()
    ->getInstanceFromDefinition(EntityDefinitionUpdateManager::class)
    ->applyUpdates();

  // Full flash and clear cash and rebuilding newly created routes.
  // After install of extra modules by install: in the .info.yml files.
  // In vardoc profile and all vardoc components.
  // ---------------------------------------------------------------------------
  // * Necessary initialization for the entire system.
  // * Account for changed config by the end install.
  // * Flush all persistent caches.
  // * Flush asset file caches.
  // * Wipe the Twig PHP Storage cache.
  // * Rebuild module and theme data.
  // * Clear all plugin caches.
  // * Rebuild the menu router based on all rebuilt data.
  drupal_flush_all_caches();

  // Set front page to "/node".
  // Issue #3188641: Change the set front page to "/node" process from
  // using static node id to front page path by the alias.
  // https://www.drupal.org/project/vardoc_core/issues/3188641
  try {
    $alias_ids = \Drupal::entityQuery('path_alias')
      ->accessCheck(FALSE)
      ->condition('alias', '/node', '=')
      ->execute();

    if (count($alias_ids) > 0) {
      foreach ($alias_ids as $alias_id) {

        if (!(end($alias_ids))) {
          $path_alias = PathAlias::load($alias_id);
          $path_alias->delete();
        }
        else {
          $page_front_path = PathAlias::load($alias_id)->getPath();

          \Drupal::configFactory()->getEditable('system.site')
            ->set('page.front', $page_front_path)
            ->save();
        }
      }
    }
  }
  catch (\Exception $e) {
    \Drupal::messenger()->addError($e->getMessage());
  }

  global $base_url;

  // After install direction.
  $after_install_direction = $base_url . '/?tour=1&welcome=done';

  install_finished($install_state);
  $output = [];

  // Clear all messages.
  \Drupal::service('messenger')->deleteAll();

  $output = [
    '#title' => t('Vardoc'),
    'info' => [
      '#markup' => t('<p>Congratulations, you have installed Vardoc!</p><p>If you are not redirected to the front page in 5 seconds, Please <a href="@url">click here</a> to proceed to your installed site.</p>', [
        '@url' => $after_install_direction,
      ]),
    ],
    '#attached' => [
      'http_header' => [
        ['Cache-Control', 'no-cache'],
      ],
    ],
  ];

  $meta_redirect = [
    '#tag' => 'meta',
    '#attributes' => [
      'http-equiv' => 'refresh',
      'content' => '0;url=' . $after_install_direction,
    ],
  ];
  $output['#attached']['html_head'][] = [$meta_redirect, 'meta_redirect'];

  return $output;
}

/**
 * Batch function to hide warning messages.
 *
 * @param bool $hide
 *   To hide or not.
 */
function vardoc_hide_warning_and_status_messages($hide) {
  if ($hide && !isset($_SESSION['messages']['error'])) {
    unset($_SESSION['messages']);
  }
}

/**
 * Implements hook_toolbar_alter().
 */
function vardoc_toolbar_alter(&$items) {
  if (\Drupal::currentUser()->hasPermission('access toolbar')
    && !empty($items['admin_toolbar_tools'])) {
    $items['admin_toolbar_tools']['#attached']['library'][] = 'vardoc/toolbar.icon';
  }
}

/**
 * Implements hook_requirements().
 */
function vardoc_requirements($phase) {
  $requirements = [];
  $phpVersion = phpversion();
  $memoryLimit = ini_get('memory_limit');
  $maxExecutionTime = ini_get('max_execution_time');

  if ($phase === "install") {
    if (version_compare($phpVersion, "8.0", "<")) {
      $requirements['php'] = [
        'title' => t('PHP'),
        'description' => t('Your PHP installation is too old. It is recommended to upgrade to PHP version <b>%php_version</b> or higher for the best ongoing support. See <a href="http://php.net/supported-versions.php">PHP\'s version support documentation</a>', ['%php_version' => "8.0"]),
        'severity' => REQUIREMENT_WARNING,
      ];
    }

    if (!Environment::checkMemoryLimit(256, $memoryLimit)) {
      $requirements['php_memory_limit'] = [
        'title' => t('PHP memory limit'),
        'description' => t('Consider increasing your PHP memory limit to <b>%memory_recommended_limit</b> M to help prevent errors in the installation process.', ['%memory_recommended_limit' => 256]),
        'severity' => REQUIREMENT_WARNING,
      ];
    }

    if ($maxExecutionTime < 180) {
      $requirements['max_execution_time'] = [
        'title' => t('Recommended maximum execution time'),
        'description' => t('Your current setting for <b>max_execution_time</b> is less than <b>%recommended_max_execution_time</b>. Change your PHP settings or contact your server administrator to set it to the recommended value.', ['%recommended_max_execution_time' => 180]),
        'severity' => REQUIREMENT_WARNING,
      ];
    }

    if (!extension_loaded('yaml')) {
      $requirements['php_yaml_extension'] = [
        'title' => 'PHP YAML extension',
        'description' => t('The PHP YAML extension is not enabled. It is recommended that you enable the PHP YAML extension for your server.'),
        'severity' => REQUIREMENT_WARNING,
      ];
    }
  }

  return $requirements;
}

/**
 * Implements hook_preprocess_install_page().
 */
function vardoc_preprocess_install_page(&$variables) {
  // If you are accessing the value before it is written to configuration
  // during the installer use the $install_state global.
  global $install_state;
  $profile_name = 'vardoc';
  // If the profile has been selected return it.
  if (isset($install_state['parameters']['profile'])) {
    $profile_name = $install_state['parameters']['profile'];
  }

  $current_profile_path = \Drupal::service('extension.list.profile')->getPath($profile_name);
  // Profile logo.
  if (file_exists($current_profile_path . '/images/' . $profile_name . '-logo.png')) {
    $variables['profile_logo'] = base_path() . $current_profile_path . '/images/' . $profile_name . '-logo.png';
  }

  // Attach install page library.
  $variables['#attached']['library'][] = $profile_name . '/install_page';
}
