<?php

/**
 * @file
 * Contains Views hooks for Vardoc Groups.
 */

/**
 * Implements hook_views_data_alter().
 */
function vardoc_groups_views_data_alter(array &$data) {
  // Where UID passed as an argument for a member in Group content.
  $data['groups']['group_membership'] = [
    'group' => t('Group Content'),
    'title' => t('User is member'),
    'help' => t('User is member of the group'),
    'argument' => [
      'field' => 'uid',
      'name table' => 'group_content_field_data',
      'name field' => 'name',
      'id' => 'group_content_user_uid',
      'no group by' => TRUE,
    ],
  ];
}
