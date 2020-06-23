<?php

namespace Drupal\vardoc_book;

use Drupal\Core\DependencyInjection\ContainerBuilder;
use Drupal\Core\DependencyInjection\ServiceProviderBase;
use Drupal\Core\DependencyInjection\ServiceProviderInterface;

/**
 * Defines a book outline which extends the core BookOutline class.
 */
class VardocBookServiceProvider extends ServiceProviderBase implements ServiceProviderInterface {

  /**
   * {@inheritdoc}
   */
  public function alter(ContainerBuilder $container) {
    $definition = $container->getDefinition('book.outline');
    $definition->setClass('Drupal\vardoc_book\VardocBookOutline');
  }

}
