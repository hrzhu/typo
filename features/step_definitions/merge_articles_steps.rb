Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
   Article.create!(article)
  end
end

Given /^I am logged as '(.+)' with password '(.+)'$/ do |usr, pwd|
  visit '/accounts/login'
  fill_in 'user_login', :with => usr
  fill_in 'user_password', :with => pwd
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
