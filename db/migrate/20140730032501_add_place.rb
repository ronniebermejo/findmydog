class AddPlace < ActiveRecord::Migration
    def up
      create_table :places, :force => true do |t|
        t.string :name
        t.string :address
        t.float :latitude
        t.float :longitude
        t.belongs_to :place_category
        t.belongs_to :pet

        t.timestamps
      end

      create_table :place_categories, :force => true do |t|
        t.string :category
        t.timestamps
      end
    end


    def down
      drop_table :places
      drop_table :place_categories
    end

end
