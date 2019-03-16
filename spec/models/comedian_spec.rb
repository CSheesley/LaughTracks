RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end

  describe 'Class Methodss' do
    # it 'has many specials' do
    #   c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
    #
    #   c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
    #   c1.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
    #
    #   expect(c1.specials.length).to eq(2)
    # end
  end

  describe 'Relationships' do
    it 'has many specials' do
      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")

      c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c1.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")

      expect(c1.specials.length).to eq(2)
    end
  end
end
