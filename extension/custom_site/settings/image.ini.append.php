<?php /* #?ini charset="utf-8"?
[ImageMagick]
QualityParameters[]
QualityParameters[]=image/jpeg; -strip -interlace Plane -quality %1

[AliasSettings]
# Defines a list of aliases that are available to
# the template engine and other clients.
# The alias must be defined as a separate INI block.
AliasList[]=flexslider
AliasList[]=zoomed
AliasList[]=paragraph
AliasList[]=teaser
#AliasList[]=sponsor
#AliasList[]=sponsorgrid
AliasList[]=blogpost_teaser

[flexslider]
Filters[]=geometry/scaledownonly=;350
HideFromRelations=enabled
#GUIName=Standard

[paragraph]
Filters[]=geometry/scaledownonly=563;
GUIName=Absatz

[blogpost_teaser]
HideFromRelations=enabled
Filters[]=geometry/scaledownonly=563;250

[rss]
HideFromRelations=enabled

[reference]
HideFromRelations=enabled

[tiny]
HideFromRelations=enabled

[teaser]
HideFromRelations=enabled
Filters[]=geometry/scaledownonly=274;

[small]
GUIName=Klein

[medium]
GUIName=Mittel

[large]
GUIName=Groß

[zoomed]
Filters[]=geometry/scaledownonly=1024;800
HideFromRelations=enabled

#[sponsor]
#Filters[]=geometry/scaledownonly=235;
#HideFromRelations=enabled

#[sponsorgrid]
#Filters[]=geometry/scaledownonly=240;
#HideFromRelations=enabled

[multiuploadthumbnail]
HideFromRelations=enabled

*/ ?>