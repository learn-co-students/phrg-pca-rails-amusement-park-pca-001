class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    return unless nausea
    if self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end
end
