�
C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\App_Start\WebApiConfig.cs
	namespace 	
RestaurantService
 
{ 
public		 

static		 
class		 
WebApiConfig		 $
{

 
public 
static 
void 
Register #
(# $
HttpConfiguration$ 5
config6 <
)< =
{ 	
config 
. "
MapHttpAttributeRoutes )
() *
)* +
;+ ,
config 
. 
Routes 
. 
MapHttpRoute &
(& '
name 
: 
$str "
," #
routeTemplate 
: 
$str 6
,6 7
defaults 
: 
new 
{ 
id  "
=# $
RouteParameter% 3
.3 4
Optional4 <
}= >
) 
; 
GlobalConfiguration 
.  
Configuration  -
.- .

Formatters. 8
.8 9
JsonFormatter9 F
.F G
MediaTypeMappingsG X
.X Y
AddY \
(\ ]
new] ` 
RequestHeaderMappinga u
(u v
$strv ~
,~ 
$str )
,) *
StringComparison .
.. /&
InvariantCultureIgnoreCase/ I
,I J
true "
," #
$str 0
)0 1
)1 2
;2 3
} 	
} 
}   �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ApiDescriptionExtensions.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

static 
class $
ApiDescriptionExtensions 0
{		 
public 
static 
string 
GetFriendlyId *
(* +
this+ /
ApiDescription0 >
description? J
)J K
{ 	
string 
path 
= 
description %
.% &
RelativePath& 2
;2 3
string 
[ 
] 
urlParts 
= 
path  $
.$ %
Split% *
(* +
$char+ .
). /
;/ 0
string 
	localPath 
= 
urlParts '
[' (
$num( )
]) *
;* +
string 
queryKeyString !
=" #
null$ (
;( )
if 
( 
urlParts 
. 
Length 
>  !
$num" #
)# $
{ 
string 
query 
= 
urlParts '
[' (
$num( )
]) *
;* +
string 
[ 
] 
	queryKeys "
=# $
HttpUtility% 0
.0 1
ParseQueryString1 A
(A B
queryB G
)G H
.H I
AllKeysI P
;P Q
queryKeyString 
=  
String! '
.' (
Join( ,
(, -
$str- 0
,0 1
	queryKeys2 ;
); <
;< =
} 
StringBuilder 
friendlyPath &
=' (
new) ,
StringBuilder- :
(: ;
); <
;< =
friendlyPath 
. 
AppendFormat %
(% &
$str& /
,/ 0
description 
. 

HttpMethod &
.& '
Method' -
,- .
	localPath 
. 
Replace !
(! "
$str" %
,% &
$str' *
)* +
.+ ,
Replace, 3
(3 4
$str4 7
,7 8
String9 ?
.? @
Empty@ E
)E F
.F G
ReplaceG N
(N O
$strO R
,R S
StringT Z
.Z [
Empty[ `
)` a
)a b
;b c
if   
(   
queryKeyString   
!=   !
null  " &
)  & '
{!! 
friendlyPath"" 
."" 
AppendFormat"" )
("") *
$str""* 0
,""0 1
queryKeyString""2 @
.""@ A
Replace""A H
(""H I
$char""I L
,""L M
$char""N Q
)""Q R
)""R S
;""S T
}## 
return$$ 
friendlyPath$$ 
.$$  
ToString$$  (
($$( )
)$$) *
;$$* +
}%% 	
}&& 
}'' �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\App_Start\HelpPageConfig.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

static 
class 
HelpPageConfig &
{ 
[ 	
SuppressMessage	 
( 
$str 2
,2 3
$str4 i
,i j
	MessageId 
= 
$str Z
,Z [
Justification 
= 
$str j
)j k
]k l
[ 	
SuppressMessage	 
( 
$str +
,+ ,
$str- Z
,Z [
	MessageId   
=   
$str   "
,  " #
Justification!! 
=!! 
$str!! ,
)!!, -
]!!- .
public"" 
static"" 
void"" 
Register"" #
(""# $
HttpConfiguration""$ 5
config""6 <
)""< =
{## 	
config%% 
.%% $
SetDocumentationProvider%% +
(%%+ ,
new%%, /$
XmlDocumentationProvider%%0 H
(%%H I
HttpContext%%I T
.%%T U
Current%%U \
.%%\ ]
Server%%] c
.%%c d
MapPath%%d k
(%%k l
$str	%%l �
)
%%� �
)
%%� �
)
%%� �
;
%%� �
config:: 
.:: !
SetSampleForMediaType:: (
(::( )
new;; 

TextSample;; 
(;; 
$str;; Z
);;Z [
,;;[ \
new<<  
MediaTypeHeaderValue<< (
(<<( )
$str<<) ;
)<<; <
)<<< =
;<<= >
}QQ 	
}pp 
}qq �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\Controllers\HelpController.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
Controllers+ 6
{ 
public 

class 
HelpController 
:  !

Controller" ,
{ 
private 
const 
string 
ErrorViewName *
=+ ,
$str- 4
;4 5
public 
HelpController 
( 
) 
: 
this 
( 
GlobalConfiguration &
.& '
Configuration' 4
)4 5
{ 	
} 	
public 
HelpController 
( 
HttpConfiguration /
config0 6
)6 7
{ 	
Configuration 
= 
config "
;" #
} 	
public 
HttpConfiguration  
Configuration! .
{/ 0
get1 4
;4 5
private6 =
set> A
;A B
}C D
public 
ActionResult 
Index !
(! "
)" #
{ 	
ViewBag 
. !
DocumentationProvider )
=* +
Configuration, 9
.9 :
Services: B
.B C$
GetDocumentationProviderC [
([ \
)\ ]
;] ^
return 
View 
( 
Configuration %
.% &
Services& .
.. /
GetApiExplorer/ =
(= >
)> ?
.? @
ApiDescriptions@ O
)O P
;P Q
}   	
public"" 
ActionResult"" 
Api"" 
(""  
string""  &
apiId""' ,
)"", -
{## 	
if$$ 
($$ 
!$$ 
String$$ 
.$$ 
IsNullOrEmpty$$ %
($$% &
apiId$$& +
)$$+ ,
)$$, -
{%% 
HelpPageApiModel&&  
apiModel&&! )
=&&* +
Configuration&&, 9
.&&9 :
GetHelpPageApiModel&&: M
(&&M N
apiId&&N S
)&&S T
;&&T U
if'' 
('' 
apiModel'' 
!='' 
null''  $
)''$ %
{(( 
return)) 
View)) 
())  
apiModel))  (
)))( )
;))) *
}** 
}++ 
return-- 
View-- 
(-- 
ErrorViewName-- %
)--% &
;--& '
}.. 	
public00 
ActionResult00 
ResourceModel00 )
(00) *
string00* 0
	modelName001 :
)00: ;
{11 	
if22 
(22 
!22 
String22 
.22 
IsNullOrEmpty22 %
(22% &
	modelName22& /
)22/ 0
)220 1
{33 %
ModelDescriptionGenerator44 )%
modelDescriptionGenerator44* C
=44D E
Configuration44F S
.44S T(
GetModelDescriptionGenerator44T p
(44p q
)44q r
;44r s
ModelDescription55  
modelDescription55! 1
;551 2
if66 
(66 %
modelDescriptionGenerator66 -
.66- .
GeneratedModels66. =
.66= >
TryGetValue66> I
(66I J
	modelName66J S
,66S T
out66U X
modelDescription66Y i
)66i j
)66j k
{77 
return88 
View88 
(88  
modelDescription88  0
)880 1
;881 2
}99 
}:: 
return<< 
View<< 
(<< 
ErrorViewName<< %
)<<% &
;<<& '
}== 	
}>> 
}?? �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\HelpPageAreaRegistration.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class $
HelpPageAreaRegistration )
:* +
AreaRegistration, <
{ 
public 
override 
string 
AreaName '
{		 	
get

 
{ 
return 
$str !
;! "
} 
} 	
public 
override 
void 
RegisterArea )
() *#
AreaRegistrationContext* A
contextB I
)I J
{ 	
context 
. 
MapRoute 
( 
$str "
," #
$str '
,' (
new 
{ 

controller  
=! "
$str# )
,) *
action+ 1
=2 3
$str4 ;
,; <
apiId= B
=C D
UrlParameterE Q
.Q R
OptionalR Z
}[ \
)\ ]
;] ^
HelpPageConfig 
. 
Register #
(# $
GlobalConfiguration$ 7
.7 8
Configuration8 E
)E F
;F G
} 	
} 
} ̳
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\HelpPageConfigurationExtensions.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

static 
class +
HelpPageConfigurationExtensions 7
{ 
private 
const 
string 
ApiModelPrefix +
=, -
$str. D
;D E
public 
static 
void $
SetDocumentationProvider 3
(3 4
this4 8
HttpConfiguration9 J
configK Q
,Q R"
IDocumentationProviderS i!
documentationProviderj 
)	 �
{ 	
config 
. 
Services 
. 
Replace #
(# $
typeof$ *
(* +"
IDocumentationProvider+ A
)A B
,B C!
documentationProviderD Y
)Y Z
;Z [
} 	
public&& 
static&& 
void&& 
SetSampleObjects&& +
(&&+ ,
this&&, 0
HttpConfiguration&&1 B
config&&C I
,&&I J
IDictionary&&K V
<&&V W
Type&&W [
,&&[ \
object&&] c
>&&c d
sampleObjects&&e r
)&&r s
{'' 	
config(( 
.(( &
GetHelpPageSampleGenerator(( -
(((- .
)((. /
.((/ 0
SampleObjects((0 =
=((> ?
sampleObjects((@ M
;((M N
})) 	
public33 
static33 
void33 
SetSampleRequest33 +
(33+ ,
this33, 0
HttpConfiguration331 B
config33C I
,33I J
object33K Q
sample33R X
,33X Y 
MediaTypeHeaderValue33Z n
	mediaType33o x
,33x y
string	33z �
controllerName
33� �
,
33� �
string
33� �

actionName
33� �
)
33� �
{44 	
config55 
.55 &
GetHelpPageSampleGenerator55 -
(55- .
)55. /
.55/ 0
ActionSamples550 =
.55= >
Add55> A
(55A B
new55B E
HelpPageSampleKey55F W
(55W X
	mediaType55X a
,55a b
SampleDirection55c r
.55r s
Request55s z
,55z {
controllerName	55| �
,
55� �

actionName
55� �
,
55� �
new
55� �
[
55� �
]
55� �
{
55� �
$str
55� �
}
55� �
)
55� �
,
55� �
sample
55� �
)
55� �
;
55� �
}66 	
publicAA 
staticAA 
voidAA 
SetSampleRequestAA +
(AA+ ,
thisAA, 0
HttpConfigurationAA1 B
configAAC I
,AAI J
objectAAK Q
sampleAAR X
,AAX Y 
MediaTypeHeaderValueAAZ n
	mediaTypeAAo x
,AAx y
string	AAz �
controllerName
AA� �
,
AA� �
string
AA� �

actionName
AA� �
,
AA� �
params
AA� �
string
AA� �
[
AA� �
]
AA� �
parameterNames
AA� �
)
AA� �
{BB 	
configCC 
.CC &
GetHelpPageSampleGeneratorCC -
(CC- .
)CC. /
.CC/ 0
ActionSamplesCC0 =
.CC= >
AddCC> A
(CCA B
newCCB E
HelpPageSampleKeyCCF W
(CCW X
	mediaTypeCCX a
,CCa b
SampleDirectionCCc r
.CCr s
RequestCCs z
,CCz {
controllerName	CC| �
,
CC� �

actionName
CC� �
,
CC� �
parameterNames
CC� �
)
CC� �
,
CC� �
sample
CC� �
)
CC� �
;
CC� �
}DD 	
publicNN 
staticNN 
voidNN 
SetSampleResponseNN ,
(NN, -
thisNN- 1
HttpConfigurationNN2 C
configNND J
,NNJ K
objectNNL R
sampleNNS Y
,NNY Z 
MediaTypeHeaderValueNN[ o
	mediaTypeNNp y
,NNy z
string	NN{ �
controllerName
NN� �
,
NN� �
string
NN� �

actionName
NN� �
)
NN� �
{OO 	
configPP 
.PP &
GetHelpPageSampleGeneratorPP -
(PP- .
)PP. /
.PP/ 0
ActionSamplesPP0 =
.PP= >
AddPP> A
(PPA B
newPPB E
HelpPageSampleKeyPPF W
(PPW X
	mediaTypePPX a
,PPa b
SampleDirectionPPc r
.PPr s
ResponsePPs {
,PP{ |
controllerName	PP} �
,
PP� �

actionName
PP� �
,
PP� �
new
PP� �
[
PP� �
]
PP� �
{
PP� �
$str
PP� �
}
PP� �
)
PP� �
,
PP� �
sample
PP� �
)
PP� �
;
PP� �
}QQ 	
public\\ 
static\\ 
void\\ 
SetSampleResponse\\ ,
(\\, -
this\\- 1
HttpConfiguration\\2 C
config\\D J
,\\J K
object\\L R
sample\\S Y
,\\Y Z 
MediaTypeHeaderValue\\[ o
	mediaType\\p y
,\\y z
string	\\{ �
controllerName
\\� �
,
\\� �
string
\\� �

actionName
\\� �
,
\\� �
params
\\� �
string
\\� �
[
\\� �
]
\\� �
parameterNames
\\� �
)
\\� �
{]] 	
config^^ 
.^^ &
GetHelpPageSampleGenerator^^ -
(^^- .
)^^. /
.^^/ 0
ActionSamples^^0 =
.^^= >
Add^^> A
(^^A B
new^^B E
HelpPageSampleKey^^F W
(^^W X
	mediaType^^X a
,^^a b
SampleDirection^^c r
.^^r s
Response^^s {
,^^{ |
controllerName	^^} �
,
^^� �

actionName
^^� �
,
^^� �
parameterNames
^^� �
)
^^� �
,
^^� �
sample
^^� �
)
^^� �
;
^^� �
}__ 	
publicgg 
staticgg 
voidgg !
SetSampleForMediaTypegg 0
(gg0 1
thisgg1 5
HttpConfigurationgg6 G
configggH N
,ggN O
objectggP V
sampleggW ]
,gg] ^ 
MediaTypeHeaderValuegg_ s
	mediaTypeggt }
)gg} ~
{hh 	
configii 
.ii &
GetHelpPageSampleGeneratorii -
(ii- .
)ii. /
.ii/ 0
ActionSamplesii0 =
.ii= >
Addii> A
(iiA B
newiiB E
HelpPageSampleKeyiiF W
(iiW X
	mediaTypeiiX a
)iia b
,iib c
sampleiid j
)iij k
;iik l
}jj 	
publicss 
staticss 
voidss 
SetSampleForTypess +
(ss+ ,
thisss, 0
HttpConfigurationss1 B
configssC I
,ssI J
objectssK Q
samplessR X
,ssX Y 
MediaTypeHeaderValuessZ n
	mediaTypesso x
,ssx y
Typessz ~
type	ss �
)
ss� �
{tt 	
configuu 
.uu &
GetHelpPageSampleGeneratoruu -
(uu- .
)uu. /
.uu/ 0
ActionSamplesuu0 =
.uu= >
Adduu> A
(uuA B
newuuB E
HelpPageSampleKeyuuF W
(uuW X
	mediaTypeuuX a
,uua b
typeuuc g
)uug h
,uuh i
sampleuuj p
)uup q
;uuq r
}vv 	
public
�� 
static
�� 
void
�� "
SetActualRequestType
�� /
(
��/ 0
this
��0 4
HttpConfiguration
��5 F
config
��G M
,
��M N
Type
��O S
type
��T X
,
��X Y
string
��Z `
controllerName
��a o
,
��o p
string
��q w

actionName��x �
)��� �
{
�� 	
config
�� 
.
�� (
GetHelpPageSampleGenerator
�� -
(
��- .
)
��. /
.
��/ 0$
ActualHttpMessageTypes
��0 F
.
��F G
Add
��G J
(
��J K
new
��K N
HelpPageSampleKey
��O `
(
��` a
SampleDirection
��a p
.
��p q
Request
��q x
,
��x y
controllerName��z �
,��� �

actionName��� �
,��� �
new��� �
[��� �
]��� �
{��� �
$str��� �
}��� �
)��� �
,��� �
type��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� 
void
�� "
SetActualRequestType
�� /
(
��/ 0
this
��0 4
HttpConfiguration
��5 F
config
��G M
,
��M N
Type
��O S
type
��T X
,
��X Y
string
��Z `
controllerName
��a o
,
��o p
string
��q w

actionName��x �
,��� �
params��� �
string��� �
[��� �
]��� �
parameterNames��� �
)��� �
{
�� 	
config
�� 
.
�� (
GetHelpPageSampleGenerator
�� -
(
��- .
)
��. /
.
��/ 0$
ActualHttpMessageTypes
��0 F
.
��F G
Add
��G J
(
��J K
new
��K N
HelpPageSampleKey
��O `
(
��` a
SampleDirection
��a p
.
��p q
Request
��q x
,
��x y
controllerName��z �
,��� �

actionName��� �
,��� �
parameterNames��� �
)��� �
,��� �
type��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� 
void
�� #
SetActualResponseType
�� 0
(
��0 1
this
��1 5
HttpConfiguration
��6 G
config
��H N
,
��N O
Type
��P T
type
��U Y
,
��Y Z
string
��[ a
controllerName
��b p
,
��p q
string
��r x

actionName��y �
)��� �
{
�� 	
config
�� 
.
�� (
GetHelpPageSampleGenerator
�� -
(
��- .
)
��. /
.
��/ 0$
ActualHttpMessageTypes
��0 F
.
��F G
Add
��G J
(
��J K
new
��K N
HelpPageSampleKey
��O `
(
��` a
SampleDirection
��a p
.
��p q
Response
��q y
,
��y z
controllerName��{ �
,��� �

actionName��� �
,��� �
new��� �
[��� �
]��� �
{��� �
$str��� �
}��� �
)��� �
,��� �
type��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� 
void
�� #
SetActualResponseType
�� 0
(
��0 1
this
��1 5
HttpConfiguration
��6 G
config
��H N
,
��N O
Type
��P T
type
��U Y
,
��Y Z
string
��[ a
controllerName
��b p
,
��p q
string
��r x

actionName��y �
,��� �
params��� �
string��� �
[��� �
]��� �
parameterNames��� �
)��� �
{
�� 	
config
�� 
.
�� (
GetHelpPageSampleGenerator
�� -
(
��- .
)
��. /
.
��/ 0$
ActualHttpMessageTypes
��0 F
.
��F G
Add
��G J
(
��J K
new
��K N
HelpPageSampleKey
��O `
(
��` a
SampleDirection
��a p
.
��p q
Response
��q y
,
��y z
controllerName��{ �
,��� �

actionName��� �
,��� �
parameterNames��� �
)��� �
,��� �
type��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� %
HelpPageSampleGenerator
�� -(
GetHelpPageSampleGenerator
��. H
(
��H I
this
��I M
HttpConfiguration
��N _
config
��` f
)
��f g
{
�� 	
return
�� 
(
�� %
HelpPageSampleGenerator
�� +
)
��+ ,
config
��, 2
.
��2 3

Properties
��3 =
.
��= >
GetOrAdd
��> F
(
��F G
typeof
�� 
(
�� %
HelpPageSampleGenerator
�� .
)
��. /
,
��/ 0
k
�� 
=>
�� 
new
�� %
HelpPageSampleGenerator
�� 0
(
��0 1
)
��1 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
static
�� 
void
�� (
SetHelpPageSampleGenerator
�� 5
(
��5 6
this
��6 :
HttpConfiguration
��; L
config
��M S
,
��S T%
HelpPageSampleGenerator
��U l
sampleGenerator
��m |
)
��| }
{
�� 	
config
�� 
.
�� 

Properties
�� 
.
�� 
AddOrUpdate
�� )
(
��) *
typeof
�� 
(
�� %
HelpPageSampleGenerator
�� .
)
��. /
,
��/ 0
k
�� 
=>
�� 
sampleGenerator
�� $
,
��$ %
(
�� 
k
�� 
,
�� 
o
�� 
)
�� 
=>
�� 
sampleGenerator
�� )
)
��) *
;
��* +
}
�� 	
public
�� 
static
�� '
ModelDescriptionGenerator
�� /*
GetModelDescriptionGenerator
��0 L
(
��L M
this
��M Q
HttpConfiguration
��R c
config
��d j
)
��j k
{
�� 	
return
�� 
(
�� '
ModelDescriptionGenerator
�� -
)
��- .
config
��. 4
.
��4 5

Properties
��5 ?
.
��? @
GetOrAdd
��@ H
(
��H I
typeof
�� 
(
�� '
ModelDescriptionGenerator
�� 0
)
��0 1
,
��1 2
k
�� 
=>
�� 1
#InitializeModelDescriptionGenerator
�� 8
(
��8 9
config
��9 ?
)
��? @
)
��@ A
;
��A B
}
�� 	
public
�� 
static
�� 
HelpPageApiModel
�� &!
GetHelpPageApiModel
��' :
(
��: ;
this
��; ?
HttpConfiguration
��@ Q
config
��R X
,
��X Y
string
��Z `
apiDescriptionId
��a q
)
��q r
{
�� 	
object
�� 
model
�� 
;
�� 
string
�� 
modelId
�� 
=
�� 
ApiModelPrefix
�� +
+
��, -
apiDescriptionId
��. >
;
��> ?
if
�� 
(
�� 
!
�� 
config
�� 
.
�� 

Properties
�� "
.
��" #
TryGetValue
��# .
(
��. /
modelId
��/ 6
,
��6 7
out
��8 ;
model
��< A
)
��A B
)
��B C
{
�� 

Collection
�� 
<
�� 
ApiDescription
�� )
>
��) *
apiDescriptions
��+ :
=
��; <
config
��= C
.
��C D
Services
��D L
.
��L M
GetApiExplorer
��M [
(
��[ \
)
��\ ]
.
��] ^
ApiDescriptions
��^ m
;
��m n
ApiDescription
�� 
apiDescription
�� -
=
��. /
apiDescriptions
��0 ?
.
��? @
FirstOrDefault
��@ N
(
��N O
api
��O R
=>
��S U
String
��V \
.
��\ ]
Equals
��] c
(
��c d
api
��d g
.
��g h
GetFriendlyId
��h u
(
��u v
)
��v w
,
��w x
apiDescriptionId��y �
,��� � 
StringComparison��� �
.��� �!
OrdinalIgnoreCase��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
apiDescription
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
model
�� 
=
�� 
GenerateApiModel
�� ,
(
��, -
apiDescription
��- ;
,
��; <
config
��= C
)
��C D
;
��D E
config
�� 
.
�� 

Properties
�� %
.
��% &
TryAdd
��& ,
(
��, -
modelId
��- 4
,
��4 5
model
��6 ;
)
��; <
;
��< =
}
�� 
}
�� 
return
�� 
(
�� 
HelpPageApiModel
�� $
)
��$ %
model
��% *
;
��* +
}
�� 	
private
�� 
static
�� 
HelpPageApiModel
�� '
GenerateApiModel
��( 8
(
��8 9
ApiDescription
��9 G
apiDescription
��H V
,
��V W
HttpConfiguration
��X i
config
��j p
)
��p q
{
�� 	
HelpPageApiModel
�� 
apiModel
�� %
=
��& '
new
��( +
HelpPageApiModel
��, <
(
��< =
)
��= >
{
�� 
ApiDescription
�� 
=
��  
apiDescription
��! /
,
��/ 0
}
�� 
;
�� '
ModelDescriptionGenerator
�� %
modelGenerator
��& 4
=
��5 6
config
��7 =
.
��= >*
GetModelDescriptionGenerator
��> Z
(
��Z [
)
��[ \
;
��\ ]%
HelpPageSampleGenerator
�� #
sampleGenerator
��$ 3
=
��4 5
config
��6 <
.
��< =(
GetHelpPageSampleGenerator
��= W
(
��W X
)
��X Y
;
��Y Z#
GenerateUriParameters
�� !
(
��! "
apiModel
��" *
,
��* +
modelGenerator
��, :
)
��: ;
;
��; <-
GenerateRequestModelDescription
�� +
(
��+ ,
apiModel
��, 4
,
��4 5
modelGenerator
��6 D
,
��D E
sampleGenerator
��F U
)
��U V
;
��V W)
GenerateResourceDescription
�� '
(
��' (
apiModel
��( 0
,
��0 1
modelGenerator
��2 @
)
��@ A
;
��A B
GenerateSamples
�� 
(
�� 
apiModel
�� $
,
��$ %
sampleGenerator
��& 5
)
��5 6
;
��6 7
return
�� 
apiModel
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� #
GenerateUriParameters
�� 1
(
��1 2
HelpPageApiModel
��2 B
apiModel
��C K
,
��K L'
ModelDescriptionGenerator
��M f
modelGenerator
��g u
)
��u v
{
�� 	
ApiDescription
�� 
apiDescription
�� )
=
��* +
apiModel
��, 4
.
��4 5
ApiDescription
��5 C
;
��C D
foreach
�� 
(
�� %
ApiParameterDescription
�� ,
apiParameter
��- 9
in
��: <
apiDescription
��= K
.
��K L#
ParameterDescriptions
��L a
)
��a b
{
�� 
if
�� 
(
�� 
apiParameter
��  
.
��  !
Source
��! '
==
��( * 
ApiParameterSource
��+ =
.
��= >
FromUri
��> E
)
��E F
{
�� %
HttpParameterDescriptor
�� +!
parameterDescriptor
��, ?
=
��@ A
apiParameter
��B N
.
��N O!
ParameterDescriptor
��O b
;
��b c
Type
�� 
parameterType
�� &
=
��' (
null
��) -
;
��- .
ModelDescription
�� $
typeDescription
��% 4
=
��5 6
null
��7 ;
;
��; <)
ComplexTypeModelDescription
�� /$
complexTypeDescription
��0 F
=
��G H
null
��I M
;
��M N
if
�� 
(
�� !
parameterDescriptor
�� +
!=
��, .
null
��/ 3
)
��3 4
{
�� 
parameterType
�� %
=
��& '!
parameterDescriptor
��( ;
.
��; <
ParameterType
��< I
;
��I J
typeDescription
�� '
=
��( )
modelGenerator
��* 8
.
��8 9)
GetOrCreateModelDescription
��9 T
(
��T U
parameterType
��U b
)
��b c
;
��c d$
complexTypeDescription
�� .
=
��/ 0
typeDescription
��1 @
as
��A C)
ComplexTypeModelDescription
��D _
;
��_ `
}
�� 
if
�� 
(
�� $
complexTypeDescription
�� .
!=
��/ 1
null
��2 6
&&
�� 
!
�� )
IsBindableWithTypeConverter
�� 7
(
��7 8
parameterType
��8 E
)
��E F
)
��F G
{
�� 
foreach
�� 
(
��  !"
ParameterDescription
��! 5
uriParameter
��6 B
in
��C E$
complexTypeDescription
��F \
.
��\ ]

Properties
��] g
)
��g h
{
�� 
apiModel
�� $
.
��$ %
UriParameters
��% 2
.
��2 3
Add
��3 6
(
��6 7
uriParameter
��7 C
)
��C D
;
��D E
}
�� 
}
�� 
else
�� 
if
�� 
(
�� !
parameterDescriptor
�� 0
!=
��1 3
null
��4 8
)
��8 9
{
�� "
ParameterDescription
�� ,
uriParameter
��- 9
=
��: ;%
AddParameterDescription
�� 3
(
��3 4
apiModel
��4 <
,
��< =
apiParameter
��> J
,
��J K
typeDescription
��L [
)
��[ \
;
��\ ]
if
�� 
(
�� 
!
�� !
parameterDescriptor
�� 0
.
��0 1

IsOptional
��1 ;
)
��; <
{
�� 
uriParameter
�� (
.
��( )
Annotations
��) 4
.
��4 5
Add
��5 8
(
��8 9
new
��9 <!
ParameterAnnotation
��= P
(
��P Q
)
��Q R
{
��S T
Documentation
��U b
=
��c d
$str
��e o
}
��p q
)
��q r
;
��r s
}
�� 
object
�� 
defaultValue
�� +
=
��, -!
parameterDescriptor
��. A
.
��A B
DefaultValue
��B N
;
��N O
if
�� 
(
�� 
defaultValue
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
uriParameter
�� (
.
��( )
Annotations
��) 4
.
��4 5
Add
��5 8
(
��8 9
new
��9 <!
ParameterAnnotation
��= P
(
��P Q
)
��Q R
{
��S T
Documentation
��U b
=
��c d
$str
��e x
+
��y z
Convert��{ �
.��� �
ToString��� �
(��� �
defaultValue��� �
,��� �
CultureInfo��� �
.��� � 
InvariantCulture��� �
)��� �
}��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
Debug
�� 
.
�� 
Assert
�� $
(
��$ %!
parameterDescriptor
��% 8
==
��9 ;
null
��< @
)
��@ A
;
��A B
ModelDescription
�� (
modelDescription
��) 9
=
��: ;
modelGenerator
��< J
.
��J K)
GetOrCreateModelDescription
��K f
(
��f g
typeof
��g m
(
��m n
string
��n t
)
��t u
)
��u v
;
��v w%
AddParameterDescription
�� /
(
��/ 0
apiModel
��0 8
,
��8 9
apiParameter
��: F
,
��F G
modelDescription
��H X
)
��X Y
;
��Y Z
}
�� 
}
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� )
IsBindableWithTypeConverter
�� 7
(
��7 8
Type
��8 <
parameterType
��= J
)
��J K
{
�� 	
if
�� 
(
�� 
parameterType
�� 
==
��  
null
��! %
)
��% &
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
TypeDescriptor
�� !
.
��! "
GetConverter
��" .
(
��. /
parameterType
��/ <
)
��< =
.
��= >
CanConvertFrom
��> L
(
��L M
typeof
��M S
(
��S T
string
��T Z
)
��Z [
)
��[ \
;
��\ ]
}
�� 	
private
�� 
static
�� "
ParameterDescription
�� +%
AddParameterDescription
��, C
(
��C D
HelpPageApiModel
��D T
apiModel
��U ]
,
��] ^%
ApiParameterDescription
�� #
apiParameter
��$ 0
,
��0 1
ModelDescription
��2 B
typeDescription
��C R
)
��R S
{
�� 	"
ParameterDescription
��  "
parameterDescription
��! 5
=
��6 7
new
��8 ;"
ParameterDescription
��< P
{
�� 
Name
�� 
=
�� 
apiParameter
�� #
.
��# $
Name
��$ (
,
��( )
Documentation
�� 
=
�� 
apiParameter
��  ,
.
��, -
Documentation
��- :
,
��: ;
TypeDescription
�� 
=
��  !
typeDescription
��" 1
,
��1 2
}
�� 
;
�� 
apiModel
�� 
.
�� 
UriParameters
�� "
.
��" #
Add
��# &
(
��& '"
parameterDescription
��' ;
)
��; <
;
��< =
return
�� "
parameterDescription
�� '
;
��' (
}
�� 	
private
�� 
static
�� 
void
�� -
GenerateRequestModelDescription
�� ;
(
��; <
HelpPageApiModel
��< L
apiModel
��M U
,
��U V'
ModelDescriptionGenerator
��W p
modelGenerator
��q 
,�� �'
HelpPageSampleGenerator��� �
sampleGenerator��� �
)��� �
{
�� 	
ApiDescription
�� 
apiDescription
�� )
=
��* +
apiModel
��, 4
.
��4 5
ApiDescription
��5 C
;
��C D
foreach
�� 
(
�� %
ApiParameterDescription
�� ,
apiParameter
��- 9
in
��: <
apiDescription
��= K
.
��K L#
ParameterDescriptions
��L a
)
��a b
{
�� 
if
�� 
(
�� 
apiParameter
��  
.
��  !
Source
��! '
==
��( * 
ApiParameterSource
��+ =
.
��= >
FromBody
��> F
)
��F G
{
�� 
Type
�� 
parameterType
�� &
=
��' (
apiParameter
��) 5
.
��5 6!
ParameterDescriptor
��6 I
.
��I J
ParameterType
��J W
;
��W X
apiModel
�� 
.
�� %
RequestModelDescription
�� 4
=
��5 6
modelGenerator
��7 E
.
��E F)
GetOrCreateModelDescription
��F a
(
��a b
parameterType
��b o
)
��o p
;
��p q
apiModel
�� 
.
�� "
RequestDocumentation
�� 1
=
��2 3
apiParameter
��4 @
.
��@ A
Documentation
��A N
;
��N O
}
�� 
else
�� 
if
�� 
(
�� 
apiParameter
�� %
.
��% &!
ParameterDescriptor
��& 9
!=
��: <
null
��= A
&&
��B D
apiParameter
��  
.
��  !!
ParameterDescriptor
��! 4
.
��4 5
ParameterType
��5 B
==
��C E
typeof
��F L
(
��L M 
HttpRequestMessage
��M _
)
��_ `
)
��` a
{
�� 
Type
�� 
parameterType
�� &
=
��' (
sampleGenerator
��) 8
.
��8 9+
ResolveHttpRequestMessageType
��9 V
(
��V W
apiDescription
��W e
)
��e f
;
��f g
if
�� 
(
�� 
parameterType
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
apiModel
��  
.
��  !%
RequestModelDescription
��! 8
=
��9 :
modelGenerator
��; I
.
��I J)
GetOrCreateModelDescription
��J e
(
��e f
parameterType
��f s
)
��s t
;
��t u
}
�� 
}
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� )
GenerateResourceDescription
�� 7
(
��7 8
HelpPageApiModel
��8 H
apiModel
��I Q
,
��Q R'
ModelDescriptionGenerator
��S l
modelGenerator
��m {
)
��{ |
{
�� 	!
ResponseDescription
�� 
response
��  (
=
��) *
apiModel
��+ 3
.
��3 4
ApiDescription
��4 B
.
��B C!
ResponseDescription
��C V
;
��V W
Type
�� 
responseType
�� 
=
�� 
response
��  (
.
��( )
ResponseType
��) 5
??
��6 8
response
��9 A
.
��A B
DeclaredType
��B N
;
��N O
if
�� 
(
�� 
responseType
�� 
!=
�� 
null
��  $
&&
��% '
responseType
��( 4
!=
��5 7
typeof
��8 >
(
��> ?
void
��? C
)
��C D
)
��D E
{
�� 
apiModel
�� 
.
�� !
ResourceDescription
�� ,
=
��- .
modelGenerator
��/ =
.
��= >)
GetOrCreateModelDescription
��> Y
(
��Y Z
responseType
��Z f
)
��f g
;
��g h
}
�� 
}
�� 	
[
�� 	
SuppressMessage
��	 
(
�� 
$str
�� +
,
��+ ,
$str
��- U
,
��U V
Justification
��W d
=
��e f
$str��g �
)��� �
]��� �
private
�� 
static
�� 
void
�� 
GenerateSamples
�� +
(
��+ ,
HelpPageApiModel
��, <
apiModel
��= E
,
��E F%
HelpPageSampleGenerator
��G ^
sampleGenerator
��_ n
)
��n o
{
�� 	
try
�� 
{
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
sampleGenerator
��% 4
.
��4 5
GetSampleRequests
��5 F
(
��F G
apiModel
��G O
.
��O P
ApiDescription
��P ^
)
��^ _
)
��_ `
{
�� 
apiModel
�� 
.
�� 
SampleRequests
�� +
.
��+ ,
Add
��, /
(
��/ 0
item
��0 4
.
��4 5
Key
��5 8
,
��8 9
item
��: >
.
��> ?
Value
��? D
)
��D E
;
��E F%
LogInvalidSampleAsError
�� +
(
��+ ,
apiModel
��, 4
,
��4 5
item
��6 :
.
��: ;
Value
��; @
)
��@ A
;
��A B
}
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
sampleGenerator
��% 4
.
��4 5 
GetSampleResponses
��5 G
(
��G H
apiModel
��H P
.
��P Q
ApiDescription
��Q _
)
��_ `
)
��` a
{
�� 
apiModel
�� 
.
�� 
SampleResponses
�� ,
.
��, -
Add
��- 0
(
��0 1
item
��1 5
.
��5 6
Key
��6 9
,
��9 :
item
��; ?
.
��? @
Value
��@ E
)
��E F
;
��F G%
LogInvalidSampleAsError
�� +
(
��+ ,
apiModel
��, 4
,
��4 5
item
��6 :
.
��: ;
Value
��; @
)
��@ A
;
��A B
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
apiModel
�� 
.
�� 
ErrorMessages
�� &
.
��& '
Add
��' *
(
��* +
String
��+ 1
.
��1 2
Format
��2 8
(
��8 9
CultureInfo
��9 D
.
��D E
CurrentCulture
��E S
,
��S T
$str
�� c
,
��c d%
HelpPageSampleGenerator
�� +
.
��+ ,
UnwrapException
��, ;
(
��; <
e
��< =
)
��= >
.
��> ?
Message
��? F
)
��F G
)
��G H
;
��H I
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� %
TryGetResourceParameter
�� 3
(
��3 4
ApiDescription
��4 B
apiDescription
��C Q
,
��Q R
HttpConfiguration
��S d
config
��e k
,
��k l
out
��m p&
ApiParameterDescription��q �$
parameterDescription��� �
,��� �
out��� �
Type��� �
resourceType��� �
)��� �
{
�� 	"
parameterDescription
��  
=
��! "
apiDescription
��# 1
.
��1 2#
ParameterDescriptions
��2 G
.
��G H
FirstOrDefault
��H V
(
��V W
p
�� 
=>
�� 
p
�� 
.
�� 
Source
�� 
==
��   
ApiParameterSource
��! 3
.
��3 4
FromBody
��4 <
||
��= ?
(
�� 
p
�� 
.
�� !
ParameterDescriptor
�� *
!=
��+ -
null
��. 2
&&
��3 5
p
��6 7
.
��7 8!
ParameterDescriptor
��8 K
.
��K L
ParameterType
��L Y
==
��Z \
typeof
��] c
(
��c d 
HttpRequestMessage
��d v
)
��v w
)
��w x
)
��x y
;
��y z
if
�� 
(
�� "
parameterDescription
�� $
==
��% '
null
��( ,
)
��, -
{
�� 
resourceType
�� 
=
�� 
null
�� #
;
��# $
return
�� 
false
�� 
;
�� 
}
�� 
resourceType
�� 
=
�� "
parameterDescription
�� /
.
��/ 0!
ParameterDescriptor
��0 C
.
��C D
ParameterType
��D Q
;
��Q R
if
�� 
(
�� 
resourceType
�� 
==
�� 
typeof
��  &
(
��& ' 
HttpRequestMessage
��' 9
)
��9 :
)
��: ;
{
�� %
HelpPageSampleGenerator
�� '
sampleGenerator
��( 7
=
��8 9
config
��: @
.
��@ A(
GetHelpPageSampleGenerator
��A [
(
��[ \
)
��\ ]
;
��] ^
resourceType
�� 
=
�� 
sampleGenerator
�� .
.
��. /+
ResolveHttpRequestMessageType
��/ L
(
��L M
apiDescription
��M [
)
��[ \
;
��\ ]
}
�� 
if
�� 
(
�� 
resourceType
�� 
==
�� 
null
��  $
)
��$ %
{
�� "
parameterDescription
�� $
=
��% &
null
��' +
;
��+ ,
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
static
�� '
ModelDescriptionGenerator
�� 01
#InitializeModelDescriptionGenerator
��1 T
(
��T U
HttpConfiguration
��U f
config
��g m
)
��m n
{
�� 	'
ModelDescriptionGenerator
�� %
modelGenerator
��& 4
=
��5 6
new
��7 :'
ModelDescriptionGenerator
��; T
(
��T U
config
��U [
)
��[ \
;
��\ ]

Collection
�� 
<
�� 
ApiDescription
�� %
>
��% &
apis
��' +
=
��, -
config
��. 4
.
��4 5
Services
��5 =
.
��= >
GetApiExplorer
��> L
(
��L M
)
��M N
.
��N O
ApiDescriptions
��O ^
;
��^ _
foreach
�� 
(
�� 
ApiDescription
�� #
api
��$ '
in
��( *
apis
��+ /
)
��/ 0
{
�� %
ApiParameterDescription
�� '"
parameterDescription
��( <
;
��< =
Type
�� 
parameterType
�� "
;
��" #
if
�� 
(
�� %
TryGetResourceParameter
�� +
(
��+ ,
api
��, /
,
��/ 0
config
��1 7
,
��7 8
out
��9 <"
parameterDescription
��= Q
,
��Q R
out
��S V
parameterType
��W d
)
��d e
)
��e f
{
�� 
modelGenerator
�� "
.
��" #)
GetOrCreateModelDescription
��# >
(
��> ?
parameterType
��? L
)
��L M
;
��M N
}
�� 
}
�� 
return
�� 
modelGenerator
�� !
;
��! "
}
�� 	
private
�� 
static
�� 
void
�� %
LogInvalidSampleAsError
�� 3
(
��3 4
HelpPageApiModel
��4 D
apiModel
��E M
,
��M N
object
��O U
sample
��V \
)
��\ ]
{
�� 	
InvalidSample
�� 
invalidSample
�� '
=
��( )
sample
��* 0
as
��1 3
InvalidSample
��4 A
;
��A B
if
�� 
(
�� 
invalidSample
�� 
!=
��  
null
��! %
)
��% &
{
�� 
apiModel
�� 
.
�� 
ErrorMessages
�� &
.
��& '
Add
��' *
(
��* +
invalidSample
��+ 8
.
��8 9
ErrorMessage
��9 E
)
��E F
;
��F G
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\CollectionModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class &
CollectionModelDescription +
:, -
ModelDescription. >
{ 
public 
ModelDescription 
ElementDescription  2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ComplexTypeModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class '
ComplexTypeModelDescription ,
:- .
ModelDescription/ ?
{ 
public '
ComplexTypeModelDescription *
(* +
)+ ,
{ 	

Properties		 
=		 
new		 

Collection		 '
<		' ( 
ParameterDescription		( <
>		< =
(		= >
)		> ?
;		? @
}

 	
public 

Collection 
<  
ParameterDescription .
>. /

Properties0 :
{; <
get= @
;@ A
privateB I
setJ M
;M N
}O P
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\DictionaryModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class &
DictionaryModelDescription +
:, -(
KeyValuePairModelDescription. J
{ 
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\EnumTypeModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class $
EnumTypeModelDescription )
:* +
ModelDescription, <
{ 
public $
EnumTypeModelDescription '
(' (
)( )
{		 	
Values

 
=

 
new

 

Collection

 #
<

# $ 
EnumValueDescription

$ 8
>

8 9
(

9 :
)

: ;
;

; <
} 	
public 

Collection 
<  
EnumValueDescription .
>. /
Values0 6
{7 8
get9 <
;< =
private> E
setF I
;I J
}K L
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\EnumValueDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class  
EnumValueDescription %
{ 
public 
string 
Documentation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Value		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\IModelDocumentationProvider.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

	interface '
IModelDocumentationProvider 0
{ 
string 
GetDocumentation 
(  

MemberInfo  *
member+ 1
)1 2
;2 3
string

 
GetDocumentation

 
(

  
Type

  $
type

% )
)

) *
;

* +
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\KeyValuePairModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class (
KeyValuePairModelDescription -
:. /
ModelDescription0 @
{ 
public 
ModelDescription 
KeyModelDescription  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
ModelDescription !
ValueModelDescription  5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
}		 �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

abstract 
class 
ModelDescription *
{		 
public

 
string

 
Documentation

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
Type 
	ModelType 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ModelDescriptionGenerator.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class %
ModelDescriptionGenerator *
{ 
private 
readonly 
IDictionary $
<$ %
Type% )
,) *
Func+ /
</ 0
object0 6
,6 7
string8 >
>> ?
>? @#
AnnotationTextGeneratorA X
=Y Z
new[ ^

Dictionary_ i
<i j
Typej n
,n o
Funcp t
<t u
objectu {
,{ |
string	} �
>
� �
>
� �
{ 	
{ 
typeof 
( 
RequiredAttribute &
)& '
,' (
a) *
=>+ -
$str. 8
}9 :
,: ;
{ 
typeof 
( 
RangeAttribute #
)# $
,$ %
a& '
=>( *
{ 
RangeAttribute "
range# (
=) *
(+ ,
RangeAttribute, :
): ;
a; <
;< =
return 
String !
.! "
Format" (
(( )
CultureInfo) 4
.4 5
CurrentCulture5 C
,C D
$strE k
,k l
rangem r
.r s
Minimums z
,z {
range	| �
.
� �
Maximum
� �
)
� �
;
� �
} 
} 
, 
{ 
typeof 
( 
MaxLengthAttribute '
)' (
,( )
a* +
=>, .
{   
MaxLengthAttribute!! &
	maxLength!!' 0
=!!1 2
(!!3 4
MaxLengthAttribute!!4 F
)!!F G
a!!G H
;!!H I
return"" 
String"" !
.""! "
Format""" (
(""( )
CultureInfo"") 4
.""4 5
CurrentCulture""5 C
,""C D
$str""E V
,""V W
	maxLength""X a
.""a b
Length""b h
)""h i
;""i j
}## 
}$$ 
,$$ 
{%% 
typeof%% 
(%% 
MinLengthAttribute%% '
)%%' (
,%%( )
a%%* +
=>%%, .
{&& 
MinLengthAttribute'' &
	minLength''' 0
=''1 2
(''3 4
MinLengthAttribute''4 F
)''F G
a''G H
;''H I
return(( 
String(( !
.((! "
Format((" (
(((( )
CultureInfo(() 4
.((4 5
CurrentCulture((5 C
,((C D
$str((E V
,((V W
	minLength((X a
.((a b
Length((b h
)((h i
;((i j
})) 
}** 
,** 
{++ 
typeof++ 
(++ !
StringLengthAttribute++ *
)++* +
,+++ ,
a++- .
=>++/ 1
{,, !
StringLengthAttribute-- )
	strLength--* 3
=--4 5
(--6 7!
StringLengthAttribute--7 L
)--L M
a--M N
;--N O
return.. 
String.. !
...! "
Format.." (
(..( )
CultureInfo..) 4
...4 5
CurrentCulture..5 C
,..C D
$str..E s
,..s t
	strLength..u ~
...~ 
MinimumLength	.. �
,
..� �
	strLength
..� �
.
..� �
MaximumLength
..� �
)
..� �
;
..� �
}// 
}00 
,00 
{11 
typeof11 
(11 
DataTypeAttribute11 &
)11& '
,11' (
a11) *
=>11+ -
{22 
DataTypeAttribute33 %
dataType33& .
=33/ 0
(331 2
DataTypeAttribute332 C
)33C D
a33D E
;33E F
return44 
String44 !
.44! "
Format44" (
(44( )
CultureInfo44) 4
.444 5
CurrentCulture445 C
,44C D
$str44E U
,44U V
dataType44W _
.44_ `
CustomDataType44` n
??44o q
dataType44r z
.44z {
DataType	44{ �
.
44� �
ToString
44� �
(
44� �
)
44� �
)
44� �
;
44� �
}55 
}66 
,66 
{77 
typeof77 
(77 &
RegularExpressionAttribute77 /
)77/ 0
,770 1
a772 3
=>774 6
{88 &
RegularExpressionAttribute99 .
regularExpression99/ @
=99A B
(99C D&
RegularExpressionAttribute99D ^
)99^ _
a99_ `
;99` a
return:: 
String:: !
.::! "
Format::" (
(::( )
CultureInfo::) 4
.::4 5
CurrentCulture::5 C
,::C D
$str::E o
,::o p
regularExpression	::q �
.
::� �
Pattern
::� �
)
::� �
;
::� �
};; 
}<< 
,<< 
}== 	
;==	 

private@@ 
readonly@@ 
IDictionary@@ $
<@@$ %
Type@@% )
,@@) *
string@@+ 1
>@@1 2$
DefaultTypeDocumentation@@3 K
=@@L M
new@@N Q

Dictionary@@R \
<@@\ ]
Type@@] a
,@@a b
string@@c i
>@@i j
{AA 	
{BB 
typeofBB 
(BB 
Int16BB 
)BB 
,BB 
$strBB &
}BB' (
,BB( )
{CC 
typeofCC 
(CC 
Int32CC 
)CC 
,CC 
$strCC &
}CC' (
,CC( )
{DD 
typeofDD 
(DD 
Int64DD 
)DD 
,DD 
$strDD &
}DD' (
,DD( )
{EE 
typeofEE 
(EE 
UInt16EE 
)EE 
,EE 
$strEE 0
}EE1 2
,EE2 3
{FF 
typeofFF 
(FF 
UInt32FF 
)FF 
,FF 
$strFF 0
}FF1 2
,FF2 3
{GG 
typeofGG 
(GG 
UInt64GG 
)GG 
,GG 
$strGG 0
}GG1 2
,GG2 3
{HH 
typeofHH 
(HH 
ByteHH 
)HH 
,HH 
$strHH "
}HH# $
,HH$ %
{II 
typeofII 
(II 
CharII 
)II 
,II 
$strII '
}II( )
,II) *
{JJ 
typeofJJ 
(JJ 
SByteJJ 
)JJ 
,JJ 
$strJJ *
}JJ+ ,
,JJ, -
{KK 
typeofKK 
(KK 
UriKK 
)KK 
,KK 
$strKK  
}KK! "
,KK" #
{LL 
typeofLL 
(LL 
SingleLL 
)LL 
,LL 
$strLL .
}LL/ 0
,LL0 1
{MM 
typeofMM 
(MM 
DoubleMM 
)MM 
,MM 
$strMM .
}MM/ 0
,MM0 1
{NN 
typeofNN 
(NN 
DecimalNN 
)NN 
,NN 
$strNN /
}NN0 1
,NN1 2
{OO 
typeofOO 
(OO 
StringOO 
)OO 
,OO 
$strOO &
}OO' (
,OO( )
{PP 
typeofPP 
(PP 
GuidPP 
)PP 
,PP 
$strPP 8
}PP9 :
,PP: ;
{QQ 
typeofQQ 
(QQ 
TimeSpanQQ 
)QQ 
,QQ 
$strQQ  /
}QQ0 1
,QQ1 2
{RR 
typeofRR 
(RR 
DateTimeRR 
)RR 
,RR 
$strRR  &
}RR' (
,RR( )
{SS 
typeofSS 
(SS 
DateTimeOffsetSS #
)SS# $
,SS$ %
$strSS& ,
}SS- .
,SS. /
{TT 
typeofTT 
(TT 
BooleanTT 
)TT 
,TT 
$strTT (
}TT) *
,TT* +
}UU 	
;UU	 

privateWW 
LazyWW 
<WW '
IModelDocumentationProviderWW 0
>WW0 1"
_documentationProviderWW2 H
;WWH I
publicYY %
ModelDescriptionGeneratorYY (
(YY( )
HttpConfigurationYY) :
configYY; A
)YYA B
{ZZ 	
if[[ 
([[ 
config[[ 
==[[ 
null[[ 
)[[ 
{\\ 
throw]] 
new]] !
ArgumentNullException]] /
(]]/ 0
$str]]0 8
)]]8 9
;]]9 :
}^^ "
_documentationProvider`` "
=``# $
new``% (
Lazy``) -
<``- .'
IModelDocumentationProvider``. I
>``I J
(``J K
(``K L
)``L M
=>``N P
config``Q W
.``W X
Services``X `
.``` a$
GetDocumentationProvider``a y
(``y z
)``z {
as``| ~(
IModelDocumentationProvider	`` �
)
``� �
;
``� �
GeneratedModelsaa 
=aa 
newaa !

Dictionaryaa" ,
<aa, -
stringaa- 3
,aa3 4
ModelDescriptionaa5 E
>aaE F
(aaF G
StringCompareraaG U
.aaU V
OrdinalIgnoreCaseaaV g
)aag h
;aah i
}bb 	
publicdd 

Dictionarydd 
<dd 
stringdd  
,dd  !
ModelDescriptiondd" 2
>dd2 3
GeneratedModelsdd4 C
{ddD E
getddF I
;ddI J
privateddK R
setddS V
;ddV W
}ddX Y
privateff '
IModelDocumentationProviderff +!
DocumentationProviderff, A
{gg 	
gethh 
{ii 
returnjj "
_documentationProviderjj -
.jj- .
Valuejj. 3
;jj3 4
}kk 
}ll 	
publicnn 
ModelDescriptionnn '
GetOrCreateModelDescriptionnn  ;
(nn; <
Typenn< @
	modelTypennA J
)nnJ K
{oo 	
ifpp 
(pp 
	modelTypepp 
==pp 
nullpp !
)pp! "
{qq 
throwrr 
newrr !
ArgumentNullExceptionrr /
(rr/ 0
$strrr0 ;
)rr; <
;rr< =
}ss 
Typeuu 
underlyingTypeuu 
=uu  !
Nullableuu" *
.uu* +
GetUnderlyingTypeuu+ <
(uu< =
	modelTypeuu= F
)uuF G
;uuG H
ifvv 
(vv 
underlyingTypevv 
!=vv !
nullvv" &
)vv& '
{ww 
	modelTypexx 
=xx 
underlyingTypexx *
;xx* +
}yy 
ModelDescription{{ 
modelDescription{{ -
;{{- .
string|| 
	modelName|| 
=|| 
ModelNameHelper|| .
.||. /
GetModelName||/ ;
(||; <
	modelType||< E
)||E F
;||F G
if}} 
(}} 
GeneratedModels}} 
.}}  
TryGetValue}}  +
(}}+ ,
	modelName}}, 5
,}}5 6
out}}7 :
modelDescription}}; K
)}}K L
)}}L M
{~~ 
if 
( 
	modelType 
!=  
modelDescription! 1
.1 2
	ModelType2 ;
); <
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
String
�� 
.
�� 
Format
�� %
(
��% &
CultureInfo
�� '
.
��' (
CurrentCulture
��( 6
,
��6 7
$str�� �
+��� �
$str�� �
,��� �
	modelName
�� %
,
��% &
modelDescription
�� ,
.
��, -
	ModelType
��- 6
.
��6 7
FullName
��7 ?
,
��? @
	modelType
�� %
.
��% &
FullName
��& .
)
��. /
)
��/ 0
;
��0 1
}
�� 
return
�� 
modelDescription
�� '
;
��' (
}
�� 
if
�� 
(
�� &
DefaultTypeDocumentation
�� (
.
��( )
ContainsKey
��) 4
(
��4 5
	modelType
��5 >
)
��> ?
)
��? @
{
�� 
return
�� 0
"GenerateSimpleTypeModelDescription
�� 9
(
��9 :
	modelType
��: C
)
��C D
;
��D E
}
�� 
if
�� 
(
�� 
	modelType
�� 
.
�� 
IsEnum
��  
)
��  !
{
�� 
return
�� .
 GenerateEnumTypeModelDescription
�� 7
(
��7 8
	modelType
��8 A
)
��A B
;
��B C
}
�� 
if
�� 
(
�� 
	modelType
�� 
.
�� 
IsGenericType
�� '
)
��' (
{
�� 
Type
�� 
[
�� 
]
�� 
genericArguments
�� '
=
��( )
	modelType
��* 3
.
��3 4!
GetGenericArguments
��4 G
(
��G H
)
��H I
;
��I J
if
�� 
(
�� 
genericArguments
�� $
.
��$ %
Length
��% +
==
��, .
$num
��/ 0
)
��0 1
{
�� 
Type
�� 
enumerableType
�� '
=
��( )
typeof
��* 0
(
��0 1
IEnumerable
��1 <
<
��< =
>
��= >
)
��> ?
.
��? @
MakeGenericType
��@ O
(
��O P
genericArguments
��P `
)
��` a
;
��a b
if
�� 
(
�� 
enumerableType
�� &
.
��& '
IsAssignableFrom
��' 7
(
��7 8
	modelType
��8 A
)
��A B
)
��B C
{
�� 
return
�� 0
"GenerateCollectionModelDescription
�� A
(
��A B
	modelType
��B K
,
��K L
genericArguments
��M ]
[
��] ^
$num
��^ _
]
��_ `
)
��` a
;
��a b
}
�� 
}
�� 
if
�� 
(
�� 
genericArguments
�� $
.
��$ %
Length
��% +
==
��, .
$num
��/ 0
)
��0 1
{
�� 
Type
�� 
dictionaryType
�� '
=
��( )
typeof
��* 0
(
��0 1
IDictionary
��1 <
<
��< =
,
��= >
>
��> ?
)
��? @
.
��@ A
MakeGenericType
��A P
(
��P Q
genericArguments
��Q a
)
��a b
;
��b c
if
�� 
(
�� 
dictionaryType
�� &
.
��& '
IsAssignableFrom
��' 7
(
��7 8
	modelType
��8 A
)
��A B
)
��B C
{
�� 
return
�� 0
"GenerateDictionaryModelDescription
�� A
(
��A B
	modelType
��B K
,
��K L
genericArguments
��M ]
[
��] ^
$num
��^ _
]
��_ `
,
��` a
genericArguments
��b r
[
��r s
$num
��s t
]
��t u
)
��u v
;
��v w
}
�� 
Type
�� 
keyValuePairType
�� )
=
��* +
typeof
��, 2
(
��2 3
KeyValuePair
��3 ?
<
��? @
,
��@ A
>
��A B
)
��B C
.
��C D
MakeGenericType
��D S
(
��S T
genericArguments
��T d
)
��d e
;
��e f
if
�� 
(
�� 
keyValuePairType
�� (
.
��( )
IsAssignableFrom
��) 9
(
��9 :
	modelType
��: C
)
��C D
)
��D E
{
�� 
return
�� 2
$GenerateKeyValuePairModelDescription
�� C
(
��C D
	modelType
��D M
,
��M N
genericArguments
��O _
[
��_ `
$num
��` a
]
��a b
,
��b c
genericArguments
��d t
[
��t u
$num
��u v
]
��v w
)
��w x
;
��x y
}
�� 
}
�� 
}
�� 
if
�� 
(
�� 
	modelType
�� 
.
�� 
IsArray
�� !
)
��! "
{
�� 
Type
�� 
elementType
��  
=
��! "
	modelType
��# ,
.
��, -
GetElementType
��- ;
(
��; <
)
��< =
;
��= >
return
�� 0
"GenerateCollectionModelDescription
�� 9
(
��9 :
	modelType
��: C
,
��C D
elementType
��E P
)
��P Q
;
��Q R
}
�� 
if
�� 
(
�� 
	modelType
�� 
==
�� 
typeof
�� #
(
��# $!
NameValueCollection
��$ 7
)
��7 8
)
��8 9
{
�� 
return
�� 0
"GenerateDictionaryModelDescription
�� 9
(
��9 :
	modelType
��: C
,
��C D
typeof
��E K
(
��K L
string
��L R
)
��R S
,
��S T
typeof
��U [
(
��[ \
string
��\ b
)
��b c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
typeof
�� 
(
�� 
IDictionary
�� "
)
��" #
.
��# $
IsAssignableFrom
��$ 4
(
��4 5
	modelType
��5 >
)
��> ?
)
��? @
{
�� 
return
�� 0
"GenerateDictionaryModelDescription
�� 9
(
��9 :
	modelType
��: C
,
��C D
typeof
��E K
(
��K L
object
��L R
)
��R S
,
��S T
typeof
��U [
(
��[ \
object
��\ b
)
��b c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
typeof
�� 
(
�� 
IEnumerable
�� "
)
��" #
.
��# $
IsAssignableFrom
��$ 4
(
��4 5
	modelType
��5 >
)
��> ?
)
��? @
{
�� 
return
�� 0
"GenerateCollectionModelDescription
�� 9
(
��9 :
	modelType
��: C
,
��C D
typeof
��E K
(
��K L
object
��L R
)
��R S
)
��S T
;
��T U
}
�� 
return
�� 1
#GenerateComplexTypeModelDescription
�� 6
(
��6 7
	modelType
��7 @
)
��@ A
;
��A B
}
�� 	
private
�� 
static
�� 
string
�� 
GetMemberName
�� +
(
��+ ,

MemberInfo
��, 6
member
��7 =
,
��= >
bool
��? C&
hasDataContractAttribute
��D \
)
��\ ]
{
�� 	#
JsonPropertyAttribute
�� !
jsonProperty
��" .
=
��/ 0
member
��1 7
.
��7 8 
GetCustomAttribute
��8 J
<
��J K#
JsonPropertyAttribute
��K `
>
��` a
(
��a b
)
��b c
;
��c d
if
�� 
(
�� 
jsonProperty
�� 
!=
�� 
null
��  $
&&
��% '
!
��( )
String
��) /
.
��/ 0
IsNullOrEmpty
��0 =
(
��= >
jsonProperty
��> J
.
��J K
PropertyName
��K W
)
��W X
)
��X Y
{
�� 
return
�� 
jsonProperty
�� #
.
��# $
PropertyName
��$ 0
;
��0 1
}
�� 
if
�� 
(
�� &
hasDataContractAttribute
�� (
)
��( )
{
�� !
DataMemberAttribute
�� #

dataMember
��$ .
=
��/ 0
member
��1 7
.
��7 8 
GetCustomAttribute
��8 J
<
��J K!
DataMemberAttribute
��K ^
>
��^ _
(
��_ `
)
��` a
;
��a b
if
�� 
(
�� 

dataMember
�� 
!=
�� !
null
��" &
&&
��' )
!
��* +
String
��+ 1
.
��1 2
IsNullOrEmpty
��2 ?
(
��? @

dataMember
��@ J
.
��J K
Name
��K O
)
��O P
)
��P Q
{
�� 
return
�� 

dataMember
�� %
.
��% &
Name
��& *
;
��* +
}
�� 
}
�� 
return
�� 
member
�� 
.
�� 
Name
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
bool
�� !
ShouldDisplayMember
�� /
(
��/ 0

MemberInfo
��0 :
member
��; A
,
��A B
bool
��C G&
hasDataContractAttribute
��H `
)
��` a
{
�� 	!
JsonIgnoreAttribute
�� 

jsonIgnore
��  *
=
��+ ,
member
��- 3
.
��3 4 
GetCustomAttribute
��4 F
<
��F G!
JsonIgnoreAttribute
��G Z
>
��Z [
(
��[ \
)
��\ ]
;
��] ^ 
XmlIgnoreAttribute
�� 
	xmlIgnore
�� (
=
��) *
member
��+ 1
.
��1 2 
GetCustomAttribute
��2 D
<
��D E 
XmlIgnoreAttribute
��E W
>
��W X
(
��X Y
)
��Y Z
;
��Z ['
IgnoreDataMemberAttribute
�� %
ignoreDataMember
��& 6
=
��7 8
member
��9 ?
.
��? @ 
GetCustomAttribute
��@ R
<
��R S'
IgnoreDataMemberAttribute
��S l
>
��l m
(
��m n
)
��n o
;
��o p$
NonSerializedAttribute
�� "
nonSerialized
��# 0
=
��1 2
member
��3 9
.
��9 : 
GetCustomAttribute
��: L
<
��L M$
NonSerializedAttribute
��M c
>
��c d
(
��d e
)
��e f
;
��f g*
ApiExplorerSettingsAttribute
�� ( 
apiExplorerSetting
��) ;
=
��< =
member
��> D
.
��D E 
GetCustomAttribute
��E W
<
��W X*
ApiExplorerSettingsAttribute
��X t
>
��t u
(
��u v
)
��v w
;
��w x
bool
��  
hasMemberAttribute
�� #
=
��$ %
member
��& ,
.
��, -
DeclaringType
��- :
.
��: ;
IsEnum
��; A
?
��B C
member
�� 
.
��  
GetCustomAttribute
�� )
<
��) *!
EnumMemberAttribute
��* =
>
��= >
(
��> ?
)
��? @
!=
��A C
null
��D H
:
��I J
member
�� 
.
��  
GetCustomAttribute
�� )
<
��) *!
DataMemberAttribute
��* =
>
��= >
(
��> ?
)
��? @
!=
��A C
null
��D H
;
��H I
return
�� 

jsonIgnore
�� 
==
��  
null
��! %
&&
��& (
	xmlIgnore
�� 
==
�� 
null
�� !
&&
��" $
ignoreDataMember
��  
==
��! #
null
��$ (
&&
��) +
nonSerialized
�� 
==
��  
null
��! %
&&
��& (
(
��  
apiExplorerSetting
�� #
==
��$ &
null
��' +
||
��, .
!
��/ 0 
apiExplorerSetting
��0 B
.
��B C
	IgnoreApi
��C L
)
��L M
&&
��N P
(
�� 
!
�� &
hasDataContractAttribute
�� *
||
��+ - 
hasMemberAttribute
��. @
)
��@ A
;
��A B
}
�� 	
private
�� 
string
�� (
CreateDefaultDocumentation
�� 1
(
��1 2
Type
��2 6
type
��7 ;
)
��; <
{
�� 	
string
�� 
documentation
��  
;
��  !
if
�� 
(
�� &
DefaultTypeDocumentation
�� (
.
��( )
TryGetValue
��) 4
(
��4 5
type
��5 9
,
��9 :
out
��; >
documentation
��? L
)
��L M
)
��M N
{
�� 
return
�� 
documentation
�� $
;
��$ %
}
�� 
if
�� 
(
�� #
DocumentationProvider
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
documentation
�� 
=
�� #
DocumentationProvider
��  5
.
��5 6
GetDocumentation
��6 F
(
��F G
type
��G K
)
��K L
;
��L M
}
�� 
return
�� 
documentation
��  
;
��  !
}
�� 	
private
�� 
void
�� !
GenerateAnnotations
�� (
(
��( )

MemberInfo
��) 3
property
��4 <
,
��< ="
ParameterDescription
��> R
propertyModel
��S `
)
��` a
{
�� 	
List
�� 
<
�� !
ParameterAnnotation
�� $
>
��$ %
annotations
��& 1
=
��2 3
new
��4 7
List
��8 <
<
��< =!
ParameterAnnotation
��= P
>
��P Q
(
��Q R
)
��R S
;
��S T
IEnumerable
�� 
<
�� 
	Attribute
�� !
>
��! "

attributes
��# -
=
��. /
property
��0 8
.
��8 9!
GetCustomAttributes
��9 L
(
��L M
)
��M N
;
��N O
foreach
�� 
(
�� 
	Attribute
�� 
	attribute
�� (
in
��) +

attributes
��, 6
)
��6 7
{
�� 
Func
�� 
<
�� 
object
�� 
,
�� 
string
�� #
>
��# $
textGenerator
��% 2
;
��2 3
if
�� 
(
�� %
AnnotationTextGenerator
�� +
.
��+ ,
TryGetValue
��, 7
(
��7 8
	attribute
��8 A
.
��A B
GetType
��B I
(
��I J
)
��J K
,
��K L
out
��M P
textGenerator
��Q ^
)
��^ _
)
��_ `
{
�� 
annotations
�� 
.
��  
Add
��  #
(
��# $
new
�� !
ParameterAnnotation
�� /
{
�� !
AnnotationAttribute
�� /
=
��0 1
	attribute
��2 ;
,
��; <
Documentation
�� )
=
��* +
textGenerator
��, 9
(
��9 :
	attribute
��: C
)
��C D
}
�� 
)
�� 
;
�� 
}
�� 
}
�� 
annotations
�� 
.
�� 
Sort
�� 
(
�� 
(
�� 
x
�� 
,
��  
y
��! "
)
��" #
=>
��$ &
{
�� 
if
�� 
(
�� 
x
�� 
.
�� !
AnnotationAttribute
�� )
is
��* ,
RequiredAttribute
��- >
)
��> ?
{
�� 
return
�� 
-
�� 
$num
�� 
;
�� 
}
�� 
if
�� 
(
�� 
y
�� 
.
�� !
AnnotationAttribute
�� )
is
��* ,
RequiredAttribute
��- >
)
��> ?
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
return
�� 
String
�� 
.
�� 
Compare
�� %
(
��% &
x
��& '
.
��' (
Documentation
��( 5
,
��5 6
y
��7 8
.
��8 9
Documentation
��9 F
,
��F G
StringComparison
��H X
.
��X Y
OrdinalIgnoreCase
��Y j
)
��j k
;
��k l
}
�� 
)
�� 
;
�� 
foreach
�� 
(
�� !
ParameterAnnotation
�� (

annotation
��) 3
in
��4 6
annotations
��7 B
)
��B C
{
�� 
propertyModel
�� 
.
�� 
Annotations
�� )
.
��) *
Add
��* -
(
��- .

annotation
��. 8
)
��8 9
;
��9 :
}
�� 
}
�� 	
private
�� (
CollectionModelDescription
�� *0
"GenerateCollectionModelDescription
��+ M
(
��M N
Type
��N R
	modelType
��S \
,
��\ ]
Type
��^ b
elementType
��c n
)
��n o
{
�� 	
ModelDescription
�� (
collectionModelDescription
�� 7
=
��8 9)
GetOrCreateModelDescription
��: U
(
��U V
elementType
��V a
)
��a b
;
��b c
if
�� 
(
�� (
collectionModelDescription
�� *
!=
��+ -
null
��. 2
)
��2 3
{
�� 
return
�� 
new
�� (
CollectionModelDescription
�� 5
{
�� 
Name
�� 
=
�� 
ModelNameHelper
�� *
.
��* +
GetModelName
��+ 7
(
��7 8
	modelType
��8 A
)
��A B
,
��B C
	ModelType
�� 
=
�� 
	modelType
��  )
,
��) * 
ElementDescription
�� &
=
��' ((
collectionModelDescription
��) C
}
�� 
;
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
private
�� 
ModelDescription
��  1
#GenerateComplexTypeModelDescription
��! D
(
��D E
Type
��E I
	modelType
��J S
)
��S T
{
�� 	)
ComplexTypeModelDescription
�� '%
complexModelDescription
��( ?
=
��@ A
new
��B E)
ComplexTypeModelDescription
��F a
{
�� 
Name
�� 
=
�� 
ModelNameHelper
�� &
.
��& '
GetModelName
��' 3
(
��3 4
	modelType
��4 =
)
��= >
,
��> ?
	ModelType
�� 
=
�� 
	modelType
�� %
,
��% &
Documentation
�� 
=
�� (
CreateDefaultDocumentation
��  :
(
��: ;
	modelType
��; D
)
��D E
}
�� 
;
�� 
GeneratedModels
�� 
.
�� 
Add
�� 
(
��  %
complexModelDescription
��  7
.
��7 8
Name
��8 <
,
��< =%
complexModelDescription
��> U
)
��U V
;
��V W
bool
�� &
hasDataContractAttribute
�� )
=
��* +
	modelType
��, 5
.
��5 6 
GetCustomAttribute
��6 H
<
��H I#
DataContractAttribute
��I ^
>
��^ _
(
��_ `
)
��` a
!=
��b d
null
��e i
;
��i j
PropertyInfo
�� 
[
�� 
]
�� 

properties
�� %
=
��& '
	modelType
��( 1
.
��1 2
GetProperties
��2 ?
(
��? @
BindingFlags
��@ L
.
��L M
Public
��M S
|
��T U
BindingFlags
��V b
.
��b c
Instance
��c k
)
��k l
;
��l m
foreach
�� 
(
�� 
PropertyInfo
�� !
property
��" *
in
��+ -

properties
��. 8
)
��8 9
{
�� 
if
�� 
(
�� !
ShouldDisplayMember
�� '
(
��' (
property
��( 0
,
��0 1&
hasDataContractAttribute
��2 J
)
��J K
)
��K L
{
�� "
ParameterDescription
�� (
propertyModel
��) 6
=
��7 8
new
��9 <"
ParameterDescription
��= Q
{
�� 
Name
�� 
=
�� 
GetMemberName
�� ,
(
��, -
property
��- 5
,
��5 6&
hasDataContractAttribute
��7 O
)
��O P
}
�� 
;
�� 
if
�� 
(
�� #
DocumentationProvider
�� -
!=
��. 0
null
��1 5
)
��5 6
{
�� 
propertyModel
�� %
.
��% &
Documentation
��& 3
=
��4 5#
DocumentationProvider
��6 K
.
��K L
GetDocumentation
��L \
(
��\ ]
property
��] e
)
��e f
;
��f g
}
�� !
GenerateAnnotations
�� '
(
��' (
property
��( 0
,
��0 1
propertyModel
��2 ?
)
��? @
;
��@ A%
complexModelDescription
�� +
.
��+ ,

Properties
��, 6
.
��6 7
Add
��7 :
(
��: ;
propertyModel
��; H
)
��H I
;
��I J
propertyModel
�� !
.
��! "
TypeDescription
��" 1
=
��2 3)
GetOrCreateModelDescription
��4 O
(
��O P
property
��P X
.
��X Y
PropertyType
��Y e
)
��e f
;
��f g
}
�� 
}
�� 
	FieldInfo
�� 
[
�� 
]
�� 
fields
�� 
=
��  
	modelType
��! *
.
��* +
	GetFields
��+ 4
(
��4 5
BindingFlags
��5 A
.
��A B
Public
��B H
|
��I J
BindingFlags
��K W
.
��W X
Instance
��X `
)
��` a
;
��a b
foreach
�� 
(
�� 
	FieldInfo
�� 
field
�� $
in
��% '
fields
��( .
)
��. /
{
�� 
if
�� 
(
�� !
ShouldDisplayMember
�� '
(
��' (
field
��( -
,
��- .&
hasDataContractAttribute
��/ G
)
��G H
)
��H I
{
�� "
ParameterDescription
�� (
propertyModel
��) 6
=
��7 8
new
��9 <"
ParameterDescription
��= Q
{
�� 
Name
�� 
=
�� 
GetMemberName
�� ,
(
��, -
field
��- 2
,
��2 3&
hasDataContractAttribute
��4 L
)
��L M
}
�� 
;
�� 
if
�� 
(
�� #
DocumentationProvider
�� -
!=
��. 0
null
��1 5
)
��5 6
{
�� 
propertyModel
�� %
.
��% &
Documentation
��& 3
=
��4 5#
DocumentationProvider
��6 K
.
��K L
GetDocumentation
��L \
(
��\ ]
field
��] b
)
��b c
;
��c d
}
�� %
complexModelDescription
�� +
.
��+ ,

Properties
��, 6
.
��6 7
Add
��7 :
(
��: ;
propertyModel
��; H
)
��H I
;
��I J
propertyModel
�� !
.
��! "
TypeDescription
��" 1
=
��2 3)
GetOrCreateModelDescription
��4 O
(
��O P
field
��P U
.
��U V
	FieldType
��V _
)
��_ `
;
��` a
}
�� 
}
�� 
return
�� %
complexModelDescription
�� *
;
��* +
}
�� 	
private
�� (
DictionaryModelDescription
�� *0
"GenerateDictionaryModelDescription
��+ M
(
��M N
Type
��N R
	modelType
��S \
,
��\ ]
Type
��^ b
keyType
��c j
,
��j k
Type
��l p
	valueType
��q z
)
��z {
{
�� 	
ModelDescription
�� !
keyModelDescription
�� 0
=
��1 2)
GetOrCreateModelDescription
��3 N
(
��N O
keyType
��O V
)
��V W
;
��W X
ModelDescription
�� #
valueModelDescription
�� 2
=
��3 4)
GetOrCreateModelDescription
��5 P
(
��P Q
	valueType
��Q Z
)
��Z [
;
��[ \
return
�� 
new
�� (
DictionaryModelDescription
�� 1
{
�� 
Name
�� 
=
�� 
ModelNameHelper
�� &
.
��& '
GetModelName
��' 3
(
��3 4
	modelType
��4 =
)
��= >
,
��> ?
	ModelType
�� 
=
�� 
	modelType
�� %
,
��% &!
KeyModelDescription
�� #
=
��$ %!
keyModelDescription
��& 9
,
��9 :#
ValueModelDescription
�� %
=
��& '#
valueModelDescription
��( =
}
�� 
;
�� 
}
�� 	
private
�� &
EnumTypeModelDescription
�� (.
 GenerateEnumTypeModelDescription
��) I
(
��I J
Type
��J N
	modelType
��O X
)
��X Y
{
�� 	&
EnumTypeModelDescription
�� $
enumDescription
��% 4
=
��5 6
new
��7 :&
EnumTypeModelDescription
��; S
{
�� 
Name
�� 
=
�� 
ModelNameHelper
�� &
.
��& '
GetModelName
��' 3
(
��3 4
	modelType
��4 =
)
��= >
,
��> ?
	ModelType
�� 
=
�� 
	modelType
�� %
,
��% &
Documentation
�� 
=
�� (
CreateDefaultDocumentation
��  :
(
��: ;
	modelType
��; D
)
��D E
}
�� 
;
�� 
bool
�� &
hasDataContractAttribute
�� )
=
��* +
	modelType
��, 5
.
��5 6 
GetCustomAttribute
��6 H
<
��H I#
DataContractAttribute
��I ^
>
��^ _
(
��_ `
)
��` a
!=
��b d
null
��e i
;
��i j
foreach
�� 
(
�� 
	FieldInfo
�� 
field
�� $
in
��% '
	modelType
��( 1
.
��1 2
	GetFields
��2 ;
(
��; <
BindingFlags
��< H
.
��H I
Public
��I O
|
��P Q
BindingFlags
��R ^
.
��^ _
Static
��_ e
)
��e f
)
��f g
{
�� 
if
�� 
(
�� !
ShouldDisplayMember
�� '
(
��' (
field
��( -
,
��- .&
hasDataContractAttribute
��/ G
)
��G H
)
��H I
{
�� "
EnumValueDescription
�� (
	enumValue
��) 2
=
��3 4
new
��5 8"
EnumValueDescription
��9 M
{
�� 
Name
�� 
=
�� 
field
�� $
.
��$ %
Name
��% )
,
��) *
Value
�� 
=
�� 
field
��  %
.
��% &!
GetRawConstantValue
��& 9
(
��9 :
)
��: ;
.
��; <
ToString
��< D
(
��D E
)
��E F
}
�� 
;
�� 
if
�� 
(
�� #
DocumentationProvider
�� -
!=
��. 0
null
��1 5
)
��5 6
{
�� 
	enumValue
�� !
.
��! "
Documentation
��" /
=
��0 1#
DocumentationProvider
��2 G
.
��G H
GetDocumentation
��H X
(
��X Y
field
��Y ^
)
��^ _
;
��_ `
}
�� 
enumDescription
�� #
.
��# $
Values
��$ *
.
��* +
Add
��+ .
(
��. /
	enumValue
��/ 8
)
��8 9
;
��9 :
}
�� 
}
�� 
GeneratedModels
�� 
.
�� 
Add
�� 
(
��  
enumDescription
��  /
.
��/ 0
Name
��0 4
,
��4 5
enumDescription
��6 E
)
��E F
;
��F G
return
�� 
enumDescription
�� "
;
��" #
}
�� 	
private
�� *
KeyValuePairModelDescription
�� ,2
$GenerateKeyValuePairModelDescription
��- Q
(
��Q R
Type
��R V
	modelType
��W `
,
��` a
Type
��b f
keyType
��g n
,
��n o
Type
��p t
	valueType
��u ~
)
��~ 
{
�� 	
ModelDescription
�� !
keyModelDescription
�� 0
=
��1 2)
GetOrCreateModelDescription
��3 N
(
��N O
keyType
��O V
)
��V W
;
��W X
ModelDescription
�� #
valueModelDescription
�� 2
=
��3 4)
GetOrCreateModelDescription
��5 P
(
��P Q
	valueType
��Q Z
)
��Z [
;
��[ \
return
�� 
new
�� *
KeyValuePairModelDescription
�� 3
{
�� 
Name
�� 
=
�� 
ModelNameHelper
�� &
.
��& '
GetModelName
��' 3
(
��3 4
	modelType
��4 =
)
��= >
,
��> ?
	ModelType
�� 
=
�� 
	modelType
�� %
,
��% &!
KeyModelDescription
�� #
=
��$ %!
keyModelDescription
��& 9
,
��9 :#
ValueModelDescription
�� %
=
��& '#
valueModelDescription
��( =
}
�� 
;
�� 
}
�� 	
private
�� 
ModelDescription
��  0
"GenerateSimpleTypeModelDescription
��! C
(
��C D
Type
��D H
	modelType
��I R
)
��R S
{
�� 	(
SimpleTypeModelDescription
�� &$
simpleModelDescription
��' =
=
��> ?
new
��@ C(
SimpleTypeModelDescription
��D ^
{
�� 
Name
�� 
=
�� 
ModelNameHelper
�� &
.
��& '
GetModelName
��' 3
(
��3 4
	modelType
��4 =
)
��= >
,
��> ?
	ModelType
�� 
=
�� 
	modelType
�� %
,
��% &
Documentation
�� 
=
�� (
CreateDefaultDocumentation
��  :
(
��: ;
	modelType
��; D
)
��D E
}
�� 
;
�� 
GeneratedModels
�� 
.
�� 
Add
�� 
(
��  $
simpleModelDescription
��  6
.
��6 7
Name
��7 ;
,
��; <$
simpleModelDescription
��= S
)
��S T
;
��T U
return
�� $
simpleModelDescription
�� )
;
��) *
}
�� 	
}
�� 
}�� �

�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ModelNameAttribute.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Struct> D
|E F
AttributeTargetsG W
.W X
EnumX \
,\ ]
AllowMultiple^ k
=l m
falsen s
,s t
	Inheritedu ~
=	 �
false
� �
)
� �
]
� �
public		 

sealed		 
class		 
ModelNameAttribute		 *
:		+ ,
	Attribute		- 6
{

 
public 
ModelNameAttribute !
(! "
string" (
name) -
)- .
{ 	
Name 
= 
name 
; 
} 	
public 
string 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ModelNameHelper.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
internal 
static 
class 
ModelNameHelper )
{		 
public 
static 
string 
GetModelName )
() *
Type* .
type/ 3
)3 4
{ 	
ModelNameAttribute 
modelNameAttribute 1
=2 3
type4 8
.8 9
GetCustomAttribute9 K
<K L
ModelNameAttributeL ^
>^ _
(_ `
)` a
;a b
if 
( 
modelNameAttribute "
!=# %
null& *
&&+ -
!. /
String/ 5
.5 6
IsNullOrEmpty6 C
(C D
modelNameAttributeD V
.V W
NameW [
)[ \
)\ ]
{ 
return 
modelNameAttribute )
.) *
Name* .
;. /
} 
string 
	modelName 
= 
type #
.# $
Name$ (
;( )
if 
( 
type 
. 
IsGenericType "
)" #
{ 
Type 
genericType  
=! "
type# '
.' ($
GetGenericTypeDefinition( @
(@ A
)A B
;B C
Type 
[ 
] 
genericArguments '
=( )
type* .
.. /
GetGenericArguments/ B
(B C
)C D
;D E
string 
genericTypeName &
=' (
genericType) 4
.4 5
Name5 9
;9 :
genericTypeName 
=  !
genericTypeName" 1
.1 2
	Substring2 ;
(; <
$num< =
,= >
genericTypeName? N
.N O
IndexOfO V
(V W
$charW Z
)Z [
)[ \
;\ ]
string 
[ 
] 
argumentTypeNames *
=+ ,
genericArguments- =
.= >
Select> D
(D E
tE F
=>G I
GetModelNameJ V
(V W
tW X
)X Y
)Y Z
.Z [
ToArray[ b
(b c
)c d
;d e
	modelName 
= 
String "
." #
Format# )
() *
CultureInfo* 5
.5 6
InvariantCulture6 F
,F G
$strH R
,R S
genericTypeNameT c
,c d
Stringe k
.k l
Joinl p
(p q
$strq v
,v w
argumentTypeNames	x �
)
� �
)
� �
;
� �
} 
return!! 
	modelName!! 
;!! 
}"" 	
}## 
}$$ �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ParameterAnnotation.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class 
ParameterAnnotation $
{ 
public 
	Attribute 
AnnotationAttribute ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public		 
string		 
Documentation		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
}

 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\ParameterDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class  
ParameterDescription %
{ 
public  
ParameterDescription #
(# $
)$ %
{		 	
Annotations

 
=

 
new

 

Collection

 (
<

( )
ParameterAnnotation

) <
>

< =
(

= >
)

> ?
;

? @
} 	
public 

Collection 
< 
ParameterAnnotation -
>- .
Annotations/ :
{; <
get= @
;@ A
privateB I
setJ M
;M N
}O P
public 
string 
Documentation #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
ModelDescription 
TypeDescription  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\ModelDescriptions\SimpleTypeModelDescription.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
ModelDescriptions+ <
{ 
public 

class &
SimpleTypeModelDescription +
:, -
ModelDescription. >
{ 
} 
} �*
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\Models\HelpPageApiModel.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
.* +
Models+ 1
{ 
public 

class 
HelpPageApiModel !
{ 
public 
HelpPageApiModel 
(  
)  !
{ 	
UriParameters 
= 
new 

Collection  *
<* + 
ParameterDescription+ ?
>? @
(@ A
)A B
;B C
SampleRequests 
= 
new  

Dictionary! +
<+ , 
MediaTypeHeaderValue, @
,@ A
objectB H
>H I
(I J
)J K
;K L
SampleResponses 
= 
new !

Dictionary" ,
<, - 
MediaTypeHeaderValue- A
,A B
objectC I
>I J
(J K
)K L
;L M
ErrorMessages 
= 
new 

Collection  *
<* +
string+ 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
ApiDescription 
ApiDescription ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public!! 

Collection!! 
<!!  
ParameterDescription!! .
>!!. /
UriParameters!!0 =
{!!> ?
get!!@ C
;!!C D
private!!E L
set!!M P
;!!P Q
}!!R S
public&& 
string&&  
RequestDocumentation&& *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
public++ 
ModelDescription++ #
RequestModelDescription++  7
{++8 9
get++: =
;++= >
set++? B
;++B C
}++D E
public00 
IList00 
<00  
ParameterDescription00 )
>00) *!
RequestBodyParameters00+ @
{11 	
get22 
{33 
return44 $
GetParameterDescriptions44 /
(44/ 0#
RequestModelDescription440 G
)44G H
;44H I
}55 
}66 	
public;; 
ModelDescription;; 
ResourceDescription;;  3
{;;4 5
get;;6 9
;;;9 :
set;;; >
;;;> ?
};;@ A
public@@ 
IList@@ 
<@@  
ParameterDescription@@ )
>@@) *
ResourceProperties@@+ =
{AA 	
getBB 
{CC 
returnDD $
GetParameterDescriptionsDD /
(DD/ 0
ResourceDescriptionDD0 C
)DDC D
;DDD E
}EE 
}FF 	
publicKK 
IDictionaryKK 
<KK  
MediaTypeHeaderValueKK /
,KK/ 0
objectKK1 7
>KK7 8
SampleRequestsKK9 G
{KKH I
getKKJ M
;KKM N
privateKKO V
setKKW Z
;KKZ [
}KK\ ]
publicPP 
IDictionaryPP 
<PP  
MediaTypeHeaderValuePP /
,PP/ 0
objectPP1 7
>PP7 8
SampleResponsesPP9 H
{PPI J
getPPK N
;PPN O
privatePPP W
setPPX [
;PP[ \
}PP] ^
publicUU 

CollectionUU 
<UU 
stringUU  
>UU  !
ErrorMessagesUU" /
{UU0 1
getUU2 5
;UU5 6
privateUU7 >
setUU? B
;UUB C
}UUD E
privateWW 
staticWW 
IListWW 
<WW  
ParameterDescriptionWW 1
>WW1 2$
GetParameterDescriptionsWW3 K
(WWK L
ModelDescriptionWWL \
modelDescriptionWW] m
)WWm n
{XX 	'
ComplexTypeModelDescriptionYY ''
complexTypeModelDescriptionYY( C
=YYD E
modelDescriptionYYF V
asYYW Y'
ComplexTypeModelDescriptionYYZ u
;YYu v
ifZZ 
(ZZ '
complexTypeModelDescriptionZZ +
!=ZZ, .
nullZZ/ 3
)ZZ3 4
{[[ 
return\\ '
complexTypeModelDescription\\ 2
.\\2 3

Properties\\3 =
;\\= >
}]] &
CollectionModelDescription__ &&
collectionModelDescription__' A
=__B C
modelDescription__D T
as__U W&
CollectionModelDescription__X r
;__r s
if`` 
(`` &
collectionModelDescription`` *
!=``+ -
null``. 2
)``2 3
{aa '
complexTypeModelDescriptionbb +
=bb, -&
collectionModelDescriptionbb. H
.bbH I
ElementDescriptionbbI [
asbb\ ^'
ComplexTypeModelDescriptionbb_ z
;bbz {
ifcc 
(cc '
complexTypeModelDescriptioncc /
!=cc0 2
nullcc3 7
)cc7 8
{dd 
returnee '
complexTypeModelDescriptionee 6
.ee6 7

Propertiesee7 A
;eeA B
}ff 
}gg 
returnii 
nullii 
;ii 
}jj 	
}kk 
}ll ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\HelpPageSampleGenerator.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class #
HelpPageSampleGenerator (
{ 
public #
HelpPageSampleGenerator &
(& '
)' (
{ 	"
ActualHttpMessageTypes "
=# $
new% (

Dictionary) 3
<3 4
HelpPageSampleKey4 E
,E F
TypeG K
>K L
(L M
)M N
;N O
ActionSamples 
= 
new 

Dictionary  *
<* +
HelpPageSampleKey+ <
,< =
object> D
>D E
(E F
)F G
;G H
SampleObjects 
= 
new 

Dictionary  *
<* +
Type+ /
,/ 0
object1 7
>7 8
(8 9
)9 :
;: ;!
SampleObjectFactories !
=" #
new$ '
List( ,
<, -
Func- 1
<1 2#
HelpPageSampleGenerator2 I
,I J
TypeK O
,O P
objectQ W
>W X
>X Y
{   &
DefaultSampleObjectFactory!! *
,!!* +
}"" 
;"" 
}## 	
public(( 
IDictionary(( 
<(( 
HelpPageSampleKey(( ,
,((, -
Type((. 2
>((2 3"
ActualHttpMessageTypes((4 J
{((K L
get((M P
;((P Q
internal((R Z
set(([ ^
;((^ _
}((` a
public-- 
IDictionary-- 
<-- 
HelpPageSampleKey-- ,
,--, -
object--. 4
>--4 5
ActionSamples--6 C
{--D E
get--F I
;--I J
internal--K S
set--T W
;--W X
}--Y Z
public22 
IDictionary22 
<22 
Type22 
,22  
object22! '
>22' (
SampleObjects22) 6
{227 8
get229 <
;22< =
internal22> F
set22G J
;22J K
}22L M
[<< 	
SuppressMessage<<	 
(<< 
$str<< +
,<<+ ,
$str<<- ]
,<<] ^
Justification== 
=== 
$str== M
)==M N
]==N O
public>> 
IList>> 
<>> 
Func>> 
<>> #
HelpPageSampleGenerator>> 1
,>>1 2
Type>>3 7
,>>7 8
object>>9 ?
>>>? @
>>>@ A!
SampleObjectFactories>>B W
{>>X Y
get>>Z ]
;>>] ^
private>>_ f
set>>g j
;>>j k
}>>l m
publicEE 
IDictionaryEE 
<EE  
MediaTypeHeaderValueEE /
,EE/ 0
objectEE1 7
>EE7 8
GetSampleRequestsEE9 J
(EEJ K
ApiDescriptionEEK Y
apiEEZ ]
)EE] ^
{FF 	
returnGG 
	GetSampleGG 
(GG 
apiGG  
,GG  !
SampleDirectionGG" 1
.GG1 2
RequestGG2 9
)GG9 :
;GG: ;
}HH 	
publicOO 
IDictionaryOO 
<OO  
MediaTypeHeaderValueOO /
,OO/ 0
objectOO1 7
>OO7 8
GetSampleResponsesOO9 K
(OOK L
ApiDescriptionOOL Z
apiOO[ ^
)OO^ _
{PP 	
returnQQ 
	GetSampleQQ 
(QQ 
apiQQ  
,QQ  !
SampleDirectionQQ" 1
.QQ1 2
ResponseQQ2 :
)QQ: ;
;QQ; <
}RR 	
publicZZ 
virtualZZ 
IDictionaryZZ "
<ZZ" # 
MediaTypeHeaderValueZZ# 7
,ZZ7 8
objectZZ9 ?
>ZZ? @
	GetSampleZZA J
(ZZJ K
ApiDescriptionZZK Y
apiZZZ ]
,ZZ] ^
SampleDirectionZZ_ n
sampleDirectionZZo ~
)ZZ~ 
{[[ 	
if\\ 
(\\ 
api\\ 
==\\ 
null\\ 
)\\ 
{]] 
throw^^ 
new^^ !
ArgumentNullException^^ /
(^^/ 0
$str^^0 5
)^^5 6
;^^6 7
}__ 
string`` 
controllerName`` !
=``" #
api``$ '
.``' (
ActionDescriptor``( 8
.``8 9 
ControllerDescriptor``9 M
.``M N
ControllerName``N \
;``\ ]
stringaa 

actionNameaa 
=aa 
apiaa  #
.aa# $
ActionDescriptoraa$ 4
.aa4 5

ActionNameaa5 ?
;aa? @
IEnumerablebb 
<bb 
stringbb 
>bb 
parameterNamesbb  .
=bb/ 0
apibb1 4
.bb4 5!
ParameterDescriptionsbb5 J
.bbJ K
SelectbbK Q
(bbQ R
pbbR S
=>bbT V
pbbW X
.bbX Y
NamebbY ]
)bb] ^
;bb^ _

Collectioncc 
<cc 
MediaTypeFormattercc )
>cc) *

formatterscc+ 5
;cc5 6
Typedd 
typedd 
=dd 
ResolveTypedd #
(dd# $
apidd$ '
,dd' (
controllerNamedd) 7
,dd7 8

actionNamedd9 C
,ddC D
parameterNamesddE S
,ddS T
sampleDirectionddU d
,ddd e
outddf i

formattersddj t
)ddt u
;ddu v
varee 
samplesee 
=ee 
newee 

Dictionaryee (
<ee( ) 
MediaTypeHeaderValueee) =
,ee= >
objectee? E
>eeE F
(eeF G
)eeG H
;eeH I
varhh 
actionSampleshh 
=hh 
GetAllActionSampleshh  3
(hh3 4
controllerNamehh4 B
,hhB C

actionNamehhD N
,hhN O
parameterNameshhP ^
,hh^ _
sampleDirectionhh` o
)hho p
;hhp q
foreachii 
(ii 
varii 
actionSampleii %
inii& (
actionSamplesii) 6
)ii6 7
{jj 
sampleskk 
.kk 
Addkk 
(kk 
actionSamplekk (
.kk( )
Keykk) ,
.kk, -
	MediaTypekk- 6
,kk6 7
WrapSampleIfStringkk8 J
(kkJ K
actionSamplekkK W
.kkW X
ValuekkX ]
)kk] ^
)kk^ _
;kk_ `
}ll 
ifpp 
(pp 
typepp 
!=pp 
nullpp 
&&pp 
!pp  !
typeofpp! '
(pp' (
HttpResponseMessagepp( ;
)pp; <
.pp< =
IsAssignableFrompp= M
(ppM N
typeppN R
)ppR S
)ppS T
{qq 
objectrr 
sampleObjectrr #
=rr$ %
GetSampleObjectrr& 5
(rr5 6
typerr6 :
)rr: ;
;rr; <
foreachss 
(ss 
varss 
	formatterss &
inss' )

formattersss* 4
)ss4 5
{tt 
foreachuu 
(uu  
MediaTypeHeaderValueuu 1
	mediaTypeuu2 ;
inuu< >
	formatteruu? H
.uuH I
SupportedMediaTypesuuI \
)uu\ ]
{vv 
ifww 
(ww 
!ww 
samplesww $
.ww$ %
ContainsKeyww% 0
(ww0 1
	mediaTypeww1 :
)ww: ;
)ww; <
{xx 
objectyy "
sampleyy# )
=yy* +
GetActionSampleyy, ;
(yy; <
controllerNameyy< J
,yyJ K

actionNameyyL V
,yyV W
parameterNamesyyX f
,yyf g
typeyyh l
,yyl m
	formatteryyn w
,yyw x
	mediaType	yyy �
,
yy� �
sampleDirection
yy� �
)
yy� �
;
yy� �
if|| 
(||  
sample||  &
==||' )
null||* .
&&||/ 1
sampleObject||2 >
!=||? A
null||B F
)||F G
{}} 
sample~~  &
=~~' (+
WriteSampleObjectUsingFormatter~~) H
(~~H I
	formatter~~I R
,~~R S
sampleObject~~T `
,~~` a
type~~b f
,~~f g
	mediaType~~h q
)~~q r
;~~r s
} 
samples
�� #
.
��# $
Add
��$ '
(
��' (
	mediaType
��( 1
,
��1 2 
WrapSampleIfString
��3 E
(
��E F
sample
��F L
)
��L M
)
��M N
;
��N O
}
�� 
}
�� 
}
�� 
}
�� 
return
�� 
samples
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
object
�� 
GetActionSample
�� -
(
��- .
string
��. 4
controllerName
��5 C
,
��C D
string
��E K

actionName
��L V
,
��V W
IEnumerable
��X c
<
��c d
string
��d j
>
��j k
parameterNames
��l z
,
��z {
Type��| �
type��� �
,��� �"
MediaTypeFormatter��� �
	formatter��� �
,��� �$
MediaTypeHeaderValue��� �
	mediaType��� �
,��� �
SampleDirection��� �
sampleDirection��� �
)��� �
{
�� 	
object
�� 
sample
�� 
;
�� 
if
�� 
(
�� 
ActionSamples
�� 
.
�� 
TryGetValue
�� )
(
��) *
new
��* -
HelpPageSampleKey
��. ?
(
��? @
	mediaType
��@ I
,
��I J
sampleDirection
��K Z
,
��Z [
controllerName
��\ j
,
��j k

actionName
��l v
,
��v w
parameterNames��x �
)��� �
,��� �
out��� �
sample��� �
)��� �
||��� �
ActionSamples
�� 
.
�� 
TryGetValue
�� )
(
��) *
new
��* -
HelpPageSampleKey
��. ?
(
��? @
	mediaType
��@ I
,
��I J
sampleDirection
��K Z
,
��Z [
controllerName
��\ j
,
��j k

actionName
��l v
,
��v w
new
��x {
[
��{ |
]
��| }
{
��~ 
$str��� �
}��� �
)��� �
,��� �
out��� �
sample��� �
)��� �
||��� �
ActionSamples
�� 
.
�� 
TryGetValue
�� )
(
��) *
new
��* -
HelpPageSampleKey
��. ?
(
��? @
	mediaType
��@ I
,
��I J
type
��K O
)
��O P
,
��P Q
out
��R U
sample
��V \
)
��\ ]
||
��^ `
ActionSamples
�� 
.
�� 
TryGetValue
�� )
(
��) *
new
��* -
HelpPageSampleKey
��. ?
(
��? @
	mediaType
��@ I
)
��I J
,
��J K
out
��L O
sample
��P V
)
��V W
)
��W X
{
�� 
return
�� 
sample
�� 
;
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
[
�� 	
SuppressMessage
��	 
(
�� 
$str
�� +
,
��+ ,
$str
��- U
,
��U V
Justification
�� 
=
�� 
$str
�� z
)
��z {
]
��{ |
public
�� 
virtual
�� 
object
�� 
GetSampleObject
�� -
(
��- .
Type
��. 2
type
��3 7
)
��7 8
{
�� 	
object
�� 
sampleObject
�� 
;
��  
if
�� 
(
�� 
!
�� 
SampleObjects
�� 
.
�� 
TryGetValue
�� *
(
��* +
type
��+ /
,
��/ 0
out
��1 4
sampleObject
��5 A
)
��A B
)
��B C
{
�� 
foreach
�� 
(
�� 
Func
�� 
<
�� %
HelpPageSampleGenerator
�� 5
,
��5 6
Type
��7 ;
,
��; <
object
��= C
>
��C D
factory
��E L
in
��M O#
SampleObjectFactories
��P e
)
��e f
{
�� 
if
�� 
(
�� 
factory
�� 
==
��  "
null
��# '
)
��' (
{
�� 
continue
��  
;
��  !
}
�� 
try
�� 
{
�� 
sampleObject
�� $
=
��% &
factory
��' .
(
��. /
this
��/ 3
,
��3 4
type
��5 9
)
��9 :
;
��: ;
if
�� 
(
�� 
sampleObject
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
break
�� !
;
��! "
}
�� 
}
�� 
catch
�� 
{
�� 
}
�� 
}
�� 
}
�� 
return
�� 
sampleObject
�� 
;
��  
}
�� 	
public
�� 
virtual
�� 
Type
�� +
ResolveHttpRequestMessageType
�� 9
(
��9 :
ApiDescription
��: H
api
��I L
)
��L M
{
�� 	
string
�� 
controllerName
�� !
=
��" #
api
��$ '
.
��' (
ActionDescriptor
��( 8
.
��8 9"
ControllerDescriptor
��9 M
.
��M N
ControllerName
��N \
;
��\ ]
string
�� 

actionName
�� 
=
�� 
api
��  #
.
��# $
ActionDescriptor
��$ 4
.
��4 5

ActionName
��5 ?
;
��? @
IEnumerable
�� 
<
�� 
string
�� 
>
�� 
parameterNames
��  .
=
��/ 0
api
��1 4
.
��4 5#
ParameterDescriptions
��5 J
.
��J K
Select
��K Q
(
��Q R
p
��R S
=>
��T V
p
��W X
.
��X Y
Name
��Y ]
)
��] ^
;
��^ _

Collection
�� 
<
��  
MediaTypeFormatter
�� )
>
��) *

formatters
��+ 5
;
��5 6
return
�� 
ResolveType
�� 
(
�� 
api
�� "
,
��" #
controllerName
��$ 2
,
��2 3

actionName
��4 >
,
��> ?
parameterNames
��@ N
,
��N O
SampleDirection
��P _
.
��_ `
Request
��` g
,
��g h
out
��i l

formatters
��m w
)
��w x
;
��x y
}
�� 	
[
�� 	
SuppressMessage
��	 
(
�� 
$str
�� +
,
��+ ,
$str
��- H
,
��H I
Justification
��J W
=
��X Y
$str��Z �
)��� �
]��� �
public
�� 
virtual
�� 
Type
�� 
ResolveType
�� '
(
��' (
ApiDescription
��( 6
api
��7 :
,
��: ;
string
��< B
controllerName
��C Q
,
��Q R
string
��S Y

actionName
��Z d
,
��d e
IEnumerable
��f q
<
��q r
string
��r x
>
��x y
parameterNames��z �
,��� �
SampleDirection��� �
sampleDirection��� �
,��� �
out��� �

Collection��� �
<��� �"
MediaTypeFormatter��� �
>��� �

formatters��� �
)��� �
{
�� 	
if
�� 
(
�� 
!
�� 
Enum
�� 
.
�� 
	IsDefined
�� 
(
��  
typeof
��  &
(
��& '
SampleDirection
��' 6
)
��6 7
,
��7 8
sampleDirection
��9 H
)
��H I
)
��I J
{
�� 
throw
�� 
new
�� *
InvalidEnumArgumentException
�� 6
(
��6 7
$str
��7 H
,
��H I
(
��J K
int
��K N
)
��N O
sampleDirection
��O ^
,
��^ _
typeof
��` f
(
��f g
SampleDirection
��g v
)
��v w
)
��w x
;
��x y
}
�� 
if
�� 
(
�� 
api
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 5
)
��5 6
;
��6 7
}
�� 
Type
�� 
type
�� 
;
�� 
if
�� 
(
�� $
ActualHttpMessageTypes
�� &
.
��& '
TryGetValue
��' 2
(
��2 3
new
��3 6
HelpPageSampleKey
��7 H
(
��H I
sampleDirection
��I X
,
��X Y
controllerName
��Z h
,
��h i

actionName
��j t
,
��t u
parameterNames��v �
)��� �
,��� �
out��� �
type��� �
)��� �
||��� �$
ActualHttpMessageTypes
�� &
.
��& '
TryGetValue
��' 2
(
��2 3
new
��3 6
HelpPageSampleKey
��7 H
(
��H I
sampleDirection
��I X
,
��X Y
controllerName
��Z h
,
��h i

actionName
��j t
,
��t u
new
��v y
[
��y z
]
��z {
{
��| }
$str��~ �
}��� �
)��� �
,��� �
out��� �
type��� �
)��� �
)��� �
{
�� 

Collection
�� 
<
��  
MediaTypeFormatter
�� -
>
��- .
newFormatters
��/ <
=
��= >
new
��? B

Collection
��C M
<
��M N 
MediaTypeFormatter
��N `
>
��` a
(
��a b
)
��b c
;
��c d
foreach
�� 
(
�� 
var
�� 
	formatter
�� &
in
��' )
api
��* -
.
��- .
ActionDescriptor
��. >
.
��> ?
Configuration
��? L
.
��L M

Formatters
��M W
)
��W X
{
�� 
if
�� 
(
�� 
IsFormatSupported
�� )
(
��) *
sampleDirection
��* 9
,
��9 :
	formatter
��; D
,
��D E
type
��F J
)
��J K
)
��K L
{
�� 
newFormatters
�� %
.
��% &
Add
��& )
(
��) *
	formatter
��* 3
)
��3 4
;
��4 5
}
�� 
}
�� 

formatters
�� 
=
�� 
newFormatters
�� *
;
��* +
}
�� 
else
�� 
{
�� 
switch
�� 
(
�� 
sampleDirection
�� '
)
��' (
{
�� 
case
�� 
SampleDirection
�� (
.
��( )
Request
��) 0
:
��0 1%
ApiParameterDescription
�� /"
requestBodyParameter
��0 D
=
��E F
api
��G J
.
��J K#
ParameterDescriptions
��K `
.
��` a
FirstOrDefault
��a o
(
��o p
p
��p q
=>
��r t
p
��u v
.
��v w
Source
��w }
==��~ �"
ApiParameterSource��� �
.��� �
FromBody��� �
)��� �
;��� �
type
�� 
=
�� "
requestBodyParameter
�� 3
==
��4 6
null
��7 ;
?
��< =
null
��> B
:
��C D"
requestBodyParameter
��E Y
.
��Y Z!
ParameterDescriptor
��Z m
.
��m n
ParameterType
��n {
;
��{ |

formatters
�� "
=
��# $
api
��% (
.
��( ),
SupportedRequestBodyFormatters
��) G
;
��G H
break
�� 
;
�� 
case
�� 
SampleDirection
�� (
.
��( )
Response
��) 1
:
��1 2
default
�� 
:
�� 
type
�� 
=
�� 
api
�� "
.
��" #!
ResponseDescription
��# 6
.
��6 7
ResponseType
��7 C
??
��D F
api
��G J
.
��J K!
ResponseDescription
��K ^
.
��^ _
DeclaredType
��_ k
;
��k l

formatters
�� "
=
��# $
api
��% (
.
��( ))
SupportedResponseFormatters
��) D
;
��D E
break
�� 
;
�� 
}
�� 
}
�� 
return
�� 
type
�� 
;
�� 
}
�� 	
[
�� 	
SuppressMessage
��	 
(
�� 
$str
�� +
,
��+ ,
$str
��- U
,
��U V
Justification
��W d
=
��e f
$str��g �
)��� �
]��� �
public
�� 
virtual
�� 
object
�� -
WriteSampleObjectUsingFormatter
�� =
(
��= > 
MediaTypeFormatter
��> P
	formatter
��Q Z
,
��Z [
object
��\ b
value
��c h
,
��h i
Type
��j n
type
��o s
,
��s t#
MediaTypeHeaderValue��u �
	mediaType��� �
)��� �
{
�� 	
if
�� 
(
�� 
	formatter
�� 
==
�� 
null
�� !
)
��! "
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 ;
)
��; <
;
��< =
}
�� 
if
�� 
(
�� 
	mediaType
�� 
==
�� 
null
�� !
)
��! "
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
$str
��0 ;
)
��; <
;
��< =
}
�� 
object
�� 
sample
�� 
=
�� 
String
�� "
.
��" #
Empty
��# (
;
��( )
MemoryStream
�� 
ms
�� 
=
�� 
null
�� "
;
��" #
HttpContent
�� 
content
�� 
=
��  !
null
��" &
;
��& '
try
�� 
{
�� 
if
�� 
(
�� 
	formatter
�� 
.
�� 
CanWriteType
�� *
(
��* +
type
��+ /
)
��/ 0
)
��0 1
{
�� 
ms
�� 
=
�� 
new
�� 
MemoryStream
�� )
(
��) *
)
��* +
;
��+ ,
content
�� 
=
�� 
new
�� !
ObjectContent
��" /
(
��/ 0
type
��0 4
,
��4 5
value
��6 ;
,
��; <
	formatter
��= F
,
��F G
	mediaType
��H Q
)
��Q R
;
��R S
	formatter
�� 
.
��  
WriteToStreamAsync
�� 0
(
��0 1
type
��1 5
,
��5 6
value
��7 <
,
��< =
ms
��> @
,
��@ A
content
��B I
,
��I J
null
��K O
)
��O P
.
��P Q
Wait
��Q U
(
��U V
)
��V W
;
��W X
ms
�� 
.
�� 
Position
�� 
=
��  !
$num
��" #
;
��# $
StreamReader
��  
reader
��! '
=
��( )
new
��* -
StreamReader
��. :
(
��: ;
ms
��; =
)
��= >
;
��> ?
string
�� $
serializedSampleString
�� 1
=
��2 3
reader
��4 :
.
��: ;
	ReadToEnd
��; D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 
	mediaType
�� !
.
��! "
	MediaType
��" +
.
��+ ,
ToUpperInvariant
��, <
(
��< =
)
��= >
.
��> ?
Contains
��? G
(
��G H
$str
��H M
)
��M N
)
��N O
{
�� $
serializedSampleString
�� .
=
��/ 0
TryFormatXml
��1 =
(
��= >$
serializedSampleString
��> T
)
��T U
;
��U V
}
�� 
else
�� 
if
�� 
(
�� 
	mediaType
�� &
.
��& '
	MediaType
��' 0
.
��0 1
ToUpperInvariant
��1 A
(
��A B
)
��B C
.
��C D
Contains
��D L
(
��L M
$str
��M S
)
��S T
)
��T U
{
�� $
serializedSampleString
�� .
=
��/ 0
TryFormatJson
��1 >
(
��> ?$
serializedSampleString
��? U
)
��U V
;
��V W
}
�� 
sample
�� 
=
�� 
new
��  

TextSample
��! +
(
��+ ,$
serializedSampleString
��, B
)
��B C
;
��C D
}
�� 
else
�� 
{
�� 
sample
�� 
=
�� 
new
��  
InvalidSample
��! .
(
��. /
String
��/ 5
.
��5 6
Format
��6 <
(
��< =
CultureInfo
�� #
.
��# $
CurrentCulture
��$ 2
,
��2 3
$str
�� }
,
��} ~
	mediaType
�� !
,
��! "
	formatter
�� !
.
��! "
GetType
��" )
(
��) *
)
��* +
.
��+ ,
Name
��, 0
,
��0 1
type
�� 
.
�� 
Name
�� !
)
��! "
)
��" #
;
��# $
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
sample
�� 
=
�� 
new
�� 
InvalidSample
�� *
(
��* +
String
��+ 1
.
��1 2
Format
��2 8
(
��8 9
CultureInfo
�� 
.
��  
CurrentCulture
��  .
,
��. /
$str�� �
,��� �
	formatter
�� 
.
�� 
GetType
�� %
(
��% &
)
��& '
.
��' (
Name
��( ,
,
��, -
	mediaType
�� 
.
�� 
	MediaType
�� '
,
��' (
UnwrapException
�� #
(
��# $
e
��$ %
)
��% &
.
��& '
Message
��' .
)
��. /
)
��/ 0
;
��0 1
}
�� 
finally
�� 
{
�� 
if
�� 
(
�� 
ms
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
ms
�� 
.
�� 
Dispose
�� 
(
�� 
)
��  
;
��  !
}
�� 
if
�� 
(
�� 
content
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
content
�� 
.
�� 
Dispose
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
}
�� 
return
�� 
sample
�� 
;
�� 
}
�� 	
internal
�� 
static
�� 
	Exception
�� !
UnwrapException
��" 1
(
��1 2
	Exception
��2 ;
	exception
��< E
)
��E F
{
�� 	 
AggregateException
��  
aggregateException
�� 1
=
��2 3
	exception
��4 =
as
��> @ 
AggregateException
��A S
;
��S T
if
�� 
(
��  
aggregateException
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
return
��  
aggregateException
�� )
.
��) *
Flatten
��* 1
(
��1 2
)
��2 3
.
��3 4
InnerException
��4 B
;
��B C
}
�� 
return
�� 
	exception
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
�� (
DefaultSampleObjectFactory
�� 8
(
��8 9%
HelpPageSampleGenerator
��9 P
sampleGenerator
��Q `
,
��` a
Type
��b f
type
��g k
)
��k l
{
�� 	
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
return
�� 
objectGenerator
�� "
.
��" #
GenerateObject
��# 1
(
��1 2
type
��2 6
)
��6 7
;
��7 8
}
�� 	
[
�� 	
SuppressMessage
��	 
(
�� 
$str
�� +
,
��+ ,
$str
��- U
,
��U V
Justification
��W d
=
��e f
$str��g �
)��� �
]��� �
private
�� 
static
�� 
string
�� 
TryFormatJson
�� +
(
��+ ,
string
��, 2
str
��3 6
)
��6 7
{
�� 	
try
�� 
{
�� 
object
�� 

parsedJson
�� !
=
��" #
JsonConvert
��$ /
.
��/ 0
DeserializeObject
��0 A
(
��A B
str
��B E
)
��E F
;
��F G
return
�� 
JsonConvert
�� "
.
��" #
SerializeObject
��# 2
(
��2 3

parsedJson
��3 =
,
��= >

Formatting
��? I
.
��I J
Indented
��J R
)
��R S
;
��S T
}
�� 
catch
�� 
{
�� 
return
�� 
str
�� 
;
�� 
}
�� 
}
�� 	
[
�� 	
SuppressMessage
��	 
(
�� 
$str
�� +
,
��+ ,
$str
��- U
,
��U V
Justification
��W d
=
��e f
$str��g �
)��� �
]��� �
private
�� 
static
�� 
string
�� 
TryFormatXml
�� *
(
��* +
string
��+ 1
str
��2 5
)
��5 6
{
�� 	
try
�� 
{
�� 
	XDocument
�� 
xml
�� 
=
�� 
	XDocument
��  )
.
��) *
Parse
��* /
(
��/ 0
str
��0 3
)
��3 4
;
��4 5
return
�� 
xml
�� 
.
�� 
ToString
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
catch
�� 
{
�� 
return
�� 
str
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
IsFormatSupported
�� -
(
��- .
SampleDirection
��. =
sampleDirection
��> M
,
��M N 
MediaTypeFormatter
��O a
	formatter
��b k
,
��k l
Type
��m q
type
��r v
)
��v w
{
�� 	
switch
�� 
(
�� 
sampleDirection
�� #
)
��# $
{
�� 
case
�� 
SampleDirection
�� $
.
��$ %
Request
��% ,
:
��, -
return
�� 
	formatter
�� $
.
��$ %
CanReadType
��% 0
(
��0 1
type
��1 5
)
��5 6
;
��6 7
case
�� 
SampleDirection
�� $
.
��$ %
Response
��% -
:
��- .
return
�� 
	formatter
�� $
.
��$ %
CanWriteType
��% 1
(
��1 2
type
��2 6
)
��6 7
;
��7 8
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
IEnumerable
�� 
<
�� 
KeyValuePair
�� (
<
��( )
HelpPageSampleKey
��) :
,
��: ;
object
��< B
>
��B C
>
��C D!
GetAllActionSamples
��E X
(
��X Y
string
��Y _
controllerName
��` n
,
��n o
string
��p v

actionName��w �
,��� �
IEnumerable��� �
<��� �
string��� �
>��� �
parameterNames��� �
,��� �
SampleDirection��� �
sampleDirection��� �
)��� �
{
�� 	
HashSet
�� 
<
�� 
string
�� 
>
�� 
parameterNamesSet
�� -
=
��. /
new
��0 3
HashSet
��4 ;
<
��; <
string
��< B
>
��B C
(
��C D
parameterNames
��D R
,
��R S
StringComparer
��T b
.
��b c
OrdinalIgnoreCase
��c t
)
��t u
;
��u v
foreach
�� 
(
�� 
var
�� 
sample
�� 
in
��  "
ActionSamples
��# 0
)
��0 1
{
�� 
HelpPageSampleKey
�� !
	sampleKey
��" +
=
��, -
sample
��. 4
.
��4 5
Key
��5 8
;
��8 9
if
�� 
(
�� 
String
�� 
.
�� 
Equals
�� !
(
��! "
controllerName
��" 0
,
��0 1
	sampleKey
��2 ;
.
��; <
ControllerName
��< J
,
��J K
StringComparison
��L \
.
��\ ]
OrdinalIgnoreCase
��] n
)
��n o
&&
��p r
String
�� 
.
�� 
Equals
�� !
(
��! "

actionName
��" ,
,
��, -
	sampleKey
��. 7
.
��7 8

ActionName
��8 B
,
��B C
StringComparison
��D T
.
��T U
OrdinalIgnoreCase
��U f
)
��f g
&&
��h j
(
�� 
	sampleKey
�� 
.
�� 
ParameterNames
�� -
.
��- .
	SetEquals
��. 7
(
��7 8
new
��8 ;
[
��; <
]
��< =
{
��> ?
$str
��@ C
}
��D E
)
��E F
||
��G I
parameterNamesSet
��J [
.
��[ \
	SetEquals
��\ e
(
��e f
	sampleKey
��f o
.
��o p
ParameterNames
��p ~
)
��~ 
)�� �
&&��� �
sampleDirection
�� #
==
��$ &
	sampleKey
��' 0
.
��0 1
SampleDirection
��1 @
)
��@ A
{
�� 
yield
�� 
return
��  
sample
��! '
;
��' (
}
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
object
��  
WrapSampleIfString
�� 0
(
��0 1
object
��1 7
sample
��8 >
)
��> ?
{
�� 	
string
�� 
stringSample
�� 
=
��  !
sample
��" (
as
��) +
string
��, 2
;
��2 3
if
�� 
(
�� 
stringSample
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
return
�� 
new
�� 

TextSample
�� %
(
��% &
stringSample
��& 2
)
��2 3
;
��3 4
}
�� 
return
�� 
sample
�� 
;
�� 
}
�� 	
}
�� 
}�� �U
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\HelpPageSampleKey.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 
HelpPageSampleKey "
{ 
public 
HelpPageSampleKey  
(  ! 
MediaTypeHeaderValue! 5
	mediaType6 ?
)? @
{ 	
if 
( 
	mediaType 
== 
null !
)! "
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 ;
); <
;< =
} 

ActionName 
= 
String 
.  
Empty  %
;% &
ControllerName 
= 
String #
.# $
Empty$ )
;) *
	MediaType 
= 
	mediaType !
;! "
ParameterNames 
= 
new  
HashSet! (
<( )
string) /
>/ 0
(0 1
StringComparer1 ?
.? @
OrdinalIgnoreCase@ Q
)Q R
;R S
} 	
public## 
HelpPageSampleKey##  
(##  ! 
MediaTypeHeaderValue##! 5
	mediaType##6 ?
,##? @
Type##A E
type##F J
)##J K
:$$ 
this$$ 
($$ 
	mediaType$$ 
)$$ 
{%% 	
if&& 
(&& 
type&& 
==&& 
null&& 
)&& 
{'' 
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
$str((0 6
)((6 7
;((7 8
})) 
ParameterType++ 
=++ 
type++  
;++  !
},, 	
public55 
HelpPageSampleKey55  
(55  !
SampleDirection55! 0
sampleDirection551 @
,55@ A
string55B H
controllerName55I W
,55W X
string55Y _

actionName55` j
,55j k
IEnumerable55l w
<55w x
string55x ~
>55~ 
parameterNames
55� �
)
55� �
{66 	
if77 
(77 
!77 
Enum77 
.77 
	IsDefined77 
(77  
typeof77  &
(77& '
SampleDirection77' 6
)776 7
,777 8
sampleDirection779 H
)77H I
)77I J
{88 
throw99 
new99 (
InvalidEnumArgumentException99 6
(996 7
$str997 H
,99H I
(99J K
int99K N
)99N O
sampleDirection99O ^
,99^ _
typeof99` f
(99f g
SampleDirection99g v
)99v w
)99w x
;99x y
}:: 
if;; 
(;; 
controllerName;; 
==;; !
null;;" &
);;& '
{<< 
throw== 
new== !
ArgumentNullException== /
(==/ 0
$str==0 @
)==@ A
;==A B
}>> 
if?? 
(?? 

actionName?? 
==?? 
null?? "
)??" #
{@@ 
throwAA 
newAA !
ArgumentNullExceptionAA /
(AA/ 0
$strAA0 <
)AA< =
;AA= >
}BB 
ifCC 
(CC 
parameterNamesCC 
==CC !
nullCC" &
)CC& '
{DD 
throwEE 
newEE !
ArgumentNullExceptionEE /
(EE/ 0
$strEE0 @
)EE@ A
;EEA B
}FF 
ControllerNameHH 
=HH 
controllerNameHH +
;HH+ ,

ActionNameII 
=II 

actionNameII #
;II# $
ParameterNamesJJ 
=JJ 
newJJ  
HashSetJJ! (
<JJ( )
stringJJ) /
>JJ/ 0
(JJ0 1
parameterNamesJJ1 ?
,JJ? @
StringComparerJJA O
.JJO P
OrdinalIgnoreCaseJJP a
)JJa b
;JJb c
SampleDirectionKK 
=KK 
sampleDirectionKK -
;KK- .
}LL 	
publicVV 
HelpPageSampleKeyVV  
(VV  ! 
MediaTypeHeaderValueVV! 5
	mediaTypeVV6 ?
,VV? @
SampleDirectionVVA P
sampleDirectionVVQ `
,VV` a
stringVVb h
controllerNameVVi w
,VVw x
stringVVy 

actionName
VV� �
,
VV� �
IEnumerable
VV� �
<
VV� �
string
VV� �
>
VV� �
parameterNames
VV� �
)
VV� �
:WW 
thisWW 
(WW 
sampleDirectionWW "
,WW" #
controllerNameWW$ 2
,WW2 3

actionNameWW4 >
,WW> ?
parameterNamesWW@ N
)WWN O
{XX 	
ifYY 
(YY 
	mediaTypeYY 
==YY 
nullYY !
)YY! "
{ZZ 
throw[[ 
new[[ !
ArgumentNullException[[ /
([[/ 0
$str[[0 ;
)[[; <
;[[< =
}\\ 
	MediaType^^ 
=^^ 
	mediaType^^ !
;^^! "
}__ 	
publicgg 
stringgg 
ControllerNamegg $
{gg% &
getgg' *
;gg* +
privategg, 3
setgg4 7
;gg7 8
}gg9 :
publicoo 
stringoo 

ActionNameoo  
{oo! "
getoo# &
;oo& '
privateoo( /
setoo0 3
;oo3 4
}oo5 6
publicww  
MediaTypeHeaderValueww #
	MediaTypeww$ -
{ww. /
getww0 3
;ww3 4
privateww5 <
setww= @
;ww@ A
}wwB C
public|| 
HashSet|| 
<|| 
string|| 
>|| 
ParameterNames|| -
{||. /
get||0 3
;||3 4
private||5 <
set||= @
;||@ A
}||B C
public~~ 
Type~~ 
ParameterType~~ !
{~~" #
get~~$ '
;~~' (
private~~) 0
set~~1 4
;~~4 5
}~~6 7
public
�� 
SampleDirection
�� 
?
�� 
SampleDirection
��  /
{
��0 1
get
��2 5
;
��5 6
private
��7 >
set
��? B
;
��B C
}
��D E
public
�� 
override
�� 
bool
�� 
Equals
�� #
(
��# $
object
��$ *
obj
��+ .
)
��. /
{
�� 	
HelpPageSampleKey
�� 
otherKey
�� &
=
��' (
obj
��) ,
as
��- /
HelpPageSampleKey
��0 A
;
��A B
if
�� 
(
�� 
otherKey
�� 
==
�� 
null
��  
)
��  !
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
return
�� 
String
�� 
.
�� 
Equals
��  
(
��  !
ControllerName
��! /
,
��/ 0
otherKey
��1 9
.
��9 :
ControllerName
��: H
,
��H I
StringComparison
��J Z
.
��Z [
OrdinalIgnoreCase
��[ l
)
��l m
&&
��n p
String
�� 
.
�� 
Equals
�� 
(
�� 

ActionName
�� (
,
��( )
otherKey
��* 2
.
��2 3

ActionName
��3 =
,
��= >
StringComparison
��? O
.
��O P
OrdinalIgnoreCase
��P a
)
��a b
&&
��c e
(
�� 
	MediaType
�� 
==
�� 
otherKey
�� &
.
��& '
	MediaType
��' 0
||
��1 3
(
��4 5
	MediaType
��5 >
!=
��? A
null
��B F
&&
��G I
	MediaType
��J S
.
��S T
Equals
��T Z
(
��Z [
otherKey
��[ c
.
��c d
	MediaType
��d m
)
��m n
)
��n o
)
��o p
&&
��q s
ParameterType
�� 
==
��  
otherKey
��! )
.
��) *
ParameterType
��* 7
&&
��8 :
SampleDirection
�� 
==
��  "
otherKey
��# +
.
��+ ,
SampleDirection
��, ;
&&
��< >
ParameterNames
�� 
.
�� 
	SetEquals
�� (
(
��( )
otherKey
��) 1
.
��1 2
ParameterNames
��2 @
)
��@ A
;
��A B
}
�� 	
public
�� 
override
�� 
int
�� 
GetHashCode
�� '
(
��' (
)
��( )
{
�� 	
int
�� 
hashCode
�� 
=
�� 
ControllerName
�� )
.
��) *
ToUpperInvariant
��* :
(
��: ;
)
��; <
.
��< =
GetHashCode
��= H
(
��H I
)
��I J
^
��K L

ActionName
��M W
.
��W X
ToUpperInvariant
��X h
(
��h i
)
��i j
.
��j k
GetHashCode
��k v
(
��v w
)
��w x
;
��x y
if
�� 
(
�� 
	MediaType
�� 
!=
�� 
null
�� !
)
��! "
{
�� 
hashCode
�� 
^=
�� 
	MediaType
�� %
.
��% &
GetHashCode
��& 1
(
��1 2
)
��2 3
;
��3 4
}
�� 
if
�� 
(
�� 
SampleDirection
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
hashCode
�� 
^=
�� 
SampleDirection
�� +
.
��+ ,
GetHashCode
��, 7
(
��7 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
ParameterType
�� 
!=
��  
null
��! %
)
��% &
{
�� 
hashCode
�� 
^=
�� 
ParameterType
�� )
.
��) *
GetHashCode
��* 5
(
��5 6
)
��6 7
;
��7 8
}
�� 
foreach
�� 
(
�� 
string
�� 
parameterName
�� )
in
��* ,
ParameterNames
��- ;
)
��; <
{
�� 
hashCode
�� 
^=
�� 
parameterName
�� )
.
��) *
ToUpperInvariant
��* :
(
��: ;
)
��; <
.
��< =
GetHashCode
��= H
(
��H I
)
��I J
;
��J K
}
�� 
return
�� 
hashCode
�� 
;
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\ImageSample.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 
ImageSample 
{		 
public 
ImageSample 
( 
string !
src" %
)% &
{ 	
if 
( 
src 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 5
)5 6
;6 7
} 
Src 
= 
src 
; 
} 	
public 
string 
Src 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
ImageSample 
other 
= 
obj  #
as$ &
ImageSample' 2
;2 3
return 
other 
!= 
null  
&&! #
Src$ '
==( *
other+ 0
.0 1
Src1 4
;4 5
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{   	
return!! 
Src!! 
.!! 
GetHashCode!! "
(!!" #
)!!# $
;!!$ %
}"" 	
public$$ 
override$$ 
string$$ 
ToString$$ '
($$' (
)$$( )
{%% 	
return&& 
Src&& 
;&& 
}'' 	
}(( 
})) �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\InvalidSample.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 
InvalidSample 
{		 
public

 
InvalidSample

 
(

 
string

 #
errorMessage

$ 0
)

0 1
{ 	
if 
( 
errorMessage 
== 
null  $
)$ %
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 >
)> ?
;? @
} 
ErrorMessage 
= 
errorMessage '
;' (
} 	
public 
string 
ErrorMessage "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
InvalidSample 
other 
=  !
obj" %
as& (
InvalidSample) 6
;6 7
return 
other 
!= 
null  
&&! #
ErrorMessage$ 0
==1 3
other4 9
.9 :
ErrorMessage: F
;F G
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{ 	
return 
ErrorMessage 
.  
GetHashCode  +
(+ ,
), -
;- .
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
ErrorMessage"" 
;""  
}## 	
}$$ 
}%% ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\ObjectGenerator.cs
	namespace		 	
RestaurantService		
 
.		 
Areas		 !
.		! "
HelpPage		" *
{

 
public 

class 
ObjectGenerator  
{ 
internal 
const 
int !
DefaultCollectionSize 0
=1 2
$num3 4
;4 5
private 
readonly %
SimpleTypeObjectGenerator 2!
SimpleObjectGenerator3 H
=I J
newK N%
SimpleTypeObjectGeneratorO h
(h i
)i j
;j k
public!! 
object!! 
GenerateObject!! $
(!!$ %
Type!!% )
type!!* .
)!!. /
{"" 	
return## 
GenerateObject## !
(##! "
type##" &
,##& '
new##( +

Dictionary##, 6
<##6 7
Type##7 ;
,##; <
object##= C
>##C D
(##D E
)##E F
)##F G
;##G H
}$$ 	
[&& 	
SuppressMessage&&	 
(&& 
$str&& +
,&&+ ,
$str&&- U
,&&U V
Justification&&W d
=&&e f
$str	&&g �
)
&&� �
]
&&� �
private'' 
object'' 
GenerateObject'' %
(''% &
Type''& *
type''+ /
,''/ 0

Dictionary''1 ;
<''; <
Type''< @
,''@ A
object''B H
>''H I#
createdObjectReferences''J a
)''a b
{(( 	
try)) 
{** 
if++ 
(++ %
SimpleTypeObjectGenerator++ -
.++- .
CanGenerateObject++. ?
(++? @
type++@ D
)++D E
)++E F
{,, 
return-- !
SimpleObjectGenerator-- 0
.--0 1
GenerateObject--1 ?
(--? @
type--@ D
)--D E
;--E F
}.. 
if00 
(00 
type00 
.00 
IsArray00  
)00  !
{11 
return22 
GenerateArray22 (
(22( )
type22) -
,22- .!
DefaultCollectionSize22/ D
,22D E#
createdObjectReferences22F ]
)22] ^
;22^ _
}33 
if55 
(55 
type55 
.55 
IsGenericType55 &
)55& '
{66 
return77 
GenerateGenericType77 .
(77. /
type77/ 3
,773 4!
DefaultCollectionSize775 J
,77J K#
createdObjectReferences77L c
)77c d
;77d e
}88 
if:: 
(:: 
type:: 
==:: 
typeof:: "
(::" #
IDictionary::# .
)::. /
)::/ 0
{;; 
return<< 
GenerateDictionary<< -
(<<- .
typeof<<. 4
(<<4 5
	Hashtable<<5 >
)<<> ?
,<<? @!
DefaultCollectionSize<<A V
,<<V W#
createdObjectReferences<<X o
)<<o p
;<<p q
}== 
if?? 
(?? 
typeof?? 
(?? 
IDictionary?? &
)??& '
.??' (
IsAssignableFrom??( 8
(??8 9
type??9 =
)??= >
)??> ?
{@@ 
returnAA 
GenerateDictionaryAA -
(AA- .
typeAA. 2
,AA2 3!
DefaultCollectionSizeAA4 I
,AAI J#
createdObjectReferencesAAK b
)AAb c
;AAc d
}BB 
ifDD 
(DD 
typeDD 
==DD 
typeofDD "
(DD" #
IListDD# (
)DD( )
||DD* ,
typeEE 
==EE 
typeofEE "
(EE" #
IEnumerableEE# .
)EE. /
||EE0 2
typeFF 
==FF 
typeofFF "
(FF" #
ICollectionFF# .
)FF. /
)FF/ 0
{GG 
returnHH 
GenerateCollectionHH -
(HH- .
typeofHH. 4
(HH4 5
	ArrayListHH5 >
)HH> ?
,HH? @!
DefaultCollectionSizeHHA V
,HHV W#
createdObjectReferencesHHX o
)HHo p
;HHp q
}II 
ifKK 
(KK 
typeofKK 
(KK 
IListKK  
)KK  !
.KK! "
IsAssignableFromKK" 2
(KK2 3
typeKK3 7
)KK7 8
)KK8 9
{LL 
returnMM 
GenerateCollectionMM -
(MM- .
typeMM. 2
,MM2 3!
DefaultCollectionSizeMM4 I
,MMI J#
createdObjectReferencesMMK b
)MMb c
;MMc d
}NN 
ifPP 
(PP 
typePP 
==PP 
typeofPP "
(PP" #

IQueryablePP# -
)PP- .
)PP. /
{QQ 
returnRR 
GenerateQueryableRR ,
(RR, -
typeRR- 1
,RR1 2!
DefaultCollectionSizeRR3 H
,RRH I#
createdObjectReferencesRRJ a
)RRa b
;RRb c
}SS 
ifUU 
(UU 
typeUU 
.UU 
IsEnumUU 
)UU  
{VV 
returnWW 
GenerateEnumWW '
(WW' (
typeWW( ,
)WW, -
;WW- .
}XX 
ifZZ 
(ZZ 
typeZZ 
.ZZ 
IsPublicZZ !
||ZZ" $
typeZZ% )
.ZZ) *
IsNestedPublicZZ* 8
)ZZ8 9
{[[ 
return\\ !
GenerateComplexObject\\ 0
(\\0 1
type\\1 5
,\\5 6#
createdObjectReferences\\7 N
)\\N O
;\\O P
}]] 
}^^ 
catch__ 
{`` 
returnbb 
nullbb 
;bb 
}cc 
returnee 
nullee 
;ee 
}ff 	
privatehh 
statichh 
objecthh 
GenerateGenericTypehh 1
(hh1 2
Typehh2 6
typehh7 ;
,hh; <
inthh= @
collectionSizehhA O
,hhO P

DictionaryhhQ [
<hh[ \
Typehh\ `
,hh` a
objecthhb h
>hhh i$
createdObjectReferences	hhj �
)
hh� �
{ii 	
Typejj !
genericTypeDefinitionjj &
=jj' (
typejj) -
.jj- .$
GetGenericTypeDefinitionjj. F
(jjF G
)jjG H
;jjH I
ifkk 
(kk !
genericTypeDefinitionkk %
==kk& (
typeofkk) /
(kk/ 0
Nullablekk0 8
<kk8 9
>kk9 :
)kk: ;
)kk; <
{ll 
returnmm 
GenerateNullablemm '
(mm' (
typemm( ,
,mm, -#
createdObjectReferencesmm. E
)mmE F
;mmF G
}nn 
ifpp 
(pp !
genericTypeDefinitionpp %
==pp& (
typeofpp) /
(pp/ 0
KeyValuePairpp0 <
<pp< =
,pp= >
>pp> ?
)pp? @
)pp@ A
{qq 
returnrr  
GenerateKeyValuePairrr +
(rr+ ,
typerr, 0
,rr0 1#
createdObjectReferencesrr2 I
)rrI J
;rrJ K
}ss 
ifuu 
(uu 
IsTupleuu 
(uu !
genericTypeDefinitionuu -
)uu- .
)uu. /
{vv 
returnww 
GenerateTupleww $
(ww$ %
typeww% )
,ww) *#
createdObjectReferencesww+ B
)wwB C
;wwC D
}xx 
Typezz 
[zz 
]zz 
genericArgumentszz #
=zz$ %
typezz& *
.zz* +
GetGenericArgumentszz+ >
(zz> ?
)zz? @
;zz@ A
if{{ 
({{ 
genericArguments{{  
.{{  !
Length{{! '
=={{( *
$num{{+ ,
){{, -
{|| 
if}} 
(}} !
genericTypeDefinition}} )
==}}* ,
typeof}}- 3
(}}3 4
IList}}4 9
<}}9 :
>}}: ;
)}}; <
||}}= ?!
genericTypeDefinition~~ )
==~~* ,
typeof~~- 3
(~~3 4
IEnumerable~~4 ?
<~~? @
>~~@ A
)~~A B
||~~C E!
genericTypeDefinition )
==* ,
typeof- 3
(3 4
ICollection4 ?
<? @
>@ A
)A B
)B C
{
�� 
Type
�� 
collectionType
�� '
=
��( )
typeof
��* 0
(
��0 1
List
��1 5
<
��5 6
>
��6 7
)
��7 8
.
��8 9
MakeGenericType
��9 H
(
��H I
genericArguments
��I Y
)
��Y Z
;
��Z [
return
��  
GenerateCollection
�� -
(
��- .
collectionType
��. <
,
��< =
collectionSize
��> L
,
��L M%
createdObjectReferences
��N e
)
��e f
;
��f g
}
�� 
if
�� 
(
�� #
genericTypeDefinition
�� )
==
��* ,
typeof
��- 3
(
��3 4

IQueryable
��4 >
<
��> ?
>
��? @
)
��@ A
)
��A B
{
�� 
return
�� 
GenerateQueryable
�� ,
(
��, -
type
��- 1
,
��1 2
collectionSize
��3 A
,
��A B%
createdObjectReferences
��C Z
)
��Z [
;
��[ \
}
�� 
Type
�� "
closedCollectionType
�� )
=
��* +
typeof
��, 2
(
��2 3
ICollection
��3 >
<
��> ?
>
��? @
)
��@ A
.
��A B
MakeGenericType
��B Q
(
��Q R
genericArguments
��R b
[
��b c
$num
��c d
]
��d e
)
��e f
;
��f g
if
�� 
(
�� "
closedCollectionType
�� (
.
��( )
IsAssignableFrom
��) 9
(
��9 :
type
��: >
)
��> ?
)
��? @
{
�� 
return
��  
GenerateCollection
�� -
(
��- .
type
��. 2
,
��2 3
collectionSize
��4 B
,
��B C%
createdObjectReferences
��D [
)
��[ \
;
��\ ]
}
�� 
}
�� 
if
�� 
(
�� 
genericArguments
��  
.
��  !
Length
��! '
==
��( *
$num
��+ ,
)
��, -
{
�� 
if
�� 
(
�� #
genericTypeDefinition
�� )
==
��* ,
typeof
��- 3
(
��3 4
IDictionary
��4 ?
<
��? @
,
��@ A
>
��A B
)
��B C
)
��C D
{
�� 
Type
�� 
dictionaryType
�� '
=
��( )
typeof
��* 0
(
��0 1

Dictionary
��1 ;
<
��; <
,
��< =
>
��= >
)
��> ?
.
��? @
MakeGenericType
��@ O
(
��O P
genericArguments
��P `
)
��` a
;
��a b
return
��  
GenerateDictionary
�� -
(
��- .
dictionaryType
��. <
,
��< =
collectionSize
��> L
,
��L M%
createdObjectReferences
��N e
)
��e f
;
��f g
}
�� 
Type
�� "
closedDictionaryType
�� )
=
��* +
typeof
��, 2
(
��2 3
IDictionary
��3 >
<
��> ?
,
��? @
>
��@ A
)
��A B
.
��B C
MakeGenericType
��C R
(
��R S
genericArguments
��S c
[
��c d
$num
��d e
]
��e f
,
��f g
genericArguments
��h x
[
��x y
$num
��y z
]
��z {
)
��{ |
;
��| }
if
�� 
(
�� "
closedDictionaryType
�� (
.
��( )
IsAssignableFrom
��) 9
(
��9 :
type
��: >
)
��> ?
)
��? @
{
�� 
return
��  
GenerateDictionary
�� -
(
��- .
type
��. 2
,
��2 3
collectionSize
��4 B
,
��B C%
createdObjectReferences
��D [
)
��[ \
;
��\ ]
}
�� 
}
�� 
if
�� 
(
�� 
type
�� 
.
�� 
IsPublic
�� 
||
��  
type
��! %
.
��% &
IsNestedPublic
��& 4
)
��4 5
{
�� 
return
�� #
GenerateComplexObject
�� ,
(
��, -
type
��- 1
,
��1 2%
createdObjectReferences
��3 J
)
��J K
;
��K L
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
�� 
GenerateTuple
�� +
(
��+ ,
Type
��, 0
type
��1 5
,
��5 6

Dictionary
��7 A
<
��A B
Type
��B F
,
��F G
object
��H N
>
��N O%
createdObjectReferences
��P g
)
��g h
{
�� 	
Type
�� 
[
�� 
]
�� 
genericArgs
�� 
=
��  
type
��! %
.
��% &!
GetGenericArguments
��& 9
(
��9 :
)
��: ;
;
��; <
object
�� 
[
�� 
]
�� 
parameterValues
�� $
=
��% &
new
��' *
object
��+ 1
[
��1 2
genericArgs
��2 =
.
��= >
Length
��> D
]
��D E
;
��E F
bool
�� !
failedToCreateTuple
�� $
=
��% &
true
��' +
;
��+ ,
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
genericArgs
��  +
.
��+ ,
Length
��, 2
;
��2 3
i
��4 5
++
��5 7
)
��7 8
{
�� 
parameterValues
�� 
[
��  
i
��  !
]
��! "
=
��# $
objectGenerator
��% 4
.
��4 5
GenerateObject
��5 C
(
��C D
genericArgs
��D O
[
��O P
i
��P Q
]
��Q R
,
��R S%
createdObjectReferences
��T k
)
��k l
;
��l m!
failedToCreateTuple
�� #
&=
��$ &
parameterValues
��' 6
[
��6 7
i
��7 8
]
��8 9
==
��: <
null
��= A
;
��A B
}
�� 
if
�� 
(
�� !
failedToCreateTuple
�� #
)
��# $
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
object
�� 
result
�� 
=
�� 
	Activator
�� %
.
��% &
CreateInstance
��& 4
(
��4 5
type
��5 9
,
��9 :
parameterValues
��; J
)
��J K
;
��K L
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
IsTuple
�� #
(
��# $
Type
��$ (#
genericTypeDefinition
��) >
)
��> ?
{
�� 	
return
�� #
genericTypeDefinition
�� (
==
��) +
typeof
��, 2
(
��2 3
Tuple
��3 8
<
��8 9
>
��9 :
)
��: ;
||
��< >#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
>
��7 8
)
��8 9
||
��: <#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
,
��7 8
>
��8 9
)
��9 :
||
��; =#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
,
��7 8
,
��8 9
>
��9 :
)
��: ;
||
��< >#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
,
��7 8
,
��8 9
,
��9 :
>
��: ;
)
��; <
||
��= ?#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
,
��7 8
,
��8 9
,
��9 :
,
��: ;
>
��; <
)
��< =
||
��> @#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
,
��7 8
,
��8 9
,
��9 :
,
��: ;
,
��; <
>
��< =
)
��= >
||
��? A#
genericTypeDefinition
�� %
==
��& (
typeof
��) /
(
��/ 0
Tuple
��0 5
<
��5 6
,
��6 7
,
��7 8
,
��8 9
,
��9 :
,
��: ;
,
��; <
,
��< =
>
��= >
)
��> ?
;
��? @
}
�� 	
private
�� 
static
�� 
object
�� "
GenerateKeyValuePair
�� 2
(
��2 3
Type
��3 7
keyValuePairType
��8 H
,
��H I

Dictionary
��J T
<
��T U
Type
��U Y
,
��Y Z
object
��[ a
>
��a b%
createdObjectReferences
��c z
)
��z {
{
�� 	
Type
�� 
[
�� 
]
�� 
genericArgs
�� 
=
��  
keyValuePairType
��! 1
.
��1 2!
GetGenericArguments
��2 E
(
��E F
)
��F G
;
��G H
Type
�� 
typeK
�� 
=
�� 
genericArgs
�� $
[
��$ %
$num
��% &
]
��& '
;
��' (
Type
�� 
typeV
�� 
=
�� 
genericArgs
�� $
[
��$ %
$num
��% &
]
��& '
;
��' (
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
object
�� 
	keyObject
�� 
=
�� 
objectGenerator
�� .
.
��. /
GenerateObject
��/ =
(
��= >
typeK
��> C
,
��C D%
createdObjectReferences
��E \
)
��\ ]
;
��] ^
object
�� 
valueObject
�� 
=
��  
objectGenerator
��! 0
.
��0 1
GenerateObject
��1 ?
(
��? @
typeV
��@ E
,
��E F%
createdObjectReferences
��G ^
)
��^ _
;
��_ `
if
�� 
(
�� 
	keyObject
�� 
==
�� 
null
�� !
&&
��" $
valueObject
��% 0
==
��1 3
null
��4 8
)
��8 9
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
object
�� 
result
�� 
=
�� 
	Activator
�� %
.
��% &
CreateInstance
��& 4
(
��4 5
keyValuePairType
��5 E
,
��E F
	keyObject
��G P
,
��P Q
valueObject
��R ]
)
��] ^
;
��^ _
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
�� 
GenerateArray
�� +
(
��+ ,
Type
��, 0
	arrayType
��1 :
,
��: ;
int
��< ?
size
��@ D
,
��D E

Dictionary
��F P
<
��P Q
Type
��Q U
,
��U V
object
��W ]
>
��] ^%
createdObjectReferences
��_ v
)
��v w
{
�� 	
Type
�� 
type
�� 
=
�� 
	arrayType
�� !
.
��! "
GetElementType
��" 0
(
��0 1
)
��1 2
;
��2 3
Array
�� 
result
�� 
=
�� 
Array
��  
.
��  !
CreateInstance
��! /
(
��/ 0
type
��0 4
,
��4 5
size
��6 :
)
��: ;
;
��; <
bool
��  
areAllElementsNull
�� #
=
��$ %
true
��& *
;
��* +
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
size
��  $
;
��$ %
i
��& '
++
��' )
)
��) *
{
�� 
object
�� 
element
�� 
=
��  
objectGenerator
��! 0
.
��0 1
GenerateObject
��1 ?
(
��? @
type
��@ D
,
��D E%
createdObjectReferences
��F ]
)
��] ^
;
��^ _
result
�� 
.
�� 
SetValue
�� 
(
��  
element
��  '
,
��' (
i
��) *
)
��* +
;
��+ , 
areAllElementsNull
�� "
&=
��# %
element
��& -
==
��. 0
null
��1 5
;
��5 6
}
�� 
if
�� 
(
��  
areAllElementsNull
�� "
)
��" #
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
��  
GenerateDictionary
�� 0
(
��0 1
Type
��1 5
dictionaryType
��6 D
,
��D E
int
��F I
size
��J N
,
��N O

Dictionary
��P Z
<
��Z [
Type
��[ _
,
��_ `
object
��a g
>
��g h&
createdObjectReferences��i �
)��� �
{
�� 	
Type
�� 
typeK
�� 
=
�� 
typeof
�� 
(
��  
object
��  &
)
��& '
;
��' (
Type
�� 
typeV
�� 
=
�� 
typeof
�� 
(
��  
object
��  &
)
��& '
;
��' (
if
�� 
(
�� 
dictionaryType
�� 
.
�� 
IsGenericType
�� ,
)
��, -
{
�� 
Type
�� 
[
�� 
]
�� 
genericArgs
�� "
=
��# $
dictionaryType
��% 3
.
��3 4!
GetGenericArguments
��4 G
(
��G H
)
��H I
;
��I J
typeK
�� 
=
�� 
genericArgs
�� #
[
��# $
$num
��$ %
]
��% &
;
��& '
typeV
�� 
=
�� 
genericArgs
�� #
[
��# $
$num
��$ %
]
��% &
;
��& '
}
�� 
object
�� 
result
�� 
=
�� 
	Activator
�� %
.
��% &
CreateInstance
��& 4
(
��4 5
dictionaryType
��5 C
)
��C D
;
��D E

MethodInfo
�� 
	addMethod
��  
=
��! "
dictionaryType
��# 1
.
��1 2
	GetMethod
��2 ;
(
��; <
$str
��< A
)
��A B
??
��C E
dictionaryType
��F T
.
��T U
	GetMethod
��U ^
(
��^ _
$str
��_ g
)
��g h
;
��h i

MethodInfo
�� 
containsMethod
�� %
=
��& '
dictionaryType
��( 6
.
��6 7
	GetMethod
��7 @
(
��@ A
$str
��A K
)
��K L
??
��M O
dictionaryType
��P ^
.
��^ _
	GetMethod
��_ h
(
��h i
$str
��i v
)
��v w
;
��w x
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
size
��  $
;
��$ %
i
��& '
++
��' )
)
��) *
{
�� 
object
�� 
newKey
�� 
=
�� 
objectGenerator
��  /
.
��/ 0
GenerateObject
��0 >
(
��> ?
typeK
��? D
,
��D E%
createdObjectReferences
��F ]
)
��] ^
;
��^ _
if
�� 
(
�� 
newKey
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 
null
�� 
;
��  
}
�� 
bool
�� 
containsKey
��  
=
��! "
(
��# $
bool
��$ (
)
��( )
containsMethod
��) 7
.
��7 8
Invoke
��8 >
(
��> ?
result
��? E
,
��E F
new
��G J
object
��K Q
[
��Q R
]
��R S
{
��T U
newKey
��V \
}
��] ^
)
��^ _
;
��_ `
if
�� 
(
�� 
!
�� 
containsKey
��  
)
��  !
{
�� 
object
�� 
newValue
�� #
=
��$ %
objectGenerator
��& 5
.
��5 6
GenerateObject
��6 D
(
��D E
typeV
��E J
,
��J K%
createdObjectReferences
��L c
)
��c d
;
��d e
	addMethod
�� 
.
�� 
Invoke
�� $
(
��$ %
result
��% +
,
��+ ,
new
��- 0
object
��1 7
[
��7 8
]
��8 9
{
��: ;
newKey
��< B
,
��B C
newValue
��D L
}
��M N
)
��N O
;
��O P
}
�� 
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
�� 
GenerateEnum
�� *
(
��* +
Type
��+ /
enumType
��0 8
)
��8 9
{
�� 	
Array
�� 
possibleValues
��  
=
��! "
Enum
��# '
.
��' (
	GetValues
��( 1
(
��1 2
enumType
��2 :
)
��: ;
;
��; <
if
�� 
(
�� 
possibleValues
�� 
.
�� 
Length
�� %
>
��& '
$num
��( )
)
��) *
{
�� 
return
�� 
possibleValues
�� %
.
��% &
GetValue
��& .
(
��. /
$num
��/ 0
)
��0 1
;
��1 2
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
�� 
GenerateQueryable
�� /
(
��/ 0
Type
��0 4
queryableType
��5 B
,
��B C
int
��D G
size
��H L
,
��L M

Dictionary
��N X
<
��X Y
Type
��Y ]
,
��] ^
object
��_ e
>
��e f%
createdObjectReferences
��g ~
)
��~ 
{
�� 	
bool
�� 
	isGeneric
�� 
=
�� 
queryableType
�� *
.
��* +
IsGenericType
��+ 8
;
��8 9
object
�� 
list
�� 
;
�� 
if
�� 
(
�� 
	isGeneric
�� 
)
�� 
{
�� 
Type
�� 
listType
�� 
=
�� 
typeof
��  &
(
��& '
List
��' +
<
��+ ,
>
��, -
)
��- .
.
��. /
MakeGenericType
��/ >
(
��> ?
queryableType
��? L
.
��L M!
GetGenericArguments
��M `
(
��` a
)
��a b
)
��b c
;
��c d
list
�� 
=
��  
GenerateCollection
�� )
(
��) *
listType
��* 2
,
��2 3
size
��4 8
,
��8 9%
createdObjectReferences
��: Q
)
��Q R
;
��R S
}
�� 
else
�� 
{
�� 
list
�� 
=
�� 
GenerateArray
�� $
(
��$ %
typeof
��% +
(
��+ ,
object
��, 2
[
��2 3
]
��3 4
)
��4 5
,
��5 6
size
��7 ;
,
��; <%
createdObjectReferences
��= T
)
��T U
;
��U V
}
�� 
if
�� 
(
�� 
list
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
if
�� 
(
�� 
	isGeneric
�� 
)
�� 
{
�� 
Type
�� 
argumentType
�� !
=
��" #
typeof
��$ *
(
��* +
IEnumerable
��+ 6
<
��6 7
>
��7 8
)
��8 9
.
��9 :
MakeGenericType
��: I
(
��I J
queryableType
��J W
.
��W X!
GetGenericArguments
��X k
(
��k l
)
��l m
)
��m n
;
��n o

MethodInfo
�� 
asQueryableMethod
�� ,
=
��- .
typeof
��/ 5
(
��5 6
	Queryable
��6 ?
)
��? @
.
��@ A
	GetMethod
��A J
(
��J K
$str
��K X
,
��X Y
new
��Z ]
[
��] ^
]
��^ _
{
��` a
argumentType
��b n
}
��o p
)
��p q
;
��q r
return
�� 
asQueryableMethod
�� (
.
��( )
Invoke
��) /
(
��/ 0
null
��0 4
,
��4 5
new
��6 9
[
��9 :
]
��: ;
{
��< =
list
��> B
}
��C D
)
��D E
;
��E F
}
�� 
return
�� 
	Queryable
�� 
.
�� 
AsQueryable
�� (
(
��( )
(
��) *
IEnumerable
��* 5
)
��5 6
list
��6 :
)
��: ;
;
��; <
}
�� 	
private
�� 
static
�� 
object
��  
GenerateCollection
�� 0
(
��0 1
Type
��1 5
collectionType
��6 D
,
��D E
int
��F I
size
��J N
,
��N O

Dictionary
��P Z
<
��Z [
Type
��[ _
,
��_ `
object
��a g
>
��g h&
createdObjectReferences��i �
)��� �
{
�� 	
Type
�� 
type
�� 
=
�� 
collectionType
�� &
.
��& '
IsGenericType
��' 4
?
��5 6
collectionType
�� 
.
�� !
GetGenericArguments
�� 2
(
��2 3
)
��3 4
[
��4 5
$num
��5 6
]
��6 7
:
��8 9
typeof
�� 
(
�� 
object
�� 
)
�� 
;
�� 
object
�� 
result
�� 
=
�� 
	Activator
�� %
.
��% &
CreateInstance
��& 4
(
��4 5
collectionType
��5 C
)
��C D
;
��D E

MethodInfo
�� 
	addMethod
��  
=
��! "
collectionType
��# 1
.
��1 2
	GetMethod
��2 ;
(
��; <
$str
��< A
)
��A B
;
��B C
bool
��  
areAllElementsNull
�� #
=
��$ %
true
��& *
;
��* +
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
size
��  $
;
��$ %
i
��& '
++
��' )
)
��) *
{
�� 
object
�� 
element
�� 
=
��  
objectGenerator
��! 0
.
��0 1
GenerateObject
��1 ?
(
��? @
type
��@ D
,
��D E%
createdObjectReferences
��F ]
)
��] ^
;
��^ _
	addMethod
�� 
.
�� 
Invoke
��  
(
��  !
result
��! '
,
��' (
new
��) ,
object
��- 3
[
��3 4
]
��4 5
{
��6 7
element
��8 ?
}
��@ A
)
��A B
;
��B C 
areAllElementsNull
�� "
&=
��# %
element
��& -
==
��. 0
null
��1 5
;
��5 6
}
�� 
if
�� 
(
��  
areAllElementsNull
�� "
)
��" #
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
object
�� 
GenerateNullable
�� .
(
��. /
Type
��/ 3
nullableType
��4 @
,
��@ A

Dictionary
��B L
<
��L M
Type
��M Q
,
��Q R
object
��S Y
>
��Y Z%
createdObjectReferences
��[ r
)
��r s
{
�� 	
Type
�� 
type
�� 
=
�� 
nullableType
�� $
.
��$ %!
GetGenericArguments
��% 8
(
��8 9
)
��9 :
[
��: ;
$num
��; <
]
��< =
;
��= >
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
return
�� 
objectGenerator
�� "
.
��" #
GenerateObject
��# 1
(
��1 2
type
��2 6
,
��6 7%
createdObjectReferences
��8 O
)
��O P
;
��P Q
}
�� 	
private
�� 
static
�� 
object
�� #
GenerateComplexObject
�� 3
(
��3 4
Type
��4 8
type
��9 =
,
��= >

Dictionary
��? I
<
��I J
Type
��J N
,
��N O
object
��P V
>
��V W%
createdObjectReferences
��X o
)
��o p
{
�� 	
object
�� 
result
�� 
=
�� 
null
��  
;
��  !
if
�� 
(
�� %
createdObjectReferences
�� '
.
��' (
TryGetValue
��( 3
(
��3 4
type
��4 8
,
��8 9
out
��: =
result
��> D
)
��D E
)
��E F
{
�� 
return
�� 
result
�� 
;
�� 
}
�� 
if
�� 
(
�� 
type
�� 
.
�� 
IsValueType
��  
)
��  !
{
�� 
result
�� 
=
�� 
	Activator
�� "
.
��" #
CreateInstance
��# 1
(
��1 2
type
��2 6
)
��6 7
;
��7 8
}
�� 
else
�� 
{
�� 
ConstructorInfo
�� 
defaultCtor
��  +
=
��, -
type
��. 2
.
��2 3
GetConstructor
��3 A
(
��A B
Type
��B F
.
��F G

EmptyTypes
��G Q
)
��Q R
;
��R S
if
�� 
(
�� 
defaultCtor
�� 
==
��  "
null
��# '
)
��' (
{
�� 
return
�� 
null
�� 
;
��  
}
�� 
result
�� 
=
�� 
defaultCtor
�� $
.
��$ %
Invoke
��% +
(
��+ ,
new
��, /
object
��0 6
[
��6 7
$num
��7 8
]
��8 9
)
��9 :
;
��: ;
}
�� %
createdObjectReferences
�� #
.
��# $
Add
��$ '
(
��' (
type
��( ,
,
��, -
result
��. 4
)
��4 5
;
��5 6!
SetPublicProperties
�� 
(
��  
type
��  $
,
��$ %
result
��& ,
,
��, -%
createdObjectReferences
��. E
)
��E F
;
��F G
SetPublicFields
�� 
(
�� 
type
��  
,
��  !
result
��" (
,
��( )%
createdObjectReferences
��* A
)
��A B
;
��B C
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� !
SetPublicProperties
�� /
(
��/ 0
Type
��0 4
type
��5 9
,
��9 :
object
��; A
obj
��B E
,
��E F

Dictionary
��G Q
<
��Q R
Type
��R V
,
��V W
object
��X ^
>
��^ _%
createdObjectReferences
��` w
)
��w x
{
�� 	
PropertyInfo
�� 
[
�� 
]
�� 

properties
�� %
=
��& '
type
��( ,
.
��, -
GetProperties
��- :
(
��: ;
BindingFlags
��; G
.
��G H
Public
��H N
|
��O P
BindingFlags
��Q ]
.
��] ^
Instance
��^ f
)
��f g
;
��g h
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
foreach
�� 
(
�� 
PropertyInfo
�� !
property
��" *
in
��+ -

properties
��. 8
)
��8 9
{
�� 
if
�� 
(
�� 
property
�� 
.
�� 
CanWrite
�� %
)
��% &
{
�� 
object
�� 
propertyValue
�� (
=
��) *
objectGenerator
��+ :
.
��: ;
GenerateObject
��; I
(
��I J
property
��J R
.
��R S
PropertyType
��S _
,
��_ `%
createdObjectReferences
��a x
)
��x y
;
��y z
property
�� 
.
�� 
SetValue
�� %
(
��% &
obj
��& )
,
��) *
propertyValue
��+ 8
,
��8 9
null
��: >
)
��> ?
;
��? @
}
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
SetPublicFields
�� +
(
��+ ,
Type
��, 0
type
��1 5
,
��5 6
object
��7 =
obj
��> A
,
��A B

Dictionary
��C M
<
��M N
Type
��N R
,
��R S
object
��T Z
>
��Z [%
createdObjectReferences
��\ s
)
��s t
{
�� 	
	FieldInfo
�� 
[
�� 
]
�� 
fields
�� 
=
��  
type
��! %
.
��% &
	GetFields
��& /
(
��/ 0
BindingFlags
��0 <
.
��< =
Public
��= C
|
��D E
BindingFlags
��F R
.
��R S
Instance
��S [
)
��[ \
;
��\ ]
ObjectGenerator
�� 
objectGenerator
�� +
=
��, -
new
��. 1
ObjectGenerator
��2 A
(
��A B
)
��B C
;
��C D
foreach
�� 
(
�� 
	FieldInfo
�� 
field
�� $
in
��% '
fields
��( .
)
��. /
{
�� 
object
�� 

fieldValue
�� !
=
��" #
objectGenerator
��$ 3
.
��3 4
GenerateObject
��4 B
(
��B C
field
��C H
.
��H I
	FieldType
��I R
,
��R S%
createdObjectReferences
��T k
)
��k l
;
��l m
field
�� 
.
�� 
SetValue
�� 
(
�� 
obj
�� "
,
��" #

fieldValue
��$ .
)
��. /
;
��/ 0
}
�� 
}
�� 	
private
�� 
class
�� '
SimpleTypeObjectGenerator
�� /
{
�� 	
private
�� 
long
�� 
_index
�� 
=
��  !
$num
��" #
;
��# $
private
�� 
static
�� 
readonly
�� #

Dictionary
��$ .
<
��. /
Type
��/ 3
,
��3 4
Func
��5 9
<
��9 :
long
��: >
,
��> ?
object
��@ F
>
��F G
>
��G H
DefaultGenerators
��I Z
=
��[ \"
InitializeGenerators
��] q
(
��q r
)
��r s
;
��s t
[
�� 
SuppressMessage
�� 
(
�� 
$str
�� 8
,
��8 9
$str
��: [
,
��[ \
Justification
��] j
=
��k l
$str��m �
)��� �
]��� �
private
�� 
static
�� 

Dictionary
�� %
<
��% &
Type
��& *
,
��* +
Func
��, 0
<
��0 1
long
��1 5
,
��5 6
object
��7 =
>
��= >
>
��> ?"
InitializeGenerators
��@ T
(
��T U
)
��U V
{
�� 
return
�� 
new
�� 

Dictionary
�� %
<
��% &
Type
��& *
,
��* +
Func
��, 0
<
��0 1
long
��1 5
,
��5 6
object
��7 =
>
��= >
>
��> ?
{
�� 
{
�� 
typeof
�� 
(
�� 
Boolean
�� $
)
��$ %
,
��% &
index
��' ,
=>
��- /
true
��0 4
}
��5 6
,
��6 7
{
�� 
typeof
�� 
(
�� 
Byte
�� !
)
��! "
,
��" #
index
��$ )
=>
��* ,
(
��- .
Byte
��. 2
)
��2 3
$num
��3 5
}
��6 7
,
��7 8
{
�� 
typeof
�� 
(
�� 
Char
�� !
)
��! "
,
��" #
index
��$ )
=>
��* ,
(
��- .
Char
��. 2
)
��2 3
$num
��3 5
}
��6 7
,
��7 8
{
�� 
typeof
�� 
(
�� 
DateTime
�� %
)
��% &
,
��& '
index
��( -
=>
��. 0
DateTime
��1 9
.
��9 :
Now
��: =
}
��> ?
,
��? @
{
�� 
typeof
�� 
(
�� 
DateTimeOffset
�� +
)
��+ ,
,
��, -
index
��. 3
=>
��4 6
new
��7 :
DateTimeOffset
��; I
(
��I J
DateTime
��J R
.
��R S
Now
��S V
)
��V W
}
��X Y
,
��Y Z
{
�� 
typeof
�� 
(
�� 
DBNull
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
DBNull
��/ 5
.
��5 6
Value
��6 ;
}
��< =
,
��= >
{
�� 
typeof
�� 
(
�� 
Decimal
�� $
)
��$ %
,
��% &
index
��' ,
=>
��- /
(
��0 1
Decimal
��1 8
)
��8 9
index
��9 >
}
��? @
,
��@ A
{
�� 
typeof
�� 
(
�� 
Double
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
(
��/ 0
Double
��0 6
)
��6 7
(
��7 8
index
��8 =
+
��> ?
$num
��@ C
)
��C D
}
��E F
,
��F G
{
�� 
typeof
�� 
(
�� 
Guid
�� !
)
��! "
,
��" #
index
��$ )
=>
��* ,
Guid
��- 1
.
��1 2
NewGuid
��2 9
(
��9 :
)
��: ;
}
��< =
,
��= >
{
�� 
typeof
�� 
(
�� 
Int16
�� "
)
��" #
,
��# $
index
��% *
=>
��+ -
(
��. /
Int16
��/ 4
)
��4 5
(
��5 6
index
��6 ;
%
��< =
Int16
��> C
.
��C D
MaxValue
��D L
)
��L M
}
��N O
,
��O P
{
�� 
typeof
�� 
(
�� 
Int32
�� "
)
��" #
,
��# $
index
��% *
=>
��+ -
(
��. /
Int32
��/ 4
)
��4 5
(
��5 6
index
��6 ;
%
��< =
Int32
��> C
.
��C D
MaxValue
��D L
)
��L M
}
��N O
,
��O P
{
�� 
typeof
�� 
(
�� 
Int64
�� "
)
��" #
,
��# $
index
��% *
=>
��+ -
(
��. /
Int64
��/ 4
)
��4 5
index
��5 :
}
��; <
,
��< =
{
�� 
typeof
�� 
(
�� 
Object
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
new
��/ 2
object
��3 9
(
��9 :
)
��: ;
}
��< =
,
��= >
{
�� 
typeof
�� 
(
�� 
SByte
�� "
)
��" #
,
��# $
index
��% *
=>
��+ -
(
��. /
SByte
��/ 4
)
��4 5
$num
��5 7
}
��8 9
,
��9 :
{
�� 
typeof
�� 
(
�� 
Single
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
(
��/ 0
Single
��0 6
)
��6 7
(
��7 8
index
��8 =
+
��> ?
$num
��@ C
)
��C D
}
��E F
,
��F G
{
�� 
typeof
�� 
(
�� 
String
�� %
)
��% &
,
��& '
index
��( -
=>
��. 0
{
�� 
return
�� "
String
��# )
.
��) *
Format
��* 0
(
��0 1
CultureInfo
��1 <
.
��< =
CurrentCulture
��= K
,
��K L
$str
��M `
,
��` a
index
��b g
)
��g h
;
��h i
}
�� 
}
�� 
,
�� 
{
�� 
typeof
�� 
(
�� 
TimeSpan
�� '
)
��' (
,
��( )
index
��* /
=>
��0 2
{
�� 
return
�� "
TimeSpan
��# +
.
��+ ,
	FromTicks
��, 5
(
��5 6
$num
��6 =
)
��= >
;
��> ?
}
�� 
}
�� 
,
�� 
{
�� 
typeof
�� 
(
�� 
UInt16
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
(
��/ 0
UInt16
��0 6
)
��6 7
(
��7 8
index
��8 =
%
��> ?
UInt16
��@ F
.
��F G
MaxValue
��G O
)
��O P
}
��Q R
,
��R S
{
�� 
typeof
�� 
(
�� 
UInt32
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
(
��/ 0
UInt32
��0 6
)
��6 7
(
��7 8
index
��8 =
%
��> ?
UInt32
��@ F
.
��F G
MaxValue
��G O
)
��O P
}
��Q R
,
��R S
{
�� 
typeof
�� 
(
�� 
UInt64
�� #
)
��# $
,
��$ %
index
��& +
=>
��, .
(
��/ 0
UInt64
��0 6
)
��6 7
index
��7 <
}
��= >
,
��> ?
{
�� 
typeof
�� 
(
�� 
Uri
�� "
)
��" #
,
��# $
index
��% *
=>
��+ -
{
�� 
return
�� "
new
��# &
Uri
��' *
(
��* +
String
��+ 1
.
��1 2
Format
��2 8
(
��8 9
CultureInfo
��9 D
.
��D E
CurrentCulture
��E S
,
��S T
$str
��U s
,
��s t
index
��u z
)
��z {
)
��{ |
;
��| }
}
�� 
}
�� 
,
�� 
}
�� 
;
�� 
}
�� 
public
�� 
static
�� 
bool
�� 
CanGenerateObject
�� 0
(
��0 1
Type
��1 5
type
��6 :
)
��: ;
{
�� 
return
�� 
DefaultGenerators
�� (
.
��( )
ContainsKey
��) 4
(
��4 5
type
��5 9
)
��9 :
;
��: ;
}
�� 
public
�� 
object
�� 
GenerateObject
�� (
(
��( )
Type
��) -
type
��. 2
)
��2 3
{
�� 
return
�� 
DefaultGenerators
�� (
[
��( )
type
��) -
]
��- .
(
��. /
++
��/ 1
_index
��1 7
)
��7 8
;
��8 9
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\SampleDirection.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

enum 
SampleDirection 
{ 
Request 
= 
$num 
, 
Response		 
}

 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\SampleGeneration\TextSample.cs
	namespace 	
RestaurantService
 
. 
Areas !
.! "
HelpPage" *
{ 
public 

class 

TextSample 
{		 
public

 

TextSample

 
(

 
string

  
text

! %
)

% &
{ 	
if 
( 
text 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 6
)6 7
;7 8
} 
Text 
= 
text 
; 
} 	
public 
string 
Text 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	

TextSample 
other 
= 
obj "
as# %

TextSample& 0
;0 1
return 
other 
!= 
null  
&&! #
Text$ (
==) +
other, 1
.1 2
Text2 6
;6 7
} 	
public 
override 
int 
GetHashCode '
(' (
)( )
{ 	
return 
Text 
. 
GetHashCode #
(# $
)$ %
;% &
} 	
public   
override   
string   
ToString   '
(  ' (
)  ( )
{!! 	
return"" 
Text"" 
;"" 
}## 	
}$$ 
}%% �w
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Areas\HelpPage\XmlDocumentationProvider.cs
	namespace

 	
RestaurantService


 
.

 
Areas

 !
.

! "
HelpPage

" *
{ 
public 

class $
XmlDocumentationProvider )
:* +"
IDocumentationProvider, B
,B C'
IModelDocumentationProviderD _
{ 
private 
XPathNavigator 
_documentNavigator 1
;1 2
private 
const 
string 
TypeExpression +
=, -
$str. R
;R S
private 
const 
string 
MethodExpression -
=. /
$str0 T
;T U
private 
const 
string 
PropertyExpression /
=0 1
$str2 V
;V W
private 
const 
string 
FieldExpression ,
=- .
$str/ S
;S T
private 
const 
string 
ParameterExpression 0
=1 2
$str3 G
;G H
public $
XmlDocumentationProvider '
(' (
string( .
documentPath/ ;
); <
{ 	
if 
( 
documentPath 
== 
null  $
)$ %
{ 
throw   
new   !
ArgumentNullException   /
(  / 0
$str  0 >
)  > ?
;  ? @
}!! 
XPathDocument"" 
xpath"" 
=""  !
new""" %
XPathDocument""& 3
(""3 4
documentPath""4 @
)""@ A
;""A B
_documentNavigator## 
=##  
xpath##! &
.##& '
CreateNavigator##' 6
(##6 7
)##7 8
;##8 9
}$$ 	
public&& 
string&& 
GetDocumentation&& &
(&&& '$
HttpControllerDescriptor&&' ? 
controllerDescriptor&&@ T
)&&T U
{'' 	
XPathNavigator(( 
typeNode(( #
=(($ %
GetTypeNode((& 1
(((1 2 
controllerDescriptor((2 F
.((F G
ControllerType((G U
)((U V
;((V W
return)) 
GetTagValue)) 
()) 
typeNode)) '
,))' (
$str))) 2
)))2 3
;))3 4
}** 	
public,, 
virtual,, 
string,, 
GetDocumentation,, .
(,,. / 
HttpActionDescriptor,,/ C
actionDescriptor,,D T
),,T U
{-- 	
XPathNavigator.. 

methodNode.. %
=..& '
GetMethodNode..( 5
(..5 6
actionDescriptor..6 F
)..F G
;..G H
return// 
GetTagValue// 
(// 

methodNode// )
,//) *
$str//+ 4
)//4 5
;//5 6
}00 	
public22 
virtual22 
string22 
GetDocumentation22 .
(22. /#
HttpParameterDescriptor22/ F
parameterDescriptor22G Z
)22Z [
{33 	,
 ReflectedHttpParameterDescriptor44 ,(
reflectedParameterDescriptor44- I
=44J K
parameterDescriptor44L _
as44` b-
 ReflectedHttpParameterDescriptor	44c �
;
44� �
if55 
(55 (
reflectedParameterDescriptor55 ,
!=55- /
null550 4
)554 5
{66 
XPathNavigator77 

methodNode77 )
=77* +
GetMethodNode77, 9
(779 :(
reflectedParameterDescriptor77: V
.77V W
ActionDescriptor77W g
)77g h
;77h i
if88 
(88 

methodNode88 
!=88 !
null88" &
)88& '
{99 
string:: 
parameterName:: (
=::) *(
reflectedParameterDescriptor::+ G
.::G H
ParameterInfo::H U
.::U V
Name::V Z
;::Z [
XPathNavigator;; "
parameterNode;;# 0
=;;1 2

methodNode;;3 =
.;;= >
SelectSingleNode;;> N
(;;N O
String;;O U
.;;U V
Format;;V \
(;;\ ]
CultureInfo;;] h
.;;h i
InvariantCulture;;i y
,;;y z 
ParameterExpression	;;{ �
,
;;� �
parameterName
;;� �
)
;;� �
)
;;� �
;
;;� �
if<< 
(<< 
parameterNode<< %
!=<<& (
null<<) -
)<<- .
{== 
return>> 
parameterNode>> ,
.>>, -
Value>>- 2
.>>2 3
Trim>>3 7
(>>7 8
)>>8 9
;>>9 :
}?? 
}@@ 
}AA 
returnCC 
nullCC 
;CC 
}DD 	
publicFF 
stringFF $
GetResponseDocumentationFF .
(FF. / 
HttpActionDescriptorFF/ C
actionDescriptorFFD T
)FFT U
{GG 	
XPathNavigatorHH 

methodNodeHH %
=HH& '
GetMethodNodeHH( 5
(HH5 6
actionDescriptorHH6 F
)HHF G
;HHG H
returnII 
GetTagValueII 
(II 

methodNodeII )
,II) *
$strII+ 4
)II4 5
;II5 6
}JJ 	
publicLL 
stringLL 
GetDocumentationLL &
(LL& '

MemberInfoLL' 1
memberLL2 8
)LL8 9
{MM 	
stringNN 

memberNameNN 
=NN 
StringNN  &
.NN& '
FormatNN' -
(NN- .
CultureInfoNN. 9
.NN9 :
InvariantCultureNN: J
,NNJ K
$strNNL U
,NNU V
GetTypeNameNNW b
(NNb c
memberNNc i
.NNi j
DeclaringTypeNNj w
)NNw x
,NNx y
member	NNz �
.
NN� �
Name
NN� �
)
NN� �
;
NN� �
stringOO 

expressionOO 
=OO 
memberOO  &
.OO& '

MemberTypeOO' 1
==OO2 4
MemberTypesOO5 @
.OO@ A
FieldOOA F
?OOG H
FieldExpressionOOI X
:OOY Z
PropertyExpressionOO[ m
;OOm n
stringPP 
selectExpressionPP #
=PP$ %
StringPP& ,
.PP, -
FormatPP- 3
(PP3 4
CultureInfoPP4 ?
.PP? @
InvariantCulturePP@ P
,PPP Q

expressionPPR \
,PP\ ]

memberNamePP^ h
)PPh i
;PPi j
XPathNavigatorQQ 
propertyNodeQQ '
=QQ( )
_documentNavigatorQQ* <
.QQ< =
SelectSingleNodeQQ= M
(QQM N
selectExpressionQQN ^
)QQ^ _
;QQ_ `
returnRR 
GetTagValueRR 
(RR 
propertyNodeRR +
,RR+ ,
$strRR- 6
)RR6 7
;RR7 8
}SS 	
publicUU 
stringUU 
GetDocumentationUU &
(UU& '
TypeUU' +
typeUU, 0
)UU0 1
{VV 	
XPathNavigatorWW 
typeNodeWW #
=WW$ %
GetTypeNodeWW& 1
(WW1 2
typeWW2 6
)WW6 7
;WW7 8
returnXX 
GetTagValueXX 
(XX 
typeNodeXX '
,XX' (
$strXX) 2
)XX2 3
;XX3 4
}YY 	
private[[ 
XPathNavigator[[ 
GetMethodNode[[ ,
([[, - 
HttpActionDescriptor[[- A
actionDescriptor[[B R
)[[R S
{\\ 	)
ReflectedHttpActionDescriptor]] )%
reflectedActionDescriptor]]* C
=]]D E
actionDescriptor]]F V
as]]W Y)
ReflectedHttpActionDescriptor]]Z w
;]]w x
if^^ 
(^^ %
reflectedActionDescriptor^^ )
!=^^* ,
null^^- 1
)^^1 2
{__ 
string`` 
selectExpression`` '
=``( )
String``* 0
.``0 1
Format``1 7
(``7 8
CultureInfo``8 C
.``C D
InvariantCulture``D T
,``T U
MethodExpression``V f
,``f g
GetMemberName``h u
(``u v&
reflectedActionDescriptor	``v �
.
``� �

MethodInfo
``� �
)
``� �
)
``� �
;
``� �
returnaa 
_documentNavigatoraa )
.aa) *
SelectSingleNodeaa* :
(aa: ;
selectExpressionaa; K
)aaK L
;aaL M
}bb 
returndd 
nulldd 
;dd 
}ee 	
privategg 
staticgg 
stringgg 
GetMemberNamegg +
(gg+ ,

MethodInfogg, 6
methodgg7 =
)gg= >
{hh 	
stringii 
nameii 
=ii 
Stringii  
.ii  !
Formatii! '
(ii' (
CultureInfoii( 3
.ii3 4
InvariantCultureii4 D
,iiD E
$striiF O
,iiO P
GetTypeNameiiQ \
(ii\ ]
methodii] c
.iic d
DeclaringTypeiid q
)iiq r
,iir s
methodiit z
.iiz {
Nameii{ 
)	ii �
;
ii� �
ParameterInfojj 
[jj 
]jj 

parametersjj &
=jj' (
methodjj) /
.jj/ 0
GetParametersjj0 =
(jj= >
)jj> ?
;jj? @
ifkk 
(kk 

parameterskk 
.kk 
Lengthkk !
!=kk" $
$numkk% &
)kk& '
{ll 
stringmm 
[mm 
]mm 
parameterTypeNamesmm +
=mm, -

parametersmm. 8
.mm8 9
Selectmm9 ?
(mm? @
parammm@ E
=>mmF H
GetTypeNamemmI T
(mmT U
parammmU Z
.mmZ [
ParameterTypemm[ h
)mmh i
)mmi j
.mmj k
ToArraymmk r
(mmr s
)mms t
;mmt u
namenn 
+=nn 
Stringnn 
.nn 
Formatnn %
(nn% &
CultureInfonn& 1
.nn1 2
InvariantCulturenn2 B
,nnB C
$strnnD K
,nnK L
StringnnM S
.nnS T
JoinnnT X
(nnX Y
$strnnY \
,nn\ ]
parameterTypeNamesnn^ p
)nnp q
)nnq r
;nnr s
}oo 
returnqq 
nameqq 
;qq 
}rr 	
privatett 
statictt 
stringtt 
GetTagValuett )
(tt) *
XPathNavigatortt* 8

parentNodett9 C
,ttC D
stringttE K
tagNamettL S
)ttS T
{uu 	
ifvv 
(vv 

parentNodevv 
!=vv 
nullvv "
)vv" #
{ww 
XPathNavigatorxx 
nodexx #
=xx$ %

parentNodexx& 0
.xx0 1
SelectSingleNodexx1 A
(xxA B
tagNamexxB I
)xxI J
;xxJ K
ifyy 
(yy 
nodeyy 
!=yy 
nullyy  
)yy  !
{zz 
return{{ 
node{{ 
.{{  
Value{{  %
.{{% &
Trim{{& *
({{* +
){{+ ,
;{{, -
}|| 
}}} 
return 
null 
; 
}
�� 	
private
�� 
XPathNavigator
�� 
GetTypeNode
�� *
(
��* +
Type
��+ /
type
��0 4
)
��4 5
{
�� 	
string
��  
controllerTypeName
�� %
=
��& '
GetTypeName
��( 3
(
��3 4
type
��4 8
)
��8 9
;
��9 :
string
�� 
selectExpression
�� #
=
��$ %
String
��& ,
.
��, -
Format
��- 3
(
��3 4
CultureInfo
��4 ?
.
��? @
InvariantCulture
��@ P
,
��P Q
TypeExpression
��R `
,
��` a 
controllerTypeName
��b t
)
��t u
;
��u v
return
��  
_documentNavigator
�� %
.
��% &
SelectSingleNode
��& 6
(
��6 7
selectExpression
��7 G
)
��G H
;
��H I
}
�� 	
private
�� 
static
�� 
string
�� 
GetTypeName
�� )
(
��) *
Type
��* .
type
��/ 3
)
��3 4
{
�� 	
string
�� 
name
�� 
=
�� 
type
�� 
.
�� 
FullName
�� '
;
��' (
if
�� 
(
�� 
type
�� 
.
�� 
IsGenericType
�� "
)
��" #
{
�� 
Type
�� 
genericType
��  
=
��! "
type
��# '
.
��' (&
GetGenericTypeDefinition
��( @
(
��@ A
)
��A B
;
��B C
Type
�� 
[
�� 
]
�� 
genericArguments
�� '
=
��( )
type
��* .
.
��. /!
GetGenericArguments
��/ B
(
��B C
)
��C D
;
��D E
string
�� 
genericTypeName
�� &
=
��' (
genericType
��) 4
.
��4 5
FullName
��5 =
;
��= >
genericTypeName
�� 
=
��  !
genericTypeName
��" 1
.
��1 2
	Substring
��2 ;
(
��; <
$num
��< =
,
��= >
genericTypeName
��? N
.
��N O
IndexOf
��O V
(
��V W
$char
��W Z
)
��Z [
)
��[ \
;
��\ ]
string
�� 
[
�� 
]
�� 
argumentTypeNames
�� *
=
��+ ,
genericArguments
��- =
.
��= >
Select
��> D
(
��D E
t
��E F
=>
��G I
GetTypeName
��J U
(
��U V
t
��V W
)
��W X
)
��X Y
.
��Y Z
ToArray
��Z a
(
��a b
)
��b c
;
��c d
name
�� 
=
�� 
String
�� 
.
�� 
Format
�� $
(
��$ %
CultureInfo
��% 0
.
��0 1
InvariantCulture
��1 A
,
��A B
$str
��C O
,
��O P
genericTypeName
��Q `
,
��` a
String
��b h
.
��h i
Join
��i m
(
��m n
$str
��n q
,
��q r 
argumentTypeNames��s �
)��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
type
�� 
.
�� 
IsNested
�� 
)
�� 
{
�� 
name
�� 
=
�� 
name
�� 
.
�� 
Replace
�� #
(
��# $
$str
��$ '
,
��' (
$str
��) ,
)
��, -
;
��- .
}
�� 
return
�� 
name
�� 
;
�� 
}
�� 	
}
�� 
}�� �!
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Controllers\CompanyController.cs
	namespace 	
RestaurantService
 
. 
Controllers '
{ 
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class 
CompanyController "
:# $
ApiController% 2
{ 
private 
BookingSystemDb 
_db  #
;# $
public 
CompanyController  
(  !
)! "
{ 	
_db 
= 
new 
BookingSystemDb %
(% &
)& '
;' (
} 	
public 
CompanyController  
(  !
BookingSystemDb! 0
db1 3
)3 4
{ 	
this   
.   
_db   
=   
db   
;   
}!! 	
[(( 	
Route((	 
((( 
$str(( 
)(( 
](( 
[)) 	
HttpGet))	 
])) 
public** 
async** 
Task** 
<** 
HttpResponseMessage** -
>**- .
Get**/ 2
(**2 3
)**3 4
{++ 	
Company,, 
res,, 
=,, 
await,, 
_db,,  #
.,,# $
	Companies,,$ -
.,,- .
Where,,. 3
(,,3 4
b,,4 5
=>,,6 8
!,,9 :
b,,: ;
.,,; <
Deleted,,< C
),,C D
.,,D E
FirstOrDefaultAsync,,E X
(,,X Y
),,Y Z
;,,Z [
if.. 
(.. 
res.. 
==.. 
null.. 
).. 
return// 
Request// 
.// 
CreateErrorResponse// 2
(//2 3
HttpStatusCode//3 A
.//A B
	NoContent//B K
,//K L
$str//M g
)//g h
;//h i
LibBookingService11 
.11 
Dtos11 "
.11" #
Company11# *
company11+ 2
=113 4
new115 8
LibBookingService119 J
.11J K
Dtos11K O
.11O P
Company11P W
{22 
Id33 
=33 
res33 
.33 
Id33 
,33 
Name44 
=44 
res44 
.44 
Name44 
,44  
Description55 
=55 
res55 !
.55! "
Description55" -
,55- .
PhoneNo66 
=66 
res66 
.66 
PhoneNo66 %
,66% &
AddressStreet77 
=77 
res77  #
.77# $
AddressStreet77$ 1
,771 2
AddressTown88 
=88 
res88 !
.88! "
AddressTown88" -
,88- .
AddressCounty99 
=99 
res99  #
.99# $
AddressCounty99$ 1
,991 2
AddressPostalCode:: !
=::" #
res::$ '
.::' (
AddressPostalCode::( 9
,::9 :
Email;; 
=;; 
res;; 
.;; 
Email;; !
,;;! "
Restaurants<< 
=<< 
res<< !
.<<! "
Restaurants<<" -
.<<- .
Select<<. 4
(<<4 5
r<<5 6
=><<7 9
new<<: =
LibBookingService<<> O
.<<O P
Dtos<<P T
.<<T U

Restaurant<<U _
{== 
Id>> 
=>> 
r>> 
.>> 
Id>> 
,>> 
Name?? 
=?? 
r?? 
.?? 
Name?? !
}@@ 
)@@ 
.@@ 
OrderBy@@ 
(@@ 
b@@ 
=>@@ 
b@@  !
.@@! "
Name@@" &
)@@& '
}AA 
;AA 
returnCC 
RequestCC 
.CC 
CreateResponseCC )
(CC) *
HttpStatusCodeCC* 8
.CC8 9
OKCC9 ;
,CC; <
companyCC= D
)CCD E
;CCE F
}DD 	
}EE 
}FF ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Controllers\RestaurantController.cs
	namespace 	
RestaurantService
 
. 
Controllers '
{ 
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class  
RestaurantController %
:& '
ApiController( 5
{ 
private 
BookingSystemDb 
_db  #
;# $
public  
RestaurantController #
(# $
)$ %
{ 	
_db 
= 
new 
BookingSystemDb %
(% &
)& '
;' (
} 	
public  
RestaurantController #
(# $
BookingSystemDb$ 3
db4 6
)6 7
{ 	
this   
.   
_db   
=   
db   
;   
}!! 	
[(( 	
Route((	 
((( 
$str(( 
)(( 
]((  
[)) 	
HttpGet))	 
])) 
public** 
async** 
Task** 
<** 
HttpResponseMessage** -
>**- .
Get**/ 2
(**2 3
int**3 6
id**7 9
=**: ;
-**< =
$num**= >
)**> ?
{++ 	
if,, 
(,, 
id,, 
!=,, 
-,, 
$num,, 
),, 
{-- 

Restaurant.. 
res.. 
=..  
await..! &
_db..' *
...* +
Restaurants..+ 6
...6 7
Where..7 <
(..< =
b..= >
=>..? A
b..B C
...C D
Id..D F
==..G I
id..J L
&&..M O
!..P Q
b..Q R
...R S
Deleted..S Z
)..Z [
...[ \
FirstOrDefaultAsync..\ o
(..o p
)..p q
;..q r
if00 
(00 
res00 
==00 
null00 
)00  
return11 
Request11 "
.11" #
CreateErrorResponse11# 6
(116 7
HttpStatusCode117 E
.11E F
	NoContent11F O
,11O P
$str11Q n
)11n o
;11o p
LibBookingService33 !
.33! "
Dtos33" &
.33& '

Restaurant33' 1

restaurant332 <
=33= >,
 CreateRestaurantFromDbRestaurant33? _
(33_ `
res33` c
)33c d
;33d e
return55 
Request55 
.55 
CreateResponse55 -
(55- .
HttpStatusCode55. <
.55< =
OK55= ?
,55? @

restaurant55A K
)55K L
;55L M
}66 
else77 
{88 
IEnumerable99 
<99 

Restaurant99 &
>99& '
res99( +
=99, -
await99. 3
_db994 7
.997 8
Restaurants998 C
.99C D
Where99D I
(99I J
b99J K
=>99L N
b99O P
.99P Q
Deleted99Q X
!=99Y [
true99\ `
)99` a
.99a b
ToListAsync99b m
(99m n
)99n o
;99o p
IEnumerable;; 
<;; 
LibBookingService;; -
.;;- .
Dtos;;. 2
.;;2 3

Restaurant;;3 =
>;;= >
restaurants;;? J
=;;K L
res;;M P
.;;P Q
Select;;Q W
(;;W X
b;;X Y
=>;;Z \,
 CreateRestaurantFromDbRestaurant;;] }
(;;} ~
b;;~ 
)	;; �
)
;;� �
.
;;� �
OrderBy
;;� �
(
;;� �
b
;;� �
=>
;;� �
b
;;� �
.
;;� �
Name
;;� �
)
;;� �
;
;;� �
return== 
restaurants== "
.==" #
Any==# &
(==& '
)==' (
?==) *
Request>> 
.>> 
CreateResponse>> *
(>>* +
HttpStatusCode>>+ 9
.>>9 :
OK>>: <
,>>< =
restaurants>>> I
)>>I J
:>>K L
Request?? 
.?? 
CreateErrorResponse?? /
(??/ 0
HttpStatusCode??0 >
.??> ?
	NoContent??? H
,??H I
$str??J Z
)??Z [
;??[ \
}@@ 
}AA 	
[HH 	
RouteHH	 
(HH 
$strHH 
)HH 
]HH 
[II 	
HttpPostII	 
]II 
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
HttpResponseMessageJJ -
>JJ- .
PostJJ/ 3
(JJ3 4
LibBookingServiceJJ4 E
.JJE F
DtosJJF J
.JJJ K

RestaurantJJK U

restaurantJJV `
)JJ` a
{KK 	
tryLL 
{MM 

RestaurantNN 
newRestaurantNN (
=NN) *
_dbNN+ .
.NN. /
RestaurantsNN/ :
.NN: ;
AddNN; >
(NN> ?
newNN? B

RestaurantNNC M
{OO 

Company_idPP 
=PP  

restaurantPP! +
.PP+ ,
	CompanyIdPP, 5
,PP5 6
NameQQ 
=QQ 

restaurantQQ %
.QQ% &
NameQQ& *
,QQ* +
PhoneNoRR 
=RR 

restaurantRR (
.RR( )
PhoneNoRR) 0
,RR0 1
AddressStreetSS !
=SS" #

restaurantSS$ .
.SS. /
AddressStreetSS/ <
,SS< =
AddressCountyTT !
=TT" #

restaurantTT$ .
.TT. /
AddressCountyTT/ <
,TT< =
AddressTownUU 
=UU  !

restaurantUU" ,
.UU, -
AddressTownUU- 8
,UU8 9
AddressPostalCodeVV %
=VV& '

restaurantVV( 2
.VV2 3
AddressPostalCodeVV3 D
}WW 
)WW 
;WW 
awaitXX 
_dbXX 
.XX 
SaveChangesAsyncXX *
(XX* +
)XX+ ,
;XX, -
ifZZ 
(ZZ 

restaurantZZ 
.ZZ 
TablesZZ %
!=ZZ& (
nullZZ) -
)ZZ- .
{[[ 
foreach\\ 
(\\ 
LibBookingService\\ .
.\\. /
Dtos\\/ 3
.\\3 4
Table\\4 9
t\\: ;
in\\< >

restaurant\\? I
.\\I J
Tables\\J P
)\\P Q
{]] 
_db^^ 
.^^ 
Tables^^ "
.^^" #
Add^^# &
(^^& '
new^^' *
Table^^+ 0
{__ 
Restaurant_id`` )
=``* +
newRestaurant``, 9
.``9 :
Id``: <
,``< =
AdditionalNotesaa +
=aa, -
taa. /
.aa/ 0
AdditionalNotesaa0 ?
,aa? @
NoSeatsbb #
=bb$ %
tbb& '
.bb' (
NoSeatsbb( /
,bb/ 0
Activecc "
=cc# $
tcc% &
.cc& '
Activecc' -
}dd 
)dd 
;dd 
awaitee 
_dbee !
.ee! "
SaveChangesAsyncee" 2
(ee2 3
)ee3 4
;ee4 5
}ff 
}gg 
ifii 
(ii 

restaurantii 
.ii 
	MenuItemsii (
!=ii) +
nullii, 0
)ii0 1
{jj 
foreachkk 
(kk 
LibBookingServicekk .
.kk. /
Dtoskk/ 3
.kk3 4
MenuItemkk4 <
mkk= >
inkk? A

restaurantkkB L
.kkL M
	MenuItemskkM V
)kkV W
{ll 
_dbmm 
.mm 
RestaurantMenuItemsmm /
.mm/ 0
Addmm0 3
(mm3 4
newmm4 7
RestaurantMenuItemmm8 J
{nn 
Restaurant_idoo )
=oo* +
newRestaurantoo, 9
.oo9 :
Idoo: <
,oo< =
MenuItem_idpp '
=pp( )
mpp* +
.pp+ ,
Idpp, .
}qq 
)qq 
;qq 
awaitrr 
_dbrr !
.rr! "
SaveChangesAsyncrr" 2
(rr2 3
)rr3 4
;rr4 5
}ss 
}tt 
returnvv 
Requestvv 
.vv 
CreateResponsevv -
(vv- .
HttpStatusCodevv. <
.vv< =
OKvv= ?
,vv? @,
 CreateRestaurantFromDbRestaurantvvA a
(vva b
newRestaurantvvb o
)vvo p
)vvp q
;vvq r
}ww 
catchxx 
(xx 
	Exceptionxx 
exxx 
)xx  
{yy 
returnzz 
Requestzz 
.zz 
CreateErrorResponsezz 2
(zz2 3
HttpStatusCodezz3 A
.zzA B
InternalServerErrorzzB U
,zzU V
$strzzW _
)zz_ `
;zz` a
}{{ 
}|| 	
[
�� 	
Route
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
[
�� 	

HttpDelete
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� !
HttpResponseMessage
�� -
>
��- .
Delete
��/ 5
(
��5 6
int
��6 9
id
��: <
)
��< =
{
�� 	
try
�� 
{
�� 

Restaurant
�� 

restaurant
�� %
=
��& '
await
��( -
_db
��. 1
.
��1 2
Restaurants
��2 =
.
��= >
Where
��> C
(
��C D
b
��D E
=>
��F H
b
��I J
.
��J K
Id
��K M
==
��N P
id
��Q S
)
��S T
.
��T U!
FirstOrDefaultAsync
��U h
(
��h i
)
��i j
;
��j k

restaurant
�� 
.
�� 
Deleted
�� "
=
��# $
true
��% )
;
��) *
_db
�� 
.
�� 
SetModified
�� 
(
��  

restaurant
��  *
)
��* +
;
��+ ,
await
�� 
_db
�� 
.
�� 
SaveChangesAsync
�� *
(
��* +
)
��+ ,
;
��, -
return
�� 
Request
�� 
.
�� 
CreateResponse
�� -
(
��- .
HttpStatusCode
��. <
.
��< =
OK
��= ?
,
��? @
$str
��A J
)
��J K
;
��K L
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� 2
(
��2 3
HttpStatusCode
��3 A
.
��A B!
InternalServerError
��B U
,
��U V
$str
��W _
)
��_ `
;
��` a
}
�� 
}
�� 	
[
�� 	
Route
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
[
�� 	
HttpPut
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� !
HttpResponseMessage
�� -
>
��- .
Update
��/ 5
(
��5 6
int
��6 9
id
��: <
,
��< =
LibBookingService
��> O
.
��O P
Dtos
��P T
.
��T U

Restaurant
��U _

restaurant
��` j
)
��j k
{
�� 	
try
�� 
{
�� 

Restaurant
�� 
r
�� 
=
�� 
await
�� $
_db
��% (
.
��( )
Restaurants
��) 4
.
��4 5
Where
��5 :
(
��: ;
rr
��; =
=>
��> @
rr
��A C
.
��C D
Id
��D F
==
��G I
id
��J L
)
��L M
.
��M N!
FirstOrDefaultAsync
��N a
(
��a b
)
��b c
;
��c d
r
�� 
.
�� 

Company_id
�� 
=
�� 

restaurant
�� )
.
��) *
	CompanyId
��* 3
;
��3 4
r
�� 
.
�� 
Name
�� 
=
�� 

restaurant
�� #
.
��# $
Name
��$ (
;
��( )
r
�� 
.
�� 
PhoneNo
�� 
=
�� 

restaurant
�� &
.
��& '
PhoneNo
��' .
;
��. /
r
�� 
.
�� 
AddressStreet
�� 
=
��  !

restaurant
��" ,
.
��, -
AddressStreet
��- :
;
��: ;
r
�� 
.
�� 
AddressCounty
�� 
=
��  !

restaurant
��" ,
.
��, -
AddressCounty
��- :
;
��: ;
r
�� 
.
�� 
AddressTown
�� 
=
�� 

restaurant
��  *
.
��* +
AddressTown
��+ 6
;
��6 7
r
�� 
.
�� 
AddressPostalCode
�� #
=
��$ %

restaurant
��& 0
.
��0 1
AddressPostalCode
��1 B
;
��B C
_db
�� 
.
�� 
SetModified
�� 
(
��  
r
��  !
)
��! "
;
��" #
await
�� 
_db
�� 
.
�� 
SaveChangesAsync
�� *
(
��* +
)
��+ ,
;
��, -
LibBookingService
�� !
.
��! "
Dtos
��" &
.
��& '

Restaurant
��' 1
res
��2 5
=
��6 7.
 CreateRestaurantFromDbRestaurant
��8 X
(
��X Y
r
��Y Z
)
��Z [
;
��[ \
return
�� 
Request
�� 
.
�� 
CreateResponse
�� -
(
��- .
HttpStatusCode
��. <
.
��< =
OK
��= ?
,
��? @
res
��A D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� 2
(
��2 3
HttpStatusCode
��3 A
.
��A B!
InternalServerError
��B U
,
��U V
$str
��W _
)
��_ `
;
��` a
}
�� 
}
�� 	
[
�� 	
Route
��	 
(
�� 
$str
�� 8
)
��8 9
]
��9 :
[
�� 	
HttpPut
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� !
HttpResponseMessage
�� -
>
��- .
AddMenuItem
��/ :
(
��: ;
int
��; >
id
��? A
,
��A B
int
��C F

menuItemId
��G Q
)
��Q R
{
�� 	
try
�� 
{
��  
RestaurantMenuItem
�� "
res
��# &
=
��' (
await
��) .
_db
��/ 2
.
��2 3!
RestaurantMenuItems
��3 F
.
��F G
Where
��G L
(
��L M
d
��M N
=>
��O Q
d
��R S
.
��S T
Restaurant_id
��T a
==
��b d
id
��e g
&&
��h j
d
��k l
.
��l m
MenuItem_id
��m x
==
��y {

menuItemId��| �
)��� �
.��� �#
FirstOrDefaultAsync��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
res
�� 
!=
�� 
null
�� 
)
��  
{
�� 
if
�� 
(
�� 
res
�� 
.
�� 
Deleted
�� #
)
��# $
{
�� 
res
�� 
.
�� 
Deleted
�� #
=
��$ %
false
��& +
;
��+ ,
_db
�� 
.
�� 
SetModified
�� '
(
��' (
res
��( +
)
��+ ,
;
��, -
await
�� 
_db
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
}
�� 
else
�� 
{
�� 
_db
�� 
.
�� !
RestaurantMenuItems
�� +
.
��+ ,
Add
��, /
(
��/ 0
new
��0 3 
RestaurantMenuItem
��4 F
{
�� 
Restaurant_id
�� %
=
��& '
id
��( *
,
��* +
MenuItem_id
�� #
=
��$ %

menuItemId
��& 0
}
�� 
)
�� 
;
�� 
await
�� 
_db
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
}
�� 
return
�� 
Request
�� 
.
�� 
CreateResponse
�� -
(
��- .
HttpStatusCode
��. <
.
��< =
OK
��= ?
,
��? @
$str
��A J
)
��J K
;
��K L
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� 2
(
��2 3
HttpStatusCode
��3 A
.
��A B!
InternalServerError
��B U
,
��U V
$str
��W _
)
��_ `
;
��` a
}
�� 
}
�� 	
[
�� 	
Route
��	 
(
�� 
$str
�� ;
)
��; <
]
��< =
[
�� 	

HttpDelete
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� !
HttpResponseMessage
�� -
>
��- .
RemoveMenuItem
��/ =
(
��= >
int
��> A
id
��B D
,
��D E
int
��F I

menuItemId
��J T
)
��T U
{
�� 	
try
�� 
{
��  
RestaurantMenuItem
�� "
res
��# &
=
��' (
await
��) .
_db
��/ 2
.
��2 3!
RestaurantMenuItems
��3 F
.
��F G
Where
��G L
(
��L M
d
��M N
=>
��O Q
d
��R S
.
��S T
Restaurant_id
��T a
==
��b d
id
��e g
&&
��h j
d
��k l
.
��l m
MenuItem_id
��m x
==
��y {

menuItemId��| �
)��� �
.��� �#
FirstOrDefaultAsync��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
res
�� 
==
�� 
null
�� 
)
��  
return
�� 
Request
�� "
.
��" #
CreateResponse
��# 1
(
��1 2
HttpStatusCode
��2 @
.
��@ A
OK
��A C
,
��C D
$str
��E n
)
��n o
;
��o p
res
�� 
.
�� 
Deleted
�� 
=
�� 
true
�� "
;
��" #
_db
�� 
.
�� 
SetModified
�� 
(
��  
res
��  #
)
��# $
;
��$ %
await
�� 
_db
�� 
.
�� 
SaveChangesAsync
�� *
(
��* +
)
��+ ,
;
��, -
return
�� 
Request
�� 
.
�� 
CreateResponse
�� -
(
��- .
HttpStatusCode
��. <
.
��< =
OK
��= ?
,
��? @
$str
��A J
)
��J K
;
��K L
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� 2
(
��2 3
HttpStatusCode
��3 A
.
��A B!
InternalServerError
��B U
,
��U V
$str
��W _
)
��_ `
;
��` a
}
�� 
}
�� 	
private
�� 
LibBookingService
�� !
.
��! "
Dtos
��" &
.
��& '

Restaurant
��' 1.
 CreateRestaurantFromDbRestaurant
��2 R
(
��R S

Restaurant
��S ]
r
��^ _
)
��_ `
{
�� 	
IEnumerable
�� 
<
�� 
Image
�� 
>
�� 
images
�� %
=
��& '
r
��( )
.
��) *
RestaurantImages
��* :
.
��: ;
Where
��; @
(
��@ A
m
��A B
=>
��C E
!
��F G
m
��G H
.
��H I
Deleted
��I P
)
��P Q
.
��Q R
Select
��R X
(
��X Y
m
��Y Z
=>
��[ ]
m
��^ _
.
��_ `
Image
��` e
)
��e f
.
��f g
Where
��g l
(
��l m
m
��m n
=>
��o q
!
��r s
m
��s t
.
��t u
Deleted
��u |
)
��| }
;
��} ~
return
�� 
new
�� 
LibBookingService
�� (
.
��( )
Dtos
��) -
.
��- .

Restaurant
��. 8
{
�� 
Id
�� 
=
�� 
r
�� 
.
�� 
Id
�� 
,
�� 
	CompanyId
�� 
=
�� 
r
�� 
.
�� 

Company_id
�� (
,
��( )
Name
�� 
=
�� 
r
�� 
.
�� 
Name
�� 
,
�� 
PhoneNo
�� 
=
�� 
r
�� 
.
�� 
PhoneNo
�� #
,
��# $
AddressStreet
�� 
=
�� 
r
��  !
.
��! "
AddressStreet
��" /
,
��/ 0
AddressCounty
�� 
=
�� 
r
��  !
.
��! "
AddressCounty
��" /
,
��/ 0
AddressTown
�� 
=
�� 
r
�� 
.
��  
AddressTown
��  +
,
��+ ,
AddressPostalCode
�� !
=
��" #
r
��$ %
.
��% &
AddressPostalCode
��& 7
,
��7 8
Tables
�� 
=
�� $
GetTablesForRestaurant
�� /
(
��/ 0
r
��0 1
)
��1 2
,
��2 3
	MenuItems
�� 
=
�� '
GetMenuItemsForRestaurant
�� 5
(
��5 6
r
��6 7
)
��7 8
,
��8 9
ImageIds
�� 
=
�� 
images
�� !
.
��! "
Select
��" (
(
��( )
i
��) *
=>
��+ -
i
��. /
.
��/ 0
Id
��0 2
)
��2 3
}
�� 
;
�� 
}
�� 	
private
�� 
IEnumerable
�� 
<
�� 
LibBookingService
�� -
.
��- .
Dtos
��. 2
.
��2 3
Table
��3 8
>
��8 9$
GetTablesForRestaurant
��: P
(
��P Q

Restaurant
��Q [

restaurant
��\ f
)
��f g
{
�� 	
IEnumerable
�� 
<
�� 
Table
�� 
>
�� 
restaurantTables
�� /
=
��0 1

restaurant
��2 <
.
��< =
Tables
��= C
.
��C D
Where
��D I
(
��I J
b
��J K
=>
��L N
!
��O P
b
��P Q
.
��Q R
Deleted
��R Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
restaurantTables
��  
.
��  !
Any
��! $
(
��$ %
)
��% &
)
��& '
return
�� 
restaurantTables
�� '
.
��' (
Select
��( .
(
��. /
t
��/ 0
=>
��1 3
new
��4 7
LibBookingService
��8 I
.
��I J
Dtos
��J N
.
��N O
Table
��O T
{
�� 
Id
�� 
=
�� 
t
�� 
.
�� 
Id
�� 
,
�� 
RestaurantId
��  
=
��! "
t
��# $
.
��$ %
Restaurant_id
��% 2
,
��2 3
TableNo
�� 
=
�� 
t
�� 
.
��  
TableNo
��  '
,
��' (
NoSeats
�� 
=
�� 
t
�� 
.
��  
NoSeats
��  '
,
��' (
AdditionalNotes
�� #
=
��$ %
t
��& '
.
��' (
AdditionalNotes
��( 7
,
��7 8
Active
�� 
=
�� 
t
�� 
.
�� 
Active
�� %
}
�� 
)
�� 
;
�� 
return
�� 

Enumerable
�� 
.
�� 
Empty
�� #
<
��# $
LibBookingService
��$ 5
.
��5 6
Dtos
��6 :
.
��: ;
Table
��; @
>
��@ A
(
��A B
)
��B C
;
��C D
}
�� 	
private
�� 
IEnumerable
�� 
<
�� 
LibBookingService
�� -
.
��- .
Dtos
��. 2
.
��2 3
MenuItem
��3 ;
>
��; <'
GetMenuItemsForRestaurant
��= V
(
��V W

Restaurant
��W a

restaurant
��b l
)
��l m
{
�� 	
IEnumerable
�� 
<
�� 
MenuItem
��  
>
��  !!
restaurantMenuItems
��" 5
=
��6 7

restaurant
��8 B
.
��B C!
RestaurantMenuItems
��C V
.
��V W
Where
��W \
(
��\ ]
r
��] ^
=>
��_ a
!
��b c
r
��c d
.
��d e
Deleted
��e l
)
��l m
.
��m n
Select
��n t
(
��t u
r
��u v
=>
��w y
r
��z {
.
��{ |
MenuItem��| �
)��� �
;��� �
if
�� 
(
�� !
restaurantMenuItems
�� #
.
��# $
Any
��$ '
(
��' (
)
��( )
)
��) *
return
�� !
restaurantMenuItems
�� *
.
��* +
Select
��+ 1
(
��1 2
mi
��2 4
=>
��5 7
new
��8 ;
LibBookingService
��< M
.
��M N
Dtos
��N R
.
��R S
MenuItem
��S [
{
�� 
Id
�� 
=
�� 
mi
�� 
.
�� 
Id
�� 
,
�� 
Name
�� 
=
�� 
mi
�� 
.
�� 
Name
�� "
,
��" #
Description
�� 
=
��  !
mi
��" $
.
��$ %
Description
��% 0
,
��0 1
Price
�� 
=
�� 
Convert
�� #
.
��# $
ToDouble
��$ ,
(
��, -
mi
��- /
.
��/ 0
Price
��0 5
)
��5 6
,
��6 7
DietInfo
�� 
=
�� 
mi
�� !
.
��! " 
MenuItemDietInfoes
��" 4
.
��4 5
Where
��5 :
(
��: ;
m
��; <
=>
��= ?
!
��@ A
m
��A B
.
��B C
Deleted
��C J
)
��J K
.
��K L
Select
��L R
(
��R S
m
��S T
=>
��U W
m
��X Y
.
��Y Z
DietInfo
��Z b
)
��b c
.
��c d
Where
��d i
(
��i j
m
��j k
=>
��l n
!
��o p
m
��p q
.
��q r
Deleted
��r y
)
��y z
.
��z {
Select��{ �
(��� �
m��� �
=>��� �
new��� �!
LibBookingService��� �
.��� �
Dtos��� �
.��� �
DietInfo��� �
{
�� 
Id
�� 
=
�� 
m
�� 
.
�� 
Id
�� !
,
��! "
Name
�� 
=
�� 
m
��  
.
��  !
Name
��! %
}
�� 
)
�� 
,
�� 
Types
�� 
=
�� 
mi
�� 
.
�� 
MenuItemTypes
�� ,
.
��, -
Where
��- 2
(
��2 3
t
��3 4
=>
��5 7
!
��8 9
t
��9 :
.
��: ;
Deleted
��; B
)
��B C
.
��C D
Select
��D J
(
��J K
t
��K L
=>
��M O
t
��P Q
.
��Q R
Type
��R V
)
��V W
.
��W X
Where
��X ]
(
��] ^
t
��^ _
=>
��` b
!
��c d
t
��d e
.
��e f
Deleted
��f m
)
��m n
.
��n o
Select
��o u
(
��u v
t
��v w
=>
��x z
new
��{ ~ 
LibBookingService�� �
.��� �
Dtos��� �
.��� �
MenuItemType��� �
{
�� 
Id
�� 
=
�� 
t
�� 
.
�� 
Id
�� !
,
��! "
Name
�� 
=
�� 
t
��  
.
��  !
Name
��! %
}
�� 
)
�� 
,
�� 
ImageId
�� 
=
�� 
mi
��  
.
��  !
MenuItemImages
��! /
.
��/ 0
Where
��0 5
(
��5 6
m
��6 7
=>
��8 :
!
��; <
m
��< =
.
��= >
Deleted
��> E
)
��E F
.
��F G
Select
��G M
(
��M N
m
��N O
=>
��P R
m
��S T
.
��T U
Image
��U Z
)
��Z [
.
��[ \
Where
��\ a
(
��a b
m
��b c
=>
��d f
!
��g h
m
��h i
.
��i j
Deleted
��j q
)
��q r
.
��r s
Any
��s v
(
��v w
)
��w x
?
�� 
mi
�� 
.
�� 
MenuItemImages
�� +
.
��+ ,
Where
��, 1
(
��1 2
m
��2 3
=>
��4 6
!
��7 8
m
��8 9
.
��9 :
Deleted
��: A
)
��A B
.
��B C
Select
��C I
(
��I J
m
��J K
=>
��L N
m
��O P
.
��P Q
Image
��Q V
)
��V W
.
��W X
Where
��X ]
(
��] ^
m
��^ _
=>
��` b
!
��c d
m
��d e
.
��e f
Deleted
��f m
)
��m n
.
��n o
First
��o t
(
��t u
)
��u v
.
��v w
Id
��w y
:
�� 
-
�� 
$num
�� 
}
�� 
)
�� 
;
�� 
return
�� 

Enumerable
�� 
.
�� 
Empty
�� #
<
��# $
LibBookingService
��$ 5
.
��5 6
Dtos
��6 :
.
��: ;
MenuItem
��; C
>
��C D
(
��D E
)
��E F
;
��F G
}
�� 	
}
�� 
}�� �`
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Controllers\TableController.cs
	namespace 	
RestaurantService
 
. 
Controllers '
{ 
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class 
TableController  
:! "
ApiController# 0
{ 
private 
BookingSystemDb 
_db  #
;# $
public 
TableController 
( 
)  
{ 	
_db 
= 
new 
BookingSystemDb %
(% &
)& '
;' (
} 	
public 
TableController 
( 
BookingSystemDb .
db/ 1
)1 2
{ 	
this   
.   
_db   
=   
db   
;   
}!! 	
[(( 	
Route((	 
((( 
$str(( 
)(( 
]((  
[)) 	
HttpGet))	 
])) 
public** 
async** 
Task** 
<** 
HttpResponseMessage** -
>**- .
Get**/ 2
(**2 3
int**3 6
id**7 9
=**: ;
-**< =
$num**= >
)**> ?
{++ 	
if,, 
(,, 
id,, 
!=,, 
-,, 
$num,, 
),, 
{-- 
Table.. 
res.. 
=.. 
await.. !
_db.." %
...% &
Tables..& ,
..., -
Where..- 2
(..2 3
b..3 4
=>..5 7
b..8 9
...9 :
Id..: <
==..= ?
id..@ B
&&..C E
!..F G
b..G H
...H I
Deleted..I P
)..P Q
...Q R
FirstOrDefaultAsync..R e
(..e f
)..f g
;..g h
if00 
(00 
res00 
==00 
null00 
)00  
return11 
Request11 "
.11" #
CreateErrorResponse11# 6
(116 7
HttpStatusCode117 E
.11E F
	NoContent11F O
,11O P
$str11Q i
)11i j
;11j k
LibBookingService33 !
.33! "
Dtos33" &
.33& '
Table33' ,

restaurant33- 7
=338 9"
CreateTableFromDbTable33: P
(33P Q
res33Q T
)33T U
;33U V
return55 
Request55 
.55 
CreateResponse55 -
(55- .
HttpStatusCode55. <
.55< =
OK55= ?
,55? @

restaurant55A K
)55K L
;55L M
}66 
else77 
{88 
IEnumerable99 
<99 
Table99 !
>99! "
res99# &
=99' (
await99) .
_db99/ 2
.992 3
Tables993 9
.999 :
Where99: ?
(99? @
b99@ A
=>99B D
b99E F
.99F G
Deleted99G N
!=99O Q
true99R V
)99V W
.99W X
ToListAsync99X c
(99c d
)99d e
;99e f
IEnumerable;; 
<;; 
LibBookingService;; -
.;;- .
Dtos;;. 2
.;;2 3
Table;;3 8
>;;8 9
restaurants;;: E
=;;F G
res;;H K
.;;K L
Select;;L R
(;;R S
b;;S T
=>;;U W"
CreateTableFromDbTable;;X n
(;;n o
b;;o p
);;p q
);;q r
.;;r s
OrderBy;;s z
(;;z {
b;;{ |
=>;;} 
b
;;� �
.
;;� �
TableNo
;;� �
)
;;� �
;
;;� �
return== 
restaurants== "
.==" #
Any==# &
(==& '
)==' (
?==) *
Request>> 
.>> 
CreateResponse>> *
(>>* +
HttpStatusCode>>+ 9
.>>9 :
OK>>: <
,>>< =
restaurants>>> I
)>>I J
:>>K L
Request?? 
.?? 
CreateErrorResponse?? /
(??/ 0
HttpStatusCode??0 >
.??> ?
	NoContent??? H
,??H I
$str??J Z
)??Z [
;??[ \
}@@ 
}AA 	
[HH 	
RouteHH	 
(HH 
$strHH 
)HH 
]HH 
[II 	
HttpPostII	 
]II 
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
HttpResponseMessageJJ -
>JJ- .
PostJJ/ 3
(JJ3 4
LibBookingServiceJJ4 E
.JJE F
DtosJJF J
.JJJ K
TableJJK P
tableJJQ V
)JJV W
{KK 	
tryLL 
{MM 
TableNN 
newTableNN 
=NN  
_dbNN! $
.NN$ %
TablesNN% +
.NN+ ,
AddNN, /
(NN/ 0
newNN0 3
TableNN4 9
{OO 
Restaurant_idPP !
=PP" #
tablePP$ )
.PP) *
RestaurantIdPP* 6
,PP6 7
TableNoQQ 
=QQ 
tableQQ #
.QQ# $
TableNoQQ$ +
,QQ+ ,
NoSeatsRR 
=RR 
tableRR #
.RR# $
NoSeatsRR$ +
,RR+ ,
AdditionalNotesSS #
=SS$ %
tableSS& +
.SS+ ,
AdditionalNotesSS, ;
}TT 
)TT 
;TT 
awaitUU 
_dbUU 
.UU 
SaveChangesAsyncUU *
(UU* +
)UU+ ,
;UU, -
returnWW 
RequestWW 
.WW 
CreateResponseWW -
(WW- .
HttpStatusCodeWW. <
.WW< =
OKWW= ?
,WW? @"
CreateTableFromDbTableWWA W
(WWW X
newTableWWX `
)WW` a
)WWa b
;WWb c
}XX 
catchYY 
(YY 
	ExceptionYY 
exYY 
)YY  
{ZZ 
return[[ 
Request[[ 
.[[ 
CreateErrorResponse[[ 2
([[2 3
HttpStatusCode[[3 A
.[[A B
InternalServerError[[B U
,[[U V
$str[[W _
)[[_ `
;[[` a
}\\ 
}]] 	
[dd 	
Routedd	 
(dd 
$strdd !
)dd! "
]dd" #
[ee 	

HttpDeleteee	 
]ee 
publicff 
asyncff 
Taskff 
<ff 
HttpResponseMessageff -
>ff- .
Deleteff/ 5
(ff5 6
intff6 9
idff: <
)ff< =
{gg 	
tryhh 
{ii 
Tablejj 
tablejj 
=jj 
awaitjj #
_dbjj$ '
.jj' (
Tablesjj( .
.jj. /
Wherejj/ 4
(jj4 5
bjj5 6
=>jj7 9
bjj: ;
.jj; <
Idjj< >
==jj? A
idjjB D
)jjD E
.jjE F
FirstOrDefaultAsyncjjF Y
(jjY Z
)jjZ [
;jj[ \
tablekk 
.kk 
Deletedkk 
=kk 
truekk  $
;kk$ %
_dbmm 
.mm 
SetModifiedmm 
(mm  
tablemm  %
)mm% &
;mm& '
awaitnn 
_dbnn 
.nn 
SaveChangesAsyncnn *
(nn* +
)nn+ ,
;nn, -
returnpp 
Requestpp 
.pp 
CreateResponsepp -
(pp- .
HttpStatusCodepp. <
.pp< =
OKpp= ?
,pp? @
$strppA J
)ppJ K
;ppK L
}qq 
catchrr 
(rr 
	Exceptionrr 
exrr 
)rr  
{ss 
returntt 
Requesttt 
.tt 
CreateErrorResponsett 2
(tt2 3
HttpStatusCodett3 A
.ttA B
InternalServerErrorttB U
,ttU V
$strttW _
)tt_ `
;tt` a
}uu 
}vv 	
[~~ 	
Route~~	 
(~~ 
$str~~ !
)~~! "
]~~" #
[ 	
HttpPut	 
] 
public
�� 
async
�� 
Task
�� 
<
�� !
HttpResponseMessage
�� -
>
��- .
Update
��/ 5
(
��5 6
int
��6 9
id
��: <
,
��< =
LibBookingService
��> O
.
��O P
Dtos
��P T
.
��T U
Table
��U Z
table
��[ `
)
��` a
{
�� 	
try
�� 
{
�� 
Table
�� 
r
�� 
=
�� 
await
�� 
_db
��  #
.
��# $
Tables
��$ *
.
��* +
Where
��+ 0
(
��0 1
rr
��1 3
=>
��4 6
rr
��7 9
.
��9 :
Id
��: <
==
��= ?
id
��@ B
)
��B C
.
��C D!
FirstOrDefaultAsync
��D W
(
��W X
)
��X Y
;
��Y Z
r
�� 
.
�� 
Restaurant_id
�� 
=
��  !
table
��" '
.
��' (
RestaurantId
��( 4
;
��4 5
r
�� 
.
�� 
TableNo
�� 
=
�� 
table
�� !
.
��! "
TableNo
��" )
;
��) *
r
�� 
.
�� 
NoSeats
�� 
=
�� 
table
�� !
.
��! "
NoSeats
��" )
;
��) *
r
�� 
.
�� 
AdditionalNotes
�� !
=
��" #
table
��$ )
.
��) *
AdditionalNotes
��* 9
;
��9 :
r
�� 
.
�� 
Active
�� 
=
�� 
table
��  
.
��  !
Active
��! '
;
��' (
_db
�� 
.
�� 
SetModified
�� 
(
��  
r
��  !
)
��! "
;
��" #
await
�� 
_db
�� 
.
�� 
SaveChangesAsync
�� *
(
��* +
)
��+ ,
;
��, -
LibBookingService
�� !
.
��! "
Dtos
��" &
.
��& '
Table
��' ,
res
��- 0
=
��1 2$
CreateTableFromDbTable
��3 I
(
��I J
r
��J K
)
��K L
;
��L M
return
�� 
Request
�� 
.
�� 
CreateResponse
�� -
(
��- .
HttpStatusCode
��. <
.
��< =
OK
��= ?
,
��? @
res
��A D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� 2
(
��2 3
HttpStatusCode
��3 A
.
��A B!
InternalServerError
��B U
,
��U V
$str
��W _
)
��_ `
;
��` a
}
�� 
}
�� 	
private
�� 
LibBookingService
�� !
.
��! "
Dtos
��" &
.
��& '
Table
��' ,$
CreateTableFromDbTable
��- C
(
��C D
Table
��D I
r
��J K
)
��K L
{
�� 	
return
�� 
new
�� 
LibBookingService
�� (
.
��( )
Dtos
��) -
.
��- .
Table
��. 3
{
�� 
Id
�� 
=
�� 
r
�� 
.
�� 
Id
�� 
,
�� 
RestaurantId
�� 
=
�� 
r
��  
.
��  !
Restaurant_id
��! .
,
��. /
TableNo
�� 
=
�� 
r
�� 
.
�� 
TableNo
�� #
,
��# $
NoSeats
�� 
=
�� 
r
�� 
.
�� 
NoSeats
�� #
,
��# $
AdditionalNotes
�� 
=
��  !
r
��" #
.
��# $
AdditionalNotes
��$ 3
,
��3 4
Active
�� 
=
�� 
r
�� 
.
�� 
Active
�� !
}
�� 
;
�� 
}
�� 	
}
�� 
}�� �
tC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Global.asax.cs
	namespace		 	
RestaurantService		
 
{

 
public 

class 
WebApiApplication "
:# $
System% +
.+ ,
Web, /
./ 0
HttpApplication0 ?
{ 
	protected 
void 
Application_Start (
(( )
)) *
{ 	
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
GlobalConfiguration 
.  
	Configure  )
() *
WebApiConfig* 6
.6 7
Register7 ?
)? @
;@ A
} 	
} 
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\RestaurantService\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str ,
), -
]- .
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str .
). /
]/ 0
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *