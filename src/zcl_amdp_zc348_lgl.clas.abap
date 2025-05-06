class zcl_amdp_zc348_lgl definition
  public
  final
  create public .

  public section.
   interfaces if_amdp_marker_hdb.
   interfaces if_oo_adt_classrun.

   types: begin of ty_flights,
            carrid type s_carr_id,
            connid type s_conn_id,
            cityfrom type s_from_cit,
            cityto type s_to_city,
          end of ty_flights,
          ty_flights_tt type table of ty_flights.

   class-methods get_flights importing value(iv_mandt) type mandt
                                       value(iv_carrid) type s_carr_id
                             exporting value(et_flights) type ty_flights_tt.

   class-methods get_flights_from_amdp importing value(iv_mandt2) type mandt
                                                 value(iv_carrid2) type s_carr_id
                                       exporting value(et_flights2) type ty_flights_tt.

  protected section.
  private section.
endclass.


class zcl_amdp_zc348_lgl implementation.

  method get_flights by database procedure for hdb
                     language sqlscript
                     options read-only
                     using spfli.

    et_flights = select carrid,
                        connid,
                        cityfrom,
                        cityto
                     from spfli
                     where mandt = :iv_mandt
                       and carrid = :iv_carrid;


  endmethod.

  method if_oo_adt_classrun~main.

      zcl_amdp_zc348_lgl=>get_flights_from_amdp(
        exporting
          iv_mandt2   = sy-mandt
          iv_carrid2  = 'LH'
        importing
          et_flights2 = data(lt_flights) ).

      out->write( lt_flights ).



  endmethod.

  method get_flights_from_amdp by database procedure for hdb
                               language sqlscript
                               options read-only
                               using zcl_amdp_zc348_lgl=>get_flights.

     call "ZCL_AMDP_ZC348_LGL=>GET_FLIGHTS"( iv_mandt => :iv_mandt2,
                                              iv_carrid => :iv_carrid2,
                                              et_flights => :et_flights2 );

  endmethod.

endclass.





