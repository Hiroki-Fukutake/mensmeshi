# Admin.seed do |s|
# 	s.id = 1
# 	s.name = 'admin'
# 	s.email = 'admin@admin.com'
# 	s.password = 'admin'
# 	s.password_confirmation = 'admin'
# end

Admin.create!(id: 1, name: 'admin', email: 'admin@admin.com', password: 'admins', password_confirmation: 'admins')