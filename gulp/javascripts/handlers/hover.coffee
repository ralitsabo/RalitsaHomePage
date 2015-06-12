$ = require('jquery')

# On click scrolls to the target element
module.exports = class Click
  constructor: (el) ->
    $el          = $(el)

    $el.onClick = ->
      $el.css('background-color','red')

    windowScroll()
    $(window).scroll(windowScroll)

    clickHandler = (e) ->
      e.preventDefault()
      $('body,html').animate
        scrollTop: targetOffset + 1
      , 500

    $el.off('click').click(clickHandler)
  console.log("asdasd")