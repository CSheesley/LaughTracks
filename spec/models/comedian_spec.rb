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

  describe 'Class Methods' do
    it 'can populate a list of all comedians if no age parameters are given' do

      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
      c3 = Comedian.create(name: "Dave Chappelle",	age: 45,	home_town: "Washington D.C.",	photo: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTQzMzA3MzU5NDg4MzIxMDk2/dave-chappelle_gettyimages-481295252jpg.jpg")

      expect(Comedian.count).to eq(3)
    end

    it 'can populate a list of comedians based upon an age paramater' do

      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
      c3 = Comedian.create(name: "Dave Chappelle",	age: 45,	home_town: "Washington D.C.",	photo: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTQzMzA3MzU5NDg4MzIxMDk2/dave-chappelle_gettyimages-481295252jpg.jpg")

      params = ({age: "36"})

      comics = Comedian.populate_by(params)

      expect(comics.count).to eq(1)
    end

    it 'can determine the average age of all comedians' do

      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
      c3 = Comedian.create(name: "Dave Chappelle",	age: 45,	home_town: "Washington D.C.",	photo: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTQzMzA3MzU5NDg4MzIxMDk2/dave-chappelle_gettyimages-481295252jpg.jpg")

      expect(Comedian.average_age.round).to eq(44)
    end

    it 'can build a string of unique and alpha sorted hometowns' do

      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
      c4 = Comedian.create(name: "Amy Schumer",	age: 37,	home_town: "New York, NY",	photo: "https://www.biography.com/.image/t_share/MTMyOTEyNjM4ODM2MzgyMTc0/amy-schumer_shutterstock_268854908_1290jpg.jpg")

      expect(Comedian.hometowns).to eq(" Chicago, IL | New York, NY | ")
    end
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
