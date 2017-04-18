App.summary = App.cable.subscriptions.create "SummaryChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    game = data['game']
    
    # Called when there's incoming data on the websocket for this channel
