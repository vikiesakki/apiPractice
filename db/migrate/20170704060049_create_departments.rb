class CreateDepartments < ActiveRecord::Migration[5.1]
  def up
  	unless table_exists?(:departments)
	    create_table :departments do |t|
	      t.string :name,:created_by
	      t.timestamps
	    end
    end
  end
  def down
  	if table_exists?(:departments)
  		drop_table :departments
  	end
  end
end
