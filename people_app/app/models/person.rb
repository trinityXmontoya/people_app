require 'date'

class Person

  # set default person num_of_drinks to 0 in the database but to prevent any errors and remove database dependencies i am including this private method in the model
  before_save :set_num_of_drinks

  def name
    "#{first_name} #{last_name}"
  end

  def birthday
    birthdate.strftime("%m/%d/%Y")
  end

  def age
    now = Time.now.to_date
    #calculate exact age by day
    return ((now.year) - (self.birthdate.year) - (self.birthdate.change(year: now.year) > now ? 1 : 0))
  end

  def have_a_drink
    if num_of_drinks < 3
      (age > 21) ? (self.num_of_drinks += 1 and true) : "Wait a few years"
    else
        "Go home you're drunk"
    end
  end

  def drunk?
    num_of_drinks >= 3
  end

  def drive_a_car
    case
      when age < 18 ; "Not yet youngin"
      when !license ; false
      when age > 21 && (license && drunk?) ; "Looks like a cab for you tonight"
      when age >= 18 && license ; true
    end
  end

  def sober_up
    if num_of_drinks!=0 ; self.num_of_drinks-=1 end
  end

  private
  def set_num_of_drinks
    num_of_drinks || 0
  end

end

