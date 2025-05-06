*&---------------------------------------------------------------------*
*& Report z03_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z03_zc348_lgl.

types: begin of ty_structure,
         col1 type i,
         col2 type i,
         col3 type i,
       end of ty_structure,
       ty_table type standard table of ty_structure with empty key.

data: gt_table type ty_table,
      gv_index type i.

field-symbols <gs_tab> type ty_structure.

gv_index = 1.

do.

  gv_index = gv_index + 10.
*   gv_index += 10.

  if gv_index > 40.
    exit.
  endif.

  append initial line to gt_table assigning <gs_tab>.
  <gs_tab>-col1 = gv_index.
  <gs_tab>-col2 = gv_index + 1.
  <gs_tab>-col3 = gv_index + 2.

enddo.

data(gt_itab_new) = value ty_table( for i = 11 then i + 10 until i > 40
                                            ( col1 = i
                                              col2 = i + 1
                                              col3 = i + 2 ) ).

write 'OLD'.
loop at gt_table assigning <gs_tab>.
  write: / <gs_tab>-col1, <gs_tab>-col2, <gs_tab>-col3.
endloop.

skip 2.
write 'NEW'.
loop at gt_itab_new assigning <gs_tab>.
  write: / <gs_tab>-col1, <gs_tab>-col2, <gs_tab>-col3.
endloop.
