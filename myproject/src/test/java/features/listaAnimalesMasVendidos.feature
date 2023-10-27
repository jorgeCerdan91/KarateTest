Feature: Recoge mediante petición HTTP, el JSON que retorna el endpoint /pet/findByStatus y lista 
   mediante una función los nombres de las mascotas que se hayan vendido y crear un metodo que recorra la lista y diga cuantos animales se llaman igual 
   
 
Background:
  * url entorno1 
Scenario: Recoger mediante una lista de mascotas mas vendidas y devolverla    
    Given path 'pet/findByStatus'
    And param status = 'sold' 
    When method GET 
    Then status 200
    * def mascotasVendidas = response 
    * def CrearListaAnimales =
    """
    function(Buscar) {
        var listaAnimales = [];
        for (var i = 0; i < Buscar.length; i++) {
            var Entrada = { id: Buscar[i].id, name: Buscar[i].name };
            listaAnimales.push(Entrada);
        }
        return listaAnimales;
    }
    """
    * def listaAnimales = call CrearListaAnimales mascotasVendidas
    * print 'Lista  {id, name}:', listaAnimales
    * def ContarRepeticiones =
    """
    function(Cuenta) {
        var countAnimales = {};
        for (var i = 0; i < Cuenta.length; i++) {
            var nombreAn = Cuenta[i].name;
            if (countAnimales[nombreAn] === undefined) {
                countAnimales[nombreAn] = 1;
            } else {
                countAnimales[nombreAn] = countAnimales[nombreAn] + 1;
            }
        }
        return countAnimales;
    }
    """
    * def repeticioneNombre = call ContarRepeticiones listaAnimales
    * print 'Repeticiones por nombre:', repeticioneNombre
