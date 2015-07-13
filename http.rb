require 'socket'

server = TCPServer.new 80
loop do
  Thread.start(server.accept) do |client|
    request = client.gets
    response_body = "hi this is ann"
    if request.start_with?("GET") && request.end_with?("\r\n")
      client.puts "HTTP/1.1 200 OK"
      client.puts "Content-Length: #{response_body.length}"
      client.puts "\r\n#{response_body}" 
    end
    client.close
  end
end
