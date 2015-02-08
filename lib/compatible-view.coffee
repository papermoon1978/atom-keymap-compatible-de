{View} = require 'atom'

tMapDe = require './translation-table'

module.exports =
class CompatibleView extends View
  @content: ->
    @div class: 'test overlay from-top', =>
      @div "The Test package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    console.log tMapDe
    # atom.keymap.keyBindings = atom.keymap.keyBindings.map((binding, i) ->
    atom.keymap.keyBindings.map((binding, i) ->
      # console.log binding.keystrokes
      console.log binding.index + ': ' + binding.keystrokes + ': ' + binding.command
    )
    atom.workspaceView.command "compatible:at", @at
    atom.workspaceView.command "compatible:backslash", @backslash

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  at: (event) ->
    editor = event.targetView().editor
    editor.insertText('@') if editor

  backslash: (event) ->
    editor = event.targetView().editor
    editor.insertText('\\') if editor
