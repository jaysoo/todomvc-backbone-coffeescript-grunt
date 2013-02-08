path = require 'path'
livereloadSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet

folderMount = (connect, point) -> connect.static(path.resolve(point))

module.exports = (grunt) ->
  # Grunt configuration:
  #
  # https://github.com/cowboy/grunt/blob/master/docs/getting_started.md
  #
  grunt.initConfig

    # Project configuration
    # ---------------------
    project:
      src: "scripts"
      staging: "temp"
      components: "components"
      vendor: "vendor"
      release: "www/assets"
      test: "test"

    clean:
      build: ["<%= project.staging %>"]
      dist: ["<%= project.release %>"]


    # Task configurations
    # -------------------

    # Runs a test server
    connect:
      server:
        options:
          port: 9001
          middleware: (connect, options) -> [livereloadSnippet, folderMount(connect, '.')]


    # Headless testing through PhantomJS
    mocha:
      test:
        src: ["test/index.html"]


    # Watch configuration
    regarde:
      stylesheets:
        files: '**/*.less'
        tasks: ['less', 'livereload']
      html:
        files: '**/*.html'
        tasks: ['livereload']

    # Lint configuration
    # https://github.com/cowboy/grunt/blob/master/docs/task_lint.md#lint-built-in-task
    lint:
      files: ["<%= project.staging %>/**/*.js", "<%= project.test %>/spec/**/*.js"]


    # JSHint options and globals
    # https://github.com/cowboy/grunt/blob/master/docs/task_lint.md#specifying-jshint-options-and-globals
    jshint:
      options:
        curly: true
        eqeqeq: true
        immed: true
        latedef: true
        newcap: true
        noarg: true
        sub: true
        undef: true
        boss: true
        eqnull: true
        browser: true

      globals:
        jQuery: true

    # RequireJS 2.0 configuration
    # http://requirejs.org/docs/optimization.html#mainConfigFile
    requirejs:

      # Dev version excludes require-cs and require-text plugins. You need to supply these in your
      # own project.
      #
      # Load float through RequireJS:
      #
      #     require(['float'], function (Float) {
      #       var Foo = Float.Facade.mvc.BaseModel.extend({
      #         // ...
      #       });
      #     });
      compile:
        options:
          baseUrl: "<%= project.src %>"
          mainConfigFile: "<%= project.src %>/config.js"
          stubModules: ["cs", "text"]
          out: "<%= project.staging %>/app.js"
          optimize: "uglify2"
          preserveLicenseComments: false
          generateSourceMaps: true
          name: "../components/almond/almond"
          include: ["app"]
          exclude: ["coffee-script"]
          wrap:
            startFile: ["parts/start.frag"]
            endFile: ["parts/end.frag"]

    less:
      compile:
        options:
          yuicompress: true
        files:
          '<%= project.release %>/css/base.css': ['styles/base.less']

    copy:
      dist:
        files: [

          # Float.js files
          src: ["<%= project.staging %>/*"]
          dest: "<%= project.release %>/js/"
          flatten: true
          expand: true
        ,

          # Fonts and images
          src: ['images/**']
          expand: true
          dest: "<%= project.release %>/"
        ]

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-livereload"
  grunt.loadNpmTasks "grunt-contrib-requirejs"
  grunt.loadNpmTasks "grunt-mocha"
  grunt.loadNpmTasks "grunt-regarde"

  # Aliases
  # -------
  grunt.registerTask "default", ["livereload-start", "connect:server", "regarde"]
  grunt.registerTask "build", ["clean", "requirejs", "less", "copy"]
  grunt.registerTask "test", ["mocha"]
