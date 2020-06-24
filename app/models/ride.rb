class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find(user_id)
    attraction = Attraction.find(attraction_id)
    response = ""

    unless enough_tickets?(user.tickets, attraction.tickets)
      response += " You do not have enough tickets to ride the #{attraction.name}."
    end

    unless enough_height?(user.height, attraction.min_height)
      response += " You are not tall enough to ride the #{attraction.name}."
    end

    return ("Sorry." + response) unless response == ""

    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save

    "Thanks for riding the #{attraction.name}!"
  end

private

  def enough_tickets?(tickets, ammount)
    tickets >= ammount
  end

  def enough_height?(height, restrict)
    height >= restrict
  end
end
