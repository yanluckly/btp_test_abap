CLASS zcl_gg_test_http_serv DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GG_TEST_HTTP_SERV IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    response->set_text( | Hello World GG | ).

  ENDMETHOD.
ENDCLASS.
