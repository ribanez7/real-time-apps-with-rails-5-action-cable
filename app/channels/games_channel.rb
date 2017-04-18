# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GamesChannel < ApplicationCable::Channel
  # def subscribed
  #   stream_from 'games'
  # end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end

  def follow(data)
    stop_all_streams
    stream_for data['game_id']
  end

  def unfollow
    stop_all_streams
  end

  def update
    ActionCable.server.broadcast 'games', message: 'Hello  World'
  end
end
