RSpec.describe 'comedians homepage view' do
  context 'as a visitor' do
    it 'should see a list of comedians along with thier name, age, and city' do
      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")

      c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")

      visit '/comedians'

      within "#comedian-#{c1.id}" do
        expect(page).to have_content('Adam Sandler')
        expect(page).to have_content('52')
        expect(page).to have_content('New York, NY')
      end
      within "#comedian-#{c2.id}" do
        expect(page).to have_content('John Mulaney')
        expect(page).to have_content('36')
        expect(page).to have_content('Chicago, IL')
      end
    end

    it 'should see a list of each comedians TV specials names' do
      c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
      c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")

      c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
      c2.specials.create(name: "Kid Gorgeous",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")

      visit '/comedians'

      within "#comedian-#{c1.id}" do
        expect(page).to have_content("100% Fresh")
      end
      within "#comedian-#{c2.id}" do
        expect(page).to have_content("The Comeback Kid")
        expect(page).to have_content("Kid Gorgeous")
      end
    end

    context 'where I see a list of each comedians TV specials names' do
      it 'should see the runtime and thumbnail image of each special' do
        c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")

        c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c2.specials.create(name: "Kid Gorgeous",	run_time: 64, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")

        visit '/comedians'

        thumbnail_1 = 'https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg'
        thumbnail_2 = 'https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg'

        within "#comedian-#{c2.id}" do
          expect(page).to have_content("61")
          expect(page).to have_xpath("//img[@src='#{thumbnail_1}']")
          expect(page).to have_content("64")
          expect(page).to have_xpath("//img[@src='#{thumbnail_2}']")
        end
      end
    end

    context 'when looking at the area at the top of the page called statistics' do
      it 'should see the average for all comedian ages and specials run time, along with a unique list of hometowns' do
        c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
        c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
        c10 = Comedian.create(name: "Hannibal Buress",	age: 36,	home_town: "Chicago, IL",	photo: "https://pmcvariety.files.wordpress.com/2018/03/hannibal-buress.jpg?w=1000")

        c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c10.specials.create(name: "Comedy Camisado",	run_time: 66, thumbnail: "https://m.media-amazon.com/images/M/MV5BNDQ0ZDA3NTQtNzI3NC00Y2NiLWI0ZTctN2RjNDYxNWEyODY4XkEyXkFqcGdeQXVyNTQwMDk4NDM@._V1_UX182_CR0,0,182,268_AL_.jpg")

        visit '/comedians'

        within '#statistics' do
          expect(page).to have_content("41")
          expect(page).to have_content("67")
          expect(page).to have_content("New York, NY")
          expect(page).to have_content("Chicago, IL")
        end
      end
    end

    context 'when I filter comedians by age' do
      it 'should show only information for those comedians' do
        c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
        c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")
        c10 = Comedian.create(name: "Hannibal Buress",	age: 36,	home_town: "Chicago, IL",	photo: "https://pmcvariety.files.wordpress.com/2018/03/hannibal-buress.jpg?w=1000")

        c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c10.specials.create(name: "Comedy Camisado",	run_time: 66, thumbnail: "https://m.media-amazon.com/images/M/MV5BNDQ0ZDA3NTQtNzI3NC00Y2NiLWI0ZTctN2RjNDYxNWEyODY4XkEyXkFqcGdeQXVyNTQwMDk4NDM@._V1_UX182_CR0,0,182,268_AL_.jpg")

        visit '/comedians?age=36'

        within '#statistics' do
          expect(page).to have_content("36") #average comedian
          expect(page).to have_content("2") #total specials
          expect(page).to have_content("64") #average run time
          expect(page).to have_content("Chicago, IL")
          expect(page).to_not have_content("New York, NY")
        end
        within "#profiles" do
          expect(page).to have_content('John Mulaney')
          expect(page).to have_content('Hannibal Buress')
          expect(page).to_not have_content('Adam Sandler')
        end
      end
    end

    context 'when looking at a comedians profile' do
      it 'should show a count of the number of specials that they have done' do
        c1 = Comedian.create(name: "Adam Sandler",	age: 52,	home_town: "New York, NY",	photo: "https://cdn1.thr.com/sites/default/files/2012/12/6_degrees_of_judd_apatow_adam_sandler.jpg")
        c2 = Comedian.create(name: "John Mulaney",	age: 36,	home_town: "Chicago, IL", photo: "https://resizing.flixster.com/zOSxtyjb51wl7o4ceVADrTui2IY=/874x779/v1.cjs0MzU5NTtqOzE3OTgzOzEyMDA7ODc0Ozc3OQ")

        c1.specials.create(name: "100% Fresh",	run_time: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNiYWJlNzQtYmMwMS00MjUyLWE4YjAtNDVjZWUwNzBjZDQ1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c2.specials.create(name: "The Comeback Kid", run_time: 61, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDQ3NjU0NmQtYjgyZS00MzIzLWJjNDEtMWY5YjczYjc0MTMyXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_UY268_CR4,0,182,268_AL_.jpg")
        c2.specials.create(name: "Comedy Camisado",	run_time: 66, thumbnail: "https://m.media-amazon.com/images/M/MV5BNDQ0ZDA3NTQtNzI3NC00Y2NiLWI0ZTctN2RjNDYxNWEyODY4XkEyXkFqcGdeQXVyNTQwMDk4NDM@._V1_UX182_CR0,0,182,268_AL_.jpg")

        visit '/comedians'

        within "#comedian-#{c1.id}" do
          expect(page).to have_content("1")
        end
        within "#comedian-#{c2.id}" do
          expect(page).to have_content('2')
        end
      end
    end

    context 'when I choose the option to create a new comedian' do
      it 'should see an input form with name, age, and city fields, along with a submit button' do

        visit '/comedians/new'

        within "#add-new-comedian-form" do
          expect(page).to have_content("Name")
          expect(page).to have_content("Age")
          expect(page).to have_content("Home Town")
          expect(page).to have_selector("input[type='submit'][value='Submit']")
        end
      end

      it 'should redirect me back to the homepage, where the comedian has been added' do
          visit '/comedians/new'

          within ".add-new" do
            fill_in('name', with: 'John Stewart')
            fill_in('age', with: 52)
            fill_in('hometown', with: 'New Township, NJ')
            find_button('Submit').click
          end

          expect(page).to have_content('Laugh Tracks')

          within "#profiles" do
            expect(page).to have_content('John Stewart')
            expect(page).to have_content('52')
            expect(page).to have_content('New Township, NJ')
          end
      end
    end
  end
end
