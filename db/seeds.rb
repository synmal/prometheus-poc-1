# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_post
  10.times do
    post = Post.create!(title: Faker::Lorem.words.join(" ").titleize, content: Faker::Lorem.paragraph(sentence_count: (3..10).to_a.sample))
    seed_comments(post)
  end
end

def seed_comments(post)
  10.times do
    post.comments.create!(content: Faker::Lorem.paragraph(sentence_count: (3..10).to_a.sample))
  end
end

seed_post