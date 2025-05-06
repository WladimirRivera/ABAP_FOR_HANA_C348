class zcl_cds_read_admp_zc348_lgl definition
  public
  final
  create public .

  public section.
    interfaces if_amdp_marker_hdb.
    interfaces if_oo_adt_classrun.

    types: begin of ty_flights,
             mandt    type mandt,
             carrid   type s_carr_id,
             connid   type s_conn_id,
             carrname type s_carrname,
           end of ty_flights,
           ty_flights_t type table of ty_flights.


    class-methods read_cds amdp options cds session client current
      importing value(iv_carrid) type s_carr_id
      exporting value(et_return) type ty_flights_t.

   types ty_scarr_t type table of scarr.

   class-methods get_airlines_all_clients exporting value(et_scarr) type ty_scarr_t.

  protected section.
  private section.
endclass.


class zcl_cds_read_admp_zc348_lgl implementation.

  method if_oo_adt_classrun~main.

    zcl_cds_read_admp_zc348_lgl=>read_cds(
      exporting
        iv_carrid = 'LH'
      importing
        et_return = data(lt_flights) ).

   out->write( lt_flights ).

    zcl_cds_read_admp_zc348_lgl=>get_airlines_all_clients(
      importing
        et_scarr = data(lt_company) ).

   out->write( lt_company ).


  endmethod.

  method read_cds by database procedure for hdb
                  language sqlscript
                  using spfli z48_ZC348_LGL.

    et_return = select cds.mandt,
                       cds.carrid,
                       ddbb.connid,
                       cds.carrname
                  from Z48_ZC348_LGL as cds
                  inner join spfli as ddbb on  cds.mandt = ddbb.mandt
                                           and cds.carrid = ddbb.carrid
                   where cds.carrid = :iv_carrid;
  endmethod.

  method get_airlines_all_clients by database procedure for hdb
                                  language sqlscript
                                  options read-only
                                  using scarr.
      et_scarr = select * from scarr;
  endmethod.

endclass.
