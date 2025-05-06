*&---------------------------------------------------------------------*
*& Report z06_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z06_zc348_lgl.

delete from demo_expressions.
insert demo_expressions from @( value #( id = 'L' num1 = 14 num2 = 8 ) ).

data(gv_value) = 27.

data gv_decimal type p length 14 decimals 2 value '27.0671'.

select single from demo_expressions
       fields id,
              num1,
              num2,
              cast( num1 as fltp ) / cast( num2 as fltp ) as ratio,
              division( num1, num2, 2 ) as division,
              div( num1, num2 ) as div,
              mod( num1, num2 ) as mod,
              num1 + num2 + @gv_value as sum,
              abs( num1 - num2 ) as abs,
              @gv_decimal as decimal,
              ceil( @gv_decimal ) as ceil,
              floor( @gv_decimal ) as floor,
              round( @gv_decimal, 2 ) as round
       where id eq 'L'
       into @data(gs_result).

if sy-subrc eq 0.
   cl_demo_output=>display( gs_result ).
endif.
