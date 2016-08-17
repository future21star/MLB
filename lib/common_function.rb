require_relative 'credentials'
require 'pry'

def sign_in

  @browser.goto "https://www.fanduel.com/p/login#login"

  @browser.div(css: '.login-card').wait_until_present 
  @browser.text_field(name: 'email').set(private_username)
  random_wait_tiny

  @browser.text_field(name: 'password').set(private_password)
  random_wait_tiny

  if @browser.button(id: 'login-submit').present?
    @browser.button(id: 'login-submit').click
  elsif @browser.button(name: 'login').present?
    @browser.button(name: 'login').click
  end
end

def initialize_browser

  # For :chrome, make sure to add chromedriver to path
  # Otherwise, use :firefox

  #@browser = Watir::Browser.new :chrome
  @browser = Watir::Browser.new :firefox

  sign_in
  random_wait_medium
end
