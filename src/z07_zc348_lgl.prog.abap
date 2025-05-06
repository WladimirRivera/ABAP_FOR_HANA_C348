*&---------------------------------------------------------------------*
*& Report z07_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z07_zc348_lgl.

delete from demo_expressions.
insert demo_expressions from @( value #( id    = 'L'
                                         char1 = 'AABbCDDe'
                                         char2 = '123456' ) ).


data gv_char type c length 4 value 'HANA'.

select single from demo_expressions
              fields id,
                     char1,
                     char2,
                     concat( char1, char2 ) as concat1,
                     concat_with_space( char1, @gv_char, 2 ) as concat2,
                     char1 && char2 && 'ABAP-' && @gv_char as ampersand,
                     left( char1, 2 ) as left,
                     right( char2, 3 ) as right,
                     lpad( char2, 40, '0' ) as lpad,
                     rpad( char2, 40, '0' ) as rpad,
                     ltrim( ltrim( char1, 'A' ), 'B' ) as ltrim,
                     rtrim( char1, 'e' ) as rtrim,
                     instr( char1,  'bC' ) as instr,
                     length( char1 ) as length,
                     replace( char1, 'DD', '__' ) as replace,
                     substring( char1, 3, 2 ) as substring,
                     lower( char1 ) as lower,
                     upper( char1 ) as upper
               where id eq 'L'
                 and char1 eq substring( char1, 3, 2 )
               into @data(gs_result).

if sy-subrc eq 0.
  cl_demo_output=>display( gs_result ).
endif.
