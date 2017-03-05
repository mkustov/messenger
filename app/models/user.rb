class User < ApplicationRecord
  DIALECTS = [
    ['Yoda', 'yoda'],
    ['Valley Girl', 'valey'],
    ['Boston', 'boston']
  ]
  attr_accessor :username, :dialect
end
