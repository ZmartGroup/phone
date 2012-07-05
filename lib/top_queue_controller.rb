# encoding: utf-8

class TopQueueController < Adhearsion::CallController

  def run
    join_or_pass
  end

  def max_waiting_count
    20
  end

  def join_or_pass
    if queue.waiting_count <= max_waiting_count
      queue.join! :allow_transfer => :agent
    else
      pass CallbackController
    end
  end
end