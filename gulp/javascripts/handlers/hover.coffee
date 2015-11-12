$ = require('jquery')

# On click scrolls to the target element
module.exports = class Click
  constructor: (el) ->
    $el = $(el)

    $el.click (e) ->
      $el.hide()
      alert("bongo")