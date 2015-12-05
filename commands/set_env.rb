usage 'set_env [options]'
aliases :se
summary 'set the current environment'

option :e, :env, 'specify the environment', :argument => :required

run do  |opts, args, cmd|

  # get environment
  environment = opts.fetch(:env) do
    $stderr.puts "The set_env command requires an --env option"
    exit 1
  end

  if !File.exists?("etc/environments/#{environment}.rb")
    $stderr.puts "Environment '#{environment}' does not exist."
    exit 1
  end

  system('cp', "etc/environments/#{environment}.rb", 'etc/environment.rb')

end
