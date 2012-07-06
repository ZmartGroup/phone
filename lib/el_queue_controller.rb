# encoding: utf-8

require_relative 'top_queue_controller'

class ElQueueController < TopQueueController
  def queue
    @queue ||= super('el')
  end
end