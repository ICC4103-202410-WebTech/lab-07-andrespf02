# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.delete_all
Post.delete_all
Tag.delete_all

User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password1"
)

User.create!(
  name: "Mark Zuckenberg",
  email: "mark@example.com",
  password: "password2"
)

User.create!(
  name: "Elon Musk",
  email: "elon@example.com",
  password: "password3"
)

User.create!(
  name: "Jeff Bezos",
  email: "jeff@example.com",
  password: "password4"
)

User.create!(
  name: "Lionel Messi",
  email: "lionel@example.com",
  password: "password5"
)

5.times do |i|
Tag.create!(
    name: "Tag #{i + 1}"
)
end

10.times do |i|
    user = User.offset(i % 5).first
    post = user.posts.create!(
      title: "Post #{i + 1}",
      content: "Content Post #{i + 1}",
      published_at: Time.now,
      answers_count: rand(200),
      likes_count: rand(200)
    )

    post.tags << Tag.offset(i % 5).first
end