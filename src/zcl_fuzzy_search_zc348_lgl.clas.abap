class zcl_fuzzy_search_zc348_lgl definition
  public
  final
  create public .

  public section.

    interfaces if_amdp_marker_hdb.
    interfaces if_oo_adt_classrun.

    types ty_threshold type p length 3 decimals 1.

    class-methods get_customers importing value(iv_name) type s_custname
                                          value(iv_threshold) type ty_threshold
                                exporting value(et_customer) type ty_customers.

  protected section.
  private section.
endclass.



class zcl_fuzzy_search_zc348_lgl implementation.

  method if_oo_adt_classrun~main.

    zcl_fuzzy_search_zc348_lgl=>get_customers(
      exporting
        iv_name      = 'Ann'
        iv_threshold = '0.6'
      importing
        et_customer  = data(lt_customers)
    ).

    out->write( lt_customers ).

  endmethod.

  method get_customers by database procedure for hdb
                       language sqlscript
                       options read-only
                       using zzscustom.

*     et_customer = select * from zzscustom
*                            where contains ( name, :iv_name );

*     et_customer = select * from zzscustom
*                            where contains ( name, :iv_name, exact );

     et_customer = select * from zzscustom
                            where contains ( name, :iv_name, fuzzy( :iv_threshold ) );

  endmethod.

endclass.
