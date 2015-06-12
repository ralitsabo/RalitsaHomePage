(function() {
  this.Handlers = (function() {
    function Handlers() {}

    Handlers.handlers = {};

    Handlers.register = function(handler, registered_class) {
      if (!registered_class.constructor) {
        throw "No constructor on " + handler;
      }
      return this.handlers[handler] = registered_class;
    };

    Handlers.instantiate = function(handlers, element) {
      var _this = this;
      handlers = handlers.replace(/\s/g, '').split(',');
      element.handlers = [];
      return $.each(handlers, function(index, handler) {
        var instance;
        if (_this.handlers[handler]) {
          instance = new _this.handlers[handler](element);
          return element.handlers.push(instance);
        } else {
          throw "Unknown handler " + handler;
        }
      });
    };

    Handlers.destroy = function(instances) {
      return $.each(instances, function(index, instance) {
        if (instance.destroy) {
          return instance.destroy();
        }
      });
    };

    Handlers.unregister_all = function() {
      return this.handlers = {};
    };

    return Handlers;

  })();

  $(document).on('handlers:pageChanged', function() {
    return $('[data-handler]').each(function() {
      return Handlers.instantiate($(this).attr('data-handler'), this);
    });
  });

  $(document).on('handlers:pageUpdated', function(event, scope) {
    elementHandlers = $(scope).attr('data-handler')
    if (elementHandlers) {
      Handlers.instantiate(elementHandlers, $(scope)[0]);
    }
    return $(scope).find('[data-handler]').each(function() {
      return Handlers.instantiate($(this).attr('data-handler'), this);
    });
  });

  $(document).on('handlers:pageUpdating', function(event, scope) {
    elementHandlers = $(scope).attr('data-handler')
    if (elementHandlers) {
      node = $(scope)[0];
      if (node.handlers) {
        Handlers.destroy(node.handlers);
      }
      if (node.handlers) {
        delete node.handlers;
      }
    }
    return $(scope).find('[data-handler]').each(function() {
      if (this.handlers) {
        Handlers.destroy(this.handlers);
      }
      if (this.handlers) {
        return delete this.handlers;
      }
    });
  });

  if (typeof Turbolinks !== void 0) {
    $(document).on('page:fetch', function() {
      return $(document).trigger('handlers:pageUpdating', 'body');
    });
    $(document).on('page:change', function() {
      return $(document).trigger('handlers:pageUpdated', 'body');
    });
  }

}).call(this);
