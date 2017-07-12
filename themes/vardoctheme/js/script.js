/**
 * @file
 * Behaviors for the Vardoctheme theme.
 */

(function ($, _, Drupal, drupalSettings) {
  'use strict';

  Drupal.behaviors.VARDOCTHEME = {
    attach: function (context) {
      // vardoctheme JavaScript behaviors goes here.
    }
  };

  Drupal.behaviors.vartheme_subtheme = {
  attach: function (context, settings) {
    $('#block-exposedformbook-searchpage-search form').submit(function () {
      if ($.trim($(".form-text").val()) === "") {
        return false;
      }
    });
  }
};

})(window.jQuery, window._, window.Drupal, window.drupalSettings);
