require.config({
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
  paths: {
    jquery: '../components/jquery/jquery',
    underscore: '../components/lodash/lodash',
    backbone: '../components/backbone-amd/backbone',
    handlebars: '../vendor/handlebars',
    cs: '../components/require-cs/cs',
    'coffee-script': '../components/require-cs/coffee-script',
    text: '../components/requirejs-text/text',
    localstorage: '../vendor/backbone.localStorage',
    'todos.impl': 'collections/todos.localstorage'
  }
});

