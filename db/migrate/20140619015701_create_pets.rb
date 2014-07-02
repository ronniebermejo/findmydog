class CreatePets < ActiveRecord::Migration

  def down
    drop_table :pets
    drop_table :owners
    drop_table :places
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
      t.string :reported_as, :null => false
      t.string :comments
      t.string :status
      t.integer :owner_id
      t.timestamps
    end

    create_table :places, :force => true  do |t|
      t.timestamps
    end

    create_table :reports, :force => true do |t|
      t.timestamps
      t.integer :place_id
      t.integer :owner_id
    end

  end
end
