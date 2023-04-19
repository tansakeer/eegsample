class CreateCommentEegTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_eeg_types do |t|
      t.integer :comment_id
      t.integer :eeg_type_id
      t.integer :epilepsy_type_id

      t.timestamps
    end
  end
end
