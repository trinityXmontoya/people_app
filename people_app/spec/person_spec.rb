require_relative '../app/models/person'

  describe Person do

  before(:each){@elon=Person.new("Elon","Musk",'1971-06-28',2,'https://pbs.twimg.com/profile_images/420314816444502016/xj5TnUsx.jpeg',true)}

  describe '.name' do
    it "returns a full name" do
     expect(@elon.name).to eq('Elon Musk')
    end#end full name method
  end#.name

  describe '.birthday' do
    it 'returns birthdate as a string' do
      expect(@elon.birthday).to eq('1971-06-28')
    end
  end#.birthday

  describe '.age' do
    it 'has an age' do
      expect(@elon.age).to eq(42)
    end
  end#.age

  describe '.have_a_drink' do

    it 'can only drink if over 21' do
      @lorde=Person.new("Ella","Yelich-O;Connor",'1996-09-28',0,'http://bit.ly/ti8S6KF',false)
      expect(@elon.have_a_drink).to eq(true)
      expect(@lorde.have_a_drink).to eq("Wait a few years")
    end

    it 'cannot have more than 3 drinks' do
      @elon.have_a_drink
      expect(@elon.have_a_drink).to eq("Go home you're drunk")
    end
  end#.have_a_drink

    describe '.drive_a_car' do

      it 'does not allow a person without a license to drive' do
        @trinity=Person.new("Trinity","M",'1993-07-02',0,'jpg.jpeg',false)

        expect(@trinity.age).to eq(20)
        expect(@trinity.drive_a_car).to eq(false)
      end

      it 'does not allow a person under 18 to drive' do
        @rose=Person.new("Rose","T",'1999-09-12',0,'jpeg.jpeg',false)

        expect(@rose.age).to eq(15)
        expect(@rose.drive_a_car).to eq("Not yet youngin")
      end#under 18

      it 'does not allow a drunk person to drive' do
        @norm=Person.new("Norm","Peterson",'1948-10-17',3,'http://2.bp.blogspot.com/-qv0NdZKA2_Y/UZPqouH9gWI/AAAAAAAAHYc/NC0BCjgzEzU/s320/1-norm-cheers.jpg',true)

        expect(@norm.age).to eq(66)
        expect(@norm.drunk?).to eq(true)
        expect(@norm.drive_a_car).to eq("Looks like a cab for you tonight")
      end

      it 'allows a sober person 18 and over with a license to drive' do
        @adrianna=Person.new("Adrianna","U",'1993-02-22',2,'http://bit.ly/ti8S6KF',true)

        expect(@adrianna.age).to eq(21)
        expect(@adrianna.drunk?).to eq(false)
        expect(@adrianna.drive_a_car).to eq(true)
      end


    end#.drive_a_car

    describe ".sober_up" do
      it 'reduces the number of drinks a person has' do
        @norm=Person.new("Norm","Peterson",'1948-10-17',3,'http://2.bp.blogspot.com/-qv0NdZKA2_Y/UZPqouH9gWI/AAAAAAAAHYc/NC0BCjgzEzU/s320/1-norm-cheers.jpg',true)

        @norm.sober_up
        expect(@norm.num_of_drinks).to eq(2)
      end
    end


  end#end person
