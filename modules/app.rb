require 'grape'

#require './module_1'
#require './module_2'
require './v1'
require './v2'

class App < Grape::API 
	mount V1::User
	mount V2::User
	
	#mount Module1::Hello
	#mount Module2::Hello
end