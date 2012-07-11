# encoding: utf-8

require_relative 'top_queue_controller'

class ElQueueController < TopQueueController
  def queue
    super('el')
  end

  def join_message
    "will_be_connected_to_el"
  end
end