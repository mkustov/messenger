class User < ApplicationRecord
  DIALECTS = [
    %w(Yoda yoda),
    %w(Valley\ Girl valey),
    %w(Boston boston)
  ].freeze
  attr_accessor :username, :dialect
end
