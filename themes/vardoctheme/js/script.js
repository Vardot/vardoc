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
      // Adding the title attribute for the sharethis wrapper. 
      $('.sharethis-wrapper').attr('title', Drupal.t('Share'));
      // Hiding the notifications count when there are no notifications
      var count = $('.notifications-count a').text();
      if (count == 0) {
        $('.notifications-count').css ('display','none');
      }
    }
  };

})(window.jQuery, window._, window.Drupal, window.drupalSettings);
