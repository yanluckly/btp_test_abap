CLASS zcl_gg_comsume_api_hub DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:    constructor,
      get_country_details RETURNING VALUE(r_josn) TYPE string.

    DATA:gv_web     TYPE string VALUE 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/'.
    DATA:go_http    TYPE REF TO if_web_http_client.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gg_comsume_api_hub IMPLEMENTATION.



  METHOD constructor.
    go_http = cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( gv_web ) ).
  ENDMETHOD.

  METHOD get_country_details.
    DATA(lo_req) = go_http->get_http_request(  ).
    lo_req->set_header_fields(
    VALUE #(
        ( name = 'Content-Type' value = 'application/json' )
        ( name = 'Accept' value = 'application/json' )
        ( name = 'APIKey' value = 'CA3jTJWEiOoPA3YjWzxgpEZOmlOY8HBc' )
     )
     ).

    lo_req->set_uri_path(
      EXPORTING
        i_uri_path = gv_web && 'API_COUNTRY_SRV/A_Country?$top=50&$inlinecount=none'
*        multivalue = 0
*      RECEIVING
*        r_value    =
    ).
*    CATCH cx_web_message_error.
    TRY.
        DATA(lv_response) = go_http->execute(
                              EXPORTING
                                i_method      = if_web_http_client=>get
*                            i_timeout     = 0
*                            i_request_sse = abap_false
*                          IMPORTING
*                            e_sse_enabled =
                            )->get_text( ).
      CATCH cx_web_http_client_error.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
