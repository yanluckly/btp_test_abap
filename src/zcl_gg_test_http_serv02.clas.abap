CLASS zcl_gg_test_http_serv02 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gg_test_http_serv02 IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA(lt_data) = request->get_form_fields( ).
    READ TABLE lt_data REFERENCE INTO DATA(lwa_data) WITH KEY name = 'input'.
    IF sy-subrc = 0.
      CASE lwa_data->value.

        WHEN 'send'.
          response->set_text( |hello world GG| ).

        WHEN 'consume'.

          DATA(lv_resp) = new zcl_gg_comsume_api_hub(  )->get_country_details( ).



        WHEN OTHERS.

      ENDCASE.
    ELSE.
      response->set_status( i_code = 400 i_reason = 'wrong' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
