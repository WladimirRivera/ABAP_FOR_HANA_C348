*&---------------------------------------------------------------------*
*& Report z04_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z04_zc348_lgl.

types: begin of ty_empleado,
         nombre   type char30,
         posicion type char30,
         edad     type i,
       end of ty_empleado,
       tt_empleados type standard table of ty_empleado with key nombre.

data(gt_empleados) = value tt_empleados( ( nombre = 'Oscar'  posicion = 'ABAP'       edad = 34 )
                                         ( nombre = 'Carlos' posicion = 'FUNCTIONAL' edad = 26 )
                                         ( nombre = 'Adolfo' posicion = 'ABAP'       edad = 32 )
                                         ( nombre = 'Erick'  posicion = 'FUNCTIONAL' edad = 37 )
                                         ( nombre = 'Samuel' posicion = 'ABAP'       edad = 29 )
                                         ( nombre = 'Jimmy'  posicion = 'BASIS'      edad = 24 ) ).

data: gv_edad_tot type i,
      gv_edad_avg type i.


loop at gt_empleados into data(gs_empleados)
     group by ( posicion = gs_empleados-posicion
                size     = group size
                index    = group index )
     ascending
     assigning field-symbol(<group>).

  clear gv_edad_tot.

  write: / | Indice:  { <group>-index } Posición: { <group>-posicion width = 10 } |
          & |Número de empleados de esta posición: { <group>-size }|.

  loop at group <group> assigning field-symbol(<ls_empleados>).
    gv_edad_tot = gv_edad_tot + <ls_empleados>-edad.
*    gv_edad_tot += <ls_empleados>-edad.
    write: /20 <ls_empleados>-nombre.
  endloop.

  gv_edad_avg = gv_edad_tot / <group>-size.
  write: / |Edad Media: { gv_edad_avg }|.

endloop.
