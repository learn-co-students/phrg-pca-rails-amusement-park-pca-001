class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    msg = ["Sorry."]
    if user.tickets < attraction.tickets
      msg << "You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      msg << "You are not tall enough to ride the Roller Coaster."
    end

    if msg.length > 1
      # User can't take ride, print message
      msg.join(" ")
    else
      # user can take ride, remove tickets from user
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
    end
  end
end
