class AddPlace < ActiveRecord::Migration
    def up

      create_table :places do |t|
        t.string :name
        t.string :address
        t.float :latitude
        t.float :longitude
        t.integer :place_type_id

        t.timestamps
      end

      create_table :place_types do |t|
        t.string :type
        t.timestamps
      end
    end


    def down
      drop_table :places
      drop_table :place_types
    end


end
