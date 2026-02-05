CLASS zcl_gg_test_http_serv DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gg_test_http_serv IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    response->set_text( | Hello World GG | ).

  ENDMETHOD.
ENDCLASS.
