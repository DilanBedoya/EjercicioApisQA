Feature: Demoblaze API Login Tests

  Background:
    * url 'https://api.demoblaze.com'
    * path 'login'
    * def loginData = read('classpath:ManageUsersDemoBlaze/data/Login.json')

  Scenario: Usuario y password correcto en login
    * def data = {"username": #(loginData.UserAndPasswordCorrect.username), "password":#(loginData.UserAndPasswordCorrect.password)}
    * request data
    When method post
    Then status 200
    #Como devuelve un texto y no un json valide de la siguiente manera
    * def authToken = response.replace('"', '').replace('Auth_token: ', '')
    And match authToken != null
    And match authToken != ""
    #Imprime el token obtenido del login correcto para utilizarlo en alguna ruta privada
    * print 'Auth token obtenido: ', authToken



  Scenario: Usuario y password incorrecto en login
    * def data = {"username": #(loginData.UserAndPasswordIncorrect.username), "password":#(loginData.UserAndPasswordIncorrect.password)}
    * request data
    When method post
    Then status 200
    And match response.errorMessage == "User does not exist."


    #Validación Extra cuando solo el Usuario es Correcto y la contraseña icorrecta
  Scenario: Usuario Correcto y password Incorrecto en login
    * def data = {"username":#(loginData.UserCorrectAndPasswordIncorrect.username), "password":#(loginData.UserCorrectAndPasswordIncorrect.password)}
    * request data
    When method post
    Then status 200
    And match response.errorMessage == "Wrong password."

