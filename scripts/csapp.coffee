define (require) ->
  AppView = require 'cs!views/app'
  Data = require 'cs!data'
  Workspace = require 'cs!routers/router'

  # Require an implementation of the TodoList.
  # We have mapped this in our config.js file.
  TodoList = require 'cs!todos.impl'


  # Setting up the application data.
  Data.Todos = new TodoList()
  Data.TodoRouter = new Workspace()
  Backbone.history.start()


  new AppView()
