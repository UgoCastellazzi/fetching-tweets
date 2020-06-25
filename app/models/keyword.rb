class Keyword < ApplicationRecord
  has_many :tweets, dependent: :destroy
end
