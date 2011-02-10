Feature: view front page

  Scenario: Home page
    When I get "/"
    Then I should see "Cloudtestapp"
    
  
  Scenario: Hit counting
    Given database is empty
    
    When I follow "press here" within "body"
    Then I should see "1 hits"
    
    When I follow "press here" within "body"
    Then I should see "2 hits"
    