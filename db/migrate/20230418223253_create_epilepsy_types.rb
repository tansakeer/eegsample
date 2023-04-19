class CreateEpilepsyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :epilepsy_types do |t|
      t.string :seizure_name
      t.integer :questions_count
      t.integer :comment_tags_count

      t.timestamps
    end
  end
end
