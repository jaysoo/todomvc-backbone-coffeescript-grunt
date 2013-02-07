define (require) ->
  $ = require 'jquery'
  Backbone = require 'backbone'
  Handlebars = require 'handlebars'

  appTmpl = require 'text!templates/app.hbs'


  AppView = Backbone.View.extend(
    el: $('#App')

    template: Handlebars.compile(appTmpl)

    initialize: -> @render()

    render: ->
      content = @template(
        title: 'Hello World!'
        content: '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
          Mauris id erat ante, commodo dignissim ipsum. Quisque tincidunt nunc at mauris varius ultrices.</p>'
      )

      @$el.html content
  )


  return AppView
