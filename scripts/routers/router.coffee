define (require) ->
  Backbone = require 'backbone'

  AppData = require 'appdata'


  # Todo Router
  # ----------
  Workspace = Backbone.Router.extend(
    routes:
      "*filter": "setFilter"

    setFilter: (param) ->

      # Set the current filter to be used
      AppData.TodoFilter = param.trim() or ""

      # Trigger a collection filter event, causing hiding/unhiding
      # of Todo view items
      AppData.Todos.trigger "filter"
  )
