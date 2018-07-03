# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  result = {
    :projects => {}
  }
  html = File.read("./fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  i = 0
  kickstarter.css(".project").each do |html_project|
    if i == 0
      binding.pry
      i+=1
    end
    project = {
      :image_link => html_project.css(".project-thumbnail").css("a"),
      :description => html_project.css(".bbcard_blurb").text.strip,
      :location => html_project.css(".location-name").text.strip,
      :percent_funded => html_project.css("first funded").text
    }
    result[html_project.css(".bbcard_name").css("a").text] = project
  end
  puts result


end
