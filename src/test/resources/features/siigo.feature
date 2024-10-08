Feature: Pruebas de API para la gestión de usuarios

  Background:
    * url 'https://reqres.in/api'

  Scenario: Obtener lista de usuarios
    And path 'users'
    When method get
    Then status 200
    * print response
    * print 'El código de estado es:', responseStatus
    And match each response.data contains {id: '#number',email: '#string',first_name: '#string',last_name: '#string',avatar: '#string'}
    And match response.support.url == 'https://reqres.in/#support-heading'
    And match response.support.text == 'To keep ReqRes free, contributions towards server costs are appreciated!'

  Scenario: Crear un nuevo usuario
    Given request { "name": "kevin", "job": "qa automation" }
    And path 'users'
    When method post
    Then status 201
    * print response
    * print 'El código de estado es:', responseStatus
    And match response.name == 'kevin'
    And match response.job == 'qa automation'
    And match response.createdAt != null

  Scenario: Actualizar un usuario existente
    Given request { "name": "John", "kevin": "senior qa automation" }
    And path 'users/2'
    When method put
    Then status 200
    * print response
    * print 'El código de estado es:', responseStatus
    And match response.name == 'John'
    And match response.job == 'senior developer'

  Scenario: Eliminar un usuario
    And path 'users/2'
    When method delete
    Then status 204
    * print response
    * print 'El código de estado es:', responseStatus
