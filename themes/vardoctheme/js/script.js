/**
 * @file
 * Behaviors for the vardoctheme theme.
 */

(function ($, _, Drupal, drupalSettings) {
  'use strict';

  Drupal.behaviors.vardoctheme = {
    attach: function (context) {
      // Vartheme subtheme JavaScript behaviors goes here.

      $('#block-exposedformbook-searchpage-search form').submit(function () {
        if ($.trim($(".form-text").val()) === "") {
          return false;
        }
      });
    }
  };

})(window.jQuery, window._, window.Drupal, window.drupalSettings);
