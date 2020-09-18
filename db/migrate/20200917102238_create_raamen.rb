class CreateRaamen < ActiveRecord::Migration[6.0]
  def change
    create_table :raamens do |t|
    	t.string :name, null: false
    	t.string :price, null: false
    	t.string :image_id, null: false
    	t.string :text, null: false

      t.timestamps
    end
  end
end
