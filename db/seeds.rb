(1..10).each do |num|
    user = User.find(num)
    micropost = user.microposts.build(content: user.name)
    micropost.save
end