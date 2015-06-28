
class NoFocusedJasmineSpecs
  rule:
    name: 'no_focused_jasmine_specs'
    level: 'error'
    message: 'No focused jasmine specs'
    description: '''
      This rule will call linting to fail if a focused (fdescribe/fit) spec is
      encountered.
    '''

  lintLine: (line, lineApi) ->
    tokens = line.trim().split " "
    if tokens[0] in ['fdescribe', 'fit']
      true

module.exports = NoFocusedJasmineSpecs
