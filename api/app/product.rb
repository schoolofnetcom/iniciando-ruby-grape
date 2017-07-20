require 'grape'
require 'sequel'

module Products
	class API < Grape::API
		prefix 'api'
		format :json

		resource 'products' do
			desc 'Get all products'
			get do
				{ :data => Product.all.map { |product| { :id => product.id, :name => product.name, :price => product.price, :quantity => product.quantity } } }
			end

			route_param :id do
				desc 'Get one product by id'
				get do
					{ :data => Product.where(:id => params[:id]).map { |product| { :id => product.id, :name => product.name, :price => product.price, :quantity => product.quantity } } }
				end
			end

			desc 'Create a new Product'
			params do
				requires :name, type: String
				requires :price, type: Float
				requires :quantity, type: Integer
			end
			post do
				product = Product.insert(:name => params[:name], :price => params[:price], :quantity => params[:quantity])
				{ :product => params }
			end

			desc 'Update a Product by id'
			params do
				requires :name, type: String
				requires :price, type: Float
				requires :quantity, type: Integer
			end			
			route_param :id do
				put do
					Product.where(:id => params[:id])
						   .update(:name => params[:name], :price => params[:price], :quantity => params[:quantity])

					{ :data => Product.where(:id => params[:id]).map { |product| { :id => product.id, :name => product.name, :price => product.price, :quantity => product.quantity } } }
				end
			end

			route_param :id do
				delete do
					Product.where(:id => params[:id]).delete
					{ :data => {} }
				end
			end
		end
	end
end