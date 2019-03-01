# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |i|
    Topic.create!(
        title: "Topic ##{i}"
    )
end

10.times do |i|
    Blog.create!(
        title: "Blog post number #{i + 1}",
        body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
        # topic_id: Topic.last.id
        topic_id: Topic.all.sample
    )
end

puts "10 test blog posts created"

5.times do |i| 
    Skill.create!(
        title: "Skill number #{i + 1}",
        percent_utilized: 15
    )
end

puts "5 test skills created"

8.times do |i| 
    PortfolioItem.create!(
        title: "Portfolio Item number #{i + 1}",
        subtitle: "Ruby on Rails",
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        main_image: 'http://placehold.it/600x400',
        thumb_image: 'http://placehold.it/350x200'
    )
end 

puts "8 Portfolio Items (Rails) created"

PortfolioItem.create!(
    title: "Portfolio Item number #1",
    subtitle: "Javascript",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x200'
)

puts "1 Portfolio Items (Javascript) created"


# 3.times do |i|
#     Technology.create!(
#         name: "Technology ##{i}",
#         portfolio_item_id: PortfolioItem.last.id
#     )
# end

3.times do |i|
    PortfolioItem.last.technologies.create!(
        name: "Technology ##{i}"
    )
end


puts "3 technologies created"