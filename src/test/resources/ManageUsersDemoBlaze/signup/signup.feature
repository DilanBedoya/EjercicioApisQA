Feature: Demoblaze API Signup Tests

  Background:
    * url 'https://api.demoblaze.com'
    * path 'signup'
    * request { "username": "#(username)", "password": "#(password)" }

  Scenario Outline: Crear un nuevo usuario en signup
    When method post
    Then status 200
    And match response.errorMessage == null

    #Especificar username y password nuevo y único para pasar el escenario correctamente
    Examples:
      | username     | password  |
      | DilanBedoya16 | dilanbedoya |


  Scenario Outline: Intentar crear un usuario ya existente
    When method post
    Then status 200
    And match response.errorMessage == "This user already exist."

    Examples:
      | username    | password     |
      | DilanBedoya | DilanBedoya2 |
