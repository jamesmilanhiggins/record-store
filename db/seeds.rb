Album.destroy_all
User.destroy_all

user = User.create(
  name: "Admin",
  email: "admin@gmail.com",
  password: "password",
  admin: true
)

50.times do |i|
  album = Album.create!(
    title: Faker::Book.title,
    artist: Faker::Book.author,
    genre: Faker::Book.genre,
    quantity: Faker::Number.between(10,20),
    price: Faker::Commerce.price
  )
  Faker::Number.between(7, 15).times do |i|
    album.songs.create(
      name: Faker::Hipster.sentence(1, true, 2),
      length: "#{Faker::Number.between(1, 12)}:#{Faker::Number.between(0,59)}"
    )
    # Song.create(
      # name:,
      # length:,
      # album_id: album.id
    # )
  end
end
