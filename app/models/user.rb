class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password_digest, presence: true
  has_secure_password

  def mood
    return "" if happiness.blank? || nausea.blank?

    happiness > nausea ? "happy" : "sad"
  end
end
