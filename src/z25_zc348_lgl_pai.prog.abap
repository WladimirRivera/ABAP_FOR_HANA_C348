*&---------------------------------------------------------------------*
*& Include z25_zc348_lgl_pai
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_2000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module user_command_2000 input.
  case sy-ucomm.
    when 'BACK'.
      if go_alv_display is bound.
        go_alv_display->free(  ).
      endif.
      leave to screen 0.
    when others.
  endcase.
endmodule.
*&---------------------------------------------------------------------*
*&      Module  USER_EXIT_2000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module user_exit_2000 input.
  case sy-ucomm.
    when 'EXIT'.
      if go_alv_display is bound.
        go_alv_display->free(  ).
      endif.
      leave to screen 0.
    when others.
  endcase.
endmodule.
