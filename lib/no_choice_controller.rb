# encoding: utf-8

require_relative 'top_queue_controller'

class NoChoiceController < TopQueueController
  def queue
    @queue ||= super('nochoice')
  end

  def join_message
    nil
  end
end