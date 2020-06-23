<?php

namespace Drupal\vardoc_profile\Plugin\Menu;

use Drupal\views\Views;
use Drupal\Core\StringTranslation\TranslatableMarkup;
use Drupal\Core\Menu\MenuLinkDefault;
use Drupal\Core\Menu\StaticMenuLinkOverridesInterface;
use Drupal\Core\Session\AccountInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * A menu link that shows "Notifications" menu link.
 */
class NotificationsMenuLink extends MenuLinkDefault {

  /**
   * The current user.
   *
   * @var \Drupal\Core\Session\AccountInterface
   */
  protected $currentUser;

  /**
   * Constructs a new LoginLogoutMenuLink.
   *
   * @param array $configuration
   *   A configuration array containing information about the plugin instance.
   * @param string $plugin_id
   *   The plugin_id for the plugin instance.
   * @param mixed $plugin_definition
   *   The plugin implementation definition.
   * @param \Drupal\Core\Menu\StaticMenuLinkOverridesInterface $static_override
   *   The static override storage.
   * @param \Drupal\Core\Session\AccountInterface $current_user
   *   The current user.
   */
  public function __construct(array $configuration, $plugin_id, $plugin_definition, StaticMenuLinkOverridesInterface $static_override, AccountInterface $current_user) {
    parent::__construct($configuration, $plugin_id, $plugin_definition, $static_override);

    $this->currentUser = $current_user;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container, array $configuration, $plugin_id, $plugin_definition) {
    $plugin_definition['options']['attributes'] = ['class' => 'notifications'];

    return new static(
      $configuration,
      $plugin_id,
      $plugin_definition,
      $container->get('menu_link.static.overrides'),
      $container->get('current_user')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getTitle() {
    if ($this->currentUser->isAuthenticated()) {
      // Profile content notifications.
      $view = Views::getView('profile_content');
      $view->build('notifications');
      $count = $view->query->query()->countQuery()->execute()->fetchField();
      if ($count > 0) {
        $signular = 'There is @count new content item';
        $plural = 'There are @count new content items';
        $output = \Drupal::translation()->formatPlural($count, $signular, $plural, ['@count' => $count]);
      }
      else {
        $output = new TranslatableMarkup('No new content');
      }

      return $output;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function getCacheMaxAge() {
    // Execlude the notifications menu item from cache.
    return 0;
  }

}
