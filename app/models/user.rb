class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.nausea ||= 0
    self.happiness ||= 0
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
