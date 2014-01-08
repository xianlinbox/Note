require 'sinatra'
require 'data_mapper'
require 'haml'
require File.dirname(__FILE__)+'/domain/note'

get '/' do
  @notes = Note.all(:order => [:id.desc])
  haml :index
end

post '/' do
  note = Note.new(:content => params[:content])
  if note.save
    status 201
  else
    status 412
  end
  redirect '/'
end

get '/note/:id' do
  @note = Note.get(params[:id])
  haml :note
end

get '/note/:id/delete' do
  @note = Note.get(params[:id])
  haml :delete_confirm
end

put '/note/:id' do
  Note.get(params[:id]).update(:content => params[:content], :completed_at => DateTime.strptime(params[:completed_at],'%Y-%m-%dT%H:%M:%S%z' ))
  redirect '/'
end

delete '/note/:id' do
  note = Note.get(params[:id])
  note.destroy
  redirect '/'
end
