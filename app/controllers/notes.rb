#INDEX

get '/notes' do
  @notes = Note.all
  erb :index
end


#NEW

get '/notes/new' do
  erb :new
end

#CREATE

post '/notes' do 
  @note = Note.new(title: params[:title], content: params[:content])
  if @note.save
	redirect '/notes'
  else
	erb :new
  end
end

# SHOW

get '/notes/:id' do
  @note = Note.find_by(id: params[:id])
  erb :show
end	

# EDIT

get '/notes/:id/edit' do
  @note = Note.find_by(id: params[:id])
  erb :edit
end