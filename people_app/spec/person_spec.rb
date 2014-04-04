require_relative '../app/models/person'

  describe Person do

  before(:each){@elon=Person.new("Elon","Musk",'1971-06-28',2,'https://pbs.twimg.com/profile_images/420314816444502016/xj5TnUsx.jpeg',true)}

    it "has a full name" do
     expect(@elon.name).to eq('Elon Musk')
    end#end full name method

    # it 'has a birthday' do
    #   expect(@elon.birthdate).to eq(1971-06-28)
    # end

    it 'has an age' do
      expect(@elon.age).to eq(43)
    end

    it 'can drink if over 21' do
      expect(@elon.have_a_drink).to eq(true)
      expect(@elon.num_of_drinks).to eq(3)
    end

    it 'cannot have more than 3 drinks' do
      @elon.have_a_drink
      expect(@elon.have_a_drink).to eq("Go home you're drunk")
    end

  end#end person
