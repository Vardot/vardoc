<?php
/**
 * @file
 * Enables modules and site configuration for Vardoc profile
 * site installation.
 */

use Drupal\Core\Form\FormStateInterface;
use Drupal\language\Entity\ConfigurableLanguage;
use Drupal\varbase\Form\AssemblerForm;
use Drupal\varbase\Form\ConfigureMultilingualForm;
use Drupal\varbase\Config\ConfigBit;
use Drupal\vardoc\Form\VardocAssemblerForm;

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function vardoc_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  include_once \Drupal::root() . '/profiles/varbase/varbase.profile';
  varbase_form_install_configure_form_alter($form, $form_state);
}

/**
 * Implements hook_install_tasks().
 */
function vardoc_install_tasks(&$install_state) {
  include_once \Drupal::root() . '/profiles/varbase/varbase.profile';
  $install_tasks = varbase_install_tasks($install_state);
  $needs_configure_multilingual = FALSE;
  unset($install_tasks['varbase_multilingual_configuration_form']);
  unset($install_tasks['varbase_extra_components']);
  unset($install_tasks['varbase_assemble_extra_components']);
  
  $install_tasks['vardoc_extra_components'] = [
    'display_name' => t('Extra components'),
    'display' => TRUE,
    'type' => 'form',
    'function' => VardocAssemblerForm::class,
  ];
  $install_tasks['vardoc_assemble_extra_components'] = [
    'display_name' => t('Assemble extra components'),
    'display' => TRUE,
    'type' => 'batch',
  ];
       
  return $install_tasks;
}

/**
 * Implements hook_install_tasks_alter().
 */
function vardoc_install_tasks_alter(&$tasks, $install_state) {
  //Skip select language step to install it in English as default language
  unset($tasks['install_select_language']);
  unset($tasks['install_download_translation']);
}

/**
 * Batch job to assemble Varbase extra components.
 *
 * @param array $install_state
 *   The current install state.
 *
 * @return array
 *   The batch job definition.
 */
function vardoc_assemble_extra_components(array &$install_state) {
  include_once \Drupal::root() . '/profiles/varbase/varbase.profile';
    
  // Configbit root folder for vardoc profile.
  $configbit_root = \Drupal::root() . '/profiles/vardoc/configbit';
  
  // Default vardoc components, which must be installed.
  $default_components = ConfigBit::getList($configbit_root . '/default.components.varbase.bit.yml', 'install_default_components', TRUE, 'dependencies');

  // Selected extra components to be installed.
  $selected_extra_components = $install_state['vardoc']['extra_components'];

  $batch = array();

  // Install default components first.
  foreach ($default_components as $default_component) {
    $batch['operations'][] = ['varbase_assemble_extra_component_then_install', (array) $default_component];
  }

  // Install selected extra components.
  foreach ($selected_extra_components as $extra_component) {
    $batch['operations'][] = ['varbase_assemble_extra_component_then_install', (array) $extra_component];
  }

  // Hide Wornings and status messages.
  $batch['operations'][] = ['varbase_hide_warning_and_status_messages', (array) TRUE];

  // Fix entity updates to clear up any mismatched entity.
  $batch['operations'][] = ['varbase_fix_entity_update', (array) TRUE];

  return $batch;
}