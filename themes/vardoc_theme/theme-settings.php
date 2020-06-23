<?php

/**
 * @file
 * theme-settings.php
 *
 * Provides theme settings for Bootstrap Barrio based themes when admin theme
 * is not.
 *
 * @see ./includes/settings.inc
 */

use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter().
 */
function vardoc_theme_form_system_theme_settings_alter(&$form, FormStateInterface $form_state, $form_id = NULL) {

  // General "alters" use a form id. Settings should not be set here. The only
  // thing useful about this is if you need to alter the form for the running
  // theme and *not* the theme setting.
  // @see http://drupal.org/node/943212
  if (isset($form_id)) {
    return;
  }

  // Email logo settings to be used with Varbase email.
  $form['email_logo'] = [
    '#type'     => 'details',
    '#title'    => t('Email Logo'),
    '#open' => FALSE,
  ];

  $form['email_logo']['email_logo_default'] = [
    "#type" => "checkbox",
    '#title'    => t('Use the logo supplied by the theme'),
    "#default_value" => theme_get_setting('email_logo_default'),
  ];

  $form['email_logo']['email_logo_settings'] = [
    "#type" => "container",
    '#states' => [
      "invisible" => [
        'input[name="email_logo_default"]' => [
          "checked" => TRUE,
        ],
      ],
    ],
  ];

  $form['email_logo']['email_logo_settings']["email_logo_path"] = [
    "#type" => "textfield",
    "#title" => "Path to custom logo",
    "#default_value" => theme_get_setting('email_logo_path'),
    "#description" => t("Examples: <code>@external-file</code>", ["@external-file" => "http://www.example.com/logo.png"]),
  ];

  $form['email_logo']['email_logo_settings']["email_logo_upload"] = [
    '#type'     => 'managed_file',
    "#title"    => t("Upload logo image"),
    "#description" => t("If you don't have direct file access to the server, use this field to upload your logo."),
    '#required' => FALSE,
    '#upload_location' => \Drupal::config('system.file')->get('default_scheme') . '://theme/email_logo/',
    '#default_value' => theme_get_setting('email_logo_upload'),
    '#upload_validators' => [
      'file_validate_extensions' => ['gif png jpg jpeg'],
    ],
  ];

  // Replace Barrio setting options with subtheme ones.
  $form['components']['navbar']['bootstrap_barrio_navbar_top_background']['#options'] = [
    'bg-primary' => t('Primary'),
    'bg-secondary' => t('Secondary'),
    'bg-light' => t('Light'),
    'bg-dark' => t('Dark'),
    'bg-white' => t('White'),
    'bg-transparent' => t('Transparent'),
  ];

  $form['components']['navbar']['bootstrap_barrio_navbar_background']['#options'] = [
    'bg-primary' => t('Primary'),
    'bg-secondary' => t('Secondary'),
    'bg-light' => t('Light'),
    'bg-dark' => t('Dark'),
    'bg-white' => t('White'),
    'bg-transparent' => t('Transparent'),
  ];
}
