class CreatePets < ActiveRecord::Migration

  def down
    drop_table :pets
    drop_table :owners
    drop_table :places
    drop_table :images
  end

  def up

    create_table :owners, :force => true do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :phone_number
      t.timestamps
    end

    add_index 'owners', ['name'], name: :index_owners_on_name

    create_table :pets, :force => true  do |t|
      t.string :name, :null => false
      t.text :comments
      t.integer :owner_id
      t.integer :image_id
      t.integer :place_id
      t.timestamps
    end

    create_table :reports, :force => true do |t|
      t.timestamps
      t.integer :place_id
      t.string :text
      t.integer :pet_id
    end

    create_table :images, :force => true do |t|
      t.string :category
      t.string :url, :null => false
      t.timestamps
    end

  end
end
