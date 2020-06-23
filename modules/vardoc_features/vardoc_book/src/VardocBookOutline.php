<?php

namespace Drupal\vardoc_book;

use Drupal\book\BookOutline;

/**
 * Override BookOutline service.
 */
class VardocBookOutline extends BookOutline {

  /**
   * Override Drupal\book\BookOutline childrenLinks to hide the Book Outline from book pages.
   *
   * @param array $book_link
   *   A fully loaded book link that is part of the book hierarchy.
   *
   * @return array
   *   HTML for the links to the child pages of the current page.
   */
  public function childrenLinks(array $book_link) {

    return '';
  }

}
