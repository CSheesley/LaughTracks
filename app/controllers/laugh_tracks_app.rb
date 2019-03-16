class LaughTracksApp < Sinatra::Base

  get "/comedians" do
      @comedians = Comedian.populate(params)
      @specials = Special.populate(@comedians)
    erb :index
  end

  get "/comedians/new" do
    erb :new
  end

  post "/comedians" do
    Comedian.create(name: params[:name],
                    age: params[:age],
                    home_town: params[:hometown],
                    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjRt7QFOricO6Z5lacVEfv9GuR05a7u9tXfNaWu_Gt5gdo_rOd")
    redirect "/comedians"
  end
end
