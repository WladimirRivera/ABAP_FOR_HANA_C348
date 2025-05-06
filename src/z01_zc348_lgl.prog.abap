*&---------------------------------------------------------------------*
*& Report z01_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z01_zc348_lgl.

class lcl_factura definition.

  public section.

    types: begin of ty_factura,
             importe_base type i,
             iva          type i,
           end of ty_factura,
           tt_factura type table of ty_factura.

 types: begin of ty_factura_diferente,
             precio type i,
             vat   type i,
           end of ty_factura_diferente.


    methods add_item importing is_item type ty_factura.

    methods add_items importing it_item type tt_factura.

    methods constructor importing iv_value type char2.
endclass.

class lcl_factura implementation.

  method add_item.

  endmethod.

  method add_items.

  endmethod.

  method constructor.

  endmethod.

endclass.

start-of-selection.

  data go_factura_old type ref to lcl_factura.

  create object go_factura_old
    exporting
      iv_value = 'AB'.

  data go_factura_new_1 type ref to lcl_factura.
  go_factura_new_1 = new #(  iv_value = 'AB' ).


  data(go_factura_new_2) = new lcl_factura( 'AB' ).


  data gs_inv_01 type lcl_factura=>ty_factura_diferente.


   go_factura_new_2->add_item( is_item = value #( importe_base = 10
                                                  iva          = 2 ) ).

   go_factura_new_2->add_item( is_item = value #( importe_base = gs_inv_01-precio
                                                  iva          = gs_inv_01-vat ) ).


   go_factura_new_2->add_items( it_item = value #( ( importe_base = 10 iva = 2 )
                                                   ( importe_base = 20 iva = 3 ) ) ).

   data: gt_factura type lcl_factura=>tt_factura,
         gs_factura type lcl_factura=>ty_factura.

   gs_factura-importe_base = 10.
   gs_factura-iva = 2.
   append gs_factura to gt_factura.

   gt_factura = value #( ( importe_base = 10 iva = 2 )
                         ( importe_base = 20 iva = 3 ) ).

   go_factura_new_2->add_items( it_item = gt_factura ).


   data(gv_xstr) = cl_abap_codepage=>convert_to( source = conv #( sy-uname ) ).
