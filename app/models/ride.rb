class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !enough_tix? && !tall_enough?

      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."

    elsif !enough_tix?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      go_on_ride
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def enough_tix?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def go_on_ride
    return unless enough_tix? && tall_enough?

    remaining_tickets = user.tickets - attraction.tickets
    new_nausea_level = user.nausea + attraction.nausea_rating
    new_happiness_level = user.happiness + attraction.happiness_rating

    user.update(tickets: remaining_tickets, nausea: new_nausea_level, happiness: new_happiness_level)
  end
end
