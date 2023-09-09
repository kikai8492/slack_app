require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'
include Clockwork

Dotenv.load

client = SlackNotify::Client.new(
  webhook_url: ENV['URL'],
  channel: "#general",
  username: "kikai",
)
client.notify("通知メッセージ")
# 3分毎の通知メッセージがslackに届く
every(3.minutes, "three_minutes") do
  client.notify("3分定期メッセージ")
end

module Clockwork
  client = SlackNotify::Client.new(
    webhook_url: ENV['URL'],
    channel: "#general",
    username: "kikai",
  )
end