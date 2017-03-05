describe "sign in process", type: :feature do
  it "signs me in" do
    visit '/'
    within("#new_user") do
      fill_in 'user_username', with: 'yoda'
      select 'Yoda', from: 'user_dialect'
    end
    click_button 'Start chat!'
    expect(page).to have_content 'Messages'
  end
end
