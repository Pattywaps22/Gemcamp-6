# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  begin
    post = Post.create!(
      title: Faker::Lorem.words(number: 5).join(' '),
      content: Faker::Lorem.paragraphs(number: 50).join('\n\n')
    )

    num_categories = rand(1..4)
    categories = ['Technology', 'Travel', 'Lifestyle', 'Fashion', 'Food'].sample(num_categories)

    categories.each do |category_name|
      post.categories.create!(name: category_name)
    end
  rescue StandardError => e
    puts "Error creating seed: #{e.message}"
  end
end