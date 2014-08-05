require 'zeus/rails'

class CustomPlan < Zeus::Rails

  def truncate_db
    require 'database_cleaner'
    DatabaseCleaner.clean_with :truncation
  end

  def test
    if spec_file?(ARGV) && defined?(RSpec)
      # disable autorun in case the user left it in spec_helper.rb
      RSpec::Core::Runner.disable_autorun!
      exit_code = RSpec::Core::Runner.run(ARGV)

      truncate_db

      exit exit_code
    else
      Zeus::M.run(ARGV)
    end
  end



end

Zeus.plan = CustomPlan.new
