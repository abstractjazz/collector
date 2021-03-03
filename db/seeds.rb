# ev = User.create(username: "evan_1", email: "evan@evan.com", password_digest: "secret-password")
# summer_fun = Memory.create(name: "summer fun", description: "really fun times", uploaded_memory: "img_1.jpg")
# this_year = Board.create(name: "this year", description:"all about this year")

def make_33_users
counter = 0

while counter < 33 
    counter += 1 
  User.create(username: "evan_#{counter}", email: "user#{counter}@user.com", password_digest: "password_#{counter}")
    end 
end  

make_33_users