# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100520212356) do

  create_table "course_numbers", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  create_table "courses", :force => true do |t|
    t.integer  "course_number_id",        :limit => 11
    t.string   "name"
    t.string   "number"
    t.string   "semester"
    t.string   "mini"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "primary_faculty_label"
    t.string   "secondary_faculty_label"
    t.string   "twiki_url"
    t.boolean  "remind_about_effort"
    t.string   "short_name"
  end

  add_index "courses", ["semester"], :name => "index_courses_on_semester"
  add_index "courses", ["year"], :name => "index_courses_on_year"
  add_index "courses", ["twiki_url"], :name => "index_courses_on_twiki_url"

  create_table "curriculum_comment_types", :force => true do |t|
    t.string   "name"
    t.string   "background_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_comments", :force => true do |t|
    t.string   "url"
    t.string   "semester"
    t.string   "year"
    t.integer  "user_id",                    :limit => 11
    t.integer  "curriculum_comment_type_id", :limit => 11
    t.string   "comment",                    :limit => 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "human_name"
    t.boolean  "notify_me"
  end

  add_index "curriculum_comments", ["url"], :name => "index_curriculum_comments_on_url"
  add_index "curriculum_comments", ["semester"], :name => "index_curriculum_comments_on_semester"
  add_index "curriculum_comments", ["year"], :name => "index_curriculum_comments_on_year"

  create_table "effort_log_line_items", :force => true do |t|
    t.integer  "effort_log_id", :limit => 11
    t.integer  "course_id",     :limit => 11
    t.integer  "task_type_id",  :limit => 11
    t.float    "day1"
    t.float    "day2"
    t.float    "day3"
    t.float    "day4"
    t.float    "day5"
    t.float    "day6"
    t.float    "day7"
    t.float    "sum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id",    :limit => 11
  end

  create_table "effort_logs", :force => true do |t|
    t.integer  "person_id",   :limit => 11
    t.integer  "week_number", :limit => 11
    t.integer  "year",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sum"
  end

  add_index "effort_logs", ["person_id"], :name => "index_effort_logs_on_person_id"
  add_index "effort_logs", ["week_number"], :name => "index_effort_logs_on_week_number"

  create_table "pages", :force => true do |t|
    t.integer  "course_id",              :limit => 11
    t.string   "label"
    t.integer  "position",               :limit => 11
    t.integer  "indentation_level",      :limit => 11
    t.boolean  "is_task"
    t.text     "tab_one_contents"
    t.text     "tab_two_contents"
    t.text     "tab_three_contents"
    t.integer  "task_duration",          :limit => 11
    t.string   "tab_one_email_from"
    t.string   "tab_one_email_subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tips_and_traps"
    t.text     "readings_and_resources"
    t.text     "faculty_notes"
  end

  add_index "pages", ["position"], :name => "index_pages_on_position"
  add_index "pages", ["course_id"], :name => "index_pages_on_course_id"

  create_table "papers", :force => true do |t|
    t.string   "title"
    t.string   "authors_full_listing"
    t.string   "conference"
    t.integer  "year",                 :limit => 11
    t.string   "paper_file_name"
    t.string   "paper_content_type"
    t.integer  "paper_file_size",      :limit => 11
    t.datetime "paper_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "papers_people", :id => false, :force => true do |t|
    t.integer "paper_id",  :limit => 11
    t.integer "person_id", :limit => 11
  end

  create_table "peer_evaluation_learning_objectives", :force => true do |t|
    t.integer  "person_id",          :limit => 11
    t.integer  "team_id",            :limit => 11
    t.string   "learning_objective"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peer_evaluation_reports", :force => true do |t|
    t.integer  "team_id",      :limit => 11
    t.integer  "recipient_id", :limit => 11
    t.text     "feedback"
    t.datetime "email_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peer_evaluation_reviews", :force => true do |t|
    t.integer  "team_id",         :limit => 11
    t.integer  "author_id",       :limit => 11
    t.integer  "recipient_id",    :limit => 11
    t.string   "question"
    t.text     "answer"
    t.integer  "sequence_number", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "twiki_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "human_name"
    t.boolean  "is_staff",                                :default => false
    t.boolean  "is_student",                              :default => false
    t.boolean  "is_admin",                                :default => false
    t.string   "webiso_account"
    t.string   "image_uri"
    t.string   "graduation_year"
    t.string   "masters_program"
    t.string   "masters_track"
    t.boolean  "is_part_time"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["human_name"], :name => "index_people_on_human_name"

  create_table "project_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_types", ["name"], :name => "index_project_types_on_name"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "project_type_id", :limit => 11
    t.integer  "course_id",       :limit => 11
    t.boolean  "is_closed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name"], :name => "index_projects_on_name"

  create_table "rss_feeds", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "publication_date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scotty_dog_sayings", :force => true do |t|
    t.text     "saying"
    t.integer  "user_id",    :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.string   "comment"
    t.string   "page"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "task_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_staff",    :default => false
    t.boolean  "is_student",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "twiki_space"
    t.string   "tigris_space"
    t.string   "course_id"
    t.integer  "primary_faculty_id",                  :limit => 11
    t.integer  "secondary_faculty_id",                :limit => 11
    t.string   "livemeeting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section"
    t.datetime "peer_evaluation_first_email"
    t.datetime "peer_evaluation_second_email"
    t.boolean  "peer_evaluation_do_point_allocation"
  end

  create_table "teams_people", :id => false, :force => true do |t|
    t.integer "team_id",   :limit => 11
    t.integer "person_id", :limit => 11
  end

  add_index "teams_people", ["team_id"], :name => "index_teams_people_on_team_id"
  add_index "teams_people", ["person_id"], :name => "index_teams_people_on_person_id"

  create_table "user_verions", :force => true do |t|
    t.integer  "person_id",                 :limit => 11
    t.integer  "version",                   :limit => 11
    t.string   "webiso_account"
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "is_staff",                                 :default => false
    t.boolean  "is_student",                               :default => false
    t.boolean  "is_admin",                                 :default => false
    t.string   "twiki_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "human_name"
    t.string   "image_uri"
    t.string   "graduation_year"
    t.string   "masters_program"
    t.string   "masters_track"
    t.boolean  "is_part_time"
    t.boolean  "is_teacher"
    t.boolean  "is_adobe_connect_host"
    t.datetime "effort_log_warning_email"
    t.boolean  "is_active"
    t.string   "legal_first_name"
    t.string   "organization_name"
    t.string   "title"
    t.string   "work_city"
    t.string   "work_state"
    t.string   "work_country"
    t.string   "telephone1"
    t.string   "skype"
    t.string   "tigris"
    t.string   "personal_email"
    t.string   "local_near_remote"
    t.text     "biography"
    t.text     "user_text"
    t.string   "office"
    t.string   "office_hours"
    t.string   "telephone1_label"
    t.string   "telephone2"
    t.string   "telephone2_label"
    t.string   "telephone3"
    t.string   "telephone3_label"
    t.string   "telephone4"
    t.string   "telephone4_label"
    t.integer  "updated_by_user_id",        :limit => 11
    t.boolean  "is_alumnus"
    t.string   "pronunciation"
    t.datetime "google_created"
    t.datetime "twiki_created"
    t.datetime "adobe_created"
    t.datetime "msdnaa_created"
  end

  add_index "user_verions", ["person_id"], :name => "index_user_verions_on_person_id"

  create_table "users", :force => true do |t|
    t.string   "webiso_account"
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "is_staff",                                 :default => false
    t.boolean  "is_student",                               :default => false
    t.boolean  "is_admin",                                 :default => false
    t.string   "twiki_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "human_name"
    t.string   "image_uri"
    t.string   "graduation_year"
    t.string   "masters_program"
    t.string   "masters_track"
    t.boolean  "is_part_time"
    t.boolean  "is_teacher"
    t.boolean  "is_adobe_connect_host"
    t.datetime "effort_log_warning_email"
    t.boolean  "is_active"
    t.string   "legal_first_name"
    t.string   "organization_name"
    t.string   "title"
    t.string   "work_city"
    t.string   "work_state"
    t.string   "work_country"
    t.string   "telephone1"
    t.string   "skype"
    t.string   "tigris"
    t.string   "personal_email"
    t.string   "local_near_remote"
    t.text     "biography"
    t.text     "user_text"
    t.string   "office"
    t.string   "office_hours"
    t.string   "telephone1_label"
    t.string   "telephone2"
    t.string   "telephone2_label"
    t.string   "telephone3"
    t.string   "telephone3_label"
    t.string   "telephone4"
    t.string   "telephone4_label"
    t.integer  "updated_by_user_id",        :limit => 11
    t.integer  "version",                   :limit => 11
    t.boolean  "is_alumnus"
    t.string   "pronunciation"
    t.datetime "google_created"
    t.datetime "twiki_created"
    t.datetime "adobe_created"
    t.datetime "msdnaa_created"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["human_name"], :name => "index_users_on_human_name"
  add_index "users", ["is_active"], :name => "index_users_on_is_active"

end