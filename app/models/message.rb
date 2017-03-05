class Message < ApplicationRecord
  before_create :translate
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def posted_by
    "<b>#{self.user}</b>&nbsp#{self.created_at.strftime('%H:%M:%S')}: ".html_safe
  end

  private

  def translate
    self.text = DialectTranslator.new(self.text, self.dialect).translate
  end
end
