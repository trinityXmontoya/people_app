require_relative '../app/models/person'

  describe Person do

    subject(:elon){Person.create(
                  first_name: "Elon",
                  last_name:"Musk",
                  birthdate:'1971-06-28',
                  img_url:'https://pbs.twimg.com/profile_images/420314816444502016/xj5TnUsx.jpeg',
                  license: true)}
    subject(:lorde){Person.create("Ella","Yelich-O;Connor",'1996-09-28',0,'http://bit.ly/ti8S6KF',false)}
    subject(:norm){Person.create("Norm","Peterson",'1948-10-17',3,'http://2.bp.blogspot.com/-qv0NdZKA2_Y/UZPqouH9gWI/AAAAAAAAHYc/NC0BCjgzEzU/s320/1-norm-cheers.jpg',true)}
    subject(:yashar){Person.create("Yashar","M",'1997-02-28',0,'yashar.jpeg',false)}
    subject(:trinity){Person.create("Trinity","M",'1993-07-02',0,'trinity.jpeg',false)}

  describe '.name' do
    it "returns a string that is the person's full name" do
     expect(elon.name).to eq('Elon Musk')
    end#end full name method
  end#.name

  describe '.birthday' do
    it 'returns the person\'s birthdate as a string' do
      expect(elon.birthday).to eq('1971-06-28')
    end
  end#.birthday

  describe '.age' do
    it 'returns the person\'s age' do
      expect(elon.age).to eq(42)
    end
  end#.age

  describe '.have_a_drink' do

    it 'allows the person to drink if over 21' do
      expect(elon.have_a_drink).to eq(true)
      expect(lorde.have_a_drink).to eq("Wait a few years")
    end

    it 'only allows the person to have 3 drinks max' do
      elon.have_a_drink
      expect(elon.have_a_drink).to eq("Go home you're drunk")
    end
  end#.have_a_drink

  describe '.drunk' do
    it 'returns true if the person has had 3 drinks' do

      expect(norm.drunk?).to eq(true)

    end
  end

    describe '.drive_a_car' do

      it 'only allows a person with a license to drive' do
        expect(trinity.age).to eq(20)
        expect(trinity.drive_a_car).to eq(false)
      end

      it 'does not allow a person under 18 to drive' do
        expect(rose.age).to eq(15)
        expect(rose.drive_a_car).to eq("Not yet youngin")
      end#under 18

      it 'does not allow a drunk person to drive' do

        expect(norm.age).to eq(66)
        expect(norm.drunk?).to eq(true)
        expect(norm.drive_a_car).to eq("Looks like a cab for you tonight")
      end
    end#.drive_a_car

    describe ".sober_up" do
      it 'reduces the number of drinks a person has by one' do

        norm.sober_up
        expect(norm.num_of_drinks).to eq(2)
      end
    end


  end#end person
