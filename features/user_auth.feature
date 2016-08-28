Feature: User Login Area
  User can log into the site
  As an anonymous user
  So that they can see secured parts of the site

  @happy_path @user_auth @javascript
  Scenario: Logging in with Success
    Given I visit the login page
    And I fill in the form with my username and password and submit the form
    Then I should see "You are logged in!"

    

