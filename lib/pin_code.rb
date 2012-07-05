# encoding: utf-8

class PinCode < Adhearsion::CallController
  def run
    pin_code = ask "pin_code", :timeout => 10, :limit => 5
    execute "SayDigits", pin_code

    hangup
  end
end