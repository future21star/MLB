require 'csv'
require 'watir-webdriver'
require 'watir-scroll'

require_relative 'lib/common_function'
require_relative 'lib/wait_functions'

require_relative 'data/data'
require 'byebug'

# To run:
#   Install rvm, ruby, etc.
#   `gem install bundler`
#   `bundle install`
#   `irb`
#     load 'person-scrape.rb'

initialize_browser
 random_wait_medium
 random_wait_medium
 random_wait_medium
 random_wait_medium

index = 1
@browser.as(:css => ".sport-toggle-menu__link").each do |a|
  if index == 3
    a.when_present.click
  end
  index = index + 1
end 

@browser.tbody(:css => ".content-list-body.contest-list-items").wait_until_present
@browser.goto @browser.as(:css => ".button.mini.primary.contest-enter").first.href
@browser.tbody(class: "player-list-vs-repeat-container").wait_until_present
tbody = @browser.tbody(class: "player-list-vs-repeat-container")
index = 0
while index < 30
  tbody.spans(css: '.player-first-name')[2..12].each do |first_name|
    random_wait_medium
    random_wait_medium
    random_wait_medium
    random_wait_medium
    first_name.when_present.click
    @browser.div(css: '.lightbox.legacy-lightbox.player-card--legacy').wait_until_present
    pop_up = @browser.div(css: '.lightbox.legacy-lightbox.player-card--legacy')
    pop_up.div(css: '.close-button').click
    #tbody.wait_until_present  
  end
  #random_wait_tiny
  index = index + 1
  top = 550 * index
  debugger
  scroll_bottom_script = 'arguments[0].scrollTop = ' + top.to_s
  tbody.browser.execute_script(scroll_bottom_script, tbody)
  random_wait_medium
  random_wait_medium
  random_wait_medium
end