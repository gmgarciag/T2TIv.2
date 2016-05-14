class InicioController < ApplicationController
require 'rest-client'
require 'json'
  def partir
  	status = 200
  	begin
	  	parametroTag = params[:tag]
	  	parametroAtoken = params[:access_token]
		##parametroAtoken = '486552130.9d76ac8.24245417ae7f4614a078f2ed435b1a7b'
	  	## ACCES TOKEN CLASE 2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402
	  	## ACCES TOKEN MIO 486552130.9d76ac8.24245417ae7f4614a078f2ed435b1a7b

	  	##puts 'este es el tag'
	  	##puts parametroTag
	  	respuestaMeta = RestClient.get 'https://api.instagram.com/v1/tags/'+parametroTag+'?access_token='+parametroAtoken, :content_type => 'application/json'
	  	##puts respuestaMeta
	  	hashRespuestaMeta = JSON.parse respuestaMeta
	  	##puts hashRespuestaMeta

	  	respestaPost = RestClient.get 'https://api.instagram.com/v1/tags/'+parametroTag+'/media/recent?access_token='+parametroAtoken , :content_type => 'application/json'
	  	##puts respestaPost
	  	hashRespestaPost = JSON.parse respestaPost
	  	##puts hashRespestaPost

	  	puts hashRespuestaMeta['data']['media_count']

	  	## Hay que retornar un JSON con codigo HTTP 200
	  	## metadata{ total: total de publicaciones asociadas a este tag }
	  	metadata = ({ :total => hashRespuestaMeta['data']['media_count'] })
	  	## post [ {tags[string], username, likes, url, caption}] con informacion de todos los post

	#  	puts hashRespestaPost['data'][0]['tags']

	  	arregloPost = []
	  	for i in 0 .. ((hashRespestaPost['data']).length - 1)
	  		puts i
	  		post = hashRespestaPost['data'][i]
	  		jsonPost = ({ :tags => post['tags'],
	  		 			:username => post['user']['username'] ,
	  		 			:likes => (post['likes']['count']).to_i,
	  		 			:url => post['images']['standard_resolution']['url'],
	  		 			:caption => post['caption']['text']})
	  		arregloPost << jsonPost
	  	end
	  	version = '1.2.0'
	  rescue
	  	status = 400
	  end
  	## version string con la version del servicio
  	## Si tiene los parametros incorrectos http 400
  	render :status => status, json: {metadata: metadata,
  				posts: arregloPost,
  				version: version}


  end
end
