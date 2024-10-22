require_relative "./seed_helpers"

# AVO_ADMIN_PASSWORD=secret bin/rails db:seed

puts ["Started seeding->"].inspect

# == Tear-down ==
# Avo::Kanban::Board.delete_all
# Avo::Kanban::Column.delete_all
# Avo::Kanban::Item.delete_all
User.delete_all
Project.delete_all

ActiveRecord::Base.connection.tables.each do |table_name|
  ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
end

# == Start seeding ==

create_admin
create_users
create_projects

# board = Avo::Kanban::Board.create!(name: "My board", allowed_resources: ["Avo::Resources::User", "Avo::Resources::Project"], property: "status")

# no_status = board.columns.create!(name: "No status", value: nil)
# triage = board.columns.create!(name: "Triage")
# todo = board.columns.create!(name: "To do")
# in_progress = board.columns.create!(name: "In progress")
# done = board.columns.create!(name: "Done")
# stopped = board.columns.create!(name: "Stopped")

# triage.items.create!(record: User.last, board:)
# triage.items.create!(record: User.last, board:)
# todo.items.create!(record: User.first, board:)
# todo.items.create!(record: Project.first, board:)
# todo.items.create!(record: Project.last, board:)
# in_progress.items.create!(record: User.second, board:)
# done.items.create!(record: User.third, board:)

# generate 10 projects with dummy data

def progress_params(total:, title:)
  {
    total: total,
    format: "\e[32m%t : %B %p%% %c/%C [ %a ]\e[0m",
    progress_mark: "=",
    length: 90,
    starting_at: 0,
    title: " #{title}",
    title_width: 20,
    throttle_rate: 0.01,
    remainder_mark: "."
  }
end

# # ---------------------------------- USERS ---------------------------------- #
# User.delete_all
# random_users_number = 350

# users_progress_bar = ProgressBar.create(
#   progress_params(total: random_users_number, title: "Creating users and assigning to a board column")
# )

# random_users_number.times do |i|
#   [todo, triage, in_progress, done].sample.items.create!(record: FactoryBot.create(:user), board:)
#   users_progress_bar.increment
# end

# -====================- #

# ---------------------------------- POSTS ---------------------------------- #
# Post.delete_all
# random_posts_number = 25
# posts_progress_bar = ProgressBar.create(progress_params(total: random_posts_number, title: "Creating posts"))
# random_users_number.times do
#   FactoryBot.create(:post, user_id: users.sample.id)
#   posts_progress_bar.increment
# end

# # ---------------------------------- FISH ----------------------------------- #
# Fish.delete_all
# random_fish_number = 25
# fish_progress_bar = ProgressBar.create(progress_params(total: random_fish_number, title: "Creating fish"))
# random_fish_number.times do
#   FactoryBot.create(:fish, user_id: users.sample.id)
#   fish_progress_bar.increment
# end

# # ----------------------------------- PEOPLE -------------------------------- #
# Person.delete_all

# random_people_number = 12
# people_progress_bar = ProgressBar.create(progress_params(total: random_people_number * 2, title: "Creating people"))

# random_people_number.times do
#   person = FactoryBot.create(:person)
#   people_progress_bar.increment

#   person.spouses << FactoryBot.create(:spouse)
#   people_progress_bar.increment
# end

# # ---------------------------------- COURSE --------------------------------- #
# Course::Link.delete_all
# Course.delete_all

# random_courses_number = 87
# courses_progress_bar = ProgressBar.create(progress_params(total: random_courses_number, title: "Creating courses"))
# courses = []
# random_courses_number.times do
#   courses.push FactoryBot.create(:course)
#   courses_progress_bar.increment
# end

# links_for_each_course = 3
# links_progress_bar = ProgressBar.create(
#   progress_params(total: random_courses_number * links_for_each_course, title: "Creating courses links")
# )
# courses.each do |course|
#   links_for_each_course.times do
#     FactoryBot.create(:course_link, course: course)
#     links_progress_bar.increment
#   end
# end
