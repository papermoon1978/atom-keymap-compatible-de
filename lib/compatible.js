// 'use 6to5';

// var deDE = require ('./translation-table').deDE;

// console.log(deDE);

module.exports = {

    activate: function () {
        // Deregister original keydown handler
        // document.removeEventListener('keydown', atom.windowEventHandler.onKeydown);

        // Register onKeydown handler
        // document.addEventListener('keydown', this.onKeydown);

        // console.log keymapDe
        // atom.keymap.keyBindings.map((binding, i) ->
        //    console.log binding.index + ': ' + binding.keystrokes + ': ' + binding.command
        //  )
        atom.workspaceView.command('compatible:onAtKey', this.onAtKey);
        atom.workspaceView.command('compatible:onBackslashKey', this.onBackslashKey);
    },

    deactivate: function () {
        // Deregister keydown handler
        // document.removeEventListener('keydown', this.onKeydown);
    },

    onAtKey: function (event) {
        editor = event.targetView().editor;
        if (editor) {
            editor.insertText('@');
        }
    },

    onBackslashKey: function (event) {
        editor = event.targetView().editor;
        if (editor) {
            editor.insertText('\\');
        }
    },

    /*
    onKeyDown: function (event) {
      console.log(event);
      atom.windowEventHandler.onKeydown(event);
    }
    */
};
