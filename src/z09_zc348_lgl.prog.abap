*&---------------------------------------------------------------------*
*& Report z09_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z09_zc348_lgl.

class lcl_sql_case definition.
  public section.
    class-methods main.
endclass.

class lcl_sql_case implementation.

  method main.

    try.
        data(lo_random) = cl_abap_random_int=>create( exporting seed = conv #( sy-uzeit )
                                                                min  = 1
                                                                max  = 100 ).
      catch cx_abap_random into data(lx_abap_random).
        write lx_abap_random->get_text(  ).
        return.
    endtry.

    delete from demo_expressions.
    insert demo_expressions from table @( value #(
                                             for i = 0 until i > 9 ( id   = i
                                                                     num1 = lo_random->get_next(  )
                                                                     num2 = lo_random->get_next(  ) ) ) ).

    select from demo_expressions
           fields id,
                  num1,
                  num2,

                  case
*                    when num2 = 0 then 0
*                    when division( num1, num2, 2 ) < 50 and num2 < 50 then division( num1, num2, 2 )
*                    when num1 > 50 and num2 > 50 then division( num1, num2, 2 )
                    when num1 < 50 and num2 < 50 then 'Ambos < 50'
                    when num1 = 50 and num2 = 50 then 'Ambos = 50'
                    when num1 > 50 and num2 > 50 then 'Ambos > 50'
                    else 'Otra situacion'
                  end as column_name
            into table @data(lt_results).

    if sy-subrc eq 0.
      cl_demo_output=>display( lt_results ).
    endif.

  endmethod.

endclass.

start-of-selection.

  lcl_sql_case=>main(  ).
