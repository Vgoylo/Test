class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :request_type
      t.string :digsite_info
      t.string :additional_service_area_codes, array: true, default: []
      t.string :primary_service_area_code
      t.string :request_action
      t.datetime :response_due_date_time
      t.string :sequence_number

      t.timestamps
    end
  end
end
