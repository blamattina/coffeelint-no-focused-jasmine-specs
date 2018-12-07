FOCUSED_SPECS = ['fdescribe', 'fit']

class NoFocusedJasmineSpecs
  rule:
    name: 'no_focused_jasmine_specs'
    level: 'error'
    message: 'No focused jasmine specs'
    description: '''
      This rule will call linting to fail if a focused (fdescribe/fit) spec is
      encountered.
    '''
    overrides: []

  tokens: ['IDENTIFIER']

  lintToken: (token, tokenApi) ->
    if token[1] in FOCUSED_SPECS.concat(overrides)
      true

module.exports = NoFocusedJasmineSpecs
