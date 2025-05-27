*&---------------------------------------------------------------------*
*& Report z16_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z16_zc348_lgl.

CLASS lcl_cds_me DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS lcl_cds_me IMPLEMENTATION.

  METHOD main.


    DATA(lo_out) = cl_demo_output=>new(  )->next_section( 'NO Metadata Extension' ).

    cl_dd_ddl_annotation_service=>get_annos(
      EXPORTING
        entityname         = 'Z26_ZC348_LGL'
        metadata_extension = abap_false
      IMPORTING
        element_annos      = DATA(lt_elements) ).

    DELETE lt_elements WHERE elementname <> 'CARRID' AND
                             elementname <> 'CONNID'.

    lo_out->write( lt_elements )->next_section( 'WITH Metadata Extension' ).

    cl_dd_ddl_annotation_service=>get_annos(
      EXPORTING
        entityname         = 'Z26_ZC348_LGL'
        metadata_extension = abap_true
      IMPORTING
        element_annos      = lt_elements ).

    DELETE lt_elements WHERE elementname <> 'CARRID' AND
                             elementname <> 'CONNID'.

    lo_out->write( lt_elements )->display(  ).


  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  lcl_cds_me=>main(  ).
