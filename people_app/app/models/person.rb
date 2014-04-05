require 'date'

class Person < ActiveRecord::Base
  self.table_name="people"

  def name
    return "#{first_name} #{last_name}"
  end

  def birthday
    return birthdate.strftime("%m/%d/%Y")
  end

  def age
    now = Time.now.to_date
    birthday=Date.parse(birthday)
    (now.year - birthday.year) - (birthday.change(year: now.year) > now ? 1 : 0)
  end

  def have_a_drink
    if num_of_drinks < 3
      (age > 21) ? (self.num_of_drinks += 1 and true) : "Wait a few years"
    else
        return "Go home you're drunk"
    end
  end

  def drunk?
    num_of_drinks >= 3
  end

  def drive_a_car
    case
      when age < 18 then "Not yet youngin"
      when age > 21 && (license && drunk?) then "Looks like a cab for you tonight"
      when age >= 18 && license then true
    end
  end

  def sober_up
    if num_of_drinks!=0 then self.num_of_drinks-=1 end
  end

end
