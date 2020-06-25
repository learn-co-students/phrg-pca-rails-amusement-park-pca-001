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

    update_user(user, attraction)

    "Thanks for riding the #{attraction.name}!"
  end

private

  def enough_tickets?(tickets, ammount)
    return false if tickets.blank?

    tickets >= ammount
  end

  def enough_height?(height, restrict)
    return false if height.blank?

    height >= restrict
  end

  def update_user(user, attraction)
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
