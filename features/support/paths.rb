module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When "I am on $page_name" do |page_name|
  #   When "I visit $page_name" do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)

    case page_name
      when /home/
        '/'
      when /root/
        '/'
    end
  end
end

World(NavigationHelpers)

