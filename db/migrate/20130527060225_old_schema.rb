class OldSchema < ActiveRecord::Migration
  def change
    create_table "importages", :force => true do |t|
      t.integer  "mix_id"
      t.integer  "sample_id"
      t.integer  "simple_volume"
      t.float    "start_time",    :default => 0.0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "library_id"
    end

    create_table "libraries", :force => true do |t|
      t.integer  "musician_id"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "mixes", :force => true do |t|
      t.string   "name"
      t.text     "desc"
      t.integer  "musician_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "samples", :force => true do |t|
      t.string   "name"
      t.text     "desc"
      t.integer  "musician_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "audio_file_name"
      t.string   "audio_content_type"
      t.integer  "audio_file_size"
      t.datetime "audio_updated_at"
    end
  end
end
