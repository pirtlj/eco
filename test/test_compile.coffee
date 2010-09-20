eco       = require "eco"
{fixture} = require "fixtures"

module.exports =
  "compiling fixtures/hello.eco": (test) ->
    test.expect 1
    test.same fixture("hello.js"), eco.compile fixture("hello.eco")
    test.done()

  "compiling fixtures/projects.eco": (test) ->
    test.expect 1
    test.same fixture("projects.js"), eco.compile fixture("projects.eco")
    test.done()

  "parse error throws exception": (test) ->
    test.expect 1
    try
      eco.compile "<% unclosed tag"
    catch err
      test.ok err.toString().match /^Parse error on line 1/
    test.done()