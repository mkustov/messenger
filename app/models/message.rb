class Message < ApplicationRecord
  attr_accessor :dialect

  before_create :translate
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  private

  def translate
    self.text = DialectTranslator.new(self.text, self.dialect).translate
  end
end
