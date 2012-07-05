# encoding: utf-8

class MainController < Adhearsion::CallController
  def run
    answer

    top_ivr_menu
  end

  def top_ivr_menu
    menu "helloandwelcome", :timeout => 8.seconds, :tries => 3 do
      match 1, ElController
      match 2, InsController

      timeout {}
      invalid {}
      failure {}
    end
  end
end