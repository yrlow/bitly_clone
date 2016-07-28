require "byebug"
enable :sessions

get '/' do
	@urls = Url.all.order(id: :desc)
  	erb :"static/index"
end

post '/urls' do
	# create a new url
	url = Url.create(:long_url => params[:long_url])
	if url.id.nil?
		url.errors.full_messages.to_json		
	else
		url.to_json 
		#this is what $(this) in ajax is looking for
	end

end

# get '/urls/long_urls' do 
# 	@urls = Url.all
# 	erb :"urls/index"
# end

# get '/users/:user_id/urls/:id' do
# 	@url = Url.find(params[:id])
# 	erb :"urls/show"
# end

get '/:short_url' do 
	# redirect to appropriate long url
	url = Url.find_by(short_url: params[:short_url])
	url.click_count += 1
	url.save
	if url.long_url =~ /http/
		redirect "#{url.long_url}"
	else
		redirect "http://#{url.long_url}"
	end
end

# post '/urls/:id/destroy' do
# 	Url.destroy(params[:id])
# 	redirect '/'
# end
