require 'spec_helper'
  describe Person do

    #people object scenarios:
    #over 21, sober, with license
    subject(:elon){Person.create(
                  first_name: "Elon",
                  last_name:"Musk",
                  birthdate:'1971-06-28',
                  img_url:'https://pbs.twimg.com/profile_images/420314816444502016/xj5TnUsx.jpeg',
                  num_of_drinks: 2,
                  license: true)}
    #over 21, drunk, with license
    subject(:norm){Person.create(first_name:"Norm",last_name:"Peterson",birthdate:'1948-10-17',num_of_drinks:3,img_url:'http://2.bp.blogspot.com/-qv0NdZKA2_Y/UZPqouH9gWI/AAAAAAAAHYc/NC0BCjgzEzU/s320/1-norm-cheers.jpg',license: true)}
    #over 18, under 21, without license
    subject(:trinity){Person.create(first_name:"Trinity",last_name:"M",birthdate:'1993-07-02',img_url:'trinity.jpeg',license: false)}
    #under 18
    subject(:lorde){Person.create(first_name:"Ella",last_name:"Yelich-O;Connor",birthdate:'1996-09-28',img_url:'http://bit.ly/ti8S6KF',license: true}

  describe '.name' do
    it "returns a string that is the person's full name" do
     expect(elon.name).to eq('Elon Musk')
    end#end full name method
  end#.name

  describe '.birthday' do
    it 'returns the person\'s birthdate as a string' do
      expect(elon.birthday).to eq('06/28/1971')
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

  describe '.drunk?' do
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
        expect(lorde.age).to eq(17)
        expect(lorde.drive_a_car).to eq("Not yet youngin")
      end#under 18

      it 'does not allow a drunk person to drive' do
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
