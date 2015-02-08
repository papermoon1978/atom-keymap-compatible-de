{Disposable, CompositeDisposable} = require 'event-kit'
CompatibleView = require './compatible-view'

module.exports =
  compatibleView: null

  activate: (state) ->
    @disposables = new CompositeDisposable
    @disposables.add atom.workspace.observeTextEditors (editor) =>
      return if editor.mini
      @compatibleView = new CompatibleView(state.compatibleViewState)

  deactivate: ->
    @disposables.dispose()
    @compatibleView.destroy()

  serialize: ->
    compatibleViewState: @compatibleView.serialize()
