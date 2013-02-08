This is a Todo app built using:

- [Backbone](http://backbonejs.org)
- [RequireJS](http://requirejs.org)
- [CoffeeScript](coffeescript.org)

The original Backbone app is written by [Addy Osmani](https://github.com/addyosmani) as a part of [TodoMVC](http://todomvc.com/).

Compilation is handled through [Grunt](http://gruntjs.com/).

Browser JavaScript components are handled using [Bower](http://twitter.github.com/bower/).


Getting Started
---------------

You will need [NodeJS](http://nodejs.org/) (0.8+) installed on your machine. (`node --version` to check your installed version).

**Note**: If you have Grunt installed previously, you will need to uninstall it first:

    sudo npm uninstall -g grunt

Now, install grunt-cli and bower:

    sudo npm install -g bower grunt-cli@latest

Make sure that you add the npm bin directory to your PATH in `.bashrc`:

    # Sample path if npm installed through Homebrew
    export PATH="/usr/local/share/npm/bin:$PATH"


Running
-------

You can start the server using the `grunt` command.

Todo page: [http://localhost:9001/www/](http://localhost:9001/www/)

Any stylesheet and HTML changes will live-reload the page so you don't need manual refreshes.


Installing/Updating dependencies
--------------------------------

These commands will update both NodeJS and client-side dependences. The latter probably changes more often.

Install NodeJS dependencies:

    npm install

Install client-side JavaScript components:

    bower install


Building
--------

Using grunt:

    grunt build

This will create a dist folder with the files ready for use in your project.


Testing
-------

1) Using PhantomJS:

    grunt test


2) In browser:

    grunt

Then browse to [http://localhost:9001/test/index.html](http://localhost:9001/test/index.html).
