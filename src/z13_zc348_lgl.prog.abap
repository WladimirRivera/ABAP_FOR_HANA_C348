*&---------------------------------------------------------------------*
*& Report z13_c315_gvaler
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z13_zc348_lgl.

delete from demo_simple_tree.
insert demo_simple_tree from table @( value #( ( id = 1 parent_id = 0 name = 'AA' )
                                               ( id = 2 parent_id = 1 name = 'AA-AA' )
                                               ( id = 3 parent_id = 2 name = 'AA-AA-AA' )
                                               ( id = 4 parent_id = 2 name = 'AA-AA-BB' )
                                               ( id = 5 parent_id = 1 name = 'AA-BB' )
                                               ( id = 6 parent_id = 5 name = 'AA-BB-AA' )
                                               ( id = 7 parent_id = 6 name = 'AA-BB-AA-AA' )
                                               ( id = 8 parent_id = 6 name = 'AA-BB-AA-BB' )
                                               ( id = 9 parent_id = 0 name = 'BB' ) ) ).

select from hierarchy( source demo_cds_simple_tree_source
                          child to parent association _tree
                          start where id = 1 )
       fields id,
              parent_id,
              name,
              hierarchy_is_cycle,
              hierarchy_is_orphan,
              hierarchy_level,
              hierarchy_parent_rank,
              hierarchy_rank,
              hierarchy_tree_size
       into table @data(gt_results).

select from hierarchy( source demo_cds_simple_tree_source
                          child to parent association _tree
                          start where id = 1
                          )
       fields id,
              parent_id,
              name,
              hierarchy_is_cycle,
              hierarchy_is_orphan,
              hierarchy_level,
              hierarchy_parent_rank,
              hierarchy_rank,
              hierarchy_tree_size
       into table @gt_results.



if sy-subrc eq 0.
  cl_demo_output=>display( gt_results ).
endif.
