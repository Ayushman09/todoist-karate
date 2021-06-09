Feature: Deleting Projects

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137' }

Scenario: Deleting a valid project
    Given path 'projects/2203306141'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method DELETE
    Then status 204

Scenario: Error while deleting
    Given path 'projects/2203306'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method DELETE
    Then status 404
    Then match response == '404 page not found\n'