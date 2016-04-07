usage 'set-env [options]'
aliases :se
summary 'set the current environment'

option :e, :env, 'specify the environment', :argument => :required

run do |opts, args, cmd|

  # get environment
  environment = opts.fetch(:env) do
    $stderr.puts "The set_env command requires an --env option"
    exit 1
  end

  if !File.exist?("etc/environments/#{environment}.rb")
    $stderr.puts "Environment '#{environment}' does not exist."
    exit 1
  end

  File.delete('etc/environment.rb') if File.exist?('etc/environment.rb')

  File.symlink("environments/#{environment}.rb", 'etc/environment.rb')

end
