# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170405170045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", primary_key: "assignmentid", force: :cascade do |t|
    t.string   "assignmentdescription", limit: 255
    t.datetime "assignmentdate"
    t.integer  "sessionid",                                       null: false
    t.boolean  "exam"
    t.float    "percentofgrade",                    default: 0.0
    t.float    "maximumpoints"
    t.index ["sessionid"], name: "assignments_classid", using: :btree
  end

  create_table "classes", primary_key: "classid", force: :cascade do |t|
    t.integer  "metaclassid",             null: false
    t.datetime "classdate"
    t.string   "classtime",    limit: 50
    t.string   "classname",    limit: 50
    t.integer  "instructorid"
    t.string   "location",     limit: 50
    t.text     "notes"
    t.index ["classname"], name: "classes_classname", using: :btree
    t.index ["instructorid"], name: "classes_instructorid", using: :btree
  end

  create_table "instructors", primary_key: "instructorid", force: :cascade do |t|
    t.string "instructor",  limit: 50
    t.string "emailname",   limit: 50
    t.string "phonenumber", limit: 30
    t.string "extension",   limit: 30
    t.index ["emailname"], name: "instructors_emailname", using: :btree
    t.index ["instructor"], name: "instructors_instructor", using: :btree
  end

  create_table "metaclasses", primary_key: "metaclassid", force: :cascade do |t|
    t.string  "metaclassname",         limit: 100
    t.string  "metaclassdaytime",      limit: 50
    t.decimal "metaclasstime",                     precision: 18, scale: 2, default: "0.0"
    t.integer "metaclassinstructorid"
    t.string  "metaclasslocation",     limit: 50
    t.text    "metaclassnote"
    t.text    "metaclassattachment"
    t.integer "sessionid"
    t.index ["metaclassinstructorid"], name: "metaclasses_sessioninstructorid", using: :btree
  end

  create_table "michiganscores", primary_key: "testscoreid", force: :cascade do |t|
    t.integer "assignmentid"
    t.integer "studentid"
    t.float   "speakingscore",  default: 0.0
    t.float   "listeningscore", default: 0.0
    t.float   "grammarscore",   default: 0.0
    t.float   "vocabscore",     default: 0.0
    t.float   "readscore",      default: 0.0
    t.index ["assignmentid", "studentid"], name: "michiganscores_assignmentid_studentid_key", unique: true, using: :btree
    t.index ["assignmentid"], name: "michiganscores_michiganscoresclassid", using: :btree
  end

  create_table "sessions", primary_key: "sessionid", force: :cascade do |t|
    t.string   "sessionname",      limit: 50
    t.datetime "sessionstartdate"
    t.datetime "sessionenddate"
  end

  create_table "students", primary_key: "studentid", force: :cascade do |t|
    t.string   "firstname",          limit: 100,                 null: false
    t.string   "lastname",           limit: 100,                 null: false
    t.string   "client",             limit: 50
    t.string   "address",            limit: 255
    t.string   "city",               limit: 50
    t.string   "stateorprovince",    limit: 20
    t.string   "postalcode",         limit: 20
    t.string   "officephonenumber",  limit: 30
    t.string   "cellphonenumber",    limit: 30
    t.string   "emailname",          limit: 100
    t.string   "company",            limit: 100
    t.string   "division",           limit: 100
    t.string   "job",                limit: 50
    t.string   "manager",            limit: 50
    t.string   "originallevel",      limit: 10
    t.string   "currentlevel",       limit: 10
    t.datetime "testscoredate"
    t.integer  "grammartestscore"
    t.integer  "readingtestscore"
    t.integer  "listeningtestscore"
    t.integer  "vocabtestscore"
    t.text     "notes"
    t.boolean  "leftthecompany",                 default: false
    t.index ["emailname"], name: "students_emailname", using: :btree
    t.index ["lastname"], name: "students_lastname", using: :btree
    t.index ["postalcode"], name: "students_postalcode", using: :btree
  end

  create_table "studentsclasses", primary_key: "studentclassid", force: :cascade do |t|
    t.integer "classid",                    null: false
    t.integer "studentid"
    t.boolean "attendance", default: false
    t.index ["classid"], name: "studentsclasses_classid", using: :btree
    t.index ["studentid", "classid"], name: "studentsclasses_studentid_classid_key", unique: true, using: :btree
    t.index ["studentid"], name: "studentsclasses_studentid", using: :btree
  end

  create_table "studentsmetaclasses", primary_key: "studentmetaclassid", force: :cascade do |t|
    t.integer "metaclassid"
    t.integer "studentid"
    t.integer "averageattendance"
    t.string  "metaclassbeginlevel", limit: 255
    t.index ["metaclassid", "studentid"], name: "studentsmetaclasses_metaclassid_studentid_key", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
