class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password_digest, presence: true
  has_secure_password

  def mood
    if happiness.blank? || nausea.blank?
      return ""
    else
      happiness > nausea ? "happy" : "sad"
    end
  end
end
