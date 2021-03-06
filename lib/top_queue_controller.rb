# encoding: utf-8

class TopQueueController < Adhearsion::CallController

  def run
    join_or_pass
  end

  def max_waiting_count
    20
  end

  def join_or_pass
    enable_feature :attended_transfer
    enable_feature :blind_transfer

    play join_message if join_message

    if queue.waiting_count <= max_waiting_count
      queue.join! :allow_transfer => :everyone
    else
      pass CallbackController
    end
  end
end