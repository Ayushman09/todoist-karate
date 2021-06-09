Feature: Adding new task

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137' }

Scenario: Create a New Post
    Given path 'tasks'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    And request
    """
    {
    "content": "Buy Milk",
    "project_id": 2203306141
    }
    """
    When method POST
    Then status 200
    * def postId = response.id

    Given path 'tasks/'+postId
    When method get
    Then status 200
Scenario: Create a new task error
    Given path 'tasks'
    # And header Authorization = 'Bearer e4c291d63415c9d0f274cf9069d2b571f61a7137'
    And request
    """
    {
    "project_id": 2203306141,
    }
    """
    When method POST
    Then status 400
    Then match response == "Empty content\n"