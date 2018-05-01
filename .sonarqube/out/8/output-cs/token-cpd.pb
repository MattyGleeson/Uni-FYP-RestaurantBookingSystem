�
tC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\App_Start\WebApiConfig.cs
	namespace 	
WebApi
 
{		 
public

 

static

 
class

 
WebApiConfig

 $
{ 
public 
static 
void 
Register #
(# $
HttpConfiguration$ 5
config6 <
)< =
{ 	
config 
. "
MapHttpAttributeRoutes )
() *
)* +
;+ ,
config 
. 
Routes 
. 
MapHttpRoute &
(& '
name 
: 
$str "
," #
routeTemplate 
: 
$str 6
,6 7
defaults 
: 
new 
{ 
id  "
=# $
RouteParameter% 3
.3 4
Optional4 <
}= >
) 
; 
config 
. 

Formatters 
. 
JsonFormatter +
.+ ,
MediaTypeMappings, =
.= >
Add> A
(A B
newB E 
RequestHeaderMappingF Z
(Z [
$str[ c
,c d
$str )
,) *
StringComparison .
.. /&
InvariantCultureIgnoreCase/ I
,I J
true "
," #
$str 0
)0 1
)1 2
;2 3
var   
jsonFormatter   
=   
config    &
.  & '

Formatters  ' 1
.  1 2
OfType  2 8
<  8 9"
JsonMediaTypeFormatter  9 O
>  O P
(  P Q
)  Q R
.  R S
First  S X
(  X Y
)  Y Z
;  Z [
jsonFormatter!! 
.!! 
SerializerSettings!! ,
.!!, -
ContractResolver!!- =
=!!> ?
new!!@ C2
&CamelCasePropertyNamesContractResolver!!D j
(!!j k
)!!k l
;!!l m
}"" 	
}## 
}$$ �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ApiDescriptionExtensions.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\App_Start\HelpPageConfig.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
$str O
,O P
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\Controllers\HelpController.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
Controllers  +
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
( 
Startup 
. 
Config !
)! "
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\HelpPageAreaRegistration.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
(# $
Startup$ +
.+ ,
Config, 2
)2 3
;3 4
} 	
} 
} ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\HelpPageConfigurationExtensions.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\CollectionModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ComplexTypeModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\DictionaryModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\EnumTypeModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\EnumValueDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\IModelDocumentationProvider.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\KeyValuePairModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ModelDescriptionGenerator.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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

�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ModelNameAttribute.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ModelNameHelper.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
}$$ �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ParameterAnnotation.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\ParameterDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
} �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\ModelDescriptions\SimpleTypeModelDescription.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
ModelDescriptions  1
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\Models\HelpPageApiModel.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
.  
Models  &
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\HelpPageSampleGenerator.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\HelpPageSampleKey.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\ImageSample.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\InvalidSample.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\ObjectGenerator.cs
	namespace		 	
WebApi		
 
.		 
Areas		 
.		 
HelpPage		 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\SampleDirection.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\SampleGeneration\TextSample.cs
	namespace 	
WebApi
 
. 
Areas 
. 
HelpPage 
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
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Areas\HelpPage\XmlDocumentationProvider.cs
	namespace

 	
WebApi


 
.

 
Areas

 
.

 
HelpPage

 
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
}�� �R
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\BookingServiceController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
[ 
RoutePrefix 
( 
$str 
) 
]  
public 

class $
BookingServiceController )
:* +
ApiController, 9
{ 
	protected 
readonly  
BookingServiceFacade /
_facade0 7
;7 8$
BookingServiceController  
(  !
)! "
{ 	
_facade 
= 
new  
BookingServiceFacade .
(. /
)/ 0
;0 1
} 	
[## 	
	Authorize##	 
(## 
Roles## 
=## 
(## 
$str## +
)##+ ,
)##, -
]##- .
[$$ 	
HttpGet$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
async&& 
Task&& 
<&& 
HttpResponseMessage&& -
>&&- .
Get&&/ 2
(&&2 3
)&&3 4
{'' 	
IEnumerable(( 
<(( 
Booking(( 
>((  
bookings((! )
=((* +
await((, 1
_facade((2 9
.((9 :
GetBookings((: E
(((E F
)((F G
;((G H
if** 
(** 
bookings** 
.** 
Any** 
(** 
)** 
)** 
return++ 
Request++ 
.++ 
CreateResponse++ -
(++- .
HttpStatusCode++. <
.++< =
OK++= ?
,++? @
bookings++A I
)++I J
;++J K
return-- 
Request-- 
.-- 
CreateErrorResponse-- .
(--. /
HttpStatusCode--/ =
.--= >
	NoContent--> G
,--G H
$str--I \
)--\ ]
;--] ^
}.. 	
[55 	
HttpGet55	 
]55 
[66 	
Route66	 
(66 
$str66 
)66 
]66  
public77 
async77 
Task77 
<77 
HttpResponseMessage77 -
>77- .
Get77/ 2
(772 3
int773 6
id777 9
)779 :
{88 	
Booking99 
booking99 
=99 
await99 #
_facade99$ +
.99+ ,
GetBookingById99, :
(99: ;
id99; =
)99= >
;99> ?
if;; 
(;; 
booking;; 
!=;; 
null;; 
);;  
return<< 
Request<< 
.<< 
CreateResponse<< -
(<<- .
HttpStatusCode<<. <
.<<< =
OK<<= ?
,<<? @
booking<<A H
)<<H I
;<<I J
return>> 
Request>> 
.>> 
CreateErrorResponse>> .
(>>. /
HttpStatusCode>>/ =
.>>= >
	NoContent>>> G
,>>G H
$str>>I b
)>>b c
;>>c d
}?? 	
[FF 	
HttpGetFF	 
]FF 
[GG 	
RouteGG	 
(GG 
$strGG (
)GG( )
]GG) *
publicHH 
asyncHH 
TaskHH 
<HH 
HttpResponseMessageHH -
>HH- .
GetByCustomerHH/ <
(HH< =
intHH= @
idHHA C
)HHC D
{II 	
IEnumerableJJ 
<JJ 
BookingJJ 
>JJ  
bookingsJJ! )
=JJ* +
awaitJJ, 1
_facadeJJ2 9
.JJ9 :#
GetBookingsByCustomerIdJJ: Q
(JJQ R
idJJR T
)JJT U
;JJU V
ifLL 
(LL 
bookingsLL 
!=LL 
nullLL  
)LL  !
returnMM 
RequestMM 
.MM 
CreateResponseMM -
(MM- .
HttpStatusCodeMM. <
.MM< =
OKMM= ?
,MM? @
bookingsMMA I
)MMI J
;MMJ K
returnOO 
RequestOO 
.OO 
CreateErrorResponseOO .
(OO. /
HttpStatusCodeOO/ =
.OO= >
	NoContentOO> G
,OOG H
$strOOI l
)OOl m
;OOm n
}PP 	
[WW 	
HttpPostWW	 
]WW 
[XX 	
RouteXX	 
(XX 
$strXX ,
)XX, -
]XX- .
publicYY 
asyncYY 
TaskYY 
<YY 
HttpResponseMessageYY -
>YY- .
GetAvailableTableYY/ @
(YY@ A
BookingYYA H
bookingYYI P
)YYP Q
{ZZ 	
Table[[ 
table[[ 
=[[ 
await[[ 
_facade[[  '
.[[' (
GetAvailableTable[[( 9
([[9 :
booking[[: A
)[[A B
;[[B C
if]] 
(]] 
table]] 
!=]] 
null]] 
)]] 
return^^ 
Request^^ 
.^^ 
CreateResponse^^ -
(^^- .
HttpStatusCode^^. <
.^^< =
OK^^= ?
,^^? @
table^^A F
)^^F G
;^^G H
return`` 
Request`` 
.`` 
CreateErrorResponse`` .
(``. /
HttpStatusCode``/ =
.``= >
	NoContent``> G
,``G H
$str``I d
)``d e
;``e f
}aa 	
[hh 	
HttpPosthh	 
]hh 
[ii 	
Routeii	 
(ii 
$strii 
)ii 
]ii 
publicjj 
asyncjj 
Taskjj 
<jj 
HttpResponseMessagejj -
>jj- .
Postjj/ 3
(jj3 4
Bookingjj4 ;
bookingjj< C
)jjC D
{kk 	
Bookingll 

newBookingll 
=ll  
awaitll! &
_facadell' .
.ll. /
PostBookingll/ :
(ll: ;
bookingll; B
)llB C
;llC D
ifnn 
(nn 

newBookingnn 
!=nn 
nullnn "
)nn" #
returnoo 
Requestoo 
.oo 
CreateResponseoo -
(oo- .
HttpStatusCodeoo. <
.oo< =
OKoo= ?
,oo? @

newBookingooA K
)ooK L
;ooL M
returnqq 
Requestqq 
.qq 
CreateErrorResponseqq .
(qq. /
HttpStatusCodeqq/ =
.qq= >
InternalServerErrorqq> Q
,qqQ R
$strqqS s
)qqs t
;qqt u
}rr 	
[yy 	
HttpPutyy	 
]yy 
[zz 	
Routezz	 
(zz 
$strzz 
)zz 
]zz 
public{{ 
async{{ 
Task{{ 
<{{ 
HttpResponseMessage{{ -
>{{- .
Update{{/ 5
({{5 6
Booking{{6 =
booking{{> E
){{E F
{|| 	
Booking}} 
updatedBooking}} "
=}}# $
await}}% *
_facade}}+ 2
.}}2 3
UpdateBooking}}3 @
(}}@ A
booking}}A H
)}}H I
;}}I J
if 
( 
updatedBooking 
!= !
null" &
)& '
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
��? @
updatedBooking
��A O
)
��O P
;
��P Q
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	

HttpDelete
��	 
]
�� 
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
��" #
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
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
RemoveBooking
��% 2
(
��2 3
id
��3 5
)
��5 6
;
��6 7
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	

HttpDelete
��	 
]
�� 
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
��" #
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
Cancel
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
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
CancelBooking
��% 2
(
��2 3
id
��3 5
)
��5 6
;
��6 7
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S w
)
��w x
;
��x y
}
�� 	
}
�� 
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\CompanyServiceController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
AllowAnonymous 
] 
[ 
RoutePrefix 
( 
$str 
) 
]  
public 

class $
CompanyServiceController )
:* +
ApiController, 9
{ 
	protected 
readonly 
Facades "
." #
RestaurantService# 4
.4 5*
RestaurantServiceCompanyFacade5 S
_facadeT [
;[ \$
CompanyServiceController  
(  !
)! "
{ 	
_facade 
= 
new 
Facades !
.! "
RestaurantService" 3
.3 4*
RestaurantServiceCompanyFacade4 R
(R S
)S T
;T U
} 	
[!! 	
HttpGet!!	 
]!! 
["" 	
Route""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
HttpResponseMessage## -
>##- .
Get##/ 2
(##2 3
)##3 4
{$$ 	
Company%% 
company%% 
=%% 
await%% #
_facade%%$ +
.%%+ ,

GetCompany%%, 6
(%%6 7
)%%7 8
;%%8 9
if'' 
('' 
company'' 
!='' 
null'' 
)''  
return(( 
Request(( 
.(( 
CreateResponse(( -
(((- .
HttpStatusCode((. <
.((< =
OK((= ?
,((? @
company((A H
)((H I
;((I J
return** 
Request** 
.** 
CreateErrorResponse** .
(**. /
HttpStatusCode**/ =
.**= >
	NoContent**> G
,**G H
$str**I e
)**e f
;**f g
}++ 	
},, 
}-- �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\Core\GenericServiceController.cs
	namespace 	
WebApi
 
. 
Controllers 
. 
Core !
{		 
public 

class $
GenericServiceController )
:* +
ApiController, 9
{ 
	protected 
readonly 
Facades "
." #
Core# '
.' ( 
GenericServiceFacade( <
_facade= D
;D E
public $
GenericServiceController '
(' (
)( )
{* +
}, -
public $
GenericServiceController '
(' (
Facades( /
./ 0
Core0 4
.4 5 
GenericServiceFacade5 I
facadeJ P
)P Q
{ 	
_facade 
= 
facade 
; 
}   	
}!! 
}"" �S
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\CustomerServiceController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
[ 
RoutePrefix 
( 
$str 
)  
]  !
public 

class %
CustomerServiceController *
:+ ,
ApiController- :
{ 
	protected 
readonly 
Facades "
." #!
CustomerServiceFacade# 8
_facade9 @
;@ A%
CustomerServiceController !
(! "
)" #
{ 	
_facade 
= 
new 
Facades !
.! "!
CustomerServiceFacade" 7
(7 8
)8 9
;9 :
} 	
[ 	
	Authorize	 
( 
Roles 
= 
$str "
)" #
]# $
[ 	
Route	 
( 
$str 
) 
] 
public   
IEnumerable   
<   
object   !
>  ! "
	GetClaims  # ,
(  , -
)  - .
{!! 	
var"" 
identity"" 
="" 
User"" 
.""  
Identity""  (
as"") +
ClaimsIdentity"", :
;"": ;
return$$ 
identity$$ 
.$$ 
Claims$$ "
.$$" #
Select$$# )
($$) *
c$$* +
=>$$, .
new$$/ 2
{%% 
Type&& 
=&& 
c&& 
.&& 
Type&& 
,&& 
Value'' 
='' 
c'' 
.'' 
Value'' 
}(( 
)(( 
;(( 
})) 	
[// 	
	Authorize//	 
]// 
[00 	
HttpGet00	 
]00 
[11 	
Route11	 
(11 
$str11 
)11 
]11  
public22 
async22 
Task22 
<22 
HttpResponseMessage22 -
>22- .
Get22/ 2
(222 3
int223 6
id227 9
)229 :
{33 	
var44 
identity44 
=44 
User44 
.44  
Identity44  (
as44) +
ClaimsIdentity44, :
;44: ;
Customer55 
customer55 
=55 
await55  %
_facade55& -
.55- .
GetCustomer55. 9
(559 :
id55: <
)55< =
;55= >
var77 
owinId77 
=77 
identity77 !
.77! "
Claims77" (
.77( )
Where77) .
(77. /
c77/ 0
=>771 3
c774 5
.775 6
Type776 :
==77; =
$str77> F
)77F G
.77G H
Select77H N
(77N O
c77O P
=>77Q S
c77T U
.77U V
Value77V [
)77[ \
.77\ ]
FirstOrDefault77] k
(77k l
)77l m
;77m n
var88 
username88 
=88 
identity88 #
.88# $
Claims88$ *
.88* +
Where88+ 0
(880 1
c881 2
=>883 5
c886 7
.887 8
Type888 <
==88= ?

ClaimTypes88@ J
.88J K
Name88K O
)88O P
.88P Q
Select88Q W
(88W X
c88X Y
=>88Z \
c88] ^
.88^ _
Value88_ d
)88d e
.88e f
FirstOrDefault88f t
(88t u
)88u v
;88v w
if:: 
(:: 
customer:: 
!=:: 
null::  
&&::! #
customer::$ ,
.::, -

OwinUserId::- 7
==::8 :
owinId::; A
&&::B D
customer::E M
.::M N
UserName::N V
==::W Y
username::Z b
)::b c
return;; 
Request;; 
.;; 
CreateResponse;; -
(;;- .
HttpStatusCode;;. <
.;;< =
OK;;= ?
,;;? @
customer;;A I
);;I J
;;;J K
return== 
Request== 
.== 
CreateErrorResponse== .
(==. /
HttpStatusCode==/ =
.=== >
	NoContent==> G
,==G H
$str==I c
)==c d
;==d e
}>> 	
[DD 	
	AuthorizeDD	 
]DD 
[EE 	
HttpGetEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF 
)FF 
]FF 
publicGG 
asyncGG 
TaskGG 
<GG 
HttpResponseMessageGG -
>GG- .
	GetByAuthGG/ 8
(GG8 9
)GG9 :
{HH 	
varII 
identityII 
=II 
UserII 
.II  
IdentityII  (
asII) +
ClaimsIdentityII, :
;II: ;
varJJ 
owinIdJJ 
=JJ 
identityJJ !
.JJ! "
ClaimsJJ" (
.JJ( )
WhereJJ) .
(JJ. /
cJJ/ 0
=>JJ1 3
cJJ4 5
.JJ5 6
TypeJJ6 :
==JJ; =
$strJJ> F
)JJF G
.JJG H
SelectJJH N
(JJN O
cJJO P
=>JJQ S
cJJT U
.JJU V
ValueJJV [
)JJ[ \
.JJ\ ]
FirstOrDefaultJJ] k
(JJk l
)JJl m
;JJm n
varKK 
usernameKK 
=KK 
identityKK #
.KK# $
ClaimsKK$ *
.KK* +
WhereKK+ 0
(KK0 1
cKK1 2
=>KK3 5
cKK6 7
.KK7 8
TypeKK8 <
==KK= ?

ClaimTypesKK@ J
.KKJ K
NameKKK O
)KKO P
.KKP Q
SelectKKQ W
(KKW X
cKKX Y
=>KKZ \
cKK] ^
.KK^ _
ValueKK_ d
)KKd e
.KKe f
FirstOrDefaultKKf t
(KKt u
)KKu v
;KKv w
CustomerMM 
custMM 
=MM 
awaitMM !
_facadeMM" )
.MM) *
GetCustomerMM* 5
(MM5 6
owinIdMM6 <
,MM< =
usernameMM> F
)MMF G
;MMG H
ifOO 
(OO 
custOO 
!=OO 
nullOO 
)OO 
returnPP 
RequestPP 
.PP 
CreateResponsePP -
(PP- .
HttpStatusCodePP. <
.PP< =
OKPP= ?
,PP? @
custPPA E
)PPE F
;PPF G
returnRR 
RequestRR 
.RR 
CreateErrorResponseRR .
(RR. /
HttpStatusCodeRR/ =
.RR= >
	NoContentRR> G
,RRG H
$strRRI c
)RRc d
;RRd e
}SS 	
[ZZ 	
HttpPostZZ	 
]ZZ 
[[[ 	
Route[[	 
([[ 
$str[[ 
)[[ 
][[ 
public\\ 
async\\ 
Task\\ 
<\\ 
HttpResponseMessage\\ -
>\\- .
Post\\/ 3
(\\3 4
Customer\\4 <
customer\\= E
)\\E F
{]] 	
Customer^^ 
newCustomer^^  
=^^! "
await^^# (
_facade^^) 0
.^^0 1
PostCustomer^^1 =
(^^= >
customer^^> F
)^^F G
;^^G H
if`` 
(`` 
newCustomer`` 
!=`` 
null`` #
)``# $
returnaa 
Requestaa 
.aa 
CreateResponseaa -
(aa- .
HttpStatusCodeaa. <
.aa< =
OKaa= ?
,aa? @
newCustomeraaA L
)aaL M
;aaM N
returncc 
Requestcc 
.cc 
CreateErrorResponsecc .
(cc. /
HttpStatusCodecc/ =
.cc= >
InternalServerErrorcc> Q
,ccQ R
$strccS s
)ccs t
;cct u
}dd 	
[kk 	
	Authorizekk	 
]kk 
[ll 	
HttpPutll	 
]ll 
[mm 	
Routemm	 
(mm 
$strmm 
)mm 
]mm 
publicnn 
asyncnn 
Tasknn 
<nn 
HttpResponseMessagenn -
>nn- .
Updatenn/ 5
(nn5 6
Customernn6 >
customernn? G
)nnG H
{oo 	
Customerpp 
updatedCustomerpp $
=pp% &
awaitpp' ,
_facadepp- 4
.pp4 5
UpdateCustomerpp5 C
(ppC D
customerppD L
)ppL M
;ppM N
ifrr 
(rr 
updatedCustomerrr 
!=rr  "
nullrr# '
)rr' (
returnss 
Requestss 
.ss 
CreateResponsess -
(ss- .
HttpStatusCodess. <
.ss< =
OKss= ?
,ss? @
updatedCustomerssA P
)ssP Q
;ssQ R
returnuu 
Requestuu 
.uu 
CreateErrorResponseuu .
(uu. /
HttpStatusCodeuu/ =
.uu= >
InternalServerErroruu> Q
,uuQ R
$struuS u
)uuu v
;uuv w
}vv 	
[}} 	
	Authorize}}	 
]}} 
[~~ 	

HttpDelete~~	 
]~~ 
[ 	
Route	 
( 
$str !
)! "
]" #
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
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
RemoveRestaurant
��% 5
(
��5 6
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
}
�� 
}�� �6
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\DietInfoServiceController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
	Authorize 
( 
Roles 
= 
$str &
)& '
]' (
[ 
RoutePrefix 
( 
$str 
)  
]  !
public 

class %
DietInfoServiceController *
:+ ,
ApiController- :
{ 
	protected 
readonly 
Facades "
." #
MenuService# .
.. /%
MenuServiceDietInfoFacade/ H
_facadeI P
;P Q%
DietInfoServiceController !
(! "
)" #
{ 	
_facade 
= 
new 
Facades !
.! "
MenuService" -
.- .%
MenuServiceDietInfoFacade. G
(G H
)H I
;I J
} 	
[!! 	
AllowAnonymous!!	 
]!! 
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
HttpResponseMessage$$ -
>$$- .
Get$$/ 2
($$2 3
)$$3 4
{%% 	
IEnumerable&& 
<&& 
DietInfo&&  
>&&  !
dietInfo&&" *
=&&+ ,
await&&- 2
_facade&&3 :
.&&: ;
GetDietInfo&&; F
(&&F G
)&&G H
;&&H I
if(( 
((( 
dietInfo(( 
.(( 
Any(( 
((( 
)(( 
)(( 
return)) 
Request)) 
.)) 
CreateResponse)) -
())- .
HttpStatusCode)). <
.))< =
OK))= ?
,))? @
dietInfo))A I
)))I J
;))J K
return++ 
Request++ 
.++ 
CreateErrorResponse++ .
(++. /
HttpStatusCode++/ =
.++= >
	NoContent++> G
,++G H
$str++I ]
)++] ^
;++^ _
},, 	
[22 	
AllowAnonymous22	 
]22 
[33 	
HttpGet33	 
]33 
[44 	
Route44	 
(44 
$str44 
)44 
]44  
public55 
async55 
Task55 
<55 
HttpResponseMessage55 -
>55- .
Get55/ 2
(552 3
int553 6
id557 9
)559 :
{66 	
DietInfo77 
dietInfo77 
=77 
await77  %
_facade77& -
.77- .
GetDietInfoById77. =
(77= >
id77> @
)77@ A
;77A B
if99 
(99 
dietInfo99 
!=99 
null99  
)99  !
return:: 
Request:: 
.:: 
CreateResponse:: -
(::- .
HttpStatusCode::. <
.::< =
OK::= ?
,::? @
dietInfo::A I
)::I J
;::J K
return<< 
Request<< 
.<< 
CreateErrorResponse<< .
(<<. /
HttpStatusCode<</ =
.<<= >
	NoContent<<> G
,<<G H
$str<<I d
)<<d e
;<<e f
}== 	
[DD 	
HttpPostDD	 
]DD 
[EE 	
RouteEE	 
(EE 
$strEE 
)EE 
]EE 
publicFF 
asyncFF 
TaskFF 
<FF 
HttpResponseMessageFF -
>FF- .
PostFF/ 3
(FF3 4
DietInfoFF4 <
dietInfoFF= E
)FFE F
{GG 	
DietInfoHH 
newDietInfoHH  
=HH! "
awaitHH# (
_facadeHH) 0
.HH0 1
PostDietInfoHH1 =
(HH= >
dietInfoHH> F
)HHF G
;HHG H
ifJJ 
(JJ 
newDietInfoJJ 
!=JJ 
nullJJ #
)JJ# $
returnKK 
RequestKK 
.KK 
CreateResponseKK -
(KK- .
HttpStatusCodeKK. <
.KK< =
OKKK= ?
,KK? @
newDietInfoKKA L
)KKL M
;KKM N
returnMM 
RequestMM 
.MM 
CreateErrorResponseMM .
(MM. /
HttpStatusCodeMM/ =
.MM= >
InternalServerErrorMM> Q
,MMQ R
$strMMS s
)MMs t
;MMt u
}NN 	
[UU 	
HttpPutUU	 
]UU 
[VV 	
RouteVV	 
(VV 
$strVV 
)VV 
]VV 
publicWW 
asyncWW 
TaskWW 
<WW 
HttpResponseMessageWW -
>WW- .
UpdateWW/ 5
(WW5 6
DietInfoWW6 >
dietInfoWW? G
)WWG H
{XX 	
DietInfoYY 
updatedDietInfoYY $
=YY% &
awaitYY' ,
_facadeYY- 4
.YY4 5
UpdateDietInfoYY5 C
(YYC D
dietInfoYYD L
)YYL M
;YYM N
if[[ 
([[ 
updatedDietInfo[[ 
!=[[  "
null[[# '
)[[' (
return\\ 
Request\\ 
.\\ 
CreateResponse\\ -
(\\- .
HttpStatusCode\\. <
.\\< =
OK\\= ?
,\\? @
updatedDietInfo\\A P
)\\P Q
;\\Q R
return^^ 
Request^^ 
.^^ 
CreateErrorResponse^^ .
(^^. /
HttpStatusCode^^/ =
.^^= >
InternalServerError^^> Q
,^^Q R
$str^^S u
)^^u v
;^^v w
}__ 	
[ff 	

HttpDeleteff	 
]ff 
[gg 	
Routegg	 
(gg 
$strgg !
)gg! "
]gg" #
publichh 
asynchh 
Taskhh 
<hh 
HttpResponseMessagehh -
>hh- .
Deletehh/ 5
(hh5 6
inthh6 9
idhh: <
)hh< =
{ii 	
booljj 
resjj 
=jj 
awaitjj 
_facadejj $
.jj$ %
RemoveDietInfojj% 3
(jj3 4
idjj4 6
)jj6 7
;jj7 8
ifll 
(ll 
resll 
)ll 
returnmm 
Requestmm 
.mm 
CreateResponsemm -
(mm- .
HttpStatusCodemm. <
.mm< =
OKmm= ?
)mm? @
;mm@ A
returnoo 
Requestoo 
.oo 
CreateErrorResponseoo .
(oo. /
HttpStatusCodeoo/ =
.oo= >
InternalServerErroroo> Q
,ooQ R
$strooS u
)oou v
;oov w
}pp 	
}qq 
}rr �9
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\ImageServiceController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class "
ImageServiceController '
:( )
ApiController* 7
{ 
	protected 
readonly 
Facades "
." #
ImageServiceFacade# 5
_facade6 =
;= >"
ImageServiceController 
( 
)  
{ 	
_facade 
= 
new 
Facades !
.! "
ImageServiceFacade" 4
(4 5
)5 6
;6 7
} 	
[!! 	
	Authorize!!	 
(!! 
Roles!! 
=!! 
(!! 
$str!! +
)!!+ ,
)!!, -
]!!- .
["" 	
HttpPost""	 
]"" 
[## 	
Route##	 
(## 
$str## $
)##$ %
]##% &
public$$ 
async$$ 
Task$$ 
<$$ 
HttpResponseMessage$$ -
>$$- .
UploadMenuItemImage$$/ B
($$B C
Image$$C H
image$$I N
)$$N O
{%% 	
Image&& 
newImage&& 
=&& 
await&& "
_facade&&# *
.&&* +
UploadMenuItemImage&&+ >
(&&> ?
image&&? D
)&&D E
;&&E F
if(( 
((( 
newImage(( 
!=(( 
null((  
)((  !
return)) 
Request)) 
.)) 
CreateResponse)) -
())- .
HttpStatusCode)). <
.))< =
OK))= ?
,))? @
newImage))A I
)))I J
;))J K
return++ 
Request++ 
.++ 
CreateErrorResponse++ .
(++. /
HttpStatusCode++/ =
.++= >
InternalServerError++> Q
,++Q R
$str++S s
)++s t
;++t u
},, 	
[33 	
	Authorize33	 
(33 
Roles33 
=33 
(33 
$str33 +
)33+ ,
)33, -
]33- .
[44 	
HttpPost44	 
]44 
[55 	
Route55	 
(55 
$str55 $
)55$ %
]55% &
public66 
async66 
Task66 
<66 
HttpResponseMessage66 -
>66- .
RemoveMenuItemImage66/ B
(66B C
Image66C H
image66I N
)66N O
{77 	
bool88 
res88 
=88 
await88 
_facade88 $
.88$ %
RemoveMenuItemImage88% 8
(888 9
image889 >
)88> ?
;88? @
if:: 
(:: 
res:: 
):: 
return;; 
Request;; 
.;; 
CreateResponse;; -
(;;- .
HttpStatusCode;;. <
.;;< =
OK;;= ?
,;;? @
res;;A D
);;D E
;;;E F
return== 
Request== 
.== 
CreateErrorResponse== .
(==. /
HttpStatusCode==/ =
.=== >
InternalServerError==> Q
,==Q R
$str==S s
)==s t
;==t u
}>> 	
[EE 	
	AuthorizeEE	 
(EE 
RolesEE 
=EE 
(EE 
$strEE +
)EE+ ,
)EE, -
]EE- .
[FF 	
HttpPostFF	 
]FF 
[GG 	
RouteGG	 
(GG 
$strGG &
)GG& '
]GG' (
publicHH 
asyncHH 
TaskHH 
<HH 
HttpResponseMessageHH -
>HH- .!
UploadRestaurantImageHH/ D
(HHD E
ImageHHE J
imageHHK P
)HHP Q
{II 	
ImageJJ 
newImageJJ 
=JJ 
awaitJJ "
_facadeJJ# *
.JJ* +!
UploadRestaurantImageJJ+ @
(JJ@ A
imageJJA F
)JJF G
;JJG H
ifLL 
(LL 
newImageLL 
!=LL 
nullLL  
)LL  !
returnMM 
RequestMM 
.MM 
CreateResponseMM -
(MM- .
HttpStatusCodeMM. <
.MM< =
OKMM= ?
,MM? @
newImageMMA I
)MMI J
;MMJ K
returnOO 
RequestOO 
.OO 
CreateErrorResponseOO .
(OO. /
HttpStatusCodeOO/ =
.OO= >
InternalServerErrorOO> Q
,OOQ R
$strOOS s
)OOs t
;OOt u
}PP 	
[WW 	
	AuthorizeWW	 
(WW 
RolesWW 
=WW 
(WW 
$strWW +
)WW+ ,
)WW, -
]WW- .
[XX 	
HttpPostXX	 
]XX 
[YY 	
RouteYY	 
(YY 
$strYY &
)YY& '
]YY' (
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
HttpResponseMessageZZ -
>ZZ- .!
RemoveRestaurantImageZZ/ D
(ZZD E
ImageZZE J
imageZZK P
)ZZP Q
{[[ 	
bool\\ 
res\\ 
=\\ 
await\\ 
_facade\\ $
.\\$ %!
RemoveRestaurantImage\\% :
(\\: ;
image\\; @
)\\@ A
;\\A B
if^^ 
(^^ 
res^^ 
)^^ 
return__ 
Request__ 
.__ 
CreateResponse__ -
(__- .
HttpStatusCode__. <
.__< =
OK__= ?
,__? @
res__A D
)__D E
;__E F
returnaa 
Requestaa 
.aa 
CreateErrorResponseaa .
(aa. /
HttpStatusCodeaa/ =
.aa= >
InternalServerErroraa> Q
,aaQ R
$straaS s
)aas t
;aat u
}bb 	
[hh 	
HttpGethh	 
]hh 
[ii 	
Routeii	 
(ii 
$strii $
)ii$ %
]ii% &
publicjj 
asyncjj 
Taskjj 
<jj 
HttpResponseMessagejj -
>jj- .
Getjj/ 2
(jj2 3
intjj3 6
idjj7 9
)jj9 :
{kk 	
Imagell 
imagell 
=ll 
awaitll 
_facadell  '
.ll' (
	LoadImagell( 1
(ll1 2
idll2 4
)ll4 5
;ll5 6
ifnn 
(nn 
imagenn 
!=nn 
nullnn 
)nn 
returnoo 
Requestoo 
.oo 
CreateResponseoo -
(oo- .
HttpStatusCodeoo. <
.oo< =
OKoo= ?
,oo? @
imageooA F
)ooF G
;ooG H
returnqq 
Requestqq 
.qq 
CreateErrorResponseqq .
(qq. /
HttpStatusCodeqq/ =
.qq= >
	NoContentqq> G
,qqG H
$strqqI `
)qq` a
;qqa b
}rr 	
}ss 
}tt �7
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\MenuItemTypeServiceController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
	Authorize 
( 
Roles 
= 
$str &
)& '
]' (
[ 
RoutePrefix 
( 
$str #
)# $
]$ %
public 

class )
MenuItemTypeServiceController .
:/ 0
ApiController1 >
{ 
	protected 
readonly 
Facades "
." #
MenuService# .
.. /!
MenuServiceTypeFacade/ D
_facadeE L
;L M)
MenuItemTypeServiceController %
(% &
)& '
{ 	
_facade 
= 
new 
Facades !
.! "
MenuService" -
.- .!
MenuServiceTypeFacade. C
(C D
)D E
;E F
} 	
[!! 	
AllowAnonymous!!	 
]!! 
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
HttpResponseMessage$$ -
>$$- .
Get$$/ 2
($$2 3
)$$3 4
{%% 	
IEnumerable&& 
<&& 
MenuItemType&& $
>&&$ %
menuItemTypes&&& 3
=&&4 5
await&&6 ;
_facade&&< C
.&&C D
GetMenuItemTypes&&D T
(&&T U
)&&U V
;&&V W
if(( 
((( 
menuItemTypes(( 
.(( 
Any(( !
(((! "
)((" #
)((# $
return)) 
Request)) 
.)) 
CreateResponse)) -
())- .
HttpStatusCode)). <
.))< =
OK))= ?
,))? @
menuItemTypes))A N
)))N O
;))O P
return++ 
Request++ 
.++ 
CreateErrorResponse++ .
(++. /
HttpStatusCode++/ =
.++= >
	NoContent++> G
,++G H
$str++I c
)++c d
;++d e
},, 	
[22 	
AllowAnonymous22	 
]22 
[33 	
HttpGet33	 
]33 
[44 	
Route44	 
(44 
$str44 
)44 
]44  
public55 
async55 
Task55 
<55 
HttpResponseMessage55 -
>55- .
Get55/ 2
(552 3
int553 6
id557 9
)559 :
{66 	
MenuItemType77 
menuItemType77 %
=77& '
await77( -
_facade77. 5
.775 6
GetMenuItemTypeById776 I
(77I J
id77J L
)77L M
;77M N
if99 
(99 
menuItemType99 
!=99 
null99  $
)99$ %
return:: 
Request:: 
.:: 
CreateResponse:: -
(::- .
HttpStatusCode::. <
.::< =
OK::= ?
,::? @
menuItemType::A M
)::M N
;::N O
return<< 
Request<< 
.<< 
CreateErrorResponse<< .
(<<. /
HttpStatusCode<</ =
.<<= >
	NoContent<<> G
,<<G H
$str<<I i
)<<i j
;<<j k
}== 	
[DD 	
HttpPostDD	 
]DD 
[EE 	
RouteEE	 
(EE 
$strEE 
)EE 
]EE 
publicFF 
asyncFF 
TaskFF 
<FF 
HttpResponseMessageFF -
>FF- .
PostFF/ 3
(FF3 4
MenuItemTypeFF4 @
menuItemTypeFFA M
)FFM N
{GG 	
MenuItemTypeHH 
newMenuItemHH $
=HH% &
awaitHH' ,
_facadeHH- 4
.HH4 5
PostMenuItemTypeHH5 E
(HHE F
menuItemTypeHHF R
)HHR S
;HHS T
ifJJ 
(JJ 
newMenuItemJJ 
!=JJ 
nullJJ #
)JJ# $
returnKK 
RequestKK 
.KK 
CreateResponseKK -
(KK- .
HttpStatusCodeKK. <
.KK< =
OKKK= ?
,KK? @
newMenuItemKKA L
)KKL M
;KKM N
returnMM 
RequestMM 
.MM 
CreateErrorResponseMM .
(MM. /
HttpStatusCodeMM/ =
.MM= >
InternalServerErrorMM> Q
,MMQ R
$strMMS s
)MMs t
;MMt u
}NN 	
[UU 	
HttpPutUU	 
]UU 
[VV 	
RouteVV	 
(VV 
$strVV 
)VV 
]VV 
publicWW 
asyncWW 
TaskWW 
<WW 
HttpResponseMessageWW -
>WW- .
UpdateWW/ 5
(WW5 6
MenuItemTypeWW6 B
menuItemTypeWWC O
)WWO P
{XX 	
MenuItemTypeYY 
updatedMenuItemYY (
=YY) *
awaitYY+ 0
_facadeYY1 8
.YY8 9
UpdateMenuItemTypeYY9 K
(YYK L
menuItemTypeYYL X
)YYX Y
;YYY Z
if[[ 
([[ 
updatedMenuItem[[ 
!=[[  "
null[[# '
)[[' (
return\\ 
Request\\ 
.\\ 
CreateResponse\\ -
(\\- .
HttpStatusCode\\. <
.\\< =
OK\\= ?
,\\? @
updatedMenuItem\\A P
)\\P Q
;\\Q R
return^^ 
Request^^ 
.^^ 
CreateErrorResponse^^ .
(^^. /
HttpStatusCode^^/ =
.^^= >
InternalServerError^^> Q
,^^Q R
$str^^S u
)^^u v
;^^v w
}__ 	
[ff 	

HttpDeleteff	 
]ff 
[gg 	
Routegg	 
(gg 
$strgg !
)gg! "
]gg" #
publichh 
asynchh 
Taskhh 
<hh 
HttpResponseMessagehh -
>hh- .
Deletehh/ 5
(hh5 6
inthh6 9
idhh: <
)hh< =
{ii 	
booljj 
resjj 
=jj 
awaitjj 
_facadejj $
.jj$ %
RemoveMenuItemTypejj% 7
(jj7 8
idjj8 :
)jj: ;
;jj; <
ifll 
(ll 
resll 
)ll 
returnmm 
Requestmm 
.mm 
CreateResponsemm -
(mm- .
HttpStatusCodemm. <
.mm< =
OKmm= ?
)mm? @
;mm@ A
returnoo 
Requestoo 
.oo 
CreateErrorResponseoo .
(oo. /
HttpStatusCodeoo/ =
.oo= >
InternalServerErroroo> Q
,ooQ R
$strooS u
)oou v
;oov w
}pp 	
}qq 
}rr �i
C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\MenuServiceController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
	Authorize 
( 
Roles 
= 
$str &
)& '
]' (
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class !
MenuServiceController &
:' (
ApiController) 6
{ 
	protected 
readonly 
Facades "
." #
MenuService# .
.. /
MenuServiceFacade/ @
_facadeA H
;H I!
MenuServiceController 
( 
) 
{ 	
_facade 
= 
new 
Facades !
.! "
MenuService" -
.- .
MenuServiceFacade. ?
(? @
)@ A
;A B
} 	
["" 	
AllowAnonymous""	 
]"" 
[## 	
HttpGet##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
HttpResponseMessage%% -
>%%- .
Get%%/ 2
(%%2 3
)%%3 4
{&& 	
IEnumerable'' 
<'' 
MenuItem''  
>''  !
	menuItems''" +
='', -
await''. 3
_facade''4 ;
.''; <
GetMenuItems''< H
(''H I
)''I J
;''J K
if)) 
()) 
	menuItems)) 
.)) 
Any)) 
()) 
))) 
)))  
return** 
Request** 
.** 
CreateResponse** -
(**- .
HttpStatusCode**. <
.**< =
OK**= ?
,**? @
	menuItems**A J
)**J K
;**K L
return,, 
Request,, 
.,, 
CreateErrorResponse,, .
(,,. /
HttpStatusCode,,/ =
.,,= >
	NoContent,,> G
,,,G H
$str,,I ^
),,^ _
;,,_ `
}-- 	
[33 	
AllowAnonymous33	 
]33 
[44 	
HttpGet44	 
]44 
[55 	
Route55	 
(55 
$str55 
)55 
]55  
public66 
async66 
Task66 
<66 
HttpResponseMessage66 -
>66- .
Get66/ 2
(662 3
int663 6
id667 9
)669 :
{77 	
MenuItem88 
menuItem88 
=88 
await88  %
_facade88& -
.88- .
GetMenuItemById88. =
(88= >
id88> @
)88@ A
;88A B
if:: 
(:: 
menuItem:: 
!=:: 
null::  
)::  !
return;; 
Request;; 
.;; 
CreateResponse;; -
(;;- .
HttpStatusCode;;. <
.;;< =
OK;;= ?
,;;? @
menuItem;;A I
);;I J
;;;J K
return== 
Request== 
.== 
CreateErrorResponse== .
(==. /
HttpStatusCode==/ =
.=== >
	NoContent==> G
,==G H
$str==I d
)==d e
;==e f
}>> 	
[DD 	
AllowAnonymousDD	 
]DD 
[EE 	
HttpGetEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF *
)FF* +
]FF+ ,
publicGG 
asyncGG 
TaskGG 
<GG 
HttpResponseMessageGG -
>GG- .
GetByRestaurantGG/ >
(GG> ?
intGG? B
idGGC E
)GGE F
{HH 	
IEnumerableII 
<II 
MenuItemII  
>II  !
	menuItemsII" +
=II, -
awaitII. 3
_facadeII4 ;
.II; <&
GetMenuItemsByRestaurantIdII< V
(IIV W
idIIW Y
)IIY Z
;IIZ [
ifKK 
(KK 
	menuItemsKK 
.KK 
AnyKK 
(KK 
)KK 
)KK  
returnLL 
RequestLL 
.LL 
CreateResponseLL -
(LL- .
HttpStatusCodeLL. <
.LL< =
OKLL= ?
,LL? @
	menuItemsLLA J
)LLJ K
;LLK L
returnNN 
RequestNN 
.NN 
CreateErrorResponseNN .
(NN. /
HttpStatusCodeNN/ =
.NN= >
	NoContentNN> G
,NNG H
$strNNI p
)NNp q
;NNq r
}PP 	
[WW 	
HttpPostWW	 
]WW 
[XX 	
RouteXX	 
(XX 
$strXX 
)XX 
]XX 
publicYY 
asyncYY 
TaskYY 
<YY 
HttpResponseMessageYY -
>YY- .
PostYY/ 3
(YY3 4
MenuItemYY4 <
menuItemYY= E
)YYE F
{ZZ 	
MenuItem[[ 
newMenuItem[[  
=[[! "
await[[# (
_facade[[) 0
.[[0 1
PostMenuItem[[1 =
([[= >
menuItem[[> F
)[[F G
;[[G H
if]] 
(]] 
newMenuItem]] 
!=]] 
null]] #
)]]# $
return^^ 
Request^^ 
.^^ 
CreateResponse^^ -
(^^- .
HttpStatusCode^^. <
.^^< =
OK^^= ?
,^^? @
newMenuItem^^A L
)^^L M
;^^M N
return`` 
Request`` 
.`` 
CreateErrorResponse`` .
(``. /
HttpStatusCode``/ =
.``= >
InternalServerError``> Q
,``Q R
$str``S s
)``s t
;``t u
}aa 	
[hh 	
HttpPuthh	 
]hh 
[ii 	
Routeii	 
(ii 
$strii 
)ii 
]ii 
publicjj 
asyncjj 
Taskjj 
<jj 
HttpResponseMessagejj -
>jj- .
Updatejj/ 5
(jj5 6
MenuItemjj6 >
menuItemjj? G
)jjG H
{kk 	
MenuItemll 
updatedMenuItemll $
=ll% &
awaitll' ,
_facadell- 4
.ll4 5
UpdateMenuItemll5 C
(llC D
menuItemllD L
)llL M
;llM N
ifnn 
(nn 
updatedMenuItemnn 
!=nn  "
nullnn# '
)nn' (
returnoo 
Requestoo 
.oo 
CreateResponseoo -
(oo- .
HttpStatusCodeoo. <
.oo< =
OKoo= ?
,oo? @
updatedMenuItemooA P
)ooP Q
;ooQ R
returnqq 
Requestqq 
.qq 
CreateErrorResponseqq .
(qq. /
HttpStatusCodeqq/ =
.qq= >
InternalServerErrorqq> Q
,qqQ R
$strqqS u
)qqu v
;qqv w
}rr 	
[zz 	
HttpPutzz	 
]zz 
[{{ 	
Route{{	 
({{ 
$str{{ 8
){{8 9
]{{9 :
public|| 
async|| 
Task|| 
<|| 
HttpResponseMessage|| -
>||- .
AddDietInfo||/ :
(||: ;
int||; >
id||? A
,||A B
int||C F

dietInfoId||G Q
)||Q R
{}} 	
bool~~ 
res~~ 
=~~ 
await~~ 
_facade~~ $
.~~$ %
AddDietInfo~~% 0
(~~0 1
id~~1 3
,~~3 4

dietInfoId~~5 ?
)~~? @
;~~@ A
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	

HttpDelete
��	 
]
�� 
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
��< =
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
RemoveDietInfo
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

dietInfoId
��J T
)
��T U
{
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
RemoveDietInfo
��% 3
(
��3 4
id
��4 6
,
��6 7

dietInfoId
��8 B
)
��B C
;
��C D
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	
HttpPut
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� @
)
��@ A
]
��A B
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
AddMenuItemType
��/ >
(
��> ?
int
��? B
id
��C E
,
��E F
int
��G J
menuItemTypeId
��K Y
)
��Y Z
{
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
AddMenuItemType
��% 4
(
��4 5
id
��5 7
,
��7 8
menuItemTypeId
��9 G
)
��G H
;
��H I
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	

HttpDelete
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� C
)
��C D
]
��D E
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
RemoveMenuItemType
��/ A
(
��A B
int
��B E
id
��F H
,
��H I
int
��J M
menuItemTypeId
��N \
)
��\ ]
{
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ % 
RemoveMenuItemType
��% 7
(
��7 8
id
��8 :
,
��: ;
menuItemTypeId
��< J
)
��J K
;
��K L
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	

HttpDelete
��	 
]
�� 
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
��" #
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
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
RemoveMenuItem
��% 3
(
��3 4
id
��4 6
)
��6 7
;
��7 8
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
}
�� 
}�� �H
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\PaymentServiceController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
	Authorize 
] 
[ 
RoutePrefix 
( 
$str 
) 
]  
public 

class $
PaymentServiceController )
:* +
ApiController, 9
{ 
	protected 
readonly  
PaymentServiceFacade /
_facade0 7
;7 8$
PaymentServiceController  
(  !
)! "
{ 	
_facade 
= 
new  
PaymentServiceFacade .
(. /
)/ 0
;0 1
} 	
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
HttpResponseMessage$$ -
>$$- .
Get$$/ 2
($$2 3
)$$3 4
{%% 	
IEnumerable&& 
<&& 
Payment&& 
>&&  
payments&&! )
=&&* +
await&&, 1
_facade&&2 9
.&&9 :
GetPayments&&: E
(&&E F
)&&F G
;&&G H
if(( 
((( 
payments(( 
.(( 
Any(( 
((( 
)(( 
)(( 
return)) 
Request)) 
.)) 
CreateResponse)) -
())- .
HttpStatusCode)). <
.))< =
OK))= ?
,))? @
payments))A I
)))I J
;))J K
return++ 
Request++ 
.++ 
CreateErrorResponse++ .
(++. /
HttpStatusCode++/ =
.++= >
	NoContent++> G
,++G H
$str++I \
)++\ ]
;++] ^
},, 	
[33 	
HttpGet33	 
]33 
[44 	
Route44	 
(44 
$str44 
)44 
]44  
public55 
async55 
Task55 
<55 
HttpResponseMessage55 -
>55- .
Get55/ 2
(552 3
int553 6
id557 9
)559 :
{66 	
Payment77 
payment77 
=77 
await77 #
_facade77$ +
.77+ ,
GetPaymentById77, :
(77: ;
id77; =
)77= >
;77> ?
if99 
(99 
payment99 
!=99 
null99 
)99  
return:: 
Request:: 
.:: 
CreateResponse:: -
(::- .
HttpStatusCode::. <
.::< =
OK::= ?
,::? @
payment::A H
)::H I
;::I J
return<< 
Request<< 
.<< 
CreateErrorResponse<< .
(<<. /
HttpStatusCode<</ =
.<<= >
	NoContent<<> G
,<<G H
$str<<I b
)<<b c
;<<c d
}== 	
[CC 	
HttpGetCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD !
)DD! "
]DD" #
publicEE 
asyncEE 
TaskEE 
<EE 
HttpResponseMessageEE -
>EE- .
GetPaymentMethodEE/ ?
(EE? @
)EE@ A
{FF 	
IEnumerableGG 
<GG 
PaymentMethodGG %
>GG% &
paymentMethodsGG' 5
=GG6 7
awaitGG8 =
_facadeGG> E
.GGE F
GetPaymentMethodsGGF W
(GGW X
)GGX Y
;GGY Z
ifII 
(II 
paymentMethodsII 
.II 
AnyII "
(II" #
)II# $
)II$ %
returnJJ 
RequestJJ 
.JJ 
CreateResponseJJ -
(JJ- .
HttpStatusCodeJJ. <
.JJ< =
OKJJ= ?
,JJ? @
paymentMethodsJJA O
)JJO P
;JJP Q
returnLL 
RequestLL 
.LL 
CreateErrorResponseLL .
(LL. /
HttpStatusCodeLL/ =
.LL= >
	NoContentLL> G
,LLG H
$strLLI c
)LLc d
;LLd e
}MM 	
[TT 	
HttpGetTT	 
]TT 
[UU 	
RouteUU	 
(UU 
$strUU +
)UU+ ,
]UU, -
publicVV 
asyncVV 
TaskVV 
<VV 
HttpResponseMessageVV -
>VV- .
GetPaymentMethodVV/ ?
(VV? @
intVV@ C
idVVD F
)VVF G
{WW 	
PaymentMethodXX 
paymentMethodXX '
=XX( )
awaitXX* /
_facadeXX0 7
.XX7 8 
GetPaymentMethodByIdXX8 L
(XXL M
idXXM O
)XXO P
;XXP Q
ifZZ 
(ZZ 
paymentMethodZZ 
!=ZZ  
nullZZ! %
)ZZ% &
return[[ 
Request[[ 
.[[ 
CreateResponse[[ -
([[- .
HttpStatusCode[[. <
.[[< =
OK[[= ?
,[[? @
paymentMethod[[A N
)[[N O
;[[O P
return]] 
Request]] 
.]] 
CreateErrorResponse]] .
(]]. /
HttpStatusCode]]/ =
.]]= >
	NoContent]]> G
,]]G H
$str]]I b
)]]b c
;]]c d
}^^ 	
[ee 	
	Authorizeee	 
]ee 
[ff 	
HttpPostff	 
]ff 
[gg 	
Routegg	 
(gg 
$strgg 
)gg 
]gg 
publichh 
asynchh 
Taskhh 
<hh 
HttpResponseMessagehh -
>hh- .
Posthh/ 3
(hh3 4
Paymenthh4 ;
paymenthh< C
)hhC D
{ii 	
Paymentjj 

newPaymentjj 
=jj  
awaitjj! &
_facadejj' .
.jj. /
PostPaymentjj/ :
(jj: ;
paymentjj; B
)jjB C
;jjC D
ifll 
(ll 

newPaymentll 
!=ll 
nullll "
)ll" #
returnmm 
Requestmm 
.mm 
CreateResponsemm -
(mm- .
HttpStatusCodemm. <
.mm< =
OKmm= ?
,mm? @

newPaymentmmA K
)mmK L
;mmL M
returnoo 
Requestoo 
.oo 
CreateErrorResponseoo .
(oo. /
HttpStatusCodeoo/ =
.oo= >
InternalServerErroroo> Q
,ooQ R
$strooS s
)oos t
;oot u
}pp 	
[ww 	
	Authorizeww	 
]ww 
[xx 	
HttpPutxx	 
]xx 
[yy 	
Routeyy	 
(yy 
$stryy 
)yy 
]yy 
publiczz 
asynczz 
Taskzz 
<zz 
HttpResponseMessagezz -
>zz- .
Updatezz/ 5
(zz5 6
Paymentzz6 =
paymentzz> E
)zzE F
{{{ 	
Payment|| 
updatedPayment|| "
=||# $
await||% *
_facade||+ 2
.||2 3
UpdatePayment||3 @
(||@ A
payment||A H
)||H I
;||I J
if~~ 
(~~ 
updatedPayment~~ 
!=~~ !
null~~" &
)~~& '
return 
Request 
. 
CreateResponse -
(- .
HttpStatusCode. <
.< =
OK= ?
,? @
updatedPaymentA O
)O P
;P Q
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	
	Authorize
��	 
]
�� 
[
�� 	

HttpDelete
��	 
]
�� 
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
��" #
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
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
RemovePayment
��% 2
(
��2 3
id
��3 5
)
��5 6
;
��6 7
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
}
�� 
}�� �J
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\RestaurantServiceController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
	Authorize 
( 
Roles 
= 
$str &
)& '
]' (
[ 
RoutePrefix 
( 
$str !
)! "
]" #
public 

class '
RestaurantServiceController ,
:- .
ApiController/ <
{ 
	protected 
readonly 
Facades "
." #
RestaurantService# 4
.4 5#
RestaurantServiceFacade5 L
_facadeM T
;T U'
RestaurantServiceController #
(# $
)$ %
{ 	
_facade 
= 
new 
Facades !
.! "
RestaurantService" 3
.3 4#
RestaurantServiceFacade4 K
(K L
)L M
;M N
} 	
["" 	
AllowAnonymous""	 
]"" 
[## 	
HttpGet##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
HttpResponseMessage%% -
>%%- .
Get%%/ 2
(%%2 3
)%%3 4
{&& 	
IEnumerable'' 
<'' 

Restaurant'' "
>''" #
restaurants''$ /
=''0 1
await''2 7
_facade''8 ?
.''? @
GetRestaurants''@ N
(''N O
)''O P
;''P Q
if)) 
()) 
restaurants)) 
.)) 
Any)) 
())  
)))  !
)))! "
return** 
Request** 
.** 
CreateResponse** -
(**- .
HttpStatusCode**. <
.**< =
OK**= ?
,**? @
restaurants**A L
)**L M
;**M N
return,, 
Request,, 
.,, 
CreateErrorResponse,, .
(,,. /
HttpStatusCode,,/ =
.,,= >
	NoContent,,> G
,,,G H
$str,,I _
),,_ `
;,,` a
}-- 	
[33 	
AllowAnonymous33	 
]33 
[44 	
HttpGet44	 
]44 
[55 	
Route55	 
(55 
$str55 
)55 
]55  
public66 
async66 
Task66 
<66 
HttpResponseMessage66 -
>66- .
Get66/ 2
(662 3
int663 6
id667 9
)669 :
{77 	

Restaurant88 

restaurant88 !
=88" #
await88$ )
_facade88* 1
.881 2
GetRestaurantById882 C
(88C D
id88D F
)88F G
;88G H
if:: 
(:: 

restaurant:: 
!=:: 
null:: "
)::" #
return;; 
Request;; 
.;; 
CreateResponse;; -
(;;- .
HttpStatusCode;;. <
.;;< =
OK;;= ?
,;;? @

restaurant;;A K
);;K L
;;;L M
return== 
Request== 
.== 
CreateErrorResponse== .
(==. /
HttpStatusCode==/ =
.=== >
	NoContent==> G
,==G H
$str==I e
)==e f
;==f g
}>> 	
[EE 	
HttpPostEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF 
)FF 
]FF 
publicGG 
asyncGG 
TaskGG 
<GG 
HttpResponseMessageGG -
>GG- .
PostGG/ 3
(GG3 4

RestaurantGG4 >

restaurantGG? I
)GGI J
{HH 	

RestaurantII 
newRestaurantII $
=II% &
awaitII' ,
_facadeII- 4
.II4 5
PostRestaurantII5 C
(IIC D

restaurantIID N
)IIN O
;IIO P
ifKK 
(KK 
newRestaurantKK 
!=KK  
nullKK! %
)KK% &
returnLL 
RequestLL 
.LL 
CreateResponseLL -
(LL- .
HttpStatusCodeLL. <
.LL< =
OKLL= ?
,LL? @
newRestaurantLLA N
)LLN O
;LLO P
returnNN 
RequestNN 
.NN 
CreateErrorResponseNN .
(NN. /
HttpStatusCodeNN/ =
.NN= >
InternalServerErrorNN> Q
,NNQ R
$strNNS s
)NNs t
;NNt u
}OO 	
[VV 	
HttpPutVV	 
]VV 
[WW 	
RouteWW	 
(WW 
$strWW 
)WW 
]WW 
publicXX 
asyncXX 
TaskXX 
<XX 
HttpResponseMessageXX -
>XX- .
UpdateXX/ 5
(XX5 6

RestaurantXX6 @

restaurantXXA K
)XXK L
{YY 	

RestaurantZZ 
updatedRestaurantZZ (
=ZZ) *
awaitZZ+ 0
_facadeZZ1 8
.ZZ8 9
UpdateRestaurantZZ9 I
(ZZI J

restaurantZZJ T
)ZZT U
;ZZU V
if\\ 
(\\ 
updatedRestaurant\\ !
!=\\" $
null\\% )
)\\) *
return]] 
Request]] 
.]] 
CreateResponse]] -
(]]- .
HttpStatusCode]]. <
.]]< =
OK]]= ?
,]]? @
updatedRestaurant]]A R
)]]R S
;]]S T
return__ 
Request__ 
.__ 
CreateErrorResponse__ .
(__. /
HttpStatusCode__/ =
.__= >
InternalServerError__> Q
,__Q R
$str__S u
)__u v
;__v w
}`` 	
[gg 	

HttpDeletegg	 
]gg 
[hh 	
Routehh	 
(hh 
$strhh !
)hh! "
]hh" #
publicii 
asyncii 
Taskii 
<ii 
HttpResponseMessageii -
>ii- .
Deleteii/ 5
(ii5 6
intii6 9
idii: <
)ii< =
{jj 	
boolkk 
reskk 
=kk 
awaitkk 
_facadekk $
.kk$ %
RemoveRestaurantkk% 5
(kk5 6
idkk6 8
)kk8 9
;kk9 :
ifmm 
(mm 
resmm 
)mm 
returnnn 
Requestnn 
.nn 
CreateResponsenn -
(nn- .
HttpStatusCodenn. <
.nn< =
OKnn= ?
)nn? @
;nn@ A
returnpp 
Requestpp 
.pp 
CreateErrorResponsepp .
(pp. /
HttpStatusCodepp/ =
.pp= >
InternalServerErrorpp> Q
,ppQ R
$strppS u
)ppu v
;ppv w
}qq 	
[yy 	
HttpPutyy	 
]yy 
[zz 	
Routezz	 
(zz 
$strzz 8
)zz8 9
]zz9 :
public{{ 
async{{ 
Task{{ 
<{{ 
HttpResponseMessage{{ -
>{{- .
AddMenuItem{{/ :
({{: ;
int{{; >
id{{? A
,{{A B
int{{C F

menuItemId{{G Q
){{Q R
{|| 	
bool}} 
res}} 
=}} 
await}} 
_facade}} $
.}}$ %
AddMenuItem}}% 0
(}}0 1
id}}1 3
,}}3 4

menuItemId}}5 ?
)}}? @
;}}@ A
if 
( 
res 
) 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
[
�� 	

HttpDelete
��	 
]
�� 
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
��< =
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
�� 	
bool
�� 
res
�� 
=
�� 
await
�� 
_facade
�� $
.
��$ %
RemoveMenuItem
��% 3
(
��3 4
id
��4 6
,
��6 7

menuItemId
��8 B
)
��B C
;
��C D
if
�� 
(
�� 
res
�� 
)
�� 
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
)
��? @
;
��@ A
return
�� 
Request
�� 
.
�� !
CreateErrorResponse
�� .
(
��. /
HttpStatusCode
��/ =
.
��= >!
InternalServerError
��> Q
,
��Q R
$str
��S u
)
��u v
;
��v w
}
�� 	
}
�� 
}�� �5
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Controllers\TableServiceController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
	Authorize 
( 
Roles 
= 
$str &
)& '
]' (
[ 
AllowAnonymous 
] 
[ 
RoutePrefix 
( 
$str 
) 
] 
public 

class "
TableServiceController '
:( )
ApiController* 7
{ 
	protected 
readonly 
Facades "
." #
RestaurantService# 4
.4 5(
RestaurantServiceTableFacade5 Q
_facadeR Y
;Y Z"
TableServiceController 
( 
)  
{ 	
_facade 
= 
new 
Facades !
.! "
RestaurantService" 3
.3 4(
RestaurantServiceTableFacade4 P
(P Q
)Q R
;R S
} 	
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
HttpResponseMessage$$ -
>$$- .
Get$$/ 2
($$2 3
)$$3 4
{%% 	
IEnumerable&& 
<&& 
Table&& 
>&& 
tables&& %
=&&& '
await&&( -
_facade&&. 5
.&&5 6
	GetTables&&6 ?
(&&? @
)&&@ A
;&&A B
if(( 
((( 
tables(( 
.(( 
Any(( 
((( 
)(( 
)(( 
return)) 
Request)) 
.)) 
CreateResponse)) -
())- .
HttpStatusCode)). <
.))< =
OK))= ?
,))? @
tables))A G
)))G H
;))H I
return++ 
Request++ 
.++ 
CreateErrorResponse++ .
(++. /
HttpStatusCode++/ =
.++= >
	NoContent++> G
,++G H
$str++I Z
)++Z [
;++[ \
},, 	
[22 	
HttpGet22	 
]22 
[33 	
Route33	 
(33 
$str33 
)33 
]33  
public44 
async44 
Task44 
<44 
HttpResponseMessage44 -
>44- .
Get44/ 2
(442 3
int443 6
id447 9
)449 :
{55 	
Table66 
table66 
=66 
await66 
_facade66  '
.66' (
GetTableById66( 4
(664 5
id665 7
)667 8
;668 9
if88 
(88 
table88 
!=88 
null88 
)88 
return99 
Request99 
.99 
CreateResponse99 -
(99- .
HttpStatusCode99. <
.99< =
OK99= ?
,99? @
table99A F
)99F G
;99G H
return;; 
Request;; 
.;; 
CreateErrorResponse;; .
(;;. /
HttpStatusCode;;/ =
.;;= >
	NoContent;;> G
,;;G H
$str;;I `
);;` a
;;;a b
}<< 	
[CC 	
HttpPostCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD 
)DD 
]DD 
publicEE 
asyncEE 
TaskEE 
<EE 
HttpResponseMessageEE -
>EE- .
PostEE/ 3
(EE3 4
TableEE4 9
tableEE: ?
)EE? @
{FF 	
TableGG 
newTableGG 
=GG 
awaitGG "
_facadeGG# *
.GG* +
	PostTableGG+ 4
(GG4 5
tableGG5 :
)GG: ;
;GG; <
ifII 
(II 
newTableII 
!=II 
nullII  
)II  !
returnJJ 
RequestJJ 
.JJ 
CreateResponseJJ -
(JJ- .
HttpStatusCodeJJ. <
.JJ< =
OKJJ= ?
,JJ? @
newTableJJA I
)JJI J
;JJJ K
returnLL 
RequestLL 
.LL 
CreateErrorResponseLL .
(LL. /
HttpStatusCodeLL/ =
.LL= >
InternalServerErrorLL> Q
,LLQ R
$strLLS s
)LLs t
;LLt u
}MM 	
[TT 	
HttpPutTT	 
]TT 
[UU 	
RouteUU	 
(UU 
$strUU 
)UU 
]UU 
publicVV 
asyncVV 
TaskVV 
<VV 
HttpResponseMessageVV -
>VV- .
UpdateVV/ 5
(VV5 6
TableVV6 ;
tableVV< A
)VVA B
{WW 	
TableXX 
updatedTableXX 
=XX  
awaitXX! &
_facadeXX' .
.XX. /
UpdateTableXX/ :
(XX: ;
tableXX; @
)XX@ A
;XXA B
ifZZ 
(ZZ 
updatedTableZZ 
!=ZZ 
nullZZ  $
)ZZ$ %
return[[ 
Request[[ 
.[[ 
CreateResponse[[ -
([[- .
HttpStatusCode[[. <
.[[< =
OK[[= ?
,[[? @
updatedTable[[A M
)[[M N
;[[N O
return]] 
Request]] 
.]] 
CreateErrorResponse]] .
(]]. /
HttpStatusCode]]/ =
.]]= >
InternalServerError]]> Q
,]]Q R
$str]]S u
)]]u v
;]]v w
}^^ 	
[ee 	

HttpDeleteee	 
]ee 
[ff 	
Routeff	 
(ff 
$strff !
)ff! "
]ff" #
publicgg 
asyncgg 
Taskgg 
<gg 
HttpResponseMessagegg -
>gg- .
Deletegg/ 5
(gg5 6
intgg6 9
idgg: <
)gg< =
{hh 	
boolii 
resii 
=ii 
awaitii 
_facadeii $
.ii$ %
RemoveTableii% 0
(ii0 1
idii1 3
)ii3 4
;ii4 5
ifkk 
(kk 
reskk 
)kk 
returnll 
Requestll 
.ll 
CreateResponsell -
(ll- .
HttpStatusCodell. <
.ll< =
OKll= ?
)ll? @
;ll@ A
returnnn 
Requestnn 
.nn 
CreateErrorResponsenn .
(nn. /
HttpStatusCodenn/ =
.nn= >
InternalServerErrornn> Q
,nnQ R
$strnnS u
)nnu v
;nnv w
}oo 	
}pp 
}qq �S
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\BookingService\BookingServiceFacade.cs
	namespace

 	
WebApi


 
.

 
Facades

 
.

 
BookingService

 '
{ 
public 

class  
BookingServiceFacade %
:& ' 
GenericServiceFacade( <
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ e
;e f
public  
BookingServiceFacade #
(# $
)$ %
{ 	
} 	
public  
BookingServiceFacade #
(# $

HttpClient$ .
client/ 5
)5 6
:7 8
base9 =
(= >
client> D
)D E
{   	
}!! 	
public'' 
async'' 
Task'' 
<'' 

IQueryable'' $
<''$ %
Booking''% ,
>'', -
>''- .
GetBookings''/ :
('': ;
)''; <
{(( 	
try)) 
{** 
HttpRequestMessage++ "
request++# *
=+++ ,
new++- 0
HttpRequestMessage++1 C
{,, 
Method-- 
=-- 

HttpMethod-- '
.--' (
Get--( +
,--+ ,

RequestUri.. 
=..  
new..! $
Uri..% (
(..( )
_baseUrl..) 1
+..2 3
$str..4 9
)..9 :
}// 
;// 

IQueryable11 
<11 
Booking11 "
>11" #
res11$ '
=11( )
await11* /#
ExecuteRequestAsyncList110 G
<11G H
Booking11H O
>11O P
(11P Q
request11Q X
)11X Y
;11Y Z
return33 
res33 
.33 
Any33 
(33 
)33  
?44 
res44 
:55 

Enumerable55  
.55  !
Empty55! &
<55& '
Booking55' .
>55. /
(55/ 0
)550 1
.551 2
AsQueryable552 =
(55= >
)55> ?
;55? @
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 

Enumerable99 !
.99! "
Empty99" '
<99' (
Booking99( /
>99/ 0
(990 1
)991 2
.992 3
AsQueryable993 >
(99> ?
)99? @
;99@ A
}:: 
};; 	
publicBB 
asyncBB 
TaskBB 
<BB 
BookingBB !
>BB! "
GetBookingByIdBB# 1
(BB1 2
intBB2 5
idBB6 8
)BB8 9
{CC 	
tryDD 
{EE 
HttpRequestMessageFF "
requestFF# *
=FF+ ,
newFF- 0
HttpRequestMessageFF1 C
{GG 
MethodHH 
=HH 

HttpMethodHH '
.HH' (
GetHH( +
,HH+ ,

RequestUriII 
=II  
newII! $
UriII% (
(II( )
_baseUrlII) 1
+II2 3
$strII4 :
+II; <
idII= ?
)II? @
}JJ 
;JJ 
returnLL 
awaitLL 
ExecuteRequestAsyncLL 0
<LL0 1
BookingLL1 8
>LL8 9
(LL9 :
requestLL: A
)LLA B
;LLB C
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
returnPP 
nullPP 
;PP 
}QQ 
}RR 	
publicYY 
asyncYY 
TaskYY 
<YY 

IQueryableYY $
<YY$ %
BookingYY% ,
>YY, -
>YY- .#
GetBookingsByCustomerIdYY/ F
(YYF G
intYYG J
idYYK M
)YYM N
{ZZ 	
try[[ 
{\\ 
HttpRequestMessage]] "
request]]# *
=]]+ ,
new]]- 0
HttpRequestMessage]]1 C
{^^ 
Method__ 
=__ 

HttpMethod__ '
.__' (
Get__( +
,__+ ,

RequestUri`` 
=``  
new``! $
Uri``% (
(``( )
_baseUrl``) 1
+``2 3
$str``4 D
+``E F
id``G I
)``I J
}aa 
;aa 
returncc 
awaitcc #
ExecuteRequestAsyncListcc 4
<cc4 5
Bookingcc5 <
>cc< =
(cc= >
requestcc> E
)ccE F
;ccF G
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
returngg 
nullgg 
;gg 
}hh 
}ii 	
publicpp 
asyncpp 
Taskpp 
<pp 
Tablepp 
>pp  
GetAvailableTablepp! 2
(pp2 3
Bookingpp3 :
bookingpp; B
)ppB C
{qq 	
tryrr 
{ss 
HttpRequestMessagett "
requesttt# *
=tt+ ,
newtt- 0
HttpRequestMessagett1 C
{uu 
Methodvv 
=vv 

HttpMethodvv '
.vv' (
Postvv( ,
,vv, -

RequestUriww 
=ww  
newww! $
Uriww% (
(ww( )
_baseUrlww) 1
+ww2 3
$strww4 G
)wwG H
,wwH I
Contentxx 
=xx 
newxx !
StringContentxx" /
(xx/ 0
JsonConvertxx0 ;
.xx; <
SerializeObjectxx< K
(xxK L
bookingxxL S
)xxS T
,xxT U
EncodingxxV ^
.xx^ _
UTF8xx_ c
,xxc d
$strxxe w
)xxw x
}yy 
;yy 
return{{ 
await{{ 
ExecuteRequestAsync{{ 0
<{{0 1
Table{{1 6
>{{6 7
({{7 8
request{{8 ?
){{? @
;{{@ A
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
return 
null 
; 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Booking
�� !
>
��! "
PostBooking
��# .
(
��. /
Booking
��/ 6
booking
��7 >
)
��> ?
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Post
��( ,
,
��, -

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 <
)
��< =
,
��= >
Content
�� 
=
�� 
new
�� !
StringContent
��" /
(
��/ 0
JsonConvert
��0 ;
.
��; <
SerializeObject
��< K
(
��K L
booking
��L S
)
��S T
,
��T U
Encoding
��V ^
.
��^ _
UTF8
��_ c
,
��c d
$str
��e w
)
��w x
}
�� 
;
�� 
return
�� 
await
�� !
ExecuteRequestAsync
�� 0
<
��0 1
Booking
��1 8
>
��8 9
(
��9 :
request
��: A
)
��A B
;
��B C
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Booking
�� !
>
��! "
UpdateBooking
��# 0
(
��0 1
Booking
��1 8
booking
��9 @
)
��@ A
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Put
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 =
+
��> ?
booking
��@ G
.
��G H
Id
��H J
)
��J K
,
��K L
Content
�� 
=
�� 
new
�� !
StringContent
��" /
(
��/ 0
JsonConvert
��0 ;
.
��; <
SerializeObject
��< K
(
��K L
booking
��L S
)
��S T
,
��T U
Encoding
��V ^
.
��^ _
UTF8
��_ c
,
��c d
$str
��e w
)
��w x
}
�� 
;
�� 
return
�� 
await
�� !
ExecuteRequestAsync
�� 0
<
��0 1
Booking
��1 8
>
��8 9
(
��9 :
request
��: A
)
��A B
;
��B C
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveBooking
��  -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
CancelBooking
��  -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �Q
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\BookingService\PaymentServiceFacade.cs
	namespace 	
WebApi
 
. 
Facades 
. 
BookingService '
{ 
public 

class  
PaymentServiceFacade %
:& ' 
GenericServiceFacade( <
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ e
;e f
public  
PaymentServiceFacade #
(# $
)$ %
{ 	
} 	
public!!  
PaymentServiceFacade!! #
(!!# $

HttpClient!!$ .
client!!/ 5
)!!5 6
:!!7 8
base!!9 =
(!!= >
client!!> D
)!!D E
{"" 	
}## 	
public)) 
async)) 
Task)) 
<)) 

IQueryable)) $
<))$ %
Payment))% ,
>)), -
>))- .
GetPayments))/ :
()): ;
))); <
{** 	
try++ 
{,, 
HttpRequestMessage-- "
request--# *
=--+ ,
new--- 0
HttpRequestMessage--1 C
{.. 
Method// 
=// 

HttpMethod// '
.//' (
Get//( +
,//+ ,

RequestUri00 
=00  
new00! $
Uri00% (
(00( )
_baseUrl00) 1
+002 3
$str004 9
)009 :
}11 
;11 

IQueryable33 
<33 
Payment33 "
>33" #
res33$ '
=33( )
await33* /#
ExecuteRequestAsyncList330 G
<33G H
Payment33H O
>33O P
(33P Q
request33Q X
)33X Y
;33Y Z
return55 
res55 
.55 
Any55 
(55 
)55  
?66 
res66 
:77 

Enumerable77  
.77  !
Empty77! &
<77& '
Payment77' .
>77. /
(77/ 0
)770 1
.771 2
AsQueryable772 =
(77= >
)77> ?
;77? @
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
return;; 

Enumerable;; !
.;;! "
Empty;;" '
<;;' (
Payment;;( /
>;;/ 0
(;;0 1
);;1 2
.;;2 3
AsQueryable;;3 >
(;;> ?
);;? @
;;;@ A
}<< 
}== 	
publicDD 
asyncDD 
TaskDD 
<DD 
PaymentDD !
>DD! "
GetPaymentByIdDD# 1
(DD1 2
intDD2 5
idDD6 8
)DD8 9
{EE 	
tryFF 
{GG 
HttpRequestMessageHH "
requestHH# *
=HH+ ,
newHH- 0
HttpRequestMessageHH1 C
{II 
MethodJJ 
=JJ 

HttpMethodJJ '
.JJ' (
GetJJ( +
,JJ+ ,

RequestUriKK 
=KK  
newKK! $
UriKK% (
(KK( )
_baseUrlKK) 1
+KK2 3
$strKK4 :
+KK; <
idKK= ?
)KK? @
}LL 
;LL 
returnNN 
awaitNN 
ExecuteRequestAsyncNN 0
<NN0 1
PaymentNN1 8
>NN8 9
(NN9 :
requestNN: A
)NNA B
;NNB C
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
returnRR 
nullRR 
;RR 
}SS 
}TT 	
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 

IQueryableZZ $
<ZZ$ %
PaymentMethodZZ% 2
>ZZ2 3
>ZZ3 4
GetPaymentMethodsZZ5 F
(ZZF G
)ZZG H
{[[ 	
try\\ 
{]] 
HttpRequestMessage^^ "
request^^# *
=^^+ ,
new^^- 0
HttpRequestMessage^^1 C
{__ 
Method`` 
=`` 

HttpMethod`` '
.``' (
Get``( +
,``+ ,

RequestUriaa 
=aa  
newaa! $
Uriaa% (
(aa( )
_baseUrlaa) 1
+aa2 3
$straa4 F
)aaF G
}bb 
;bb 

IQueryabledd 
<dd 
PaymentMethoddd (
>dd( )
resdd* -
=dd. /
awaitdd0 5#
ExecuteRequestAsyncListdd6 M
<ddM N
PaymentMethodddN [
>dd[ \
(dd\ ]
requestdd] d
)ddd e
;dde f
returnff 
resff 
.ff 
Anyff 
(ff 
)ff  
?gg 
resgg 
:hh 

Enumerablehh  
.hh  !
Emptyhh! &
<hh& '
PaymentMethodhh' 4
>hh4 5
(hh5 6
)hh6 7
.hh7 8
AsQueryablehh8 C
(hhC D
)hhD E
;hhE F
}ii 
catchjj 
(jj 
	Exceptionjj 
exjj 
)jj  
{kk 
returnll 

Enumerablell !
.ll! "
Emptyll" '
<ll' (
PaymentMethodll( 5
>ll5 6
(ll6 7
)ll7 8
.ll8 9
AsQueryablell9 D
(llD E
)llE F
;llF G
}mm 
}nn 	
publicuu 
asyncuu 
Taskuu 
<uu 
PaymentMethoduu '
>uu' ( 
GetPaymentMethodByIduu) =
(uu= >
intuu> A
iduuB D
)uuD E
{vv 	
tryww 
{xx 
HttpRequestMessageyy "
requestyy# *
=yy+ ,
newyy- 0
HttpRequestMessageyy1 C
{zz 
Method{{ 
={{ 

HttpMethod{{ '
.{{' (
Get{{( +
,{{+ ,

RequestUri|| 
=||  
new||! $
Uri||% (
(||( )
_baseUrl||) 1
+||2 3
$str||4 G
+||H I
id||J L
)||L M
}}} 
;}} 
return 
await 
ExecuteRequestAsync 0
<0 1
PaymentMethod1 >
>> ?
(? @
request@ G
)G H
;H I
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Payment
�� !
>
��! "
PostPayment
��# .
(
��. /
Payment
��/ 6
payment
��7 >
)
��> ?
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Post
��( ,
,
��, -

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 <
)
��< =
,
��= >
Content
�� 
=
�� 
new
�� !
StringContent
��" /
(
��/ 0
JsonConvert
��0 ;
.
��; <
SerializeObject
��< K
(
��K L
payment
��L S
)
��S T
,
��T U
Encoding
��V ^
.
��^ _
UTF8
��_ c
,
��c d
$str
��e w
)
��w x
}
�� 
;
�� 
return
�� 
await
�� !
ExecuteRequestAsync
�� 0
<
��0 1
Payment
��1 8
>
��8 9
(
��9 :
request
��: A
)
��A B
;
��B C
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Payment
�� !
>
��! "
UpdatePayment
��# 0
(
��0 1
Payment
��1 8
payment
��9 @
)
��@ A
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Put
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 =
+
��> ?
payment
��@ G
.
��G H
Id
��H J
)
��J K
,
��K L
Content
�� 
=
�� 
new
�� !
StringContent
��" /
(
��/ 0
JsonConvert
��0 ;
.
��; <
SerializeObject
��< K
(
��K L
payment
��L S
)
��S T
,
��T U
Encoding
��V ^
.
��^ _
UTF8
��_ c
,
��c d
$str
��e w
)
��w x
}
�� 
;
�� 
return
�� 
await
�� !
ExecuteRequestAsync
�� 0
<
��0 1
Payment
��1 8
>
��8 9
(
��9 :
request
��: A
)
��A B
;
��B C
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemovePayment
��  -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �-
C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\Core\GenericServiceFacade.cs
	namespace 	
WebApi
 
. 
Facades 
. 
Core 
{ 
public 

class  
GenericServiceFacade %
:& '
ApiController( 5
{ 
	protected 
readonly 

HttpClient %
_client& -
;- .
	protected "
JsonSerializerSettings (
_serializerSettings) <
;< =
public  
GenericServiceFacade #
(# $
)$ %
{   	
_client!! 
=!! 
new!! 

HttpClient!! $
(!!$ %
)!!% &
;!!& '
_client"" 
."" !
DefaultRequestHeaders"" )
."") *
Accept""* 0
.""0 1
Add""1 4
(""4 5
new""5 8+
MediaTypeWithQualityHeaderValue""9 X
(""X Y
$str""Y k
)""k l
)""l m
;""m n
_serializerSettings## 
=##  !
new##" %"
JsonSerializerSettings##& <
{##= >
NullValueHandling##? P
=##Q R
NullValueHandling##S d
.##d e
Ignore##e k
,##k l"
MissingMemberHandling	##m �
=
##� �#
MissingMemberHandling
##� �
.
##� �
Ignore
##� �
}
##� �
;
##� �
}$$ 	
public**  
GenericServiceFacade** #
(**# $

HttpClient**$ .
client**/ 5
)**5 6
{++ 	
_client,, 
=,, 
client,, 
;,, 
_serializerSettings-- 
=--  !
new--" %"
JsonSerializerSettings--& <
{--= >
NullValueHandling--? P
=--Q R
NullValueHandling--S d
.--d e
Ignore--e k
,--k l"
MissingMemberHandling	--m �
=
--� �#
MissingMemberHandling
--� �
.
--� �
Ignore
--� �
}
--� �
;
--� �
}.. 	
	protected55 
async55 
Task55 
<55 
bool55 !
>55! "
ExecuteRemove55# 0
(550 1
Uri551 4
uri555 8
)558 9
{66 	
try77 
{88 
HttpRequestMessage99 "
request99# *
=99+ ,
new99- 0
HttpRequestMessage991 C
{:: 
Method;; 
=;; 

HttpMethod;; '
.;;' (
Delete;;( .
,;;. /

RequestUri<< 
=<<  
uri<<! $
}== 
;== 
HttpResponseMessage?? #
response??$ ,
=??- .
await??/ 4
_client??5 <
.??< =
	SendAsync??= F
(??F G
request??G N
)??N O
;??O P
response@@ 
.@@ #
EnsureSuccessStatusCode@@ 0
(@@0 1
)@@1 2
;@@2 3
returnBB 
trueBB 
;BB 
}CC 
catchDD 
(DD 
	ExceptionDD 
exDD 
)DD  
{EE 
returnFF 
falseFF 
;FF 
}GG 
}HH 	
	protectedPP 
asyncPP 
TaskPP 
<PP 
TPP 
>PP 
ExecuteRequestAsyncPP  3
<PP3 4
TPP4 5
>PP5 6
(PP6 7
HttpRequestMessagePP7 I
requestPPJ Q
)PPQ R
wherePPS X
TPPY Z
:PP[ \
classPP] b
{QQ 	
HttpResponseMessageRR 
responseRR  (
=RR) *
awaitRR+ 0
_clientRR1 8
.RR8 9
	SendAsyncRR9 B
(RRB C
requestRRC J
)RRJ K
;RRK L
responseSS 
.SS #
EnsureSuccessStatusCodeSS ,
(SS, -
)SS- .
;SS. /
stringTT 
contentTT 
=TT 
awaitTT "
responseTT# +
.TT+ ,
ContentTT, 3
.TT3 4
ReadAsStringAsyncTT4 E
(TTE F
)TTF G
;TTG H
returnUU 
JsonConvertUU 
.UU 
DeserializeObjectUU 0
<UU0 1
TUU1 2
>UU2 3
(UU3 4
contentUU4 ;
,UU; <
_serializerSettingsUU= P
)UUP Q
;UUQ R
}VV 	
	protected^^ 
async^^ 
Task^^ 
<^^ 

IQueryable^^ '
<^^' (
T^^( )
>^^) *
>^^* +#
ExecuteRequestAsyncList^^, C
<^^C D
T^^D E
>^^E F
(^^F G
HttpRequestMessage^^G Y
request^^Z a
)^^a b
where^^c h
T^^i j
:^^k l
class^^m r
{__ 	
HttpResponseMessage`` 
response``  (
=``) *
await``+ 0
_client``1 8
.``8 9
	SendAsync``9 B
(``B C
request``C J
)``J K
;``K L
responseaa 
.aa #
EnsureSuccessStatusCodeaa ,
(aa, -
)aa- .
;aa. /
stringbb 
contentbb 
=bb 
awaitbb "
responsebb# +
.bb+ ,
Contentbb, 3
.bb3 4
ReadAsStringAsyncbb4 E
(bbE F
)bbF G
;bbG H
returncc 
JsonConvertcc 
.cc 
DeserializeObjectcc 0
<cc0 1
Listcc1 5
<cc5 6
Tcc6 7
>cc7 8
>cc8 9
(cc9 :
contentcc: A
,ccA B
_serializerSettingsccC V
)ccV W
.ccW X
AsQueryableccX c
(ccc d
)ccd e
;cce f
}dd 	
}ee 
}ff �7
{C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\CustomerServiceFacade.cs
	namespace 	
WebApi
 
. 
Facades 
{ 
public 

class !
CustomerServiceFacade &
:' ( 
GenericServiceFacade) =
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ ^
;^ _
public !
CustomerServiceFacade $
($ %
)% &
{ 	
} 	
public!! !
CustomerServiceFacade!! $
(!!$ %

HttpClient!!% /
client!!0 6
)!!6 7
:!!8 9
base!!: >
(!!> ?
client!!? E
)!!E F
{"" 	
}## 	
public** 
async** 
Task** 
<** 
Customer** "
>**" #
GetCustomer**$ /
(**/ 0
int**0 3
id**4 6
)**6 7
{++ 	
try,, 
{-- 
HttpRequestMessage.. "
request..# *
=..+ ,
new..- 0
HttpRequestMessage..1 C
{// 
Method00 
=00 

HttpMethod00 '
.00' (
Get00( +
,00+ ,

RequestUri11 
=11  
new11! $
Uri11% (
(11( )
_baseUrl11) 1
+112 3
$str114 :
+11; <
id11= ?
)11? @
}22 
;22 
return44 
await44 
ExecuteRequestAsync44 0
<440 1
Customer441 9
>449 :
(44: ;
request44; B
)44B C
;44C D
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
return88 
null88 
;88 
}99 
}:: 	
publicBB 
asyncBB 
TaskBB 
<BB 
CustomerBB "
>BB" #
GetCustomerBB$ /
(BB/ 0
stringBB0 6
owinIdBB7 =
,BB= >
stringBB? E
usernameBBF N
)BBN O
{CC 	
tryDD 
{EE 
HttpRequestMessageFF "
requestFF# *
=FF+ ,
newFF- 0
HttpRequestMessageFF1 C
{GG 
MethodHH 
=HH 

HttpMethodHH '
.HH' (
PostHH( ,
,HH, -

RequestUriII 
=II  
newII! $
UriII% (
(II( )
_baseUrlII) 1
+II2 3
$strII4 ?
)II? @
,II@ A
ContentJJ 
=JJ 
newJJ !
StringContentJJ" /
(JJ/ 0
JsonConvertJJ0 ;
.JJ; <
SerializeObjectJJ< K
(JJK L
newJJL O
CustomerJJP X
{JJY Z

OwinUserIdJJ[ e
=JJf g
owinIdJJh n
,JJn o
UserNameJJp x
=JJy z
username	JJ{ �
}
JJ� �
)
JJ� �
,
JJ� �
Encoding
JJ� �
.
JJ� �
UTF8
JJ� �
,
JJ� �
$str
JJ� �
)
JJ� �
}KK 
;KK 
returnMM 
awaitMM 
ExecuteRequestAsyncMM 0
<MM0 1
CustomerMM1 9
>MM9 :
(MM: ;
requestMM; B
)MMB C
;MMC D
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
returnQQ 
nullQQ 
;QQ 
}RR 
}SS 	
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
CustomerZZ "
>ZZ" #
PostCustomerZZ$ 0
(ZZ0 1
CustomerZZ1 9
customerZZ: B
)ZZB C
{[[ 	
try\\ 
{]] 
HttpRequestMessage^^ "
request^^# *
=^^+ ,
new^^- 0
HttpRequestMessage^^1 C
{__ 
Method`` 
=`` 

HttpMethod`` '
.``' (
Post``( ,
,``, -

RequestUriaa 
=aa  
newaa! $
Uriaa% (
(aa( )
_baseUrlaa) 1
+aa2 3
$straa4 <
)aa< =
,aa= >
Contentbb 
=bb 
newbb !
StringContentbb" /
(bb/ 0
JsonConvertbb0 ;
.bb; <
SerializeObjectbb< K
(bbK L
customerbbL T
)bbT U
,bbU V
EncodingbbW _
.bb_ `
UTF8bb` d
,bbd e
$strbbf x
)bbx y
}cc 
;cc 
returnee 
awaitee 
ExecuteRequestAsyncee 0
<ee0 1
Customeree1 9
>ee9 :
(ee: ;
requestee; B
)eeB C
;eeC D
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
returnii 
nullii 
;ii 
}jj 
}kk 	
publicrr 
asyncrr 
Taskrr 
<rr 
Customerrr "
>rr" #
UpdateCustomerrr$ 2
(rr2 3
Customerrr3 ;
customerrr< D
)rrD E
{ss 	
trytt 
{uu 
HttpRequestMessagevv "
requestvv# *
=vv+ ,
newvv- 0
HttpRequestMessagevv1 C
{ww 
Methodxx 
=xx 

HttpMethodxx '
.xx' (
Putxx( +
,xx+ ,

RequestUriyy 
=yy  
newyy! $
Uriyy% (
(yy( )
_baseUrlyy) 1
+yy2 3
$stryy4 =
+yy> ?
customeryy@ H
.yyH I
IdyyI K
)yyK L
,yyL M
Contentzz 
=zz 
newzz !
StringContentzz" /
(zz/ 0
JsonConvertzz0 ;
.zz; <
SerializeObjectzz< K
(zzK L
customerzzL T
)zzT U
,zzU V
EncodingzzW _
.zz_ `
UTF8zz` d
,zzd e
$strzzf x
)zzx y
}{{ 
;{{ 
return}} 
await}} 
ExecuteRequestAsync}} 0
<}}0 1
Customer}}1 9
>}}9 :
(}}: ;
request}}; B
)}}B C
;}}C D
}~~ 
catch 
( 
	Exception 
ex 
)  
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveRestaurant
��  0
(
��0 1
int
��1 4
id
��5 7
)
��7 8
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �@
xC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\ImageServiceFacade.cs
	namespace 	
WebApi
 
. 
Facades 
{ 
public 

class 
ImageServiceFacade #
:$ % 
GenericServiceFacade& :
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ [
;[ \
public 
ImageServiceFacade !
(! "
)" #
{ 	
} 	
public!! 
ImageServiceFacade!! !
(!!! "

HttpClient!!" ,
client!!- 3
)!!3 4
:!!5 6
base!!7 ;
(!!; <
client!!< B
)!!B C
{"" 	
}## 	
public** 
async** 
Task** 
<** 
Image** 
>**  
UploadMenuItemImage**! 4
(**4 5
Image**5 :
image**; @
)**@ A
{++ 	
try,, 
{-- 
HttpRequestMessage.. "
request..# *
=..+ ,
new..- 0
HttpRequestMessage..1 C
{// 
Method00 
=00 

HttpMethod00 '
.00' (
Post00( ,
,00, -

RequestUri11 
=11  
new11! $
Uri11% (
(11( )
_baseUrl11) 1
+112 3
$str114 I
)11I J
,11J K
Content22 
=22 
new22 !
StringContent22" /
(22/ 0
JsonConvert220 ;
.22; <
SerializeObject22< K
(22K L
image22L Q
)22Q R
,22R S
Encoding22T \
.22\ ]
UTF822] a
,22a b
$str22c u
)22u v
}33 
;33 
return55 
await55 
ExecuteRequestAsync55 0
<550 1
Image551 6
>556 7
(557 8
request558 ?
)55? @
;55@ A
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 
null99 
;99 
}:: 
};; 	
publicBB 
asyncBB 
TaskBB 
<BB 
boolBB 
>BB 
RemoveMenuItemImageBB  3
(BB3 4
ImageBB4 9
imageBB: ?
)BB? @
{CC 	
tryDD 
{EE 
HttpRequestMessageFF "
requestFF# *
=FF+ ,
newFF- 0
HttpRequestMessageFF1 C
{GG 
MethodHH 
=HH 

HttpMethodHH '
.HH' (
PostHH( ,
,HH, -

RequestUriII 
=II  
newII! $
UriII% (
(II( )
_baseUrlII) 1
+II2 3
$strII4 I
)III J
,IIJ K
ContentJJ 
=JJ 
newJJ !
StringContentJJ" /
(JJ/ 0
JsonConvertJJ0 ;
.JJ; <
SerializeObjectJJ< K
(JJK L
imageJJL Q
)JJQ R
,JJR S
EncodingJJT \
.JJ\ ]
UTF8JJ] a
,JJa b
$strJJc u
)JJu v
}KK 
;KK 
HttpResponseMessageMM #
responseMM$ ,
=MM- .
awaitMM/ 4
_clientMM5 <
.MM< =
	SendAsyncMM= F
(MMF G
requestMMG N
)MMN O
;MMO P
responseNN 
.NN #
EnsureSuccessStatusCodeNN 0
(NN0 1
)NN1 2
;NN2 3
returnPP 
truePP 
;PP 
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
returnTT 
falseTT 
;TT 
}UU 
}VV 	
public]] 
async]] 
Task]] 
<]] 
Image]] 
>]]  !
UploadRestaurantImage]]! 6
(]]6 7
Image]]7 <
image]]= B
)]]B C
{^^ 	
try__ 
{`` 
HttpRequestMessageaa "
requestaa# *
=aa+ ,
newaa- 0
HttpRequestMessageaa1 C
{bb 
Methodcc 
=cc 

HttpMethodcc '
.cc' (
Postcc( ,
,cc, -

RequestUridd 
=dd  
newdd! $
Uridd% (
(dd( )
_baseUrldd) 1
+dd2 3
$strdd4 K
)ddK L
,ddL M
Contentee 
=ee 
newee !
StringContentee" /
(ee/ 0
JsonConvertee0 ;
.ee; <
SerializeObjectee< K
(eeK L
imageeeL Q
)eeQ R
,eeR S
EncodingeeT \
.ee\ ]
UTF8ee] a
,eea b
$streec u
)eeu v
}ff 
;ff 
returnhh 
awaithh 
ExecuteRequestAsynchh 0
<hh0 1
Imagehh1 6
>hh6 7
(hh7 8
requesthh8 ?
)hh? @
;hh@ A
}ii 
catchjj 
(jj 
	Exceptionjj 
exjj 
)jj  
{kk 
returnll 
nullll 
;ll 
}mm 
}nn 	
publicuu 
asyncuu 
Taskuu 
<uu 
booluu 
>uu !
RemoveRestaurantImageuu  5
(uu5 6
Imageuu6 ;
imageuu< A
)uuA B
{vv 	
tryww 
{xx 
HttpRequestMessageyy "
requestyy# *
=yy+ ,
newyy- 0
HttpRequestMessageyy1 C
{zz 
Method{{ 
={{ 

HttpMethod{{ '
.{{' (
Post{{( ,
,{{, -

RequestUri|| 
=||  
new||! $
Uri||% (
(||( )
_baseUrl||) 1
+||2 3
$str||4 K
)||K L
,||L M
Content}} 
=}} 
new}} !
StringContent}}" /
(}}/ 0
JsonConvert}}0 ;
.}}; <
SerializeObject}}< K
(}}K L
image}}L Q
)}}Q R
,}}R S
Encoding}}T \
.}}\ ]
UTF8}}] a
,}}a b
$str}}c u
)}}u v
}~~ 
;~~ !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
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
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Image
�� 
>
��  
	LoadImage
��! *
(
��* +
int
��+ .
id
��/ 1
)
��1 2
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Get
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 @
+
��A B
id
��C E
)
��E F
}
�� 
;
�� 
return
�� 
await
�� !
ExecuteRequestAsync
�� 0
<
��0 1
Image
��1 6
>
��6 7
(
��7 8
request
��8 ?
)
��? @
;
��@ A
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �8
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\MenuService\MenuServiceDietInfoFacade.cs
	namespace 	
WebApi
 
. 
Facades 
. 
MenuService $
{ 
public 

class %
MenuServiceDietInfoFacade *
:+ , 
GenericServiceFacade- A
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ c
;c d
public %
MenuServiceDietInfoFacade (
(( )
)) *
{ 	
} 	
public!! %
MenuServiceDietInfoFacade!! (
(!!( )

HttpClient!!) 3
client!!4 :
)!!: ;
:!!< =
base!!> B
(!!B C
client!!C I
)!!I J
{"" 	
}## 	
public)) 
async)) 
Task)) 
<)) 

IQueryable)) $
<))$ %
DietInfo))% -
>))- .
>)). /
GetDietInfo))0 ;
()); <
)))< =
{** 	
try++ 
{,, 
HttpRequestMessage-- "
request--# *
=--+ ,
new--- 0
HttpRequestMessage--1 C
{.. 
Method// 
=// 

HttpMethod// '
.//' (
Get//( +
,//+ ,

RequestUri00 
=00  
new00! $
Uri00% (
(00( )
_baseUrl00) 1
+002 3
$str004 9
)009 :
}11 
;11 

IQueryable33 
<33 
DietInfo33 #
>33# $
res33% (
=33) *
await33+ 0#
ExecuteRequestAsyncList331 H
<33H I
DietInfo33I Q
>33Q R
(33R S
request33S Z
)33Z [
;33[ \
return55 
res55 
.55 
Any55 
(55 
)55  
?66 
res66 
:77 

Enumerable77  
.77  !
Empty77! &
<77& '
DietInfo77' /
>77/ 0
(770 1
)771 2
.772 3
AsQueryable773 >
(77> ?
)77? @
;77@ A
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
return;; 

Enumerable;; !
.;;! "
Empty;;" '
<;;' (
DietInfo;;( 0
>;;0 1
(;;1 2
);;2 3
.;;3 4
AsQueryable;;4 ?
(;;? @
);;@ A
;;;A B
}<< 
}== 	
publicDD 
asyncDD 
TaskDD 
<DD 
DietInfoDD "
>DD" #
GetDietInfoByIdDD$ 3
(DD3 4
intDD4 7
idDD8 :
)DD: ;
{EE 	
tryFF 
{GG 
HttpRequestMessageHH "
requestHH# *
=HH+ ,
newHH- 0
HttpRequestMessageHH1 C
{II 
MethodJJ 
=JJ 

HttpMethodJJ '
.JJ' (
GetJJ( +
,JJ+ ,

RequestUriKK 
=KK  
newKK! $
UriKK% (
(KK( )
_baseUrlKK) 1
+KK2 3
$strKK4 :
+KK; <
idKK= ?
)KK? @
}LL 
;LL 
returnNN 
awaitNN 
ExecuteRequestAsyncNN 0
<NN0 1
DietInfoNN1 9
>NN9 :
(NN: ;
requestNN; B
)NNB C
;NNC D
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
returnRR 
nullRR 
;RR 
}SS 
}TT 	
public[[ 
async[[ 
Task[[ 
<[[ 
DietInfo[[ "
>[[" #
PostDietInfo[[$ 0
([[0 1
DietInfo[[1 9
dietInfo[[: B
)[[B C
{\\ 	
try]] 
{^^ 
HttpRequestMessage__ "
request__# *
=__+ ,
new__- 0
HttpRequestMessage__1 C
{`` 
Methodaa 
=aa 

HttpMethodaa '
.aa' (
Postaa( ,
,aa, -

RequestUribb 
=bb  
newbb! $
Uribb% (
(bb( )
_baseUrlbb) 1
+bb2 3
$strbb4 <
)bb< =
,bb= >
Contentcc 
=cc 
newcc !
StringContentcc" /
(cc/ 0
JsonConvertcc0 ;
.cc; <
SerializeObjectcc< K
(ccK L
dietInfoccL T
)ccT U
,ccU V
EncodingccW _
.cc_ `
UTF8cc` d
,ccd e
$strccf x
)ccx y
}dd 
;dd 
returnff 
awaitff 
ExecuteRequestAsyncff 0
<ff0 1
DietInfoff1 9
>ff9 :
(ff: ;
requestff; B
)ffB C
;ffC D
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
returnjj 
nulljj 
;jj 
}kk 
}ll 	
publicss 
asyncss 
Taskss 
<ss 
DietInfoss "
>ss" #
UpdateDietInfoss$ 2
(ss2 3
DietInfoss3 ;
dietInfoss< D
)ssD E
{tt 	
tryuu 
{vv 
HttpRequestMessageww "
requestww# *
=ww+ ,
newww- 0
HttpRequestMessageww1 C
{xx 
Methodyy 
=yy 

HttpMethodyy '
.yy' (
Putyy( +
,yy+ ,

RequestUrizz 
=zz  
newzz! $
Urizz% (
(zz( )
_baseUrlzz) 1
+zz2 3
$strzz4 =
+zz> ?
dietInfozz@ H
.zzH I
IdzzI K
)zzK L
,zzL M
Content{{ 
={{ 
new{{ !
StringContent{{" /
({{/ 0
JsonConvert{{0 ;
.{{; <
SerializeObject{{< K
({{K L
dietInfo{{L T
){{T U
,{{U V
Encoding{{W _
.{{_ `
UTF8{{` d
,{{d e
$str{{f x
){{x y
}|| 
;|| 
return~~ 
await~~ 
ExecuteRequestAsync~~ 0
<~~0 1
DietInfo~~1 9
>~~9 :
(~~: ;
request~~; B
)~~B C
;~~C D
} 
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveDietInfo
��  .
(
��. /
int
��/ 2
id
��3 5
)
��5 6
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �y
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\MenuService\MenuServiceFacade.cs
	namespace

 	
WebApi


 
.

 
Facades

 
.

 
MenuService

 $
{ 
public 

class 
MenuServiceFacade "
:# $ 
GenericServiceFacade% 9
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ _
;_ `
public 
MenuServiceFacade  
(  !
)! "
{ 	
} 	
public 
MenuServiceFacade  
(  !

HttpClient! +
client, 2
)2 3
:4 5
base6 :
(: ;
client; A
)A B
{   	
}!! 	
public'' 
async'' 
Task'' 
<'' 

IQueryable'' $
<''$ %
MenuItem''% -
>''- .
>''. /
GetMenuItems''0 <
(''< =
)''= >
{(( 	
try)) 
{** 
HttpRequestMessage++ "
request++# *
=+++ ,
new++- 0
HttpRequestMessage++1 C
{,, 
Method-- 
=-- 

HttpMethod-- '
.--' (
Get--( +
,--+ ,

RequestUri.. 
=..  
new..! $
Uri..% (
(..( )
_baseUrl..) 1
+..2 3
$str..4 9
)..9 :
}// 
;// 

IQueryable11 
<11 
MenuItem11 #
>11# $
res11% (
=11) *
await11+ 0#
ExecuteRequestAsyncList111 H
<11H I
MenuItem11I Q
>11Q R
(11R S
request11S Z
)11Z [
;11[ \
return33 
res33 
.33 
Any33 
(33 
)33  
?44 
res44 
:55 

Enumerable55  
.55  !
Empty55! &
<55& '
MenuItem55' /
>55/ 0
(550 1
)551 2
.552 3
AsQueryable553 >
(55> ?
)55? @
;55@ A
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 

Enumerable99 !
.99! "
Empty99" '
<99' (
MenuItem99( 0
>990 1
(991 2
)992 3
.993 4
AsQueryable994 ?
(99? @
)99@ A
;99A B
}:: 
};; 	
publicBB 
asyncBB 
TaskBB 
<BB 
MenuItemBB "
>BB" #
GetMenuItemByIdBB$ 3
(BB3 4
intBB4 7
idBB8 :
)BB: ;
{CC 	
tryDD 
{EE 
HttpRequestMessageFF "
requestFF# *
=FF+ ,
newFF- 0
HttpRequestMessageFF1 C
{GG 
MethodHH 
=HH 

HttpMethodHH '
.HH' (
GetHH( +
,HH+ ,

RequestUriII 
=II  
newII! $
UriII% (
(II( )
_baseUrlII) 1
+II2 3
$strII4 :
+II; <
idII= ?
)II? @
}JJ 
;JJ 
returnLL 
awaitLL 
ExecuteRequestAsyncLL 0
<LL0 1
MenuItemLL1 9
>LL9 :
(LL: ;
requestLL; B
)LLB C
;LLC D
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
returnPP 
nullPP 
;PP 
}QQ 
}RR 	
publicXX 
asyncXX 
TaskXX 
<XX 

IQueryableXX $
<XX$ %
MenuItemXX% -
>XX- .
>XX. /&
GetMenuItemsByRestaurantIdXX0 J
(XXJ K
intXXK N
idXXO Q
)XXQ R
{YY 	
tryZZ 
{[[ 
HttpRequestMessage\\ "
request\\# *
=\\+ ,
new\\- 0
HttpRequestMessage\\1 C
{]] 
Method^^ 
=^^ 

HttpMethod^^ '
.^^' (
Get^^( +
,^^+ ,

RequestUri__ 
=__  
new__! $
Uri__% (
(__( )
_baseUrl__) 1
+__2 3
$str__4 F
+__G H
id__I K
)__K L
}`` 
;`` 

IQueryablebb 
<bb 
MenuItembb #
>bb# $
resbb% (
=bb) *
awaitbb+ 0#
ExecuteRequestAsyncListbb1 H
<bbH I
MenuItembbI Q
>bbQ R
(bbR S
requestbbS Z
)bbZ [
;bb[ \
returndd 
resdd 
.dd 
Anydd 
(dd 
)dd  
?ee 
resee 
:ff 

Enumerableff  
.ff  !
Emptyff! &
<ff& '
MenuItemff' /
>ff/ 0
(ff0 1
)ff1 2
.ff2 3
AsQueryableff3 >
(ff> ?
)ff? @
;ff@ A
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
returnjj 

Enumerablejj !
.jj! "
Emptyjj" '
<jj' (
MenuItemjj( 0
>jj0 1
(jj1 2
)jj2 3
.jj3 4
AsQueryablejj4 ?
(jj? @
)jj@ A
;jjA B
}kk 
}ll 	
publicss 
asyncss 
Taskss 
<ss 
MenuItemss "
>ss" #
PostMenuItemss$ 0
(ss0 1
MenuItemss1 9
menuItemss: B
)ssB C
{tt 	
tryuu 
{vv 
HttpRequestMessageww "
requestww# *
=ww+ ,
newww- 0
HttpRequestMessageww1 C
{xx 
Methodyy 
=yy 

HttpMethodyy '
.yy' (
Postyy( ,
,yy, -

RequestUrizz 
=zz  
newzz! $
Urizz% (
(zz( )
_baseUrlzz) 1
+zz2 3
$strzz4 <
)zz< =
,zz= >
Content{{ 
={{ 
new{{ !
StringContent{{" /
({{/ 0
JsonConvert{{0 ;
.{{; <
SerializeObject{{< K
({{K L
menuItem{{L T
){{T U
,{{U V
Encoding{{W _
.{{_ `
UTF8{{` d
,{{d e
$str{{f x
){{x y
}|| 
;|| 
return~~ 
await~~ 
ExecuteRequestAsync~~ 0
<~~0 1
MenuItem~~1 9
>~~9 :
(~~: ;
request~~; B
)~~B C
;~~C D
} 
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
MenuItem
�� "
>
��" #
UpdateMenuItem
��$ 2
(
��2 3
MenuItem
��3 ;
menuItem
��< D
)
��D E
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Put
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 =
+
��> ?
menuItem
��@ H
.
��H I
Id
��I K
)
��K L
,
��L M
Content
�� 
=
�� 
new
�� !
StringContent
��" /
(
��/ 0
JsonConvert
��0 ;
.
��; <
SerializeObject
��< K
(
��K L
menuItem
��L T
)
��T U
,
��U V
Encoding
��W _
.
��_ `
UTF8
��` d
,
��d e
$str
��f x
)
��x y
}
�� 
;
�� 
return
�� 
await
�� !
ExecuteRequestAsync
�� 0
<
��0 1
MenuItem
��1 9
>
��9 :
(
��: ;
request
��; B
)
��B C
;
��C D
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
AddDietInfo
��  +
(
��+ ,
int
��, /
id
��0 2
,
��2 3
int
��4 7

dietInfoId
��8 B
)
��B C
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Put
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 B
+
��C D
id
��E G
+
��H I
$str
��J M
+
��N O

dietInfoId
��P Z
)
��Z [
}
�� 
;
�� !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
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
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveDietInfo
��  .
(
��. /
int
��/ 2
id
��3 5
,
��5 6
int
��7 :

dietInfoId
��; E
)
��E F
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Delete
��( .
,
��. /

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 E
+
��F G
id
��H J
+
��K L
$str
��M P
+
��Q R

dietInfoId
��S ]
)
��] ^
}
�� 
;
�� !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
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
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
AddMenuItemType
��  /
(
��/ 0
int
��0 3
id
��4 6
,
��6 7
int
��8 ;
menuItemTypeId
��< J
)
��J K
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Put
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 F
+
��G H
id
��I K
+
��L M
$str
��N Q
+
��R S
menuItemTypeId
��T b
)
��b c
}
�� 
;
�� !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
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
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
RemoveMenuItemType
��  2
(
��2 3
int
��3 6
id
��7 9
,
��9 :
int
��; >
menuItemTypeId
��? M
)
��M N
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Delete
��( .
,
��. /

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 I
+
��J K
id
��L N
+
��O P
$str
��Q T
+
��U V
menuItemTypeId
��W e
)
��e f
}
�� 
;
�� !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveMenuItem
��  .
(
��. /
int
��/ 2
id
��3 5
)
��5 6
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �9
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\MenuService\MenuServiceTypeFacade.cs
	namespace 	
WebApi
 
. 
Facades 
. 
MenuService $
{ 
public 

class !
MenuServiceTypeFacade &
:' ( 
GenericServiceFacade) =
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ c
;c d
public !
MenuServiceTypeFacade $
($ %
)% &
{ 	
} 	
public!! !
MenuServiceTypeFacade!! $
(!!$ %

HttpClient!!% /
client!!0 6
)!!6 7
:!!8 9
base!!: >
(!!> ?
client!!? E
)!!E F
{"" 	
}## 	
public)) 
async)) 
Task)) 
<)) 

IQueryable)) $
<))$ %
MenuItemType))% 1
>))1 2
>))2 3
GetMenuItemTypes))4 D
())D E
)))E F
{** 	
try++ 
{,, 
HttpRequestMessage-- "
request--# *
=--+ ,
new--- 0
HttpRequestMessage--1 C
{.. 
Method// 
=// 

HttpMethod// '
.//' (
Get//( +
,//+ ,

RequestUri00 
=00  
new00! $
Uri00% (
(00( )
_baseUrl00) 1
+002 3
$str004 9
)009 :
}11 
;11 

IQueryable33 
<33 
MenuItemType33 '
>33' (
res33) ,
=33- .
await33/ 4#
ExecuteRequestAsyncList335 L
<33L M
MenuItemType33M Y
>33Y Z
(33Z [
request33[ b
)33b c
;33c d
return55 
res55 
.55 
Any55 
(55 
)55  
?66 
res66 
:77 

Enumerable77  
.77  !
Empty77! &
<77& '
MenuItemType77' 3
>773 4
(774 5
)775 6
.776 7
AsQueryable777 B
(77B C
)77C D
;77D E
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
return;; 

Enumerable;; !
.;;! "
Empty;;" '
<;;' (
MenuItemType;;( 4
>;;4 5
(;;5 6
);;6 7
.;;7 8
AsQueryable;;8 C
(;;C D
);;D E
;;;E F
}<< 
}== 	
publicDD 
asyncDD 
TaskDD 
<DD 
MenuItemTypeDD &
>DD& '
GetMenuItemTypeByIdDD( ;
(DD; <
intDD< ?
idDD@ B
)DDB C
{EE 	
tryFF 
{GG 
HttpRequestMessageHH "
requestHH# *
=HH+ ,
newHH- 0
HttpRequestMessageHH1 C
{II 
MethodJJ 
=JJ 

HttpMethodJJ '
.JJ' (
GetJJ( +
,JJ+ ,

RequestUriKK 
=KK  
newKK! $
UriKK% (
(KK( )
_baseUrlKK) 1
+KK2 3
$strKK4 :
+KK; <
idKK= ?
)KK? @
}LL 
;LL 
returnNN 
awaitNN 
ExecuteRequestAsyncNN 0
<NN0 1
MenuItemTypeNN1 =
>NN= >
(NN> ?
requestNN? F
)NNF G
;NNG H
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
returnRR 
nullRR 
;RR 
}SS 
}TT 	
public[[ 
async[[ 
Task[[ 
<[[ 
MenuItemType[[ &
>[[& '
PostMenuItemType[[( 8
([[8 9
MenuItemType[[9 E
menuItemType[[F R
)[[R S
{\\ 	
try]] 
{^^ 
HttpRequestMessage__ "
request__# *
=__+ ,
new__- 0
HttpRequestMessage__1 C
{`` 
Methodaa 
=aa 

HttpMethodaa '
.aa' (
Postaa( ,
,aa, -

RequestUribb 
=bb  
newbb! $
Uribb% (
(bb( )
_baseUrlbb) 1
+bb2 3
$strbb4 <
)bb< =
,bb= >
Contentcc 
=cc 
newcc !
StringContentcc" /
(cc/ 0
JsonConvertcc0 ;
.cc; <
SerializeObjectcc< K
(ccK L
menuItemTypeccL X
)ccX Y
,ccY Z
Encodingcc[ c
.ccc d
UTF8ccd h
,cch i
$strccj |
)cc| }
}dd 
;dd 
returnff 
awaitff 
ExecuteRequestAsyncff 0
<ff0 1
MenuItemTypeff1 =
>ff= >
(ff> ?
requestff? F
)ffF G
;ffG H
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
returnjj 
nulljj 
;jj 
}kk 
}ll 	
publicss 
asyncss 
Taskss 
<ss 
MenuItemTypess &
>ss& '
UpdateMenuItemTypess( :
(ss: ;
MenuItemTypess; G
menuItemTypessH T
)ssT U
{tt 	
tryuu 
{vv 
HttpRequestMessageww "
requestww# *
=ww+ ,
newww- 0
HttpRequestMessageww1 C
{xx 
Methodyy 
=yy 

HttpMethodyy '
.yy' (
Putyy( +
,yy+ ,

RequestUrizz 
=zz  
newzz! $
Urizz% (
(zz( )
_baseUrlzz) 1
+zz2 3
$strzz4 =
+zz> ?
menuItemTypezz@ L
.zzL M
IdzzM O
)zzO P
,zzP Q
Content{{ 
={{ 
new{{ !
StringContent{{" /
({{/ 0
JsonConvert{{0 ;
.{{; <
SerializeObject{{< K
({{K L
menuItemType{{L X
){{X Y
,{{Y Z
Encoding{{[ c
.{{c d
UTF8{{d h
,{{h i
$str{{j |
){{| }
}|| 
;|| 
return~~ 
await~~ 
ExecuteRequestAsync~~ 0
<~~0 1
MenuItemType~~1 =
>~~= >
(~~> ?
request~~? F
)~~F G
;~~G H
} 
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
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
RemoveMenuItemType
��  2
(
��2 3
int
��3 6
id
��7 9
)
��9 :
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\RestaurantService\RestaurantServiceCompanyFacade.cs
	namespace

 	
WebApi


 
.

 
Facades

 
.

 
RestaurantService

 *
{ 
public 

class *
RestaurantServiceCompanyFacade /
:0 1 
GenericServiceFacade2 F
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ h
;h i
public *
RestaurantServiceCompanyFacade -
(- .
). /
{ 	
} 	
public *
RestaurantServiceCompanyFacade -
(- .

HttpClient. 8
client9 ?
)? @
:A B
baseC G
(G H
clientH N
)N O
{   	
}!! 	
public(( 
async(( 
Task(( 
<(( 
Company(( !
>((! "

GetCompany((# -
(((- .
)((. /
{)) 	
try** 
{++ 
HttpRequestMessage,, "
request,,# *
=,,+ ,
new,,- 0
HttpRequestMessage,,1 C
{-- 
Method.. 
=.. 

HttpMethod.. '
...' (
Get..( +
,..+ ,

RequestUri// 
=//  
new//! $
Uri//% (
(//( )
_baseUrl//) 1
+//2 3
$str//4 9
)//9 :
}00 
;00 
return22 
await22 
ExecuteRequestAsync22 0
<220 1
Company221 8
>228 9
(229 :
request22: A
)22A B
;22B C
}33 
catch44 
(44 
	Exception44 
ex44 
)44  
{55 
return66 
null66 
;66 
}77 
}88 	
}99 
}:: �Q
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\RestaurantService\RestaurantServiceFacade.cs
	namespace

 	
WebApi


 
.

 
Facades

 
.

 
RestaurantService

 *
{ 
public 

class #
RestaurantServiceFacade (
:) * 
GenericServiceFacade+ ?
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ k
;k l
public #
RestaurantServiceFacade &
(& '
)' (
{ 	
} 	
public #
RestaurantServiceFacade &
(& '

HttpClient' 1
client2 8
)8 9
:: ;
base< @
(@ A
clientA G
)G H
{   	
}!! 	
public'' 
async'' 
Task'' 
<'' 

IQueryable'' $
<''$ %

Restaurant''% /
>''/ 0
>''0 1
GetRestaurants''2 @
(''@ A
)''A B
{(( 	
try)) 
{** 
HttpRequestMessage++ "
request++# *
=+++ ,
new++- 0
HttpRequestMessage++1 C
{,, 
Method-- 
=-- 

HttpMethod-- '
.--' (
Get--( +
,--+ ,

RequestUri.. 
=..  
new..! $
Uri..% (
(..( )
_baseUrl..) 1
+..2 3
$str..4 9
)..9 :
}// 
;// 

IQueryable11 
<11 

Restaurant11 %
>11% &
res11' *
=11+ ,
await11- 2#
ExecuteRequestAsyncList113 J
<11J K

Restaurant11K U
>11U V
(11V W
request11W ^
)11^ _
;11_ `
return33 
res33 
.33 
Any33 
(33 
)33  
?44 
res44 
:55 

Enumerable55  
.55  !
Empty55! &
<55& '

Restaurant55' 1
>551 2
(552 3
)553 4
.554 5
AsQueryable555 @
(55@ A
)55A B
;55B C
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 

Enumerable99 !
.99! "
Empty99" '
<99' (

Restaurant99( 2
>992 3
(993 4
)994 5
.995 6
AsQueryable996 A
(99A B
)99B C
;99C D
}:: 
};; 	
publicBB 
asyncBB 
TaskBB 
<BB 

RestaurantBB $
>BB$ %
GetRestaurantByIdBB& 7
(BB7 8
intBB8 ;
idBB< >
)BB> ?
{CC 	
tryDD 
{EE 
HttpRequestMessageFF "
requestFF# *
=FF+ ,
newFF- 0
HttpRequestMessageFF1 C
{GG 
MethodHH 
=HH 

HttpMethodHH '
.HH' (
GetHH( +
,HH+ ,

RequestUriII 
=II  
newII! $
UriII% (
(II( )
_baseUrlII) 1
+II2 3
$strII4 :
+II; <
idII= ?
)II? @
}JJ 
;JJ 
returnLL 
awaitLL 
ExecuteRequestAsyncLL 0
<LL0 1

RestaurantLL1 ;
>LL; <
(LL< =
requestLL= D
)LLD E
;LLE F
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
returnPP 
nullPP 
;PP 
}QQ 
}RR 	
publicYY 
asyncYY 
TaskYY 
<YY 

RestaurantYY $
>YY$ %
PostRestaurantYY& 4
(YY4 5

RestaurantYY5 ?

restaurantYY@ J
)YYJ K
{ZZ 	
try[[ 
{\\ 
HttpRequestMessage]] "
request]]# *
=]]+ ,
new]]- 0
HttpRequestMessage]]1 C
{^^ 
Method__ 
=__ 

HttpMethod__ '
.__' (
Post__( ,
,__, -

RequestUri`` 
=``  
new``! $
Uri``% (
(``( )
_baseUrl``) 1
+``2 3
$str``4 <
)``< =
,``= >
Contentaa 
=aa 
newaa !
StringContentaa" /
(aa/ 0
JsonConvertaa0 ;
.aa; <
SerializeObjectaa< K
(aaK L

restaurantaaL V
)aaV W
,aaW X
EncodingaaY a
.aaa b
UTF8aab f
,aaf g
$straah z
)aaz {
}bb 
;bb 
returndd 
awaitdd 
ExecuteRequestAsyncdd 0
<dd0 1

Restaurantdd1 ;
>dd; <
(dd< =
requestdd= D
)ddD E
;ddE F
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
returnhh 
nullhh 
;hh 
}ii 
}jj 	
publicqq 
asyncqq 
Taskqq 
<qq 

Restaurantqq $
>qq$ %
UpdateRestaurantqq& 6
(qq6 7

Restaurantqq7 A

restaurantqqB L
)qqL M
{rr 	
tryss 
{tt 
HttpRequestMessageuu "
requestuu# *
=uu+ ,
newuu- 0
HttpRequestMessageuu1 C
{vv 
Methodww 
=ww 

HttpMethodww '
.ww' (
Putww( +
,ww+ ,

RequestUrixx 
=xx  
newxx! $
Urixx% (
(xx( )
_baseUrlxx) 1
+xx2 3
$strxx4 =
+xx> ?

restaurantxx@ J
.xxJ K
IdxxK M
)xxM N
,xxN O
Contentyy 
=yy 
newyy !
StringContentyy" /
(yy/ 0
JsonConvertyy0 ;
.yy; <
SerializeObjectyy< K
(yyK L

restaurantyyL V
)yyV W
,yyW X
EncodingyyY a
.yya b
UTF8yyb f
,yyf g
$stryyh z
)yyz {
}zz 
;zz 
return|| 
await|| 
ExecuteRequestAsync|| 0
<||0 1

Restaurant||1 ;
>||; <
(||< =
request||= D
)||D E
;||E F
}}} 
catch~~ 
(~~ 
	Exception~~ 
ex~~ 
)~~  
{ 
return
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveRestaurant
��  0
(
��0 1
int
��1 4
id
��5 7
)
��7 8
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
AddMenuItem
��  +
(
��+ ,
int
��, /
id
��0 2
,
��2 3
int
��4 7

menuItemId
��8 B
)
��B C
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Put
��( +
,
��+ ,

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 B
+
��C D
id
��E G
+
��H I
$str
��J M
+
��N O

menuItemId
��P Z
)
��Z [
}
�� 
;
�� !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
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
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveMenuItem
��  .
(
��. /
int
��/ 2
id
��3 5
,
��5 6
int
��7 :

menuItemId
��; E
)
��E F
{
�� 	
try
�� 
{
��  
HttpRequestMessage
�� "
request
��# *
=
��+ ,
new
��- 0 
HttpRequestMessage
��1 C
{
�� 
Method
�� 
=
�� 

HttpMethod
�� '
.
��' (
Delete
��( .
,
��. /

RequestUri
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_baseUrl
��) 1
+
��2 3
$str
��4 E
+
��F G
id
��H J
+
��K L
$str
��M P
+
��Q R

menuItemId
��S ]
)
��] ^
}
�� 
;
�� !
HttpResponseMessage
�� #
response
��$ ,
=
��- .
await
��/ 4
_client
��5 <
.
��< =
	SendAsync
��= F
(
��F G
request
��G N
)
��N O
;
��O P
response
�� 
.
�� %
EnsureSuccessStatusCode
�� 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
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
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �8
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Facades\RestaurantService\RestaurantServiceTableFacade.cs
	namespace 	
WebApi
 
. 
Facades 
. 
RestaurantService *
{ 
public 

class (
RestaurantServiceTableFacade -
:. / 
GenericServiceFacade0 D
{ 
private 
readonly 
string 
_baseUrl  (
=) *
$str+ f
;f g
public (
RestaurantServiceTableFacade +
(+ ,
), -
{ 	
} 	
public (
RestaurantServiceTableFacade +
(+ ,

HttpClient, 6
client7 =
)= >
:? @
baseA E
(E F
clientF L
)L M
{ 	
}   	
public&& 
async&& 
Task&& 
<&& 

IQueryable&& $
<&&$ %
Table&&% *
>&&* +
>&&+ ,
	GetTables&&- 6
(&&6 7
)&&7 8
{'' 	
try(( 
{)) 
HttpRequestMessage** "
request**# *
=**+ ,
new**- 0
HttpRequestMessage**1 C
{++ 
Method,, 
=,, 

HttpMethod,, '
.,,' (
Get,,( +
,,,+ ,

RequestUri-- 
=--  
new--! $
Uri--% (
(--( )
_baseUrl--) 1
+--2 3
$str--4 9
)--9 :
}.. 
;.. 

IQueryable00 
<00 
Table00  
>00  !
res00" %
=00& '
await00( -#
ExecuteRequestAsyncList00. E
<00E F
Table00F K
>00K L
(00L M
request00M T
)00T U
;00U V
return22 
res22 
.22 
Any22 
(22 
)22  
?33 
res33 
:44 

Enumerable44  
.44  !
Empty44! &
<44& '
Table44' ,
>44, -
(44- .
)44. /
.44/ 0
AsQueryable440 ;
(44; <
)44< =
;44= >
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
return88 

Enumerable88 !
.88! "
Empty88" '
<88' (
Table88( -
>88- .
(88. /
)88/ 0
.880 1
AsQueryable881 <
(88< =
)88= >
;88> ?
}99 
}:: 	
publicAA 
asyncAA 
TaskAA 
<AA 
TableAA 
>AA  
GetTableByIdAA! -
(AA- .
intAA. 1
idAA2 4
)AA4 5
{BB 	
tryCC 
{DD 
HttpRequestMessageEE "
requestEE# *
=EE+ ,
newEE- 0
HttpRequestMessageEE1 C
{FF 
MethodGG 
=GG 

HttpMethodGG '
.GG' (
GetGG( +
,GG+ ,

RequestUriHH 
=HH  
newHH! $
UriHH% (
(HH( )
_baseUrlHH) 1
+HH2 3
$strHH4 :
+HH; <
idHH= ?
)HH? @
}II 
;II 
returnKK 
awaitKK 
ExecuteRequestAsyncKK 0
<KK0 1
TableKK1 6
>KK6 7
(KK7 8
requestKK8 ?
)KK? @
;KK@ A
}LL 
catchMM 
(MM 
	ExceptionMM 
exMM 
)MM  
{NN 
returnOO 
nullOO 
;OO 
}PP 
}QQ 	
publicXX 
asyncXX 
TaskXX 
<XX 
TableXX 
>XX  
	PostTableXX! *
(XX* +
TableXX+ 0

restaurantXX1 ;
)XX; <
{YY 	
tryZZ 
{[[ 
HttpRequestMessage\\ "
request\\# *
=\\+ ,
new\\- 0
HttpRequestMessage\\1 C
{]] 
Method^^ 
=^^ 

HttpMethod^^ '
.^^' (
Post^^( ,
,^^, -

RequestUri__ 
=__  
new__! $
Uri__% (
(__( )
_baseUrl__) 1
+__2 3
$str__4 <
)__< =
,__= >
Content`` 
=`` 
new`` !
StringContent``" /
(``/ 0
JsonConvert``0 ;
.``; <
SerializeObject``< K
(``K L

restaurant``L V
)``V W
,``W X
Encoding``Y a
.``a b
UTF8``b f
,``f g
$str``h z
)``z {
}aa 
;aa 
returncc 
awaitcc 
ExecuteRequestAsynccc 0
<cc0 1
Tablecc1 6
>cc6 7
(cc7 8
requestcc8 ?
)cc? @
;cc@ A
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
returngg 
nullgg 
;gg 
}hh 
}ii 	
publicpp 
asyncpp 
Taskpp 
<pp 
Tablepp 
>pp  
UpdateTablepp! ,
(pp, -
Tablepp- 2

restaurantpp3 =
)pp= >
{qq 	
tryrr 
{ss 
HttpRequestMessagett "
requesttt# *
=tt+ ,
newtt- 0
HttpRequestMessagett1 C
{uu 
Methodvv 
=vv 

HttpMethodvv '
.vv' (
Putvv( +
,vv+ ,

RequestUriww 
=ww  
newww! $
Uriww% (
(ww( )
_baseUrlww) 1
+ww2 3
$strww4 =
+ww> ?

restaurantww@ J
.wwJ K
IdwwK M
)wwM N
,wwN O
Contentxx 
=xx 
newxx !
StringContentxx" /
(xx/ 0
JsonConvertxx0 ;
.xx; <
SerializeObjectxx< K
(xxK L

restaurantxxL V
)xxV W
,xxW X
EncodingxxY a
.xxa b
UTF8xxb f
,xxf g
$strxxh z
)xxz {
}yy 
;yy 
return{{ 
await{{ 
ExecuteRequestAsync{{ 0
<{{0 1
Table{{1 6
>{{6 7
({{7 8
request{{8 ?
){{? @
;{{@ A
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
return 
null 
; 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
RemoveTable
��  +
(
��+ ,
int
��, /
id
��0 2
)
��2 3
{
�� 	
return
�� 
await
�� 
ExecuteRemove
�� &
(
��& '
new
��' *
Uri
��+ .
(
��. /
_baseUrl
��/ 7
+
��8 9
$str
��: C
+
��D E
id
��F H
)
��H I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� �
uC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str !
)! "
]" #
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
$str #
)# $
]$ %
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
]##) *�
eC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\WebApi\Startup.cs
[ 
assembly 	
:	 

OwinStartup 
( 
typeof 
( 
WebApi $
.$ %
Startup% ,
), -
)- .
]. /
	namespace 	
WebApi
 
{ 
public 

class 
Startup 
{ 
public 
static 
HttpConfiguration '
Config( .
{/ 0
get1 4
;4 5
private6 =
set> A
;A B
}C D
public 
void 
Configuration !
(! "
IAppBuilder" -
app. 1
)1 2
{ 	
Config 
= 
new 
HttpConfiguration *
(* +
)+ ,
;, -
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
ConfigureOAuth 
( 
app 
) 
;  
WebApiConfig 
. 
Register !
(! "
Config" (
)( )
;) *
app 
. 
UseCors 
( 
	Microsoft !
.! "
Owin" &
.& '
Cors' +
.+ ,
CorsOptions, 7
.7 8
AllowAll8 @
)@ A
;A B
app 
. 
	UseWebApi 
( 
Config  
)  !
;! "
} 	
private 
void 
ConfigureOAuth #
(# $
IAppBuilder$ /
app0 3
)3 4
{ 	
app!! 
.!! (
UseOAuthBearerAuthentication!! ,
(!!, -
new!!- 0,
 OAuthBearerAuthenticationOptions!!1 Q
{"" 
}## 
)## 
;## 
}$$ 	
}%% 
}&& 