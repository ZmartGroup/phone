# encoding: utf-8

class MainController < Adhearsion::CallController
  def run
    answer

    top_ivr_menu
  end

  def top_ivr_menu
    menu "hello_and_welcome", :timeout => 3.seconds, :tries => 3 do
      match 1, ElQueueController
      match 2, InsQueueController

      timeout { pass NoChoiceController }
      invalid { play "invalid_choice" }
      failure { hangup }
    end
  end
end