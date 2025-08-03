# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create test users with Indian names
user1 = User.create!(
  email: 'priya@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

user2 = User.create!(
  email: 'rajesh@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

user3 = User.create!(
  email: 'meera@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Create test posts with Indian themes
post1 = user1.posts.create!(
  title: 'Traditional Indian Cooking: A Beginner\'s Guide',
  body: 'Indian cuisine is known for its rich flavors, aromatic spices, and diverse regional variations. From the spicy curries of the South to the creamy dishes of the North, Indian cooking offers a world of culinary exploration. In this post, we will explore the basics of Indian cooking, essential spices, and some simple recipes to get you started on your Indian cooking journey.',
  status: 'published'
)

post2 = user1.posts.create!(
  title: 'Exploring Indian Classical Music: Ragas and Talas',
  body: 'Indian classical music is one of the oldest musical traditions in the world, with a history spanning over 2000 years. The music is based on ragas (melodic frameworks) and talas (rhythmic cycles). In this post, we will dive into the fundamentals of Indian classical music, understanding ragas, and appreciating the beauty of this ancient art form.',
  status: 'published'
)

post3 = user2.posts.create!(
  title: 'Modern Indian Tech Startups: Success Stories',
  body: 'India has emerged as a global hub for technology and innovation, with numerous successful startups making waves internationally. From fintech to edtech, Indian entrepreneurs are creating solutions that address both local and global challenges. In this post, we will explore some of the most successful Indian tech startups and their journey to success.',
  status: 'published'
)

post4 = user3.posts.create!(
  title: 'Yoga and Meditation: Ancient Wisdom for Modern Life',
  body: 'Yoga, originating from ancient India, has become a global phenomenon for health and wellness. Beyond physical postures, yoga encompasses meditation, breathing techniques, and philosophical teachings. In this post, we will explore the various aspects of yoga, its benefits for modern life, and how to incorporate these ancient practices into your daily routine.',
  status: 'published'
)

post5 = user2.posts.create!(
  title: 'Draft: Indian Festivals and Celebrations',
  body: 'This is a draft post about the colorful and diverse festivals celebrated across India, from Diwali to Holi, and their cultural significance.',
  status: 'draft'
)

# Create test comments
post1.comments.create!([
  { user: user2, content: 'Great introduction to Indian cooking! I love how you explained the spice combinations.' },
  { user: user3, content: 'This brings back memories of my grandmother\'s kitchen. The aromas are unforgettable!' }
])

post2.comments.create!([
  { user: user3, content: 'The way you explained ragas makes classical music so accessible. Looking forward to more posts!' }
])

post3.comments.create!([
  { user: user1, content: 'It\'s amazing to see how Indian startups are solving real-world problems. Great insights!' }
])

post4.comments.create!([
  { user: user1, content: 'Yoga has completely transformed my daily routine. Thanks for sharing these ancient practices!' },
  { user: user2, content: 'The meditation techniques you mentioned are really helpful for stress management.' }
])

puts "Seed data created successfully!"
puts "Test users:"
puts "  - priya@example.com (password: password123)"
puts "  - rajesh@example.com (password: password123)"
puts "  - meera@example.com (password: password123)"
