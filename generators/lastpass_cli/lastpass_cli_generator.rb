class LastpassCliGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'lastpass_cli.rb', 'config/initializers/lastpass_cli.rb'
    end
  end
end
