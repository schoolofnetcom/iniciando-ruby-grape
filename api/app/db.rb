require 'sequel'

DB = Sequel.sqlite('api.db')
Sequel::Model.plugin :schema

class Product < Sequel::Model
	Sequel.extension :pagination

	set_schema do
		primary_key :id
		String :name
		Float :price
		Integer :quantity
	end

	create_table unless table_exists?
end