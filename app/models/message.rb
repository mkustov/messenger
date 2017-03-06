class Message < ApplicationRecord
  before_create :translate
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  private

  def translate
    self.text = DialectTranslator.new(text, dialect).translate
  end
end
