class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    msg = ["Sorry."]
    msg << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    msg << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    print_results(msg)
  end

  def print_results(msg)
    if msg.length > 1
      # User can't take ride, print message
      msg.join(" ")
    else
      # user can take ride, remove tickets from user
      calculate_ride
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def calculate_ride
    update_tickets
    update_nausea
    update_happiness
    user.save
  end

  def update_tickets
    user.tickets = user.tickets - attraction.tickets
  end

  def update_nausea
    user.nausea = user.nausea + attraction.nausea_rating
  end

  def update_happiness
    user.happiness = user.happiness + attraction.happiness_rating
  end
end
