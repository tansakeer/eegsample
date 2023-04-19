class CreateEegTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :eeg_types do |t|
      t.string :name
      t.string :wave_frequency

      t.timestamps
    end
  end
end
