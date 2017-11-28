class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :timing
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
