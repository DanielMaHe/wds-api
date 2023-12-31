# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_002_225_354) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'telephone'
    t.string 'company'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_customers_on_email', unique: true
  end

  create_table 'images', force: :cascade do |t|
    t.bigint 'proyect_id', null: false
    t.string 'file'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['proyect_id'], name: 'index_images_on_proyect_id'
  end

  create_table 'proyects', force: :cascade do |t|
    t.string 'company'
    t.integer 'status'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'workers', force: :cascade do |t|
    t.string 'username'
    t.boolean 'isAdmin'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.string 'token'
    t.string 'mail'
    t.index ['mail'], name: 'index_workers_on_mail', unique: true
    t.index ['token'], name: 'index_workers_on_token', unique: true
    t.index ['username'], name: 'index_workers_on_username', unique: true
  end

  add_foreign_key 'images', 'proyects'
end
