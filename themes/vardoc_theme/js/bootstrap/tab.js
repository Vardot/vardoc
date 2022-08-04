/*!
 * Bootstrap tab.js v4.4.1 (https://getbootstrap.com/)
 * Copyright 2011-2019 The Bootstrap Authors (https://github.com/twbs/bootstrap/graphs/contributors)
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 */
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined'
    ? (module.exports = factory(require('jquery'), require('./util.js')))
    : typeof define === 'function' && define.amd
    ? define(['jquery', './util.js'], factory)
    : ((global = global || self),
      (global.Tab = factory(global.jQuery, global.Util)));
})(this, function ($, Util) {
  $ = $ && $.hasOwnProperty('default') ? $.default : $;
  Util = Util && Util.hasOwnProperty('default') ? Util.default : Util;

  function _defineProperties(target, props) {
    for (let i = 0; i < props.length; i++) {
      const descriptor = props[i];
      descriptor.enumerable = descriptor.enumerable || false;
      descriptor.configurable = true;
      if ('value' in descriptor) descriptor.writable = true;
      Object.defineProperty(target, descriptor.key, descriptor);
    }
  }

  function _createClass(Constructor, protoProps, staticProps) {
    if (protoProps) _defineProperties(Constructor.prototype, protoProps);
    if (staticProps) _defineProperties(Constructor, staticProps);
    return Constructor;
  }

  /**
   * ------------------------------------------------------------------------
   * Constants
   * ------------------------------------------------------------------------
   */

  const NAME = 'tab';
  const VERSION = '4.4.1';
  const DATA_KEY = 'bs.tab';
  const EVENT_KEY = `.${DATA_KEY}`;
  const DATA_API_KEY = '.data-api';
  const JQUERY_NO_CONFLICT = $.fn[NAME];
  const Event = {
    HIDE: `hide${EVENT_KEY}`,
    HIDDEN: `hidden${EVENT_KEY}`,
    SHOW: `show${EVENT_KEY}`,
    SHOWN: `shown${EVENT_KEY}`,
    CLICK_DATA_API: `click${EVENT_KEY}${DATA_API_KEY}`,
  };
  const ClassName = {
    DROPDOWN_MENU: 'dropdown-menu',
    ACTIVE: 'active',
    DISABLED: 'disabled',
    FADE: 'fade',
    SHOW: 'show',
  };
  const Selector = {
    DROPDOWN: '.dropdown',
    NAV_LIST_GROUP: '.nav, .list-group',
    ACTIVE: '.active',
    ACTIVE_UL: '> li > .active',
    DATA_TOGGLE:
      '[data-toggle="tab"], [data-toggle="pill"], [data-toggle="list"]',
    DROPDOWN_TOGGLE: '.dropdown-toggle',
    DROPDOWN_ACTIVE_CHILD: '> .dropdown-menu .active',
  };
  /**
   * ------------------------------------------------------------------------
   * Class Definition
   * ------------------------------------------------------------------------
   */

  const Tab =
    /* #__PURE__ */
    (function () {
      function Tab(element) {
        this._element = element;
      } // Getters

      const _proto = Tab.prototype;

      // Public
      _proto.show = function show() {
        const _this = this;

        if (
          (this._element.parentNode &&
            this._element.parentNode.nodeType === Node.ELEMENT_NODE &&
            $(this._element).hasClass(ClassName.ACTIVE)) ||
          $(this._element).hasClass(ClassName.DISABLED)
        ) {
          return;
        }

        let target;
        let previous;
        const listElement = $(this._element).closest(
          Selector.NAV_LIST_GROUP,
        )[0];
        const selector = Util.getSelectorFromElement(this._element);

        if (listElement) {
          const itemSelector =
            listElement.nodeName === 'UL' || listElement.nodeName === 'OL'
              ? Selector.ACTIVE_UL
              : Selector.ACTIVE;
          previous = $.makeArray($(listElement).find(itemSelector));
          previous = previous[previous.length - 1];
        }

        const hideEvent = $.Event(Event.HIDE, {
          relatedTarget: this._element,
        });
        const showEvent = $.Event(Event.SHOW, {
          relatedTarget: previous,
        });

        if (previous) {
          $(previous).trigger(hideEvent);
        }

        $(this._element).trigger(showEvent);

        if (showEvent.isDefaultPrevented() || hideEvent.isDefaultPrevented()) {
          return;
        }

        if (selector) {
          target = document.querySelector(selector);
        }

        this._activate(this._element, listElement);

        const complete = function complete() {
          const hiddenEvent = $.Event(Event.HIDDEN, {
            relatedTarget: _this._element,
          });
          const shownEvent = $.Event(Event.SHOWN, {
            relatedTarget: previous,
          });
          $(previous).trigger(hiddenEvent);
          $(_this._element).trigger(shownEvent);
        };

        if (target) {
          this._activate(target, target.parentNode, complete);
        } else {
          complete();
        }
      };

      _proto.dispose = function dispose() {
        $.removeData(this._element, DATA_KEY);
        this._element = null;
      }; // Private

      _proto._activate = function _activate(element, container, callback) {
        const _this2 = this;

        const activeElements =
          container &&
          (container.nodeName === 'UL' || container.nodeName === 'OL')
            ? $(container).find(Selector.ACTIVE_UL)
            : $(container).children(Selector.ACTIVE);
        const active = activeElements[0];
        const isTransitioning =
          callback && active && $(active).hasClass(ClassName.FADE);

        const complete = function complete() {
          return _this2._transitionComplete(element, active, callback);
        };

        if (active && isTransitioning) {
          const transitionDuration =
            Util.getTransitionDurationFromElement(active);
          $(active)
            .removeClass(ClassName.SHOW)
            .one(Util.TRANSITION_END, complete)
            .emulateTransitionEnd(transitionDuration);
        } else {
          complete();
        }
      };

      _proto._transitionComplete = function _transitionComplete(
        element,
        active,
        callback,
      ) {
        if (active) {
          $(active).removeClass(ClassName.ACTIVE);
          const dropdownChild = $(active.parentNode).find(
            Selector.DROPDOWN_ACTIVE_CHILD,
          )[0];

          if (dropdownChild) {
            $(dropdownChild).removeClass(ClassName.ACTIVE);
          }

          if (active.getAttribute('role') === 'tab') {
            active.setAttribute('aria-selected', false);
          }
        }

        $(element).addClass(ClassName.ACTIVE);

        if (element.getAttribute('role') === 'tab') {
          element.setAttribute('aria-selected', true);
        }

        Util.reflow(element);

        if (element.classList.contains(ClassName.FADE)) {
          element.classList.add(ClassName.SHOW);
        }

        if (
          element.parentNode &&
          $(element.parentNode).hasClass(ClassName.DROPDOWN_MENU)
        ) {
          const dropdownElement = $(element).closest(Selector.DROPDOWN)[0];

          if (dropdownElement) {
            const dropdownToggleList = [].slice.call(
              dropdownElement.querySelectorAll(Selector.DROPDOWN_TOGGLE),
            );
            $(dropdownToggleList).addClass(ClassName.ACTIVE);
          }

          element.setAttribute('aria-expanded', true);
        }

        if (callback) {
          callback();
        }
      }; // Static

      Tab._jQueryInterface = function _jQueryInterface(config) {
        return this.each(function () {
          const $this = $(this);
          let data = $this.data(DATA_KEY);

          if (!data) {
            data = new Tab(this);
            $this.data(DATA_KEY, data);
          }

          if (typeof config === 'string') {
            if (typeof data[config] === 'undefined') {
              throw new TypeError(`No method named "${config}"`);
            }

            data[config]();
          }
        });
      };

      _createClass(Tab, null, [
        {
          key: 'VERSION',
          get: function get() {
            return VERSION;
          },
        },
      ]);

      return Tab;
    })();
  /**
   * ------------------------------------------------------------------------
   * Data Api implementation
   * ------------------------------------------------------------------------
   */

  $(document).on(Event.CLICK_DATA_API, Selector.DATA_TOGGLE, function (event) {
    event.preventDefault();

    Tab._jQueryInterface.call($(this), 'show');
  });
  /**
   * ------------------------------------------------------------------------
   * jQuery
   * ------------------------------------------------------------------------
   */

  $.fn[NAME] = Tab._jQueryInterface;
  $.fn[NAME].Constructor = Tab;

  $.fn[NAME].noConflict = function () {
    $.fn[NAME] = JQUERY_NO_CONFLICT;
    return Tab._jQueryInterface;
  };

  return Tab;
});
// # sourceMappingURL=tab.js.map
