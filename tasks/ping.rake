require 'xmlrpc/client'

desc 'pings web sites to notify that this website has been updated'
task :ping do
  # Configuration
  weblog_title  = 'Pentandra Blog'
  weblog_url    = 'http://pentandra.com/blog/'
  services      = {
    'Technorati'  => 'http://rpc.technorati.com',
    'FeedBurner'  => 'http://ping.feedburner.com',
    'blo.gs'      => 'http://ping.blo.gs'
  }

  # Ping each service
  services.each_pair do |name, url|
    # Print service name
    print format('%20s', name) + ': '
    $stdout.flush

    # Ping
    client = XMLRPC::Client.new2(url)
    result = client.call("weblogUpdates.ping", weblog_title, weblog_url)

    # Pring result
    puts result['flerror'] ? 'ERROR! ' + result['message'] : 'OK'
  end
end


