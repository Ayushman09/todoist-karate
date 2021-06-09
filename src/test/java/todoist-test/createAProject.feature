Feature: Adding new project

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137' }

Scenario: Create a New Post
    Given path 'projects'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    And request
    """
    {
    "name": "Shopping List"
    }
    """
    When method POST
    Then status 200
    * def projectId = response.id

    Given path 'projects/'+projectId
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    When method get
    Then status 200

Scenario: Error while creating(body mismatch)
    Given path 'projects'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    And request
    """
    {
    "nam": "Shopping List"
    }
    """
    When method POST
    Then status 400
    
Scenario: Creating same project
    Given path 'projects'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    And request
    """
    {
    "name": "Shopping List"
    }
    """
    When method POST
    Then status 400
    Then response == "Sync item already processed. Ignored"