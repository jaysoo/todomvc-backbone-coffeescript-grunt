define (require) ->
  Backbone = require 'backbone'

  Data = require 'cs!data'


  # Todo Router
  # ----------
  Workspace = Backbone.Router.extend(
    routes:
      "*filter": "setFilter"

    setFilter: (param) ->

      # Set the current filter to be used
      Data.TodoFilter = param.trim() or ""

      # Trigger a collection filter event, causing hiding/unhiding
      # of Todo view items
      Data.Todos.trigger "filter"
  )
