class Message < ActiveRecord::Base
  attr_accessible :message_text, :subject
end
