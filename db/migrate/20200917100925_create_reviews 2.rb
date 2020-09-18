class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
    	t.string :review, null: false
    	t.string :image_id, null: false
    	t.string :topping, null: false
    	t.string :option, null: false
    	t.string :tennsuu, null: false

      t.timestamps
    end
  end
end
