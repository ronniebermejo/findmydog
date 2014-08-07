module ApplicationHelper
# app/helpers/application_helper.rb
# # Render a partial into a script tag so Angular
# # sticks it into $templateCache
  def load_ng_template(partial)
    content_tag :script, type: 'text/ng-template', id: "#{partial}.html", controller: "findMyDogApp" do
      render partial
    end
  end
end


