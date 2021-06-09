Feature: closing and reopening tasks

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137' }


Scenario: Reopen a task
    Given path 'tasks/487290266/reopen'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method GET
    Then status 204

Scenario: Close a task
    Given path 'tasks/487290266/close'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method GET
    Then status 204

Scenario: Error while closing/reopening
    Given path 'tasks/4689837/close'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    Then status 400
    Then response == 'Item Not Found\n'
