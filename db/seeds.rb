
first_user = User.create!(
  email: 'first_user@example.com',
  password: 'password123',
  first_name: 'first',
  last_name: 'user'
)

user_two = User.create!(
  email: 'user_two@example.com',
  password: 'password456',
  first_name: 'second',
  last_name: 'user'
)

# Create posts for first_user
Post.create!(
  title: 'First Post',
  content: 'Hello  writing my first post.',
  user: first_user
)

Post.create!(
  title: 'Second Post',
  content: 'Hello writing my first post.',
  user: first_user
)

# Create posts for user_two
Post.create!(
  title: 'user_two Post',
  content: 'This is the content of the post by user_two.',
  user: user_two
)

puts 'SessionAuthApp Seed data created successfully.'
