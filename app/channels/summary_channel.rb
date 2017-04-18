# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SummaryChannel < ApplicationCable::Channel
  def subscribed
    stream_from "summary"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
# ActionCable.server.broadcast 'summary', game: { id: 1, home: { runs: 4, hits: 4, errors: 1 }, away: { runs: 9, hits: 10, errors: 2 } }