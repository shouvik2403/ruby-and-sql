class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string "modality"
      t.integer "contact_id" #foreign key
      t.integer "salesperson_id" #foreign key
      t.integer "company_id" #foreign key
      t.string "notes"

      t.timestamps
    end
  end
end
