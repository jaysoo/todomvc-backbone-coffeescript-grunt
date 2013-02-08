require.config({
  paths: {
    // Map our TodoList implementation to the LocalStorage version.
    'todos.impl': 'collections/todos.localstorage',

    // Map all App data to the data module
    'appdata': 'data',

    // Third-part libs
    jquery: '../components/jquery/jquery',
    underscore: '../components/underscore/underscore',
    backbone: '../components/backbone-amd/backbone',
    handlebars: '../vendor/handlebars',
    cs: '../components/require-cs/cs',
    'coffee-script': '../components/require-cs/coffee-script',
    text: '../components/requirejs-text/text',
    localstorage: '../vendor/backbone.localStorage'
  },
  // Shims for non-AMD modules
  shim: {
    underscore: {
      exports: '_'
    },
    handlebars: {
      exports: 'Handlebars'
    },
    localstorage: {
      deps: ['backbone'],
      exports: 'Backbone.LocalStorage'
    }
  },
});
