Feature: visiting backend
  In order to avoid prohibited access a login page in backend siteunauthorized

  Scenario: Visitar homepage y validar
    Given usuario entra en el home
    When hace click en administracion
    Then se muestra un formulario de login