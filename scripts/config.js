require.config({
  // Shims for non-AMD modules
  shim: {
    underscore: {
      exports: '_'
    },
    handlebars: {
      exports: 'Handlebars'
    }
  },
  paths: {
    jquery: '../components/jquery/jquery',
    underscore: '../components/lodash/lodash',
    backbone: '../components/backbone-amd/backbone',
    handlebars: '../vendor/handlebars',
    cs: '../components/require-cs/cs',
    'coffee-script': '../components/require-cs/coffee-script',
    text: '../components/requirejs-text/text'
  },
  // http://requirejs.org/docs/api.html#config-enforceDefine
  enforceDefine: true
});

