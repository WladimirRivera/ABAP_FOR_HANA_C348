class zcl_exit_sadl_zc348_lgl definition
  public
  final
  create public .

  public section.
    interfaces if_sadl_exit_calc_element_read.

  protected section.
  private section.
endclass.



class zcl_exit_sadl_zc348_lgl implementation.

  method if_sadl_exit_calc_element_read~get_calculation_info.

    check line_exists( it_requested_calc_elements[ table_line = 'DISCOUNT' ] ).

    data ls_data type sadl_entity_element.

    ls_data = 'PRICE'.
    append ls_data to et_requested_orig_elements.

  endmethod.

  method if_sadl_exit_calc_element_read~calculate.

      data lt_calculated type table of Z42_ZC348_LGL with default key.

      lt_calculated = corresponding #( it_original_data ).

      loop at lt_calculated assigning field-symbol(<ls_calculated>).
         <ls_calculated>-Discount = <ls_calculated>-Price * '0.9'.
      endloop.

      ct_calculated_data = corresponding #( lt_calculated ).

  endmethod.

endclass.











