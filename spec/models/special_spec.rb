RSpec.describe Special do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        expect(special).to_not be_valid
      end

      it 'should be invalid if missing a run time' do
        special = Special.create(name: "100% Fresh")
        expect(special).to_not be_valid
      end
    end
  end

  describe 'Class Methodss' do
    it 'can populate a list of all specials for all comedians given' do

      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
      c3 = Comedian.create(name: "Dave Chappelle",	age: 45,	home_town: "Washington D.C.",	photo: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTQzMzA3MzU5NDg4MzIxMDk2/dave-chappelle_gettyimages-481295252jpg.jpg")

      comedians = [c1, c2, c3]

      c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "Kid Gorgeous",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c3.specials.create(name: "Killin' Them Softly",	run_time: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
      c3.specials.create(name: "Equanimity",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

      specials = Special.populate_from(comedians)

      expect(specials.count).to eq(5)
    end

    it 'can return the average run time of all specials for all comedians given' do

      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
      c3 = Comedian.create(name: "Dave Chappelle",	age: 45,	home_town: "Washington D.C.",	photo: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTQzMzA3MzU5NDg4MzIxMDk2/dave-chappelle_gettyimages-481295252jpg.jpg")

      c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "Kid Gorgeous",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c3.specials.create(name: "Killin' Them Softly",	run_time: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
      c3.specials.create(name: "Equanimity",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

      expect(Special.average_run_time.round).to eq(64)
    end
  end

  describe 'Relationships' do
    it 'has a comedian' do
      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")

      s1 = c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      s2 = c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
      s3 = c2.specials.create(name: "Kid Gorgeous",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")

      expect(s1.comedian_id).to eq(1)
      expect(s2.comedian_id).to eq(2)
      expect(s3.comedian_id).to eq(2)
    end
  end
end
