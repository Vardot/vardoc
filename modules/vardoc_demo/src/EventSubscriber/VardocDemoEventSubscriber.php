<?php

namespace Drupal\vardoc_demo\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Drupal\default_content\Event\ImportEvent;
use Drupal\default_content\Event\DefaultContentEvents;

/**
 * Subscribe to ImportEvent.
 */
class VardocDemoEventSubscriber implements EventSubscriberInterface {

  /**
   * {@inheritdoc}
   */
  public static function getSubscribedEvents() {
    $events[DefaultContentEvents::IMPORT][] = ['handleBookContent'];
    return $events;
  }

  public function handleBookContent(ImportEvent $event) {
    $books = [
      "ba9896a6-2cab-450c-858a-42fd1f3b76c3" => [
        "pid" => 0,
        "bid" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "has_children" => 1,
        "weight" => 0,
        "depth" => 1,
        "p1" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "p2" => 0,
        "p3" => 0, "p4" => 0, "p5" => 0, "p6" => 0, "p7" => 0, "p8" => 0, "p9" => 0,
      ],
      "3d2716bb-f0f5-4930-ba43-a991af39d86e" => [
        "pid" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "bid" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "has_children" => 0,
        "weight" => 0,
        "depth" => 2,
        "p1" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "p2" => "3d2716bb-f0f5-4930-ba43-a991af39d86e",
        "p3" => 0, "p4" => 0, "p5" => 0, "p6" => 0, "p7" => 0, "p8" => 0, "p9" => 0,
      ],
      "14966d6e-b69e-4faa-bd3a-55362a8db656" => [
        "pid" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "bid" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "has_children" => 0,
        "weight" => 0,
        "depth" => 2,
        "p1" => "ba9896a6-2cab-450c-858a-42fd1f3b76c3",
        "p2" => "14966d6e-b69e-4faa-bd3a-55362a8db656",
        "p3" => 0, "p4" => 0, "p5" => 0, "p6" => 0, "p7" => 0, "p8" => 0, "p9" => 0,
      ],
      "ca162646-c617-42fb-a8d6-a1117efc34a2" => [
        "pid" => 0,
        "bid" => "ca162646-c617-42fb-a8d6-a1117efc34a2",
        "has_children" => 0,
        "weight" => 0,
        "depth" => 1,
        "p1" => "ca162646-c617-42fb-a8d6-a1117efc34a2",
        "p2" => 0,
        "p3" => 0, "p4" => 0, "p5" => 0, "p6" => 0, "p7" => 0, "p8" => 0, "p9" => 0,
      ],
      "798f32ba-9943-4977-b3fd-32fc16fde9ef" => [
        "pid" => 0,
        "bid" => "798f32ba-9943-4977-b3fd-32fc16fde9ef",
        "has_children" => 0,
        "weight" => 0,
        "depth" => 1,
        "p1" => "ca162646-c617-42fb-a8d6-a1117efc34a2",
        "p2" => 0,
        "p3" => 0, "p4" => 0, "p5" => 0, "p6" => 0, "p7" => 0, "p8" => 0, "p9" => 0,
      ],
    ];

    $book_children = [];
    $entities = $event->getImportedEntities();
    $book_manager = \Drupal::service('book.manager');
    foreach ($entities as $uuid => $entity) {
      if ($entity->getEntityTypeId() == 'node' && book_type_is_allowed($entity->getType())) {
        if (array_key_exists ($uuid, $books)) {
          if ($books[$uuid]['bid'] == $uuid) {
            // Create a new book
            $new_book = $books[$uuid];
            $new_book['nid'] = $entity->id();
            $new_book['bid'] = $entity->id();
            $new_book['p1'] = $entity->id();
            $book_manager->saveBookLink($new_book, TRUE);
          }
          else {
            $book_children[$uuid] = $entity;
          }
        }
      }
    }

    foreach ($book_children as $child_uuid => $child_book) {
      // Create a new book
      $new_book = $books[$child_uuid];
      $parent_book = $entities[$new_book['bid']];
      $parent_book_id = $parent_book->id();
      $new_book['nid'] = $child_book->id();
      $new_book['bid'] = $parent_book_id;
      $new_book['pid'] = $parent_book_id;
      $new_book['p1'] = $parent_book_id;
      $new_book['p2'] = $child_book->id();
      $book_manager->saveBookLink($new_book, TRUE);
    }
  }
}
