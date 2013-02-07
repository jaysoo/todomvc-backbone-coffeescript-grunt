This is a sample project written in CoffeeScript and LESS.

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

    grunt connect:test

Then browse to [http://localhost:9001/test/index.html](http://localhost:9001/test/index.html).

Development
-----------

You can run the development server using the `grunt` command. This will start a server on port 9001, and the root is the root of the project.

e.g. http://localhost:9001/example/

Any stylesheet and HTML changes will live-reload the page so you don't need manual refreshes.
