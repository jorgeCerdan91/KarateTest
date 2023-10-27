Feature: Crea tu usuario mediante petición HTTP y posteriormente recupera sus datos llamando al servicion correspondiente. 
   
 Background:
  * url entorno1 

 Scenario: Creacion de usuario 
 Given path 'user'
 And request
 """
 {
  "id": 1,
  "username": "Jorge",
  "firstName": "Cerdan",
  "lastName": "Peña ",
  "email": "jorge@prueba.com",
  "password": "1234",
  "phone": "65656565",
  "userStatus": 0
}
 """
 When method POST 
 Then  status 200



 
 
