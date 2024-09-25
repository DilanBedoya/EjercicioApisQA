Feature: Demoblaze API Signup Tests

  Background:
    * url 'https://api.demoblaze.com'
    * path 'signup'
    * def registerData = read('classpath:ManageUsersDemoBlaze/data/Signup.json')


  Scenario: Crear un nuevo usuario en Signup
    * def data = {"username": #(registerData.newUser.username), "password": #(registerData.newUser.password)}
    * request data
    When method post
    Then status 200
    And match response.errorMessage == null


  Scenario: Intentar crear un usuario ya existente
    * def data = {"username":#(registerData.duplicateUser.username), "password": #(registerData.duplicateUser.password)}
    * request data
    When method post
    Then status 200
    And match response.errorMessage == "This user already exist."


