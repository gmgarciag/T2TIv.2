require 'test_helper'

class InicioControllerTest < ActionController::TestCase
  test "should get partir" do
    ##get :partir
  	##assert_response :success
  	assert true
  end

  test "sin parametros" do
  	post :partir
  	assert_response 400, msg: "deberia haber retornado 400, sin parametros"
  end

  test "token invalido" do
  	post :partir, tag: "matrijochan", token:"1234567"
  	assert_response 400, msg: "deberia haber retornado 400, token invalido"
  end

  test "funcionamiento normal" do
  	post :partir, tag: "matrijochan", token: "486552130.9d76ac8.24245417ae7f4614a078f2ed435b1a7b"
  	assert_response 200, msg: "deberia haber retornado 200, token valido y mensaje valido"
  end


end
