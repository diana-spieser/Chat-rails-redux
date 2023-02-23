require 'faker'

Message.destroy_all
Channel.destroy_all
User.destroy_all

names = %w[general random paris react]
nicknames = %w[John Paul George Ringo]

channels= names.map do |name|
  Channel.find_or_create_by!(name: name)
end

users = nicknames.map do |nickname|
  User.create(email: "#{nickname.downcase}@gmail.com",nickname: nickname, password: "password")
end
  20.times do
    Message.create!(
    content: Faker::TvShows::RickAndMorty.quote,
    user: users.sample,
    channel: channels.sample
  )
  end

puts 'Channels:'
channels.each do |channel|
  puts "- {channel.id}: #{channel.name}"
end

puts 'Seed finished'
