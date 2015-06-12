$ = require('jquery')

# Hides elements like the header on scroll down and shows it on scroll up
module.exports = class HideOnScroll
  constructor: (el) ->
    $el = $(el)
    didScroll = false
    lastScrollTop = 0
    delta = 5

    $(window).scroll (event) =>
      didScroll = true

    setInterval =>
      if didScroll
        hasScrolled()
        didScroll = false
    , 250

    hasScrolled = =>
      st = $(window).scrollTop()
      # Make sure they scroll more than delta
      return if Math.abs(lastScrollTop - st) <= delta

      # If they scrolled down and are past the navbar, add class .nav-up.
      # This is necessary so you never see what is "behind" the navbar.
      if st > 0
        # Scroll Down
        $el.slideUp(100)
      else
        # Scroll Up
        $el.slideDown(100)

      lastScrollTop = st