<?php

namespace Drupal\vardoc\Form;

use Drupal\Core\Extension\ExtensionDiscovery;
use Drupal\Core\Extension\InfoParserInterface;
use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\StringTranslation\TranslationInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Drupal\varbase\Config\ConfigBit;
use Drupal\varbase\Form\FormHelper;
use Drupal\varbase\Form\AssemblerForm;

/**
 * Defines form for selecting extra compoennts for the assembler to install.
 */
class VardocAssemblerForm extends AssemblerForm {
  /**
   * Assembler Form constructor.
   *
   * @param string $root
   *   The Drupal application root.
   * @param InfoParserInterface $info_parser
   *   The info parser service.
   * @param TranslationInterface $translator
   *   The string translation service.
   * @param \Drupal\varbase\Form\FormHelper $form_helper
   *   The form helper.
   */
  public function __construct($root, InfoParserInterface $info_parser, TranslationInterface $translator, FormHelper $form_helper) {
    parent::__construct($root, $info_parser, $translator, $form_helper);
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return parent::create($container);
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'vardoc_extra_components';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state, array &$install_state = NULL) {
    $form['#title'] = $this->t('Extra components');
    $form['extra_components_introduction'] = [
      '#weight' => -1,
      '#prefix' => '<p>',
      '#markup' => $this->t("Select extra components, so that they will be assembled and installed."),
      '#suffix' => '</p>',
    ];
    $form['extra_components'] = [
      '#type' => 'checkboxes',
      '#weight' => 0,
      '#options' => array(),
    ];
    $form['actions'] = [
      'continue' => [
        '#type' => 'submit',
        '#value' => $this->t('Assemble and install'),
        '#button_type' => 'primary',
      ],
      '#type' => 'actions',
      '#weight' => 5,
    ];
    
    // Configbit root folder for varbase sub profile basic.
    $configbit_root = \Drupal::root() . '/profiles/vardoc/configbit';

    foreach ($this->getExtraComponentsInfo($configbit_root) as $key => $info) {
      $form['extra_components']['#options'][$key] = $info['name'];
    }
    
    // Default selected extra components.
    $form['extra_components']['#default_value'] = $this->getSelectedExtraComponents($configbit_root);

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $extra_components = $form_state->getValue('extra_components');
    $extra_components = array_filter($extra_components);
    $GLOBALS['install_state']['vardoc']['extra_components'] = $extra_components;
  }

}
