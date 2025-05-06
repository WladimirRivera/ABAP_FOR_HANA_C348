*&---------------------------------------------------------------------*
*& Report z10_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z10_zc348_lgl.

class lcl_sql_union definition.
  public section.
    class-methods main.
endclass.

class lcl_sql_union implementation.

  method main.

     select from zint_products
            fields product_id as id,
                   description

            union distinct

      select from zext_products
             fields id,
                    name as description

      into table @data(lt_union).

     cl_demo_output=>display( lt_union ).

  endmethod.

endclass.

start-of-selection.

  lcl_sql_union=>main(  ).
