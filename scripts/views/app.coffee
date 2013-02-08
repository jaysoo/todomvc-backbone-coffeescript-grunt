define (require) ->
  Backbone = require 'backbone'

  Keys = require('cs!constants').Keys
  TodoView = require 'cs!views/todo'
  Data = require 'cs!data'


  AppView = Backbone.View.extend(
      # Instead of generating a new element, bind to the existing skeleton of
      # the App already present in the HTML.
      el: "#todoapp"

      # Our template for the line of statistics at the bottom of the app.
      statsTemplate: _.template($("#stats-template").html())

      # Delegated events for creating new items, and clearing completed ones.
      events:
        "keypress #new-todo": "createOnEnter"
        "click #clear-completed": "clearCompleted"
        "click #toggle-all": "toggleAllComplete"

      # At initialization we bind to the relevant events on the `Todos`
      # collection, when items are added or changed. Kick things off by
      # loading any preexisting todos that might be saved in *localStorage*.
      initialize: ->
        @allCheckbox = @$("#toggle-all")[0]
        @$input = @$("#new-todo")
        @$footer = @$("#footer")
        @$main = @$("#main")
        @listenTo Data.Todos, "add", @addOne
        @listenTo Data.Todos, "reset", @addAll
        @listenTo Data.Todos, "change:completed", @filterOne
        @listenTo Data.Todos, "filter", @filterAll
        @listenTo Data.Todos, "all", @render
        Data.Todos.fetch()

      # Re-rendering the App just means refreshing the statistics -- the rest
      # of the app doesn't change.
      render: ->
        completed = Data.Todos.completed().length
        remaining = Data.Todos.remaining().length
        if Data.Todos.length
          @$main.show()
          @$footer.show()
          @$footer.html @statsTemplate(
            completed: completed
            remaining: remaining
          )
          @$("#filters li a").removeClass("selected").filter("[href=\"#/" + (Data.TodoFilter or "") + "\"]").addClass "selected"
        else
          @$main.hide()
          @$footer.hide()
        @allCheckbox.checked = not remaining

      # Add a single todo item to the list by creating a view for it, and
      # appending its element to the `<ul>`.
      addOne: (todo) ->
        view = new TodoView(model: todo)
        $("#todo-list").append view.render().el

      # Add all items in the **Todos** collection at once.
      addAll: ->
        @$("#todo-list").html ""
        Data.Todos.each @addOne, this

      filterOne: (todo) ->
        todo.trigger "visible"

      filterAll: ->
        Data.Todos.each @filterOne, this

      # Generate the attributes for a new Todo item.
      newAttributes: ->
        title: @$input.val().trim()
        order: Data.Todos.nextOrder()
        completed: false

      # If you hit return in the main input field, create new **Todo** model,
      # persisting it to *localStorage*.
      createOnEnter: (e) ->
        return  if e.which isnt Keys.ENTER or not @$input.val().trim()
        Data.Todos.create @newAttributes()
        @$input.val ""

      # Clear all completed todo items, destroying their models.
      clearCompleted: ->
        _.invoke Data.Todos.completed(), "destroy"
        false

      toggleAllComplete: ->
        completed = @allCheckbox.checked
        Data.Todos.each (todo) ->
          todo.save completed: completed

    )
