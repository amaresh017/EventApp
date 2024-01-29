if User.count.zero?
  puts "going to create very first user of this app:"
  user = User.new()
  puts "enter user full name: "
  user.full_name = STDIN.gets.chomp

  puts "enter user email (amaresh@gmail.com): "
  user.email = STDIN.gets.chomp
  user.email = "amaresh@gmail.com" if user.email.blank?

  puts "enter password (password): "
  user.password = STDIN.gets.chomp
  user.password = "password" if user.password.blank?

  puts "re-enter password (password): "
  user.password_confirmation = STDIN.gets.chomp
  user.password_confirmation = "password" if user.password_confirmation.blank?
  
  if user.save!
    puts "user created successfully." 
  else
    puts "user creation failed!"
    puts "Error: #{user.errors.full_messages.join(', ')}"
  end
else
  puts "A few user(s) already created!"
end
