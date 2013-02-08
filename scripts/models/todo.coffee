define (require) ->
  Backbone = require 'backbone'


  # Todo Model
  # ----------
  # Our basic **Todo** model has `title`, `order`, and `completed` attributes.
  Todo = Backbone.Model.extend(
    # Default attributes for the todo
    # and ensure that each todo created has `title` and `completed` keys.
    defaults:
      title: ""
      completed: false

    # Toggle the `completed` state of this todo item.
    toggle: ->
      @save completed: not @get("completed")
  )
