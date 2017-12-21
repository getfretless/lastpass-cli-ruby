if defined?(Rails) && Rails::VERSION::MAJOR != 2
  
    # Rails3 generator invoked with 'rails generate lastpass_cli'
    class LastpassCliGenerator < Rails::Generators::Base
      source_root(File.expand_path(File.dirname(__FILE__) + '/../../generators/lastpass_cli/templates'))
      def copy_initializer
        copy_file 'lastpass_cli.rb', 'config/initializers/lastpass_cli.rb'
      end
    end
  
  end
