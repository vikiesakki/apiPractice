class CreateEmployees < ActiveRecord::Migration[5.1]
  def up
  	unless table_exists?(:employees)
	    create_table :employees do |t|
	      t.string :name,:email,:address
	      t.integer :mobile
	      t.references :department,:foreign_key=>true
	      t.timestamps
	    end
	end
  end
end
