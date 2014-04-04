require_relative '../app/models/person'

  describe Person do

  before(:each){@elon=Person.new("Elon","Musk",1971-06-28,2,'https://pbs.twimg.com/profile_images/420314816444502016/xj5TnUsx.jpeg',true)}

    it "has a full name" do
     expect(@elon.name).to eq('Elon Musk')
    end#end full name method


end#end person
