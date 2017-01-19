class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  # write associations here

  def take_ride
    if !enough_tickets && tall_enough
      "Sorry. " + ticket_error
    elsif enough_tickets && !tall_enough
      "Sorry. " + height_error
    elsif !enough_tickets && !tall_enough
      "Sorry. " + ticket_error + " " + height_error
    else
      self.user.tickets = self.user.tickets - self.attraction.tickets
      self.user.nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
    self.user.height >= self.attraction.min_height
  end

  def ticket_error
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_error
    "You are not tall enough to ride the #{attraction.name}."
  end

end
