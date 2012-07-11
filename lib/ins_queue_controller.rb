# encoding: utf-8

require_relative 'top_queue_controller'

class InsQueueController < TopQueueController
  def queue
    @queue ||= super('ins')
  end

  def join_message
    "will_be_connected_to_ins"
  end
end