titles = %w[Faire\ les\ courses Aller\ nager Réserver\ billets\ d'avion Cadeau\ noel]
contents = %w[Lundi Mardi Mercredi Samedi]
progress = %w[Terminer En\ cours A\ faire]

User.destroy_all

puts 'Creating 1 fake user'

user = User.new(
    email: "arthurdhuy@gmail.com",
    password: "123456",
    created_at: Time.current
  )
user.save!
puts 'Finished create user!'


Task.destroy_all

puts 'Creating 10 fake tasks'
4.times do
  task = Task.new(
    title: titles.sample,
    content: contents.sample,
    progress: progress.sample,
    user: user
  )
  task.save!
end
puts 'Finished create tasks!'
