class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :question
      t.string :patient_age
      t.text :medical_history
      t.integer :epilepsy_type_id

      t.timestamps
    end
  end
end
