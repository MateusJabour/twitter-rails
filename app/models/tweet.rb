class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets, dependent: :destroy
  
  validates_presence_of :text
end
