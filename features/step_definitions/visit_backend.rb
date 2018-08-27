Given(/^usuario entra en el home$/) do
  visit root_path
end

When(/^hace click en administracion$/) do
  click_link 'administracion'
end

Then(/^se muestra un formulario de login$/) do
  find('h2').should have_content "Sign in"
end