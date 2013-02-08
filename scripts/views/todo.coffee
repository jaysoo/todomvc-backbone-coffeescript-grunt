define (require) ->
  Backbone = require 'backbone'

  AppData = require 'appdata'
  Keys = require('cs!constants').Keys


  # Todo Item View
  # --------------

  # The DOM element for a todo item...
  TodoView = Backbone.View.extend(

    #... is a list tag.
    tagName: "li"

    # Cache the template function for a single item.
    template: _.template($("#item-template").html())

    # The DOM events specific to an item.
    events:
      "click .toggle": "toggleCompleted"
      "dblclick label": "edit"
      "click .destroy": "clear"
      "keypress .edit": "updateOnEnter"
      "blur .edit": "close"


    # The TodoView listens for changes to its model, re-rendering. Since there's
    # a one-to-one correspondence between a **Todo** and a **TodoView** in this
    # app, we set a direct reference on the model for convenience.
    initialize: ->
      @listenTo @model, "change", @render
      @listenTo @model, "destroy", @remove
      @listenTo @model, "visible", @toggleVisible


    # Re-render the titles of the todo item.
    render: ->
      @$el.html @template(@model.toJSON())
      @$el.toggleClass "completed", @model.get("completed")
      @toggleVisible()
      @$input = @$(".edit")
      this

    toggleVisible: ->
      @$el.toggleClass "hidden", @isHidden()

    isHidden: ->
      isCompleted = @model.get("completed")
      # hidden cases only
      (not isCompleted and AppData.TodoFilter is "completed") or (isCompleted and AppData.TodoFilter is "active")


    # Toggle the `"completed"` state of the model.
    toggleCompleted: ->
      @model.toggle()


    # Switch this view into `"editing"` mode, displaying the input field.
    edit: ->
      @$el.addClass "editing"
      @$input.focus()


    # Close the `"editing"` mode, saving changes to the todo.
    close: ->
      value = @$input.val().trim()
      if value
        @model.save title: value
      else
        @clear()
      @$el.removeClass "editing"


    # If you hit `enter`, we're through editing the item.
    updateOnEnter: (e) ->
      @close()  if e.which is Keys.Enter


    # Remove the item, destroy the model from *localStorage* and delete its view.
    clear: ->
      @model.destroy()
  )
