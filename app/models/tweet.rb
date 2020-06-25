class Tweet < ApplicationRecord
  belongs_to :keyword
  acts_as_votable
end
