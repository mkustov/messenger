FactoryGirl.define do
  factory :message do
    user 'User'
    text 'Awesome message'
    dialect 'yoda'
  end
end
