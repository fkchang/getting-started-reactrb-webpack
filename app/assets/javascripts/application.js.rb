require 'opal'
require 'opal_ujs'
require 'turbolinks'
# react.rb has it's own react.js so don't include this 2x
# require 'react'
require 'react_ujs'
require 'bootstrap-sprockets'
require 'components' # include isomorphic components
require_tree '.'
