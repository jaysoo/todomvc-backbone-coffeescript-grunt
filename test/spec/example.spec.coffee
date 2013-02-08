define (require) ->

  describe 'Foo', ->

    before ->
      @foo = {bar: 1}

    it 'should have bar', ->
      expect(@foo.bar).to.be.defined
