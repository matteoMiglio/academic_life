# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  # 3 addictions
  Document,

  # 2 addictions
  Participant,
  Review,
  Rate,
  Member,
  Comment,
  Event,
  Approval,
  Post,

  # 1 addiction
  Group,
  MessageBoard,
  Degree,

  # No requirements
  User, 
  Course, 
  Category, 
  Department,
  ActiveStorage::Blob,
  ActiveStorage::Attachment
].each(&:delete_all)

# No requirements
load 'db/seeds/user.rb'
load 'db/seeds/course.rb'
load 'db/seeds/category.rb'
load 'db/seeds/department.rb'

# Order matters
load 'db/seeds/message_board.rb' # Depends on course
load 'db/seeds/degree.rb'        # Depends on department
load 'db/seeds/group.rb'         # Depends on message_board

load 'db/seeds/event.rb'         # Depends on user and group
load 'db/seeds/post.rb'          # Depends on user and message_board
load 'db/seeds/comment.rb'       # Depends on user and post
load 'db/seeds/rate.rb'          # Depends on user and message_board
load 'db/seeds/review.rb'        # Depends on user and message_board
load 'db/seeds/approval.rb'      # Depends on user and post
load 'db/seeds/member.rb'        # Depends on user and group
load 'db/seeds/participant.rb'   # Depends on user and event

load 'db/seeds/document.rb'      # Depends on user, message_board and category

# Tables without models
load 'db/seeds/posts_users.rb'
load 'db/seeds/courses_users.rb'
load 'db/seeds/events_users.rb'
load 'db/seeds/courses_degrees.rb'
