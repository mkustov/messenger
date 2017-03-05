require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { build :message }

  it 'adds job on after_commit hook' do
    message.run_callbacks(:commit)
    expect(MessageBroadcastJob).to receive(:perform_later)
    message.save
  end

  it 'translates text before create' do
    allow_any_instance_of(DialectTranslator).to receive(:translate).and_return('Translated text')
    message.save
    expect(message.text).to eq('Translated text')
  end
end
