<?php /* #?ini charset="utf-8"?

[VersionView]
AvailableSiteDesignList[]
#AvailableSiteDesignList[]=custom_web


[CustomTagSettings]
AvailableCustomTags[]=underline
IsInline[underline]=true

[factbox]
CustomAttributes[]=align
CustomAttributes[]=title
CustomAttributesDefaults[align]=right
CustomAttributesDefaults[title]=factbox

[table]
AvailableClasses[]=list
AvailableClasses[]=cols
AvailableClasses[]=comparison
AvailableClasses[]=default
CustomAttributes[]=summary
CustomAttributes[]=caption
ClassDescription[list]=List
ClassDescription[cols]=Timetable
ClassDescription[comparison]=Comparison Table
ClassDescription[default]=Default
Defaults[rows]=2
Defaults[cols]=2
Defaults[width]=100%
Defaults[border]=0
Defaults[class]=default

[td]
CustomAttributes[]=valign

[th]
CustomAttributes[]=scope
CustomAttributes[]=abbr
CustomAttributes[]=valign

[object]
AvailableClasses[]=itemized_sub_items
AvailableClasses[]=itemized_subtree_items
AvailableClasses[]=highlighted_object
AvailableClasses[]=vertically_listed_sub_items
AvailableClasses[]=horizontally_listed_sub_items
CustomAttributes[]=offset
CustomAttributes[]=limit
ClassDescription[itemized_sub_items]=Itemized Sub Items
ClassDescription[itemized_subtree_items]=Itemized Subtree Items
ClassDescription[highlighted_object]=Highlighted Object
ClassDescription[vertically_listed_sub_items]=Vertically Listed Sub Items
ClassDescription[horizontally_listed_sub_items]=Horizontally Listed Sub Items
CustomAttributesDefaults[offset]=0
CustomAttributesDefaults[limit]=5

[embed]
AvailableClasses[]=itemized_sub_items
AvailableClasses[]=itemized_subtree_items
AvailableClasses[]=highlighted_object
AvailableClasses[]=vertically_listed_sub_items
AvailableClasses[]=horizontally_listed_sub_items
CustomAttributes[]=offset
CustomAttributes[]=limit
ClassDescription[itemized_sub_items]=Itemized Sub Items
ClassDescription[itemized_subtree_items]=Itemized Subtree Items
ClassDescription[highlighted_object]=Highlighted Object
ClassDescription[vertically_listed_sub_items]=Vertically Listed Sub Items
ClassDescription[horizontally_listed_sub_items]=Horizontally Listed Sub Items
CustomAttributesDefaults[offset]=0
CustomAttributesDefaults[limit]=5

[quote]
CustomAttributes[]=align
CustomAttributes[]=author
CustomAttributesDefaults[align]=right
CustomAttributesDefaults[autor]=Quote author

[embed-type_images]
AvailableClasses[]

[RelationAssignmentSettings]
# Default assignment for new related objects, possible values are
# - A Node ID - Place all new objects under this node
# - A node path - The placement of the parent node by a path, e.g. media/files
# - root - The root of the tree
# - users - The root of the user tree
# - media - The root of the media tree
# - none - DEPRECATED
#
# Multiple assignments are not allowed.
DefaultAssignment=media/files
# Automatic assignments for specific classes.
#
# Each line consists of three or two values separated by semi-colon.
# First two values are lists of elements which are comma separated.
#
# First value is the class identifier, second is the assignment (see above for
# values). An optional third is the main node in case you upload to many
# locations. If the third parameter is not set, then the first element of
# the value 2 will be used as main node.
#
# Classes are either specified with identifier, ID or group_ID
# The items are searched in order so the first to match will be used,
# this means that class IDs should come before class group IDs.
#
# If the same class is specified in many lines, then will be used the first
# match where user has an access to all listed nodes.
#
ClassSpecificAssignment[]
ClassSpecificAssignment[]=user,user_group;users/guest_accounts
ClassSpecificAssignment[]=image;Media/Bilder
ClassSpecificAssignment[]=file;Media/Dateien

*/ ?>
