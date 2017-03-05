describe "chat", type: :feature do
  it "requires user to be signed in" do
    visit '/chat'
    expect(page).not_to have_content 'Messages'
    expect(current_path).to eq '/'
  end

  context 'signed in user' do
    let!(:message) { create :message, user: 'yoda', text: ' With you, may the force be', dialect: 'yoda' }
    let!(:message_2) { create :message, user: 'valey', text: 'May the force be with you', dialect: 'valey' }
    
    before(:each) do
      visit '/'
      within("#new_user") do
        fill_in 'user_username', with: 'yoda'
        select 'Yoda', from: 'user_dialect'
      end
      click_button 'Start chat!'
    end

    it "renders list of messages" do
      expect(page).to have_content "With you, may the force be"
      expect(page).to have_content "May the force be with you"
    end

    it 'allows to create a messages' do
      expect(page.find("#message_text")).to be_present
      expect(page.find_button('Send')).to be_present
    end
  end
end
