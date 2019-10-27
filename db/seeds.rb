# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
  when "production"

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
      Notification,
      ActiveStorage::Blob,
      ActiveStorage::Attachment
    ].each(&:delete_all)
    
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end

    # No requirements
    load 'db/seeds/production/user.rb'
    load 'db/seeds/production/course.rb'
    load 'db/seeds/production/category.rb'
    load 'db/seeds/production/department.rb'
    
    # Order matters
    load 'db/seeds/production/message_board.rb' # Depends on course
    load 'db/seeds/production/degree.rb'        # Depends on department
    # load 'db/seeds/production/group.rb'         # Depends on message_board
    
    # load 'db/seeds/production/event.rb'         # Depends on user and group
    # load 'db/seeds/production/post.rb'          # Depends on user and message_board
    # load 'db/seeds/production/comment.rb'       # Depends on user and post
    # load 'db/seeds/production/rate.rb'          # Depends on user and message_board
    # load 'db/seeds/production/review.rb'        # Depends on user and message_board
    # load 'db/seeds/production/approval.rb'      # Depends on user and post
    # load 'db/seeds/production/member.rb'        # Depends on user and group
    # load 'db/seeds/production/participant.rb'   # Depends on user and event
    
    # load 'db/seeds/production/document.rb'      # Depends on user, message_board and category
    # load 'db/seeds/production/notification.rb'
    
    # Tables without models
    # load 'db/seeds/production/posts_users.rb'
    load 'db/seeds/production/courses_users.rb'
    # load 'db/seeds/production/events_users.rb'
    load 'db/seeds/production/courses_degrees.rb'

  when "development"
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
      Notification,
      ActiveStorage::Blob,
      ActiveStorage::Attachment
    ].each(&:delete_all)

    # No requirements
    load 'db/seeds/development/user.rb'
    load 'db/seeds/development/course.rb'
    load 'db/seeds/development/category.rb'
    load 'db/seeds/development/department.rb'
    
    # Order matters
    load 'db/seeds/development/message_board.rb' # Depends on course
    load 'db/seeds/development/degree.rb'        # Depends on department
    load 'db/seeds/development/group.rb'         # Depends on message_board
    
    load 'db/seeds/development/event.rb'         # Depends on user and group
    load 'db/seeds/development/post.rb'          # Depends on user and message_board
    load 'db/seeds/development/comment.rb'       # Depends on user and post
    load 'db/seeds/development/rate.rb'          # Depends on user and message_board
    load 'db/seeds/development/review.rb'        # Depends on user and message_board
    load 'db/seeds/development/approval.rb'      # Depends on user and post
    load 'db/seeds/development/member.rb'        # Depends on user and group
    load 'db/seeds/development/participant.rb'   # Depends on user and event
    
    load 'db/seeds/development/document.rb'      # Depends on user, message_board and category
    load 'db/seeds/development/notification.rb'
    
    # Tables without models
    load 'db/seeds/development/posts_users.rb'
    load 'db/seeds/development/courses_users.rb'
    load 'db/seeds/development/courses_degrees.rb'
end
