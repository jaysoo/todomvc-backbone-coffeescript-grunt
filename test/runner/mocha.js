require.config({
  paths: {
    // Ensure you point to where your spec folder is, base directory is scripts,
    // which is why ../test is necessary.
    spec: '../../../test/spec',

    // Ensure we can load modules prefixed with `cs!`.
    cs: '../components/require-cs/cs',
    'coffee-script': '../components/require-cs/coffee-script'
  }
});

require([

  // Load specs
  // ----------

  'cs!spec/forms/views/dropdown.spec',
  'cs!spec/mediator.spec',
  'cs!spec/messages.spec',
  'cs!spec/mixins/editable.integration.spec',
  'cs!spec/mixins/editable.unit.spec',
  'cs!spec/mixins/http_error_handler.unit.spec',
  'cs!spec/mixins/paginated_table.integration.spec',
  'cs!spec/mixins/popover.integration.spec',
  'cs!spec/mixins/popover.unit.spec',
  'cs!spec/mixins/select.spec',
  'cs!spec/mixins/server_validation_handler.unit.spec',
  'cs!spec/mixins/table.integration.spec',
  'cs!spec/mixins/table.unit.spec',
  'cs!spec/mixins.spec',
  'cs!spec/mvc.spec',
  'cs!spec/template_helpers.spec'

], function () {
  'use strict';

  var runner = mocha.run();

  if(!window.PHANTOMJS) return;

  runner.on('test', function(test) {
    sendMessage('testStart', test.title);
  });

  runner.on('test end', function(test) {
    sendMessage('testDone', test.title, test.state);
  });

  runner.on('suite', function(suite) {
    sendMessage('suiteStart', suite.title);
  });

  runner.on('suite end', function(suite) {
    if (suite.root) return;
    sendMessage('suiteDone', suite.title);
  });

  runner.on('fail', function(test, err) {
    sendMessage('testFail', test.title, err);
  });

  runner.on('end', function() {
    var output = {
      failed  : this.failures,
      passed  : this.total - this.failures,
      total   : this.total
    };

    sendMessage('done', output.failed,output.passed, output.total);
  });

  function sendMessage() {
    var args = [].slice.call(arguments);
    alert(JSON.stringify(args));
  }
});
