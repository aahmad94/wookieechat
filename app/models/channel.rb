class Channel < ApplicationRecord
  validates :channel_name, presence: true, uniqueness: true

  has_many :channel_subscriptions,
    dependent: :destroy

  has_many :users,
   through: :channel_subscriptions

  has_many :messages,
    as: :interface,
    dependent: :destroy
    
  def self.search(query)
    self.where("channel_name ILIKE ?",
                "%#{query}%")
  end

end
