# encoding: UTF-8

class Callback < ActiveRecord::Base
  set_table_name "asterisk_callbacks"

  scope :needs_callback, where{ callback_at == nil }

  scope :effective, where{ (effective_at <= DateTime.now) | (effective_at == nil) }

end
