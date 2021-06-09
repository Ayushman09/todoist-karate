Feature: Get User Projects

Background: 
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137' }

Scenario: Get all user projects
    Given path 'projects/'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method GET
    Then status 200
    Then match response[0].name == "Inbox"

Scenario: Get one user project
    Given path 'projects/2266692961'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method GET
    Then status 200
    Then match response.name == "Inbox"

Scenario: If error in project path
    Given path 'project/'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method GET
    Then status 404
    Then match response == "404 page not foung\n"

Scenario: If error in project id
    Given path 'projects/22666'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method GET
    Then status 404
    Then match response == "Not Found\n"