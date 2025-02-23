class User < ApplicationRecord
  validates :name, presence: true
  has_many :comments

  def avatar_url
    "https://api.dicebear.com/9.x/icons/svg?seed=#{name}&backgroundColor=ffdfbf,ef9a9a,b6e3f4,9fa8da,80cbc4&icon=emojiLaughing,emojiSmile,emojiSmileUpsideDown,emojiWink"
  end
end
