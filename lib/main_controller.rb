# encoding: utf-8

class MainController < Adhearsion::CallController
  def run
    answer

    top_ivr_menu
  end

  def top_ivr_menu
    menu "hello_and_welcome", :timeout => 40.seconds, :tries => 3 do
      match 1, ElQueueController
      match 2, InsQueueController

      timeout {}
      invalid {}
      failure {}
    end
  end
end