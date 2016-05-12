class InicioController < ApplicationController
require 'rest-client'
require 'json'
  def partir
  	parametro = params[:tag]
  	##puts 'este es el tag'
  	##puts parametro
  	respuestaMeta = RestClient.get 'https://api.instagram.com/v1/tags/'+parametro+'?access_token=486552130.9d76ac8.24245417ae7f4614a078f2ed435b1a7b', :content_type => 'application/json'
  	##puts respuestaMeta
  	hashRespuestaMeta = JSON.parse respuestaMeta
  	##puts hashRespuestaMeta

  	respestaPost = RestClient.get 'https://api.instagram.com/v1/tags/'+parametro+'/media/recent?access_token=486552130.9d76ac8.24245417ae7f4614a078f2ed435b1a7b', :content_type => 'application/json'
  	##puts respestaPost
  	hashRespestaPost = JSON.parse respestaPost
  	##puts hashRespestaPost

  	puts hashRespuestaMeta['data']['media_count']


  end
end
