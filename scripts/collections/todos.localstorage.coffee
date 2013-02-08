define (require) ->
  Backbone = require 'backbone'
  require 'localstorage'

  TodoList = require 'cs!collections/todos'

  # The collection of todos is backed by *localStorage* instead of a remote
  # server.
  LocalStorageTodoList = TodoList.extend(
    # Save all of the todo items under the `"todos"` namespace.
    localStorage: new Backbone.LocalStorage("todos-backbone")
  )
