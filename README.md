# coffeelint-no-focused-jasmine-specs
[![Circle CI](https://circleci.com/gh/blamattina/coffeelint-no-focused-jasmine-specs.svg?style=svg)](https://circleci.com/gh/blamattina/coffeelint-no-focused-jasmine-specs)

Deadlines are looming and you're **focusing** on getting those last few specs
green..

**CLEAR TEST RUN.**  You're done! `git add . && git commit -m 'All Done! :zap:'`

A few days later someone asks, 'When you run the specs, do only 10 run?' and a
knot develops in your throat. You check the project, only to have your worst
fears confirmed: **You commited an fdescribe block!**  You remove it to uncover
30 spec failures.

That would never happen to you right?  Of course not, this isn't your first
rodeo.  You're using coffeelint-no-focused-jasmine-specs.

## Installation

1. Setup [CoffeeLint](http://coffeelint.org) in your project and verify that it
   works
2. Add this module as a `devDependency`: `npm install -D
   coffeelint-no-focused-jasmine-specs`
3. Update your `coffeelint.json` configuration file as described below.
4. Modify coffeelint to use this custom rule.  For example, If you run
   `coffeelint` from the command line you might do this `coffeelint --rules
   node_modules/coffeelint-no-focused-jasmine-specs`

## Configuration

Add the following snippet to your `coffeelint.json` config:

```json
{
  "no_focused_jasmine_specs": {
    "module": "coffeelint-no-focused-jasmine-specs",
    "level": "warn"
  }
}
```
