###* @jsx React.DOM ###

React = require('react')
_ = require('underscore')

module.exports = React.createClass
  getDefaultProps: () ->
    {
      className: ''
      threshold: 250
      loader: (<div className='loading-indicator'></div>)
      loading: false
    }
  componentDidMount: () ->
    @attachScrollListeners()

  componentWillUnmount: () ->
    @detachScrollListeners()

  attachScrollListeners: () ->
    node = $(@getDOMNode())
    threshold = @props.threshold
    reachedBottom = @props.reachedBottom

    node.add(document).on('scroll', () ->
      if ($(this).scrollTop() + $(this).innerHeight >= this.scrollHeight - threshold) || ($(window).height() + $(window).scrollTop() >= $(document).height() - threshold)
        if _.isFunction(reachedBottom)
          reachedBottom()

    )

  detachScrollListeners: () ->
    $(@getDOMNode()).add(document).off('scroll')

  componentDidUpdate: (prevProps) ->
    if prevProps.loading && !@props.loading
      @attachScrollListeners()
    else if !prevProps.loading && @props.loading
      @detachScrollListeners()

  render: () ->
    loader = if @props.loading then @props.loader
    <div className='react-infinite-scroll'>
      <div className={@props.className}>
        {@props.children}
      </div>
      {loader}
    </div>