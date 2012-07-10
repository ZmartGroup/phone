# encoding: utf-8

Adhearsion.config do |config|

  # Centralized way to specify any Adhearsion platform or plugin configuration
  # - Execute rake config:show to view the active configuration values
  #
  # To update a plugin configuration you can write either:
  #
  #    * Option 1
  #        Adhearsion.config.<plugin-name> do |config|
  #          config.<key> = <value>
  #        end
  #
  #    * Option 2
  #        Adhearsion.config do |config|
  #          config.<plugin-name>.<key> = <value>
  #        end

  config.development do |dev|
    dev.platform.logging.level = :debug
  end

  ##
  # Use with Rayo (eg Voxeo PRISM)
  #
  # config.punchblock.username = "" # Your XMPP JID for use with Rayo
  # config.punchblock.password = "" # Your XMPP password

  ##
  # Use with Asterisk
  #
  config.punchblock.platform = :asterisk # Use Asterisk
  config.punchblock.username = ENV['AST_USER'] || "foo" # Your AMI username
  config.punchblock.password = ENV['AST_PASS'] || "bar" # Your AMI password
  config.punchblock.host     = "127.0.0.1" # Your AMI host
  config.punchblock.port     = 5038 # Your AMI port


  config.adhearsion_activerecord do |config|
    config.username = ENV['MYSQL_USER'] || "foo"
    config.password = ENV['MYSQL_PASS'] || "bar"
    config.database = ENV['MYSQL_DB']   || "adhearsion"
    config.host     = ENV['MYSQL_HOST'] || "localhost"
    config.port     = ENV['MYSQL_PORT'] || "3060"

    config.adapter  = "mysql2"
  end
end

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  # punchblock do |event|
  #   ...
  # end
  #
  # eg Handling PeerStatus AMI events
  # ami :name => 'PeerStatus' do |event|
  #   ...
  # end
  #
end

Adhearsion.router do

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #

  route 'default', MainController
end
