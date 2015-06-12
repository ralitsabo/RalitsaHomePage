$ = require('jquery')

# On click scrolls to the target element
module.exports = class ScrollButton
  constructor: (el) ->
    $el          = $(el)
    direction    = if $el.is('.up') then 'up' else 'down'
    $target      = $($el.data('scroll-target'))
    targetOffset = $target.offset().top
    fadeDuration = 500

    windowScroll = ->
      if window.scrollY > targetOffset
        if direction == 'down' then $el.fadeOut(fadeDuration) else $el.fadeIn(fadeDuration)
      else
        if direction == 'down' then $el.fadeIn(fadeDuration) else $el.fadeOut(fadeDuration)

    windowScroll()
    $(window).scroll(windowScroll)

    clickHandler = (e) ->
      e.preventDefault()
      $('body,html').animate
        scrollTop: targetOffset + 1
      , 500

    $el.off('click').click(clickHandler)
  console.log("asdasd")