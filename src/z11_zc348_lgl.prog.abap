*&---------------------------------------------------------------------*
*& Report z11_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z11_zc348_lgl.

insert zemployees from table @( value #( ( employee_id = 123
                                           name        = 'John'
                                           last_name   = 'Smith'
                                           gender      = 'M' ) ) ).


select from ztb_employees as tt
       inner join zemployees as gtt
               on tt~empl_num eq gtt~employee_id
       fields tt~empl_num,
              tt~name,
              gtt~last_name,
              gtt~gender
       into table @data(gt_employees).

if sy-subrc eq 0.
  cl_demo_output=>display( gt_employees ).
endif.

delete from zemployees.
