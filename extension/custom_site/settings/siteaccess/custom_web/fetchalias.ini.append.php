<?php/*
#?ini charset="utf-8"?
# eZ Publish fetch alias configuration file.

# fetch_alias is to used as a replacement for fetch for often used fetch functions
#             or to simplify complicated fetch functions.

# General syntax
#
# [<parameter>]         # name of first parameter in fetch_alias
# Module=          # which module to use
# FunctionName=    # name of function defined in kernel/<module>/function_definition.php
# Parameter[key]=<value>  # key is the name of the parameter defined for the function in kernel/<module>/function_definition.php
#                         # value is the key of the hash entry in fetch_alias
# Constant[key]=<value>   # key is the name of the parameter defined for the function in kernel/<module>/function_definition.php
#                         # value is a constant defined in this ini file. use ; to separate elements if the value is supposed to be an array

# Fetch menu main items
[main_menu_top]
Module=content
FunctionName=list
Constant[sort_by]=priority;0
Constant[parent_node_id]=2

# Fetch menu sub items
[main_menu_sub]
Module=content
FunctionName=list
Constant[sort_by]=priority;0
Parameter[parent_node_id]=parent_node_id

[echo_blog_posts]
Module=content
FunctionName=list
Constant[class_filter_type]=include
Constant[class_filter_array]=46
Constant[sort_by]=attribute;0;echo_blogpost/publication_date
Parameter[parent_node_id]=parent_node_id
Parameter[offset]=offset
Parameter[limit]=limit

[echo_blog_posts_count]
Module=content
FunctionName=list_count
Constant[class_filter_type]=include
Constant[class_filter_array]=46
Parameter[parent_node_id]=parent_node_id

[all_echo_blog_posts]
Module=content
FunctionName=list
Constant[depth]=10
Constant[class_filter_type]=include
Constant[class_filter_array]=46
Constant[sort_by]=attribute;0;echo_blogpost/publication_date
Constant[parent_node_id]=2
Parameter[limit]=limit

*/?>
