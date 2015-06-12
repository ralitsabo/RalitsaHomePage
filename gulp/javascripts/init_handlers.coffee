$ = require('jquery')
Handlers = require('handlers')


InfiniteScroll = require('./handlers/infinitescroll')
ScrollButton = require('./handlers/scroll_button')

Handlers.register 'InfiniteScroll', InfiniteScroll
Handlers.register 'ScrollButton', ScrollButton