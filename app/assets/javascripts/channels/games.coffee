App.games = App.cable.subscriptions.create "GamesChannel",
  connected: ->
    if gameId = $("[data-channel='games']").data('game-id')
      @perform 'follow', game_id: gameId
    else
      @perform 'unfollow'
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # @perform 'unfollow'
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # alert data['message']
    if summary = data['summary']
      $('#home-team-hits').text(summary['home_team']['hits'])
      $('#home-team-runs').text(summary['home_team']['runs'])
      $('#home-team-errors').text(summary['home_team']['errors'])
      $('#away-team-hits').text(summary['away_team']['hits'])
      $('#away-team-runs').text(summary['away_team']['runs'])
      $('#away-team-errors').text(summary['away_team']['errors'])
    if innings = data['innings']
      innings.forEach (inning) =>
        $("#inning-#{inning.number}-home").text(inning['home'])
        $("#inning-#{inning.number}-away").text(inning['away'])
    # Called when there's incoming data on the websocket for this channel

  update: ->
    @perform 'update'
