class AddActiveToSubscriber < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :active, :boolean,default: :true
  end
end
