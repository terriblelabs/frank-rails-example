Feature:
  As an iOS developer
  I could really use a beer about right now

@api_fixture_domestic_beers
Scenario: Listing Beers
  Given I launch the app
  Then I should see "Ales"
  And I should see "Lagers"
  When I touch "Lagers"
  Then I should see "Budweiser"
