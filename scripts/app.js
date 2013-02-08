'use strict';

require.config({
  paths: {
    'todos.impl': 'collections/todos.localstorage'
  }
});

// Requiring and return the CoffeeScript App module.
define(['cs!csapp'], function (App) {
  return App;
});
