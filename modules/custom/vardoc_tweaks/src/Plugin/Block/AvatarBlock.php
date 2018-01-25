<?php

/* 
 * Avatar blcok content
 *
 */
namespace Drupal\vardoc_tweaks\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Session\AccountInterface;
use Drupal\Core\Access\AccessResult;
/**
 * Provides a Vardoc 'Avatar' block
 * 
 * @Block(
 *    id = "avatar_block",
 *    admin_label = @Translation("Avatar Block"),
 *    category = @Translation("Blocks")
 * )
 */
class AvatarBlock extends BlockBase {
  public function build() {
    return [
      '#theme' => 'vardoc_user_avatar_block',
      '#content' => '/' . drupal_get_path('module', 'vardoc_tweaks') . '/images/avatar.png'
    ];
  }

  /**
   * {@inheritdoc}
   */
  protected function blockAccess(AccountInterface $account) {
    //Show this block only for anonymous users
    return $account->isAnonymous() ? AccessResult::allowed() : AccessResult::forbidden();
  }
}
