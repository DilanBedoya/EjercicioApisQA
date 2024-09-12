Feature: Demoblaze API Login Tests

  Background:
    * url 'https://api.demoblaze.com'
    * path 'login'
    * def jsonResponse = read('./userLogin.json')
    * request jsonResponse

  Scenario Outline: Usuario y password correcto en login
    When method post
    Then status 200
    #Como devuelve un texto y no un json valide de la siguiente manera
    * def authToken = response.replace('"', '').replace('Auth_token: ', '')
    And match authToken != null
    And match authToken != ""
    #Imprime el token obtenido del login correcto para utilizarlo en alguna ruta privada
    * print 'Auth token obtenido: ', authToken

    Examples:
      | username     | password    |
      | DilanBedoya1 | dilanbedoya |

  Scenario Outline: Usuario y password incorrecto en login
    When method post
    Then status 200
    And match response.errorMessage == "User does not exist."

    Examples:
      | username       | password       |
      | DilanBedoya743 | DilanBedoya743 |


    #Validación Extra cuando solo el Usuario es Correcto
  Scenario Outline: Usuario Correcto y password Incorrecto en login
    When method post
    Then status 200
    And match response.errorMessage == "Wrong password."

    Examples:
      | username     | password       |
      | DilanBedoya1 | DilanBedoya743 |