define (require) ->
  AppView = require 'cs!views/app'
  AppData = require 'appdata'
  Workspace = require 'cs!routers/router'

  # Require an implementation of the TodoList.
  # We have mapped this in our config.js file.
  TodoList = require 'cs!todos.impl'


  # Setting up the application data.
  AppData.Todos = new TodoList()
  AppData.TodoRouter = new Workspace()
  Backbone.history.start()


  new AppView()
