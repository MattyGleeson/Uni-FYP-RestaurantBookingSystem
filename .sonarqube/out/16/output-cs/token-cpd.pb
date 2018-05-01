�m
}C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\AuthFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 

AuthFacade 
{ 
	protected 
readonly 

HttpClient %
_client& -
;- .
	protected "
JsonSerializerSettings (
_serializerSettings) <
;< =
	protected 
readonly 
string !
_baseUrl" *
=+ ,
$str- \
;\ ]
public!! 

AuthFacade!! 
(!! 
)!! 
{"" 	
_client## 
=## 
new## 

HttpClient## $
(##$ %
)##% &
;##& '
_client$$ 
.$$ !
DefaultRequestHeaders$$ )
.$$) *
Accept$$* 0
.$$0 1
Add$$1 4
($$4 5
new$$5 8+
MediaTypeWithQualityHeaderValue$$9 X
($$X Y
$str$$Y k
)$$k l
)$$l m
;$$m n
_serializerSettings%% 
=%%  !
new%%" %"
JsonSerializerSettings%%& <
{%%= >
NullValueHandling%%? P
=%%Q R
NullValueHandling%%S d
.%%d e
Ignore%%e k
,%%k l"
MissingMemberHandling	%%m �
=
%%� �#
MissingMemberHandling
%%� �
.
%%� �
Ignore
%%� �
}
%%� �
;
%%� �
}&& 	
public,, 

AuthFacade,, 
(,, 

HttpClient,, $
client,,% +
),,+ ,
{-- 	
_client.. 
=.. 
client.. 
;.. 
_serializerSettings// 
=//  !
new//" %"
JsonSerializerSettings//& <
{//= >
NullValueHandling//? P
=//Q R
NullValueHandling//S d
.//d e
Ignore//e k
,//k l"
MissingMemberHandling	//m �
=
//� �#
MissingMemberHandling
//� �
.
//� �
Ignore
//� �
}
//� �
;
//� �
}00 	
public22 
void22 
GetToken22 
(22 
string22 #
username22$ ,
,22, -
string22. 4
password225 =
)22= >
{33 	
try44 
{55 
var66 

dictionary66 
=66  
new66! $

Dictionary66% /
<66/ 0
string660 6
,666 7
string668 >
>66> ?
{77 
{88 
$str88 "
,88" #
$str88$ .
}88/ 0
,880 1
{99 
$str99  
,99  !
username99" *
}99+ ,
,99, -
{:: 
$str::  
,::  !
password::" *
}::+ ,
};; 
;;; 
HttpRequestMessage== "
request==# *
===+ ,
new==- 0
HttpRequestMessage==1 C
{>> 
Method?? 
=?? 

HttpMethod?? '
.??' (
Post??( ,
,??, -

RequestUri@@ 
=@@  
new@@! $
Uri@@% (
(@@( )
_baseUrl@@) 1
+@@2 3
$str@@4 ;
)@@; <
,@@< =
ContentAA 
=AA 
newAA !!
FormUrlEncodedContentAA" 7
(AA7 8

dictionaryAA8 B
)AAB C
}BB 
;BB 
varDD 
resDD 
=DD 
_clientDD !
.DD! "
	SendAsyncDD" +
(DD+ ,
requestDD, 3
)DD3 4
.DD4 5
ResultDD5 ;
;DD; <
resFF 
.FF #
EnsureSuccessStatusCodeFF +
(FF+ ,
)FF, -
;FF- .
stringHH 
contentHH 
=HH  
resHH! $
.HH$ %
ContentHH% ,
.HH, -
ReadAsStringAsyncHH- >
(HH> ?
)HH? @
.HH@ A
ResultHHA G
;HHG H
varII 
modelII 
=II 
JsonConvertII '
.II' (
DeserializeObjectII( 9
<II9 :

DictionaryII: D
<IID E
stringIIE K
,IIK L
stringIIM S
>IIS T
>IIT U
(IIU V
contentIIV ]
,II] ^
_serializerSettingsII_ r
)IIr s
;IIs t
GenericFacadeKK 
.KK 
TokenKK #
=KK$ %
modelKK& +
[KK+ ,
$strKK, :
]KK: ;
;KK; <
}[[ 
catch\\ 
(\\ 
	Exception\\ 
ex\\ 
)\\  
{]] 
}__ 
}`` 	
publicbb 
stringbb 
	GetUserIdbb 
(bb  
)bb  !
{cc 	
trydd 
{ee 
usingff 
(ff 

HttpClientff !
_cff" $
=ff% &
newff' *

HttpClientff+ 5
(ff5 6
)ff6 7
)ff7 8
{gg 
_chh 
.hh !
DefaultRequestHeadershh ,
.hh, -
Accepthh- 3
.hh3 4
Addhh4 7
(hh7 8
newhh8 ;+
MediaTypeWithQualityHeaderValuehh< [
(hh[ \
$strhh\ n
)hhn o
)hho p
;hhp q
_cii 
.ii !
DefaultRequestHeadersii ,
.ii, -
Authorizationii- :
=ii; <
newii= @%
AuthenticationHeaderValueiiA Z
(iiZ [
$strii[ c
,iic d
GenericFacadeiie r
.iir s
Tokeniis x
)iix y
;iiy z
HttpRequestMessagekk &
requestkk' .
=kk/ 0
newkk1 4
HttpRequestMessagekk5 G
{ll 
Methodmm 
=mm  

HttpMethodmm! +
.mm+ ,
Getmm, /
,mm/ 0

RequestUrinn "
=nn# $
newnn% (
Urinn) ,
(nn, -
_baseUrlnn- 5
+nn6 7
$strnn8 N
)nnN O
}oo 
;oo 
varqq 
resqq 
=qq 
_cqq  
.qq  !
	SendAsyncqq! *
(qq* +
requestqq+ 2
)qq2 3
.qq3 4
Resultqq4 :
;qq: ;
resss 
.ss #
EnsureSuccessStatusCodess /
(ss/ 0
)ss0 1
;ss1 2
stringuu 
contentuu "
=uu# $
resuu% (
.uu( )
Contentuu) 0
.uu0 1
ReadAsStringAsyncuu1 B
(uuB C
)uuC D
.uuD E
ResultuuE K
;uuK L
varvv 
modelvv 
=vv 
JsonConvertvv  +
.vv+ ,
DeserializeObjectvv, =
<vv= >

Dictionaryvv> H
<vvH I
stringvvI O
,vvO P
stringvvQ W
>vvW X
>vvX Y
(vvY Z
contentvvZ a
,vva b
_serializerSettingsvvc v
)vvv w
;vvw x
returnxx 
modelxx  
[xx  !
$strxx! )
]xx) *
;xx* +
}yy 
}zz 
catch{{ 
({{ 
	Exception{{ 
ex{{ 
){{  
{|| 
return}} 
$str}} 
;}} 
}~~ 
} 	
public
�� 
void
�� 
AddCustomerRole
�� #
(
��# $
)
��$ %
{
�� 	
try
�� 
{
�� 
using
�� 
(
�� 

HttpClient
�� !
_c
��" $
=
��% &
new
��' *

HttpClient
��+ 5
(
��5 6
)
��6 7
)
��7 8
{
�� 
_c
�� 
.
�� #
DefaultRequestHeaders
�� ,
.
��, -
Accept
��- 3
.
��3 4
Add
��4 7
(
��7 8
new
��8 ;-
MediaTypeWithQualityHeaderValue
��< [
(
��[ \
$str
��\ n
)
��n o
)
��o p
;
��p q
_c
�� 
.
�� #
DefaultRequestHeaders
�� ,
.
��, -
Authorization
��- :
=
��; <
new
��= @'
AuthenticationHeaderValue
��A Z
(
��Z [
$str
��[ c
,
��c d
GenericFacade
��e r
.
��r s
Token
��s x
)
��x y
;
��y z 
HttpRequestMessage
�� &
request
��' .
=
��/ 0
new
��1 4 
HttpRequestMessage
��5 G
{
�� 
Method
�� 
=
��  

HttpMethod
��! +
.
��+ ,
Post
��, 0
,
��0 1

RequestUri
�� "
=
��# $
new
��% (
Uri
��) ,
(
��, -
_baseUrl
��- 5
+
��6 7
$str
��8 U
)
��U V
}
�� 
;
�� 
var
�� 
res
�� 
=
�� 
_c
��  
.
��  !
	SendAsync
��! *
(
��* +
request
��+ 2
)
��2 3
.
��3 4
Result
��4 :
;
��: ;
res
�� 
.
�� %
EnsureSuccessStatusCode
�� /
(
��/ 0
)
��0 1
;
��1 2
}
�� 
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
�� 
}
�� 
}
�� 	
public
�� 
bool
�� 
Register
�� 
(
�� 
string
�� #
username
��$ ,
,
��, -
string
��. 4
password
��5 =
,
��= >
string
��? E
confirmPassword
��F U
)
��U V
{
�� 	
try
�� 
{
�� 
var
�� 

dictionary
�� 
=
��  
new
��! $

Dictionary
��% /
<
��/ 0
string
��0 6
,
��6 7
string
��8 >
>
��> ?
{
�� 
{
�� 
$str
��  
,
��  !
username
��" *
}
��+ ,
,
��, -
{
�� 
$str
��  
,
��  !
password
��" *
}
��+ ,
,
��, -
{
�� 
$str
�� '
,
��' (
confirmPassword
��) 8
}
��9 :
}
�� 
;
��  
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
��4 J
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
��K L

dictionary
��L V
)
��V W
,
��W X
Encoding
��Y a
.
��a b
UTF8
��b f
,
��f g
$str
��h z
)
��z {
}
�� 
;
�� 
var
�� 
res
�� 
=
�� 
_client
�� !
.
��! "
	SendAsync
��" +
(
��+ ,
request
��, 3
)
��3 4
.
��4 5
Result
��5 ;
;
��; <
res
�� 
.
�� %
EnsureSuccessStatusCode
�� +
(
��+ ,
)
��, -
;
��- .
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
�� 
IEnumerable
�� 
<
�� 
string
�� !
>
��! "
GetRoles
��# +
(
��+ ,
)
��, -
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
��4 ;
)
��; <
}
�� 
;
�� 
var
�� 
res
�� 
=
�� 
_client
�� !
.
��! "
	SendAsync
��" +
(
��+ ,
request
��, 3
)
��3 4
.
��4 5
Result
��5 ;
;
��; <
res
�� 
.
�� %
EnsureSuccessStatusCode
�� +
(
��+ ,
)
��, -
;
��- .
string
�� 
content
�� 
=
��  
res
��! $
.
��$ %
Content
��% ,
.
��, -
ReadAsStringAsync
��- >
(
��> ?
)
��? @
.
��@ A
Result
��A G
;
��G H
return
�� 
JsonConvert
�� "
.
��" #
DeserializeObject
��# 4
<
��4 5
List
��5 9
<
��9 :
string
��: @
>
��@ A
>
��A B
(
��B C
content
��C J
,
��J K!
_serializerSettings
��L _
)
��_ `
.
��` a
AsEnumerable
��a m
(
��m n
)
��n o
;
��o p
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
�� 

Enumerable
�� !
.
��! "
Empty
��" '
<
��' (
string
��( .
>
��. /
(
��/ 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
}
�� 
}�� �R
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\BookingFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
BookingFacade 
:  
GenericFacade! .
{ 
public 
BookingFacade 
( 
) 
:  
base! %
(% &
$str& 0
)0 1
{ 	
} 	
public 
async 
Task 
< 
List 
< 
Booking &
>& '
>' (
Get) ,
(, -
)- .
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{   
Method!! 
=!! 

HttpMethod!! '
.!!' (
Get!!( +
,!!+ ,

RequestUri"" 
=""  
new""! $
Uri""% (
(""( )
_baseUrl"") 1
+""2 3
$str""4 9
)""9 :
}## 
;## 
IEnumerable%% 
<%% 
Booking%% #
>%%# $
res%%% (
=%%) *
await%%+ 0
ExecuteRequestList%%1 C
<%%C D
Booking%%D K
>%%K L
(%%L M
request%%M T
)%%T U
;%%U V
return'' 
res'' 
.'' 
Any'' 
('' 
)''  
?(( 
res(( 
.(( 
ToList((  
(((  !
)((! "
:)) 
new)) 
List)) 
<)) 
Booking)) &
>))& '
())' (
)))( )
;))) *
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 
new-- 
List-- 
<--  
Booking--  '
>--' (
(--( )
)--) *
;--* +
}.. 
}// 	
public66 
async66 
Task66 
<66 
Booking66 !
>66! "
FindById66# +
(66+ ,
int66, /
id660 2
)662 3
{77 	
try88 
{99 
HttpRequestMessage:: "
request::# *
=::+ ,
new::- 0
HttpRequestMessage::1 C
{;; 
Method<< 
=<< 

HttpMethod<< '
.<<' (
Get<<( +
,<<+ ,

RequestUri== 
===  
new==! $
Uri==% (
(==( )
_baseUrl==) 1
+==2 3
$str==4 :
+==; <
id=== ?
)==? @
}>> 
;>> 
return@@ 
await@@ 
ExecuteRequest@@ +
<@@+ ,
Booking@@, 3
>@@3 4
(@@4 5
request@@5 <
)@@< =
;@@= >
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
nullDD 
;DD 
}EE 
}FF 	
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM 
BookingMM &
>MM& '
>MM' (
FindByCustomerIdMM) 9
(MM9 :
intMM: =
idMM> @
)MM@ A
{NN 	
tryOO 
{PP 
HttpRequestMessageQQ "
requestQQ# *
=QQ+ ,
newQQ- 0
HttpRequestMessageQQ1 C
{RR 
MethodSS 
=SS 

HttpMethodSS '
.SS' (
GetSS( +
,SS+ ,

RequestUriTT 
=TT  
newTT! $
UriTT% (
(TT( )
_baseUrlTT) 1
+TT2 3
$strTT4 D
+TTE F
idTTG I
)TTI J
}UU 
;UU 
IEnumerableWW 
<WW 
BookingWW #
>WW# $
resWW% (
=WW) *
awaitWW+ 0
ExecuteRequestListWW1 C
<WWC D
BookingWWD K
>WWK L
(WWL M
requestWWM T
)WWT U
;WWU V
returnYY 
resYY 
.YY 
AnyYY 
(YY 
)YY  
?ZZ 
resZZ 
.ZZ 
ToListZZ  
(ZZ  !
)ZZ! "
:[[ 
new[[ 
List[[ 
<[[ 
Booking[[ &
>[[& '
([[' (
)[[( )
;[[) *
}\\ 
catch]] 
(]] 
	Exception]] 
ex]] 
)]]  
{^^ 
return__ 
new__ 
List__ 
<__  
Booking__  '
>__' (
(__( )
)__) *
;__* +
}`` 
}aa 	
publichh 
asynchh 
Taskhh 
<hh 
Tablehh 
>hh  
GetAvailableTablehh! 2
(hh2 3
Bookinghh3 :
modelhh; @
)hh@ A
{ii 	
tryjj 
{kk 
HttpRequestMessagell "
requestll# *
=ll+ ,
newll- 0
HttpRequestMessagell1 C
{mm 
Methodnn 
=nn 

HttpMethodnn '
.nn' (
Postnn( ,
,nn, -

RequestUrioo 
=oo  
newoo! $
Urioo% (
(oo( )
_baseUrloo) 1
+oo2 3
$stroo4 G
)ooG H
,ooH I
Contentpp 
=pp 
newpp !
StringContentpp" /
(pp/ 0
JsonConvertpp0 ;
.pp; <
SerializeObjectpp< K
(ppK L
modelppL Q
)ppQ R
,ppR S
EncodingppT \
.pp\ ]
UTF8pp] a
,ppa b
$strppc u
)ppu v
}qq 
;qq 
returnss 
awaitss 
ExecuteRequestss +
<ss+ ,
Tabless, 1
>ss1 2
(ss2 3
requestss3 :
)ss: ;
;ss; <
}tt 
catchuu 
(uu 
	Exceptionuu 
exuu 
)uu  
{vv 
returnww 
nullww 
;ww 
}xx 
}yy 	
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
��! "
Create
��# )
(
��) *
Booking
��* 1
model
��2 7
)
��7 8
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
��4 :
)
��: ;
,
��; <
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
��K L
model
��L Q
)
��Q R
,
��R S
Encoding
��T \
.
��\ ]
UTF8
��] a
,
��a b
$str
��c u
)
��u v
}
�� 
;
�� 
return
�� 
await
�� 
ExecuteRequest
�� +
<
��+ ,
Booking
��, 3
>
��3 4
(
��4 5
request
��5 <
)
��< =
;
��= >
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
��! "
Update
��# )
(
��) *
Booking
��* 1
model
��2 7
)
��7 8
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
��> ?
model
��@ E
.
��E F
Id
��F H
)
��H I
,
��I J
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
��K L
model
��L Q
)
��Q R
,
��R S
Encoding
��T \
.
��\ ]
UTF8
��] a
,
��a b
$str
��c u
)
��u v
}
�� 
;
�� 
return
�� 
await
�� 
ExecuteRequest
�� +
<
��+ ,
Booking
��, 3
>
��3 4
(
��4 5
request
��5 <
)
��< =
;
��= >
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
�� 
Delete
��  &
(
��& '
int
��' *
id
��+ -
)
��- .
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
�� 
Cancel
��  &
(
��& '
int
��' *
id
��+ -
)
��- .
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
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\CompanyFacade.cs
	namespace

 	
BookingSystemMobile


 
.

 
Facades

 %
{ 
public 

class 
CompanyFacade 
:  
GenericFacade! .
{ 
public 
CompanyFacade 
( 
) 
:  
base! %
(% &
$str& 0
)0 1
{ 	
} 	
public 
async 
Task 
< 
Company !
>! "
Get# &
(& '
)' (
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{ 
Method 
= 

HttpMethod '
.' (
Get( +
,+ ,

RequestUri   
=    
new  ! $
Uri  % (
(  ( )
_baseUrl  ) 1
+  2 3
$str  4 9
)  9 :
}!! 
;!! 
Company## 
res## 
=## 
await## #
ExecuteRequest##$ 2
<##2 3
Company##3 :
>##: ;
(##; <
request##< C
)##C D
;##D E
return%% 
res%% 
??%% 
null%% "
;%%" #
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
return)) 
null)) 
;)) 
}** 
}++ 	
},, 
}-- �N
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\Core\GenericFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
.% &
Core& *
{ 
public 

class 
GenericFacade 
{ 
public 
static 
string 
Token "
{ 	
get 
{ 
return 
CrossSecureStorage )
.) *
Current* 1
.1 2
GetValue2 :
(: ;
$str; F
)F G
;G H
} 
set 
{ 
CrossSecureStorage "
." #
Current# *
.* +
SetValue+ 3
(3 4
$str4 ?
,? @
valueA F
)F G
;G H
} 
}   	
public"" 
static"" 
bool"" 
IsAdmin"" "
{## 	
get$$ 
{%% 
return&& 
Convert&& 
.&& 
	ToBoolean&& (
(&&( )
CrossSecureStorage&&) ;
.&&; <
Current&&< C
.&&C D
GetValue&&D L
(&&L M
$str&&M Z
)&&Z [
)&&[ \
;&&\ ]
}'' 
set(( 
{)) 
CrossSecureStorage** "
.**" #
Current**# *
.*** +
SetValue**+ 3
(**3 4
$str**4 A
,**A B
value**C H
.**H I
ToString**I Q
(**Q R
)**R S
)**S T
;**T U
}++ 
},, 	
public.. 
static.. 
string.. 
UserName.. %
{// 	
get00 
{11 
return22 
CrossSecureStorage22 )
.22) *
Current22* 1
.221 2
GetValue222 :
(22: ;
$str22; I
)22I J
;22J K
}33 
set44 
{55 
CrossSecureStorage66 "
.66" #
Current66# *
.66* +
SetValue66+ 3
(663 4
$str664 B
,66B C
value66D I
)66I J
;66J K
}77 
}88 	
public:: 
static:: 
string:: 
OwinId:: #
{;; 	
get<< 
{== 
return>> 
CrossSecureStorage>> )
.>>) *
Current>>* 1
.>>1 2
GetValue>>2 :
(>>: ;
$str>>; G
)>>G H
;>>H I
}?? 
set@@ 
{AA 
CrossSecureStorageBB "
.BB" #
CurrentBB# *
.BB* +
SetValueBB+ 3
(BB3 4
$strBB4 @
,BB@ A
valueBBB G
)BBG H
;BBH I
}CC 
}DD 	
publicFF 
staticFF 
intFF 
UserIdFF  
{GG 	
getHH 
{II 
returnJJ 
intJJ 
.JJ 
ParseJJ  
(JJ  !
CrossSecureStorageJJ! 3
.JJ3 4
CurrentJJ4 ;
.JJ; <
GetValueJJ< D
(JJD E
$strJJE Q
)JJQ R
)JJR S
;JJS T
}KK 
setLL 
{MM 
CrossSecureStorageNN "
.NN" #
CurrentNN# *
.NN* +
SetValueNN+ 3
(NN3 4
$strNN4 @
,NN@ A
valueNNB G
.NNG H
ToStringNNH P
(NNP Q
)NNQ R
)NNR S
;NNS T
}OO 
}PP 	
	protectedUU 
readonlyUU 

HttpClientUU %
_clientUU& -
;UU- .
	protectedZZ "
JsonSerializerSettingsZZ (
_serializerSettingsZZ) <
;ZZ< =
	protected__ 
readonly__ 
string__ !
_baseUrl__" *
=__+ ,
$str__- a
;__a b
publicdd 
GenericFacadedd 
(dd 
stringdd #
apiControllerdd$ 1
)dd1 2
{ee 	
_clientff 
=ff 
newff 

HttpClientff $
(ff$ %
)ff% &
;ff& '
_clientgg 
.gg !
DefaultRequestHeadersgg )
.gg) *
Authorizationgg* 7
=gg8 9
newgg: =%
AuthenticationHeaderValuegg> W
(ggW X
$strggX `
,gg` a
Tokenggb g
)ggg h
;ggh i
_clienthh 
.hh !
DefaultRequestHeadershh )
.hh) *
Accepthh* 0
.hh0 1
Addhh1 4
(hh4 5
newhh5 8+
MediaTypeWithQualityHeaderValuehh9 X
(hhX Y
$strhhY k
)hhk l
)hhl m
;hhm n
_serializerSettingsii 
=ii  !
newii" %"
JsonSerializerSettingsii& <
{ii= >
NullValueHandlingii? P
=iiQ R
NullValueHandlingiiS d
.iid e
Ignoreiie k
,iik l"
MissingMemberHandling	iim �
=
ii� �#
MissingMemberHandling
ii� �
.
ii� �
Ignore
ii� �
}
ii� �
;
ii� �
_baseUrljj 
+=jj 
apiControllerjj %
;jj% &
}kk 	
	protectedss 
asyncss 
Taskss 
<ss 
Tss 
>ss 
ExecuteRequestss  .
<ss. /
Tss/ 0
>ss0 1
(ss1 2
HttpRequestMessagess2 D
requestssE L
)ssL M
wheressN S
TssT U
:ssV W
DtossX [
{tt 	
_clientuu 
.uu !
DefaultRequestHeadersuu )
.uu) *
Authorizationuu* 7
=uu8 9
newuu: =%
AuthenticationHeaderValueuu> W
(uuW X
$struuX `
,uu` a
Tokenuub g
)uug h
;uuh i
varvv 
responsevv 
=vv 
_clientvv "
.vv" #
	SendAsyncvv# ,
(vv, -
requestvv- 4
)vv4 5
.vv5 6
Resultvv6 <
;vv< =
responseww 
.ww #
EnsureSuccessStatusCodeww ,
(ww, -
)ww- .
;ww. /
stringxx 
contentxx 
=xx 
awaitxx "
responsexx# +
.xx+ ,
Contentxx, 3
.xx3 4
ReadAsStringAsyncxx4 E
(xxE F
)xxF G
;xxG H
returnyy 
JsonConvertyy 
.yy 
DeserializeObjectyy 0
<yy0 1
Tyy1 2
>yy2 3
(yy3 4
contentyy4 ;
,yy; <
_serializerSettingsyy= P
)yyP Q
;yyQ R
}zz 	
	protected
�� 
async
�� 
Task
�� 
<
�� 
IEnumerable
�� (
<
��( )
T
��) *
>
��* +
>
��+ , 
ExecuteRequestList
��- ?
<
��? @
T
��@ A
>
��A B
(
��B C 
HttpRequestMessage
��C U
request
��V ]
)
��] ^
where
��_ d
T
��e f
:
��g h
Dto
��i l
{
�� 	
_client
�� 
.
�� #
DefaultRequestHeaders
�� )
.
��) *
Authorization
��* 7
=
��8 9
new
��: ='
AuthenticationHeaderValue
��> W
(
��W X
$str
��X `
,
��` a
Token
��b g
)
��g h
;
��h i
var
�� 
response
�� 
=
�� 
_client
�� "
.
��" #
	SendAsync
��# ,
(
��, -
request
��- 4
)
��4 5
.
��5 6
Result
��6 <
;
��< =
response
�� 
.
�� %
EnsureSuccessStatusCode
�� ,
(
��, -
)
��- .
;
��. /
string
�� 
content
�� 
=
�� 
await
�� "
response
��# +
.
��+ ,
Content
��, 3
.
��3 4
ReadAsStringAsync
��4 E
(
��E F
)
��F G
;
��G H
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
List
��1 5
<
��5 6
T
��6 7
>
��7 8
>
��8 9
(
��9 :
content
��: A
,
��A B!
_serializerSettings
��C V
)
��V W
;
��W X
}
�� 	
	protected
�� 
async
�� 
Task
�� 
<
�� 
bool
�� !
>
��! "
ExecuteRemove
��# 0
(
��0 1
Uri
��1 4
uri
��5 8
)
��8 9
{
�� 	
_client
�� 
.
�� #
DefaultRequestHeaders
�� )
.
��) *
Authorization
��* 7
=
��8 9
new
��: ='
AuthenticationHeaderValue
��> W
(
��W X
$str
��X `
,
��` a
Token
��b g
)
��g h
;
��h i
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
uri
��! $
}
�� 
;
�� 
var
�� 
response
�� 
=
�� 
_client
�� &
.
��& '
	SendAsync
��' 0
(
��0 1
request
��1 8
)
��8 9
.
��9 :
Result
��: @
;
��@ A
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
}�� �/
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\CustomerFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
CustomerFacade 
:  !
GenericFacade" /
{ 
public 
CustomerFacade 
( 
) 
:  !
base" &
(& '
$str' 2
)2 3
{ 	
} 	
public 
async 
Task 
< 
Customer "
>" #
Get$ '
(' (
int( +
id, .
). /
{ 	
try 
{ 
HttpRequestMessage   "
request  # *
=  + ,
new  - 0
HttpRequestMessage  1 C
{!! 
Method"" 
="" 

HttpMethod"" '
.""' (
Get""( +
,""+ ,

RequestUri## 
=##  
new##! $
Uri##% (
(##( )
_baseUrl##) 1
+##2 3
$str##4 :
+##; <
id##= ?
)##? @
}$$ 
;$$ 
return&& 
await&& 
ExecuteRequest&& +
<&&+ ,
Customer&&, 4
>&&4 5
(&&5 6
request&&6 =
)&&= >
;&&> ?
}'' 
catch(( 
((( 
	Exception(( 
ex(( 
)((  
{)) 
return** 
null** 
;** 
}++ 
},, 	
public22 
async22 
Task22 
<22 
Customer22 "
>22" #
Get22$ '
(22' (
)22( )
{33 	
try44 
{55 
HttpRequestMessage66 "
request66# *
=66+ ,
new66- 0
HttpRequestMessage661 C
{77 
Method88 
=88 

HttpMethod88 '
.88' (
Get88( +
,88+ ,

RequestUri99 
=99  
new99! $
Uri99% (
(99( )
_baseUrl99) 1
+992 3
$str994 ?
)99? @
}:: 
;:: 
return<< 
await<< 
ExecuteRequest<< +
<<<+ ,
Customer<<, 4
><<4 5
(<<5 6
request<<6 =
)<<= >
;<<> ?
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
return@@ 
null@@ 
;@@ 
}AA 
}BB 	
publicII 
asyncII 
TaskII 
<II 
CustomerII "
>II" #
CreateII$ *
(II* +
CustomerII+ 3
modelII4 9
)II9 :
{JJ 	
tryKK 
{LL 
HttpRequestMessageMM "
requestMM# *
=MM+ ,
newMM- 0
HttpRequestMessageMM1 C
{NN 
MethodOO 
=OO 

HttpMethodOO '
.OO' (
PostOO( ,
,OO, -

RequestUriPP 
=PP  
newPP! $
UriPP% (
(PP( )
_baseUrlPP) 1
+PP2 3
$strPP4 :
)PP: ;
,PP; <
ContentQQ 
=QQ 
newQQ !
StringContentQQ" /
(QQ/ 0
JsonConvertQQ0 ;
.QQ; <
SerializeObjectQQ< K
(QQK L
modelQQL Q
)QQQ R
,QQR S
EncodingQQT \
.QQ\ ]
UTF8QQ] a
,QQa b
$strQQc u
)QQu v
}RR 
;RR 
returnTT 
awaitTT 
ExecuteRequestTT +
<TT+ ,
CustomerTT, 4
>TT4 5
(TT5 6
requestTT6 =
)TT= >
;TT> ?
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
returnXX 
nullXX 
;XX 
}YY 
}ZZ 	
publicaa 
asyncaa 
Taskaa 
<aa 
Customeraa "
>aa" #
Updateaa$ *
(aa* +
Customeraa+ 3
modelaa4 9
)aa9 :
{bb 	
trycc 
{dd 
HttpRequestMessageee "
requestee# *
=ee+ ,
newee- 0
HttpRequestMessageee1 C
{ff 
Methodgg 
=gg 

HttpMethodgg '
.gg' (
Putgg( +
,gg+ ,

RequestUrihh 
=hh  
newhh! $
Urihh% (
(hh( )
_baseUrlhh) 1
+hh2 3
$strhh4 =
+hh> ?
modelhh@ E
.hhE F
IdhhF H
)hhH I
,hhI J
Contentii 
=ii 
newii !
StringContentii" /
(ii/ 0
JsonConvertii0 ;
.ii; <
SerializeObjectii< K
(iiK L
modeliiL Q
)iiQ R
,iiR S
EncodingiiT \
.ii\ ]
UTF8ii] a
,iia b
$striic u
)iiu v
}jj 
;jj 
returnll 
awaitll 
ExecuteRequestll +
<ll+ ,
Customerll, 4
>ll4 5
(ll5 6
requestll6 =
)ll= >
;ll> ?
}mm 
catchnn 
(nn 
	Exceptionnn 
exnn 
)nn  
{oo 
returnpp 
nullpp 
;pp 
}qq 
}rr 	
publicyy 
asyncyy 
Taskyy 
<yy 
boolyy 
>yy 
Deleteyy  &
(yy& '
intyy' *
idyy+ -
)yy- .
{zz 	
return{{ 
await{{ 
ExecuteRemove{{ &
({{& '
new{{' *
Uri{{+ .
({{. /
_baseUrl{{/ 7
+{{8 9
$str{{: C
+{{D E
id{{F H
){{H I
){{I J
;{{J K
}|| 	
}}} 
}~~ �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\DietInfoFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
DietInfoFacade 
:  !
GenericFacade" /
{ 
public 
DietInfoFacade 
( 
) 
:  !
base" &
(& '
$str' 2
)2 3
{ 	
} 	
public 
async 
Task 
< 
List 
< 
DietInfo '
>' (
>( )
Get* -
(- .
). /
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{   
Method!! 
=!! 

HttpMethod!! '
.!!' (
Get!!( +
,!!+ ,

RequestUri"" 
=""  
new""! $
Uri""% (
(""( )
_baseUrl"") 1
+""2 3
$str""4 9
)""9 :
}## 
;## 
IEnumerable%% 
<%% 
DietInfo%% $
>%%$ %
res%%& )
=%%* +
await%%, 1
ExecuteRequestList%%2 D
<%%D E
DietInfo%%E M
>%%M N
(%%N O
request%%O V
)%%V W
;%%W X
return'' 
res'' 
.'' 
Any'' 
('' 
)''  
?(( 
res(( 
.(( 
ToList((  
(((  !
)((! "
:)) 
new)) 
List)) 
<)) 
DietInfo)) '
>))' (
())( )
)))) *
;))* +
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 
new-- 
List-- 
<--  
DietInfo--  (
>--( )
(--) *
)--* +
;--+ ,
}.. 
}// 	
public66 
async66 
Task66 
<66 
DietInfo66 "
>66" #
FindById66$ ,
(66, -
int66- 0
id661 3
)663 4
{77 	
try88 
{99 
HttpRequestMessage:: "
request::# *
=::+ ,
new::- 0
HttpRequestMessage::1 C
{;; 
Method<< 
=<< 

HttpMethod<< '
.<<' (
Get<<( +
,<<+ ,

RequestUri== 
===  
new==! $
Uri==% (
(==( )
_baseUrl==) 1
+==2 3
$str==4 :
+==; <
id=== ?
)==? @
}>> 
;>> 
return@@ 
await@@ 
ExecuteRequest@@ +
<@@+ ,
DietInfo@@, 4
>@@4 5
(@@5 6
request@@6 =
)@@= >
;@@> ?
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
nullDD 
;DD 
}EE 
}FF 	
}GG 
}HH �
~C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\ImageFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
ImageFacade 
: 
GenericFacade ,
{ 
public 
ImageFacade 
( 
) 
: 
base #
(# $
$str$ ,
), -
{ 	
} 	
public 
async 
Task 
< 
Image 
>  
	LoadImage! *
(* +
int+ .
id/ 1
)1 2
{ 	
try 
{ 
HttpRequestMessage   "
request  # *
=  + ,
new  - 0
HttpRequestMessage  1 C
{!! 
Method"" 
="" 

HttpMethod"" '
.""' (
Get""( +
,""+ ,

RequestUri## 
=##  
new##! $
Uri##% (
(##( )
_baseUrl##) 1
+##2 3
$str##4 @
+##A B
id##C E
)##E F
}$$ 
;$$ 
return&& 
await&& 
ExecuteRequest&& +
<&&+ ,
Image&&, 1
>&&1 2
(&&2 3
request&&3 :
)&&: ;
;&&; <
}'' 
catch(( 
((( 
	Exception(( 
ex(( 
)((  
{)) 
return** 
null** 
;** 
}++ 
},, 	
public33 
async33 
Task33 
<33 
List33 
<33 
Image33 $
>33$ %
>33% &!
LoadImagesForMenuItem33' <
(33< =
int33= @
id33A C
)33C D
{44 	
try55 
{66 
HttpRequestMessage77 "
request77# *
=77+ ,
new77- 0
HttpRequestMessage771 C
{88 
Method99 
=99 

HttpMethod99 '
.99' (
Get99( +
,99+ ,

RequestUri:: 
=::  
new::! $
Uri::% (
(::( )
_baseUrl::) 1
+::2 3
$str::4 L
+::M N
id::O Q
)::Q R
};; 
;;; 
IEnumerable== 
<== 
Image== !
>==! "
res==# &
===' (
await==) .
ExecuteRequestList==/ A
<==A B
Image==B G
>==G H
(==H I
request==I P
)==P Q
;==Q R
return?? 
res?? 
.?? 
Any?? 
(?? 
)??  
?@@ 
res@@ 
.@@ 
ToList@@  
(@@  !
)@@! "
:AA 
newAA 
ListAA 
<AA 
ImageAA $
>AA$ %
(AA% &
)AA& '
;AA' (
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
newEE 
ListEE 
<EE  
ImageEE  %
>EE% &
(EE& '
)EE' (
;EE( )
}FF 
}GG 	
}HH 
}II �&
}C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\MenuFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
class 	

MenuFacade
 
: 
GenericFacade $
{ 
public 

MenuFacade 
( 
) 
: 
base "
(" #
$str# *
)* +
{ 	
} 	
public 
async 
Task 
< 
List 
< 
MenuItem '
>' (
>( )
Get* -
(- .
). /
{   	
try!! 
{"" 
HttpRequestMessage## "
request### *
=##+ ,
new##- 0
HttpRequestMessage##1 C
{$$ 
Method%% 
=%% 

HttpMethod%% '
.%%' (
Get%%( +
,%%+ ,

RequestUri&& 
=&&  
new&&! $
Uri&&% (
(&&( )
_baseUrl&&) 1
+&&2 3
$str&&4 9
)&&9 :
}'' 
;'' 
IEnumerable)) 
<)) 
MenuItem)) $
>))$ %
res))& )
=))* +
await)), 1
ExecuteRequestList))2 D
<))D E
MenuItem))E M
>))M N
())N O
request))O V
)))V W
;))W X
return++ 
res++ 
.++ 
Any++ 
(++ 
)++  
?,, 
res,, 
.,, 
ToList,, !
(,,! "
),," #
:-- 
new-- 
List-- 
<-- 
MenuItem-- '
>--' (
(--( )
)--) *
;--* +
}.. 
catch// 
(// 
	Exception// 
ex// 
)//  
{00 
return11 
new11 
List11 
<11  
MenuItem11  (
>11( )
(11) *
)11* +
;11+ ,
}22 
}33 	
public:: 
async:: 
Task:: 
<:: 
MenuItem:: "
>::" #
FindById::$ ,
(::, -
int::- 0
id::1 3
)::3 4
{;; 	
try<< 
{== 
HttpRequestMessage>> "
request>># *
=>>+ ,
new>>- 0
HttpRequestMessage>>1 C
{?? 
Method@@ 
=@@ 

HttpMethod@@ '
.@@' (
Get@@( +
,@@+ ,

RequestUriAA 
=AA  
newAA! $
UriAA% (
(AA( )
_baseUrlAA) 1
+AA2 3
$strAA4 :
+AA; <
idAA= ?
)AA? @
}BB 
;BB 
returnDD 
awaitDD 
ExecuteRequestDD +
<DD+ ,
MenuItemDD, 4
>DD4 5
(DD5 6
requestDD6 =
)DD= >
;DD> ?
}EE 
catchFF 
(FF 
	ExceptionFF 
exFF 
)FF  
{GG 
returnHH 
nullHH 
;HH 
}II 
}JJ 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
ListQQ 
<QQ 
MenuItemQQ '
>QQ' (
>QQ( )
FindByRestaurantIdQQ* <
(QQ< =
intQQ= @
idQQA C
)QQC D
{RR 	
trySS 
{TT 
HttpRequestMessageUU "
requestUU# *
=UU+ ,
newUU- 0
HttpRequestMessageUU1 C
{VV 
MethodWW 
=WW 

HttpMethodWW '
.WW' (
GetWW( +
,WW+ ,

RequestUriXX 
=XX  
newXX! $
UriXX% (
(XX( )
_baseUrlXX) 1
+XX2 3
$strXX4 F
+XXG H
idXXI K
)XXK L
}YY 
;YY 
IEnumerable[[ 
<[[ 
MenuItem[[ $
>[[$ %
res[[& )
=[[* +
await[[, 1
ExecuteRequestList[[2 D
<[[D E
MenuItem[[E M
>[[M N
([[N O
request[[O V
)[[V W
;[[W X
return]] 
res]] 
.]] 
Any]] 
(]] 
)]]  
?^^ 
res^^ 
.^^ 
ToList^^  
(^^  !
)^^! "
:__ 
new__ 
List__ 
<__ 
MenuItem__ '
>__' (
(__( )
)__) *
;__* +
}`` 
catchaa 
(aa 
	Exceptionaa 
exaa 
)aa  
{bb 
returncc 
newcc 
Listcc 
<cc  
MenuItemcc  (
>cc( )
(cc) *
)cc* +
;cc+ ,
}dd 
}ee 	
}ff 
}gg �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\MenuItemTypeFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
MenuItemTypeFacade #
:$ %
GenericFacade& 3
{ 
public 
MenuItemTypeFacade !
(! "
)" #
:$ %
base& *
(* +
$str+ :
): ;
{ 	
} 	
public 
async 
Task 
< 
List 
< 
MenuItemType +
>+ ,
>, -
Get. 1
(1 2
)2 3
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{   
Method!! 
=!! 

HttpMethod!! '
.!!' (
Get!!( +
,!!+ ,

RequestUri"" 
=""  
new""! $
Uri""% (
(""( )
_baseUrl"") 1
+""2 3
$str""4 9
)""9 :
}## 
;## 
IEnumerable%% 
<%% 
MenuItemType%% (
>%%( )
res%%* -
=%%. /
await%%0 5
ExecuteRequestList%%6 H
<%%H I
MenuItemType%%I U
>%%U V
(%%V W
request%%W ^
)%%^ _
;%%_ `
return'' 
res'' 
.'' 
Any'' 
('' 
)''  
?(( 
res(( 
.(( 
ToList((  
(((  !
)((! "
:)) 
new)) 
List)) 
<)) 
MenuItemType)) +
>))+ ,
()), -
)))- .
;)). /
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 
new-- 
List-- 
<--  
MenuItemType--  ,
>--, -
(--- .
)--. /
;--/ 0
}.. 
}// 	
public66 
async66 
Task66 
<66 
MenuItemType66 &
>66& '
FindById66( 0
(660 1
int661 4
id665 7
)667 8
{77 	
try88 
{99 
HttpRequestMessage:: "
request::# *
=::+ ,
new::- 0
HttpRequestMessage::1 C
{;; 
Method<< 
=<< 

HttpMethod<< '
.<<' (
Get<<( +
,<<+ ,

RequestUri== 
===  
new==! $
Uri==% (
(==( )
_baseUrl==) 1
+==2 3
$str==4 :
+==; <
id=== ?
)==? @
}>> 
;>> 
return@@ 
await@@ 
ExecuteRequest@@ +
<@@+ ,
MenuItemType@@, 8
>@@8 9
(@@9 :
request@@: A
)@@A B
;@@B C
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
nullDD 
;DD 
}EE 
}FF 	
}GG 
}HH �K
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\PaymentFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
PaymentFacade 
:  
GenericFacade! .
{ 
public 
PaymentFacade 
( 
) 
:  
base! %
(% &
$str& 0
)0 1
{ 	
} 	
public 
async 
Task 
< 
List 
< 
Payment &
>& '
>' (
Get) ,
(, -
)- .
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{   
Method!! 
=!! 

HttpMethod!! '
.!!' (
Get!!( +
,!!+ ,

RequestUri"" 
=""  
new""! $
Uri""% (
(""( )
_baseUrl"") 1
+""2 3
$str""4 9
)""9 :
}## 
;## 
IEnumerable%% 
<%% 
Payment%% #
>%%# $
res%%% (
=%%) *
await%%+ 0
ExecuteRequestList%%1 C
<%%C D
Payment%%D K
>%%K L
(%%L M
request%%M T
)%%T U
;%%U V
return'' 
res'' 
.'' 
Any'' 
('' 
)''  
?(( 
res(( 
.(( 
ToList((  
(((  !
)((! "
:)) 
new)) 
List)) 
<)) 
Payment)) &
>))& '
())' (
)))( )
;))) *
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 
new-- 
List-- 
<--  
Payment--  '
>--' (
(--( )
)--) *
;--* +
}.. 
}// 	
public66 
async66 
Task66 
<66 
Payment66 !
>66! "
FindById66# +
(66+ ,
int66, /
id660 2
)662 3
{77 	
try88 
{99 
HttpRequestMessage:: "
request::# *
=::+ ,
new::- 0
HttpRequestMessage::1 C
{;; 
Method<< 
=<< 

HttpMethod<< '
.<<' (
Get<<( +
,<<+ ,

RequestUri== 
===  
new==! $
Uri==% (
(==( )
_baseUrl==) 1
+==2 3
$str==4 :
+==; <
id=== ?
)==? @
}>> 
;>> 
return@@ 
await@@ 
ExecuteRequest@@ +
<@@+ ,
Payment@@, 3
>@@3 4
(@@4 5
request@@5 <
)@@< =
;@@= >
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
nullDD 
;DD 
}EE 
}FF 	
publicLL 
asyncLL 
TaskLL 
<LL 
ListLL 
<LL 
PaymentMethodLL ,
>LL, -
>LL- .
GetPaymentMethodLL/ ?
(LL? @
)LL@ A
{MM 	
tryNN 
{OO 
HttpRequestMessagePP "
requestPP# *
=PP+ ,
newPP- 0
HttpRequestMessagePP1 C
{QQ 
MethodRR 
=RR 

HttpMethodRR '
.RR' (
GetRR( +
,RR+ ,

RequestUriSS 
=SS  
newSS! $
UriSS% (
(SS( )
_baseUrlSS) 1
+SS2 3
$strSS4 F
)SSF G
}TT 
;TT 
IEnumerableVV 
<VV 
PaymentMethodVV )
>VV) *
resVV+ .
=VV/ 0
awaitVV1 6
ExecuteRequestListVV7 I
<VVI J
PaymentMethodVVJ W
>VVW X
(VVX Y
requestVVY `
)VV` a
;VVa b
returnXX 
resXX 
.XX 
AnyXX 
(XX 
)XX  
?YY 
resYY 
.YY 
ToListYY  
(YY  !
)YY! "
:ZZ 
newZZ 
ListZZ 
<ZZ 
PaymentMethodZZ ,
>ZZ, -
(ZZ- .
)ZZ. /
;ZZ/ 0
}[[ 
catch\\ 
(\\ 
	Exception\\ 
ex\\ 
)\\  
{]] 
return^^ 
new^^ 
List^^ 
<^^  
PaymentMethod^^  -
>^^- .
(^^. /
)^^/ 0
;^^0 1
}__ 
}`` 	
publicgg 
asyncgg 
Taskgg 
<gg 
PaymentMethodgg '
>gg' (!
FindPaymentMethodByIdgg) >
(gg> ?
intgg? B
idggC E
)ggE F
{hh 	
tryii 
{jj 
HttpRequestMessagekk "
requestkk# *
=kk+ ,
newkk- 0
HttpRequestMessagekk1 C
{ll 
Methodmm 
=mm 

HttpMethodmm '
.mm' (
Getmm( +
,mm+ ,

RequestUrinn 
=nn  
newnn! $
Urinn% (
(nn( )
_baseUrlnn) 1
+nn2 3
$strnn4 G
+nnH I
idnnJ L
)nnL M
}oo 
;oo 
returnqq 
awaitqq 
ExecuteRequestqq +
<qq+ ,
PaymentMethodqq, 9
>qq9 :
(qq: ;
requestqq; B
)qqB C
;qqC D
}rr 
catchss 
(ss 
	Exceptionss 
exss 
)ss  
{tt 
returnuu 
nulluu 
;uu 
}vv 
}ww 	
public~~ 
async~~ 
Task~~ 
<~~ 
Payment~~ !
>~~! "
Create~~# )
(~~) *
Payment~~* 1
model~~2 7
)~~7 8
{ 	
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
��4 :
)
��: ;
,
��; <
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
��K L
model
��L Q
)
��Q R
,
��R S
Encoding
��T \
.
��\ ]
UTF8
��] a
,
��a b
$str
��c u
)
��u v
}
�� 
;
�� 
return
�� 
await
�� 
ExecuteRequest
�� +
<
��+ ,
Payment
��, 3
>
��3 4
(
��4 5
request
��5 <
)
��< =
;
��= >
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
��! "
Update
��# )
(
��) *
Payment
��* 1
model
��2 7
)
��7 8
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
��> ?
model
��@ E
.
��E F
Id
��F H
)
��H I
,
��I J
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
��K L
model
��L Q
)
��Q R
,
��R S
Encoding
��T \
.
��\ ]
UTF8
��] a
,
��a b
$str
��c u
)
��u v
}
�� 
;
�� 
return
�� 
await
�� 
ExecuteRequest
�� +
<
��+ ,
Payment
��, 3
>
��3 4
(
��4 5
request
��5 <
)
��< =
;
��= >
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
�� 
Delete
��  &
(
��& '
int
��' *
id
��+ -
)
��- .
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
}�� �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\RestaurantFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
RestaurantFacade !
:" #
GenericFacade$ 1
{ 
public 
RestaurantFacade 
(  
)  !
:" #
base$ (
(( )
$str) 6
)6 7
{ 	
} 	
public 
async 
Task 
< 
List 
< 

Restaurant )
>) *
>* +
Get, /
(/ 0
)0 1
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{   
Method!! 
=!! 

HttpMethod!! '
.!!' (
Get!!( +
,!!+ ,

RequestUri"" 
=""  
new""! $
Uri""% (
(""( )
_baseUrl"") 1
+""2 3
$str""4 9
)""9 :
}## 
;## 
IEnumerable%% 
<%% 

Restaurant%% &
>%%& '
res%%( +
=%%, -
await%%. 3
ExecuteRequestList%%4 F
<%%F G

Restaurant%%G Q
>%%Q R
(%%R S
request%%S Z
)%%Z [
;%%[ \
return'' 
res'' 
.'' 
Any'' 
('' 
)''  
?(( 
res(( 
.(( 
ToList((  
(((  !
)((! "
:)) 
new)) 
List)) 
<)) 

Restaurant)) )
>))) *
())* +
)))+ ,
;)), -
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 
new-- 
List-- 
<--  

Restaurant--  *
>--* +
(--+ ,
)--, -
;--- .
}.. 
}// 	
public66 
async66 
Task66 
<66 

Restaurant66 $
>66$ %
FindById66& .
(66. /
int66/ 2
id663 5
)665 6
{77 	
try88 
{99 
HttpRequestMessage:: "
request::# *
=::+ ,
new::- 0
HttpRequestMessage::1 C
{;; 
Method<< 
=<< 

HttpMethod<< '
.<<' (
Get<<( +
,<<+ ,

RequestUri== 
===  
new==! $
Uri==% (
(==( )
_baseUrl==) 1
+==2 3
$str==4 :
+==; <
id=== ?
)==? @
}>> 
;>> 
return@@ 
await@@ 
ExecuteRequest@@ +
<@@+ ,

Restaurant@@, 6
>@@6 7
(@@7 8
request@@8 ?
)@@? @
;@@@ A
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
nullDD 
;DD 
}EE 
}FF 	
}GG 
}HH �
~C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Facades\TableFacade.cs
	namespace 	
BookingSystemMobile
 
. 
Facades %
{ 
public 

class 
TableFacade 
: 
GenericFacade ,
{ 
public 
TableFacade 
( 
) 
: 
base #
(# $
$str$ ,
), -
{ 	
} 	
public 
async 
Task 
< 
List 
< 
Table $
>$ %
>% &
Get' *
(* +
)+ ,
{ 	
try 
{ 
HttpRequestMessage "
request# *
=+ ,
new- 0
HttpRequestMessage1 C
{   
Method!! 
=!! 

HttpMethod!! '
.!!' (
Get!!( +
,!!+ ,

RequestUri"" 
=""  
new""! $
Uri""% (
(""( )
_baseUrl"") 1
+""2 3
$str""4 9
)""9 :
}## 
;## 
IEnumerable%% 
<%% 
Table%% !
>%%! "
res%%# &
=%%' (
await%%) .
ExecuteRequestList%%/ A
<%%A B
Table%%B G
>%%G H
(%%H I
request%%I P
)%%P Q
;%%Q R
return'' 
res'' 
.'' 
Any'' 
('' 
)''  
?(( 
res(( 
.(( 
ToList((  
(((  !
)((! "
:)) 
new)) 
List)) 
<)) 
Table)) $
>))$ %
())% &
)))& '
;))' (
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 
new-- 
List-- 
<--  
Table--  %
>--% &
(--& '
)--' (
;--( )
}.. 
}// 	
public66 
async66 
Task66 
<66 
Table66 
>66  
FindById66! )
(66) *
int66* -
id66. 0
)660 1
{77 	
try88 
{99 
HttpRequestMessage:: "
request::# *
=::+ ,
new::- 0
HttpRequestMessage::1 C
{;; 
Method<< 
=<< 

HttpMethod<< '
.<<' (
Get<<( +
,<<+ ,

RequestUri== 
===  
new==! $
Uri==% (
(==( )
_baseUrl==) 1
+==2 3
$str==4 :
+==; <
id=== ?
)==? @
}>> 
;>> 
return@@ 
await@@ 
ExecuteRequest@@ +
<@@+ ,
Table@@, 1
>@@1 2
(@@2 3
request@@3 :
)@@: ;
;@@; <
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
nullDD 
;DD 
}EE 
}FF 	
}GG 
}HH �<
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Booking\BookingIndexFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
{ 
public 

class  
BookingIndexFragment %
:& '
Android( /
./ 0
App0 3
.3 4
Fragment4 <
{ 
private 
readonly 
BookingFacade &
_bookingFacade' 5
=6 7
new8 ;
BookingFacade< I
(I J
)J K
;K L
private 
View 
view 
; 
private 
RecyclerView 
recyclerView )
;) *
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
List 
< 
Booking 
> 
bookings &
=' (
new) ,
List- 1
<1 2
Booking2 9
>9 :
(: ;
); <
;< =
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
public 
static  
BookingIndexFragment *
NewInstance+ 6
(6 7
)7 8
{   	
var!! 
frag1!! 
=!! 
new!!  
BookingIndexFragment!! 0
{!!1 2
	Arguments!!3 <
=!!= >
new!!? B
Bundle!!C I
(!!I J
)!!J K
}!!L M
;!!M N
return"" 
frag1"" 
;"" 
}## 	
public%% 
override%% 
void%% 
OnCreate%% %
(%%% &
Bundle%%& ,
savedInstanceState%%- ?
)%%? @
{&& 	
base'' 
.'' 
OnCreate'' 
('' 
savedInstanceState'' ,
)'', -
;''- .
}** 	
public,, 
override,, 
View,, 
OnCreateView,, )
(,,) *
LayoutInflater,,* 8
inflater,,9 A
,,,A B
	ViewGroup,,C L
	container,,M V
,,,V W
Bundle,,X ^
savedInstanceState,,_ q
),,q r
{-- 	
(.. 
(.. 
MainActivity.. 
).. 
Activity.. #
)..# $
...$ %
SetAsDrawerToolbar..% 7
(..7 8
)..8 9
;..9 :
var// 
ignored// 
=// 
base// 
.// 
OnCreateView// +
(//+ ,
inflater//, 4
,//4 5
	container//6 ?
,//? @
savedInstanceState//A S
)//S T
;//T U
view00 
=00 
inflater00 
.00 
Inflate00 #
(00# $
Resource00$ ,
.00, -
Layout00- 3
.003 4
booking_index004 A
,00A B
null00C G
)00G H
;00H I
swipeRefresh22 
=22 
view22 
.22  
FindViewById22  ,
<22, -
SwipeRefreshLayout22- ?
>22? @
(22@ A
Resource22A I
.22I J
Id22J L
.22L M
booking_index_swipe22M `
)22` a
;22a b
swipeRefresh44 
.44 
Refresh44  
+=44! #
delegate44$ ,
{55 
backgroundWorker66  
.66  !
RunWorkerAsync66! /
(66/ 0
)660 1
;661 2
}77 
;77 
swipeRefresh99 
.99 

Refreshing99 #
=99$ %
true99& *
;99* +
backgroundWorker;; 
=;; 
new;; "
BackgroundWorker;;# 3
(;;3 4
);;4 5
;;;5 6
backgroundWorker<< 
.<< 
DoWork<< #
+=<<$ &
Bworker_DoWork<<' 5
;<<5 6
backgroundWorker== 
.== 
RunWorkerCompleted== /
+===0 2&
Bworker_RunWorkerCompleted==3 M
;==M N
backgroundWorker>> 
.>> 
RunWorkerAsync>> +
(>>+ ,
)>>, -
;>>- .
return@@ 
view@@ 
;@@ 
}AA 	
privateCC 
voidCC 
SetupCC 
(CC 
)CC 
{DD 	
recyclerViewEE 
=EE 
viewEE 
.EE  
FindViewByIdEE  ,
<EE, -
RecyclerViewEE- 9
>EE9 :
(EE: ;
ResourceEE; C
.EEC D
IdEED F
.EEF G
booking_indexEEG T
)EET U
;EEU V
recyclerViewFF 
.FF 
SetLayoutManagerFF )
(FF) *
newFF* -
LinearLayoutManagerFF. A
(FFA B
ActivityFFB J
)FFJ K
)FFK L
;FFL M
BookingIndexAdapterHH 
adapterHH  '
=HH( )
newHH* -
BookingIndexAdapterHH. A
(HHA B
bookingsHHB J
)HHJ K
;HHK L
adapterII 
.II 
	ItemClickII 
+=II  
MAdapter_ItemClickII! 3
;II3 4
recyclerViewJJ 
.JJ 

SetAdapterJJ #
(JJ# $
adapterJJ$ +
)JJ+ ,
;JJ, -
}KK 	
privateMM 
asyncMM 
TaskMM 
	GetValuesMM $
(MM$ %
)MM% &
{NN 	
bookingsOO 
=OO 
awaitOO 
_bookingFacadeOO +
.OO+ ,
FindByCustomerIdOO, <
(OO< =
GenericFacadeOO= J
.OOJ K
UserIdOOK Q
)OOQ R
;OOR S
}PP 	
privateRR 
voidRR &
Bworker_RunWorkerCompletedRR /
(RR/ 0
objectRR0 6
senderRR7 =
,RR= >'
RunWorkerCompletedEventArgsRR? Z
eRR[ \
)RR\ ]
{SS 	
SetupTT 
(TT 
)TT 
;TT 
swipeRefreshUU 
.UU 

RefreshingUU #
=UU$ %
falseUU& +
;UU+ ,
}VV 	
privateXX 
asyncXX 
voidXX 
Bworker_DoWorkXX )
(XX) *
objectXX* 0
senderXX1 7
,XX7 8
DoWorkEventArgsXX9 H
eXXI J
)XXJ K
{YY 	
awaitZZ 
	GetValuesZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 	
private]] 
void]] 
MAdapter_ItemClick]] '
(]]' (
object]]( .
sender]]/ 5
,]]5 6
int]]7 :
i]]; <
)]]< =
{^^ 	
MainActivity__ 
.__ 
IsNavDisabled__ &
=__' (
true__) -
;__- .
Android`` 
.`` 
App`` 
.`` 
Fragment``  
fragment``! )
=``* +
BookingViewFragment``, ?
.``? @
NewInstance``@ K
(``K L
bookings``L T
[``T U
i``U V
]``V W
.``W X
Id``X Z
)``Z [
;``[ \
FragmentManageraa 
.aa 
BeginTransactionaa ,
(aa, -
)aa- .
.bb 
Replacebb 
(bb 
Resourcebb %
.bb% &
Idbb& (
.bb( )
content_framebb) 6
,bb6 7
fragmentbb8 @
)bb@ A
.cc 
AddToBackStackcc #
(cc# $
nullcc$ (
)cc( )
.dd 
Commitdd 
(dd 
)dd 
;dd 
}ee 	
}ff 
}gg �?
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Booking\BookingIndexAdapter.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
Menu( ,
{ 
public 

class 
BookingIndexAdapter $
:% &
RecyclerView' 3
.3 4
Adapter4 ;
{ 
public 
event 
EventHandler !
<! "
int" %
>% &
	ItemClick' 0
;0 1
public 
List 
< 
Booking 
> 
Items "
;" #
public 
BookingIndexAdapter "
(" #
List# '
<' (
Booking( /
>/ 0
items1 6
)6 7
{ 	
Items 
= 
items 
; 
} 	
public 
override 
int 
	ItemCount %
{ 	
get 
{ 
return 
Items 
. 
Count $
($ %
)% &
;& '
}( )
} 	
public   
override   
RecyclerView   $
.  $ %

ViewHolder  % /
OnCreateViewHolder  0 B
(  B C
	ViewGroup  C L
parent  M S
,  S T
int  U X
viewType  Y a
)  a b
{!! 	
View"" 
view"" 
="" 
LayoutInflater"" &
.""& '
From""' +
(""+ ,
parent"", 2
.""2 3
Context""3 :
)"": ;
.""; <
Inflate""< C
(""C D
Resource""D L
.""L M
Layout""M S
.""S T"
booking_index_recycler""T j
,""j k
parent""l r
,""r s
false""t y
)""y z
;""z {
BookingViewHolder## 
vh##  
=##! "
new### &
BookingViewHolder##' 8
(##8 9
view##9 =
,##= >
OnClick##? F
)##F G
;##G H
return$$ 
vh$$ 
;$$ 
}%% 	
public'' 
override'' 
void'' 
OnBindViewHolder'' -
(''- .
RecyclerView''. :
.'': ;

ViewHolder''; E
holder''F L
,''L M
int''N Q
position''R Z
)''Z [
{(( 	
BookingViewHolder)) 
vh))  
=))! "
holder))# )
as))* ,
BookingViewHolder))- >
;))> ?
vh** 
.** 
Item** 
=** 
Items** 
[** 
position** $
]**$ %
;**% &
vh,, 
.,, 

Restaurant,, 
.,, 
Text,, 
=,,  
vh,,! #
.,,# $
Item,,$ (
.,,( )

Restaurant,,) 3
.,,3 4
Name,,4 8
;,,8 9
vh-- 
.-- 
Date-- 
.-- 
Text-- 
=-- 
vh-- 
.-- 
Item-- "
.--" #
BookingDate--# .
.--. /
ToShortDateString--/ @
(--@ A
)--A B
;--B C
vh.. 
... 
Time.. 
... 
Text.. 
=.. 
vh.. 
... 
Item.. "
..." #
	StartTime..# ,
..., -
Hours..- 2
+..3 4
$str..5 8
+..9 :
vh..; =
...= >
Item..> B
...B C
	StartTime..C L
...L M
Minutes..M T
;..T U
vh// 
.// 
NoCustomers// 
.// 
Text// 
=//  !
vh//" $
.//$ %
Item//% )
.//) *
NoCustomers//* 5
.//5 6
ToString//6 >
(//> ?
)//? @
;//@ A
vh00 
.00 
	Cancelled00 
.00 
Text00 
=00 
vh00  "
.00" #
Item00# '
.00' (
	Cancelled00( 1
.001 2
ToString002 :
(00: ;
)00; <
;00< =
}11 	
private33 
void33 
OnClick33 
(33 
int33  
obj33! $
)33$ %
{44 	
	ItemClick55 
?55 
.55 
Invoke55 
(55 
this55 "
,55" #
obj55$ '
)55' (
;55( )
}66 	
}77 
public99 

class99 
BookingViewHolder99 "
:99# $
RecyclerView99% 1
.991 2

ViewHolder992 <
{:: 
public;; 
Booking;; 
Item;; 
{;; 
get;; !
;;;! "
set;;# &
;;;& '
};;( )
public<< 
View<< 
View<< 
{<< 
get<< 
;<< 
set<<  #
;<<# $
}<<% &
public== 
TextView== 

Restaurant== "
{==# $
get==% (
;==( )
set==* -
;==- .
}==/ 0
public>> 
TextView>> 
Date>> 
{>> 
get>> "
;>>" #
set>>$ '
;>>' (
}>>) *
public?? 
TextView?? 
Time?? 
{?? 
get?? "
;??" #
set??$ '
;??' (
}??) *
public@@ 
TextView@@ 
NoCustomers@@ #
{@@$ %
get@@& )
;@@) *
set@@+ .
;@@. /
}@@0 1
publicAA 
TextViewAA 
	CancelledAA !
{AA" #
getAA$ '
;AA' (
setAA) ,
;AA, -
}AA. /
publicCC 
BookingViewHolderCC  
(CC  !
ViewCC! %
viewCC& *
,CC* +
ActionCC, 2
<CC2 3
intCC3 6
>CC6 7
listenerCC8 @
)CC@ A
:CCB C
baseCCD H
(CCH I
viewCCI M
)CCM N
{DD 	
ViewEE 
=EE 
viewEE 
;EE 

RestaurantFF 
=FF 
viewFF 
.FF 
FindViewByIdFF *
<FF* +
TextViewFF+ 3
>FF3 4
(FF4 5
ResourceFF5 =
.FF= >
IdFF> @
.FF@ A-
!booking_index_recycler_restaurantFFA b
)FFb c
;FFc d
DateGG 
=GG 
viewGG 
.GG 
FindViewByIdGG $
<GG$ %
TextViewGG% -
>GG- .
(GG. /
ResourceGG/ 7
.GG7 8
IdGG8 :
.GG: ;'
booking_index_recycler_dateGG; V
)GGV W
;GGW X
TimeHH 
=HH 
viewHH 
.HH 
FindViewByIdHH $
<HH$ %
TextViewHH% -
>HH- .
(HH. /
ResourceHH/ 7
.HH7 8
IdHH8 :
.HH: ;'
booking_index_recycler_timeHH; V
)HHV W
;HHW X
NoCustomersII 
=II 
viewII 
.II 
FindViewByIdII +
<II+ ,
TextViewII, 4
>II4 5
(II5 6
ResourceII6 >
.II> ?
IdII? A
.IIA B0
$booking_index_recycler_num_customersIIB f
)IIf g
;IIg h
	CancelledJJ 
=JJ 
viewJJ 
.JJ 
FindViewByIdJJ )
<JJ) *
TextViewJJ* 2
>JJ2 3
(JJ3 4
ResourceJJ4 <
.JJ< =
IdJJ= ?
.JJ? @,
 booking_index_recycler_cancelledJJ@ `
)JJ` a
;JJa b
viewLL 
.LL 
ClickLL 
+=LL 
(LL 
senderLL !
,LL! "
eLL# $
)LL$ %
=>LL& (
listenerLL) 1
(LL1 2
baseLL2 6
.LL6 7
PositionLL7 ?
)LL? @
;LL@ A
}MM 	
}NN 
}OO Ѐ
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Booking\BookingViewFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class 
BookingViewFragment $
:% &
Fragment' /
{ 
private 
readonly 
BookingFacade &
_bookingFacade' 5
=6 7
new8 ;
BookingFacade< I
(I J
)J K
;K L
private 
readonly 
RestaurantFacade )
_restaurantFacade* ;
=< =
new> A
RestaurantFacadeB R
(R S
)S T
;T U
private 
View 
view 
; 
private 
Booking 
booking 
;  
private 
LibBookingService !
.! "
Dtos" &
.& '

Restaurant' 1

restaurant2 <
;< =
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
public 
static 
bool 
IsActive #
=$ %
true& *
;* +
public   
static   
BookingViewFragment   )
NewInstance  * 5
(  5 6
int  6 9
id  : <
)  < =
{!! 	
var"" 
f"" 
="" 
new"" 
BookingViewFragment"" +
{"", -
	Arguments"". 7
=""8 9
new"": =
Bundle""> D
(""D E
)""E F
}""G H
;""H I
Bundle## 
args## 
=## 
new## 
Bundle## $
(##$ %
)##% &
;##& '
args$$ 
.$$ 
PutInt$$ 
($$ 
$str$$ 
,$$ 
id$$  
)$$  !
;$$! "
f%% 
.%% 
	Arguments%% 
=%% 
args%% 
;%% 
return&& 
f&& 
;&& 
}'' 	
public)) 
override)) 
void)) 
OnCreate)) %
())% &
Bundle))& ,
savedInstanceState))- ?
)))? @
{** 	
base++ 
.++ 
OnCreate++ 
(++ 
savedInstanceState++ ,
)++, -
;++- .
}.. 	
public00 
override00 
View00 
OnCreateView00 )
(00) *
LayoutInflater00* 8
inflater009 A
,00A B
	ViewGroup00C L
	container00M V
,00V W
Bundle00X ^
savedInstanceState00_ q
)00q r
{11 	
(22 
(22 
MainActivity22 
)22 
Activity22 #
)22# $
.22$ %"
SetAsNavigationToolbar22% ;
(22; <
)22< =
;22= >
SetHasOptionsMenu33 
(33 
true33 "
)33" #
;33# $
var44 
ignored44 
=44 
base44 
.44 
OnCreateView44 +
(44+ ,
inflater44, 4
,444 5
	container446 ?
,44? @
savedInstanceState44A S
)44S T
;44T U
view55 
=55 
inflater55 
.55 
Inflate55 #
(55# $
Resource55$ ,
.55, -
Layout55- 3
.553 4
booking_view554 @
,55@ A
null55B F
)55F G
;55G H
swipeRefresh66 
=66 
view66 
.66  
FindViewById66  ,
<66, -
SwipeRefreshLayout66- ?
>66? @
(66@ A
Resource66A I
.66I J
Id66J L
.66L M
booking_view_swipe66M _
)66_ `
;66` a
swipeRefresh88 
.88 
Refresh88  
+=88! #
delegate88$ ,
{99 
backgroundWorker::  
.::  !
RunWorkerAsync::! /
(::/ 0
)::0 1
;::1 2
};; 
;;; 
swipeRefresh== 
.== 

Refreshing== #
===$ %
true==& *
;==* +
backgroundWorker?? 
=?? 
new?? "
BackgroundWorker??# 3
(??3 4
)??4 5
;??5 6
backgroundWorker@@ 
.@@ 
DoWork@@ #
+=@@$ &
Bworker_DoWork@@' 5
;@@5 6
backgroundWorkerAA 
.AA 
RunWorkerCompletedAA /
+=AA0 2&
Bworker_RunWorkerCompletedAA3 M
;AAM N
backgroundWorkerBB 
.BB 
RunWorkerAsyncBB +
(BB+ ,
)BB, -
;BB- .
returnDD 
viewDD 
;DD 
}EE 	
privateGG 
voidGG 
SetupGG 
(GG 
)GG 
{HH 	
viewII 
.II 
FindViewByIdII 
<II 
TextViewII &
>II& '
(II' (
ResourceII( 0
.II0 1
IdII1 3
.II3 4(
booking_view_restaurant_nameII4 P
)IIP Q
.IIQ R
TextIIR V
=IIW X

restaurantIIY c
.IIc d
NameIId h
;IIh i
viewJJ 
.JJ 
FindViewByIdJJ 
<JJ 
TextViewJJ &
>JJ& '
(JJ' (
ResourceJJ( 0
.JJ0 1
IdJJ1 3
.JJ3 4+
booking_view_restaurant_addressJJ4 S
)JJS T
.JJT U
TextJJU Y
=JJZ [

restaurantJJ\ f
.JJf g
AddressStreetJJg t
+JJu v
$strJJw {
+JJ| }

restaurant	JJ~ �
.
JJ� �
AddressTown
JJ� �
+
JJ� �
$str
JJ� �
+
JJ� �

restaurant
JJ� �
.
JJ� �
AddressCounty
JJ� �
+
JJ� �
$str
JJ� �
+
JJ� �

restaurant
JJ� �
.
JJ� �
AddressPostalCode
JJ� �
;
JJ� �
viewLL 
.LL 
FindViewByIdLL 
<LL 
TextViewLL &
>LL& '
(LL' (
ResourceLL( 0
.LL0 1
IdLL1 3
.LL3 4 
booking_view_createdLL4 H
)LLH I
.LLI J
TextLLJ N
=LLO P
bookingLLQ X
.LLX Y
BookingMadeDateLLY h
.LLh i
ToShortDateStringLLi z
(LLz {
)LL{ |
+LL} ~
$str	LL �
+
LL� �
booking
LL� �
.
LL� �
BookingMadeTime
LL� �
.
LL� �
Hours
LL� �
+
LL� �
$str
LL� �
+
LL� �
booking
LL� �
.
LL� �
BookingMadeTime
LL� �
.
LL� �
Minutes
LL� �
;
LL� �
viewMM 
.MM 
FindViewByIdMM 
<MM 
TextViewMM &
>MM& '
(MM' (
ResourceMM( 0
.MM0 1
IdMM1 3
.MM3 4 
booking_view_bookingMM4 H
)MMH I
.MMI J
TextMMJ N
=MMO P
bookingMMQ X
.MMX Y
BookingDateMMY d
.MMd e
ToShortDateStringMMe v
(MMv w
)MMw x
+MMy z
$str	MM{ �
+
MM� �
booking
MM� �
.
MM� �
	StartTime
MM� �
.
MM� �
Hours
MM� �
+
MM� �
$str
MM� �
+
MM� �
booking
MM� �
.
MM� �
	StartTime
MM� �
.
MM� �
Minutes
MM� �
;
MM� �
viewNN 
.NN 
FindViewByIdNN 
<NN 
TextViewNN &
>NN& '
(NN' (
ResourceNN( 0
.NN0 1
IdNN1 3
.NN3 4"
booking_view_customersNN4 J
)NNJ K
.NNK L
TextNNL P
=NNQ R
bookingNNS Z
.NNZ [
NoCustomersNN[ f
.NNf g
ToStringNNg o
(NNo p
)NNp q
;NNq r
viewOO 
.OO 
FindViewByIdOO 
<OO 
TextViewOO &
>OO& '
(OO' (
ResourceOO( 0
.OO0 1
IdOO1 3
.OO3 4!
booking_view_commentsOO4 I
)OOI J
.OOJ K
TextOOK O
=OOP Q
bookingOOR Y
.OOY Z
CommentsOOZ b
;OOb c
}PP 	
privateRR 
asyncRR 
TaskRR 
	GetValuesRR $
(RR$ %
)RR% &
{SS 	
intTT 
idTT 
=TT 
	ArgumentsTT 
.TT 
GetIntTT %
(TT% &
$strTT& *
)TT* +
;TT+ ,
ifVV 
(VV 
idVV 
>VV 
$numVV 
)VV 
{WW 
bookingXX 
=XX 
awaitXX 
_bookingFacadeXX  .
.XX. /
FindByIdXX/ 7
(XX7 8
idXX8 :
)XX: ;
;XX; <

restaurantYY 
=YY 
awaitYY "
_restaurantFacadeYY# 4
.YY4 5
FindByIdYY5 =
(YY= >
bookingYY> E
.YYE F
RestaurantIdYYF R
)YYR S
;YYS T
}ZZ 
}[[ 	
private]] 
void]] &
Bworker_RunWorkerCompleted]] /
(]]/ 0
object]]0 6
sender]]7 =
,]]= >'
RunWorkerCompletedEventArgs]]? Z
e]][ \
)]]\ ]
{^^ 	
Setup__ 
(__ 
)__ 
;__ 
swipeRefresh`` 
.`` 

Refreshing`` #
=``$ %
false``& +
;``+ ,
}aa 	
privatecc 
asynccc 
voidcc 
Bworker_DoWorkcc )
(cc) *
objectcc* 0
sendercc1 7
,cc7 8
DoWorkEventArgscc9 H
eccI J
)ccJ K
{dd 	
awaitee 
	GetValuesee 
(ee 
)ee 
;ee 
}ff 	
publichh 
overridehh 
voidhh 
OnCreateOptionsMenuhh 0
(hh0 1
IMenuhh1 6
menuhh7 ;
,hh; <
MenuInflaterhh= I
inflaterhhJ R
)hhR S
{ii 	
inflaterjj 
.jj 
Inflatejj 
(jj 
Resourcejj %
.jj% &
Menujj& *
.jj* + 
booking_view_optionsjj+ ?
,jj? @
menujjA E
)jjE F
;jjF G
}kk 	
publicmm 
overridemm 
voidmm 
OnResumemm %
(mm% &
)mm& '
{nn 	
MainActivityoo 
.oo 
IsNavDisabledoo &
=oo' (
trueoo) -
;oo- .
basepp 
.pp 
OnResumepp 
(pp 
)pp 
;pp 
}qq 	
publicss 
overridess 
boolss !
OnOptionsItemSelectedss 2
(ss2 3
	IMenuItemss3 <
itemss= A
)ssA B
{tt 	
ifuu 
(uu 
IsActiveuu 
)uu 
{vv 
intww 
idww 
=ww 
itemww 
.ww 
ItemIdww $
;ww$ %
ifyy 
(yy 
idyy 
==yy 
Androidyy !
.yy! "
Resourceyy" *
.yy* +
Idyy+ -
.yy- .
Homeyy. 2
)yy2 3
{zz 
MainActivity{{  
.{{  !
IsNavDisabled{{! .
={{/ 0
false{{1 6
;{{6 7
Activity|| 
.|| 
OnBackPressed|| *
(||* +
)||+ ,
;||, -
return}} 
true}} 
;}}  
}~~ 
else 
if 
( 
id 
== 
Resource '
.' (
Id( *
.* +
view_restaurant+ :
): ;
{
�� 
Fragment
�� 
fragment
�� %
=
��& '$
RestaurantViewFragment
��( >
.
��> ?
NewInstance
��? J
(
��J K
booking
��K R
.
��R S
RestaurantId
��S _
)
��_ `
;
��` a
FragmentManager
�� #
.
��# $
BeginTransaction
��$ 4
(
��4 5
)
��5 6
.
�� 
Replace
�� $
(
��$ %
Resource
��% -
.
��- .
Id
��. 0
.
��0 1
content_frame
��1 >
,
��> ?
fragment
��@ H
)
��H I
.
�� 
AddToBackStack
�� +
(
��+ ,
null
��, 0
)
��0 1
.
�� 
Commit
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
else
�� 
if
�� 
(
�� 
id
�� 
==
�� 
Resource
�� '
.
��' (
Id
��( *
.
��* +
cancel_booking
��+ 9
)
��9 :
{
�� 
new
�� 
Android
�� 
.
��  
App
��  #
.
��# $
AlertDialog
��$ /
.
��/ 0
Builder
��0 7
(
��7 8
Activity
��8 @
)
��@ A
.
��A B
SetIcon
�� #
(
��# $
Android
��$ +
.
��+ ,
Resource
��, 4
.
��4 5
Drawable
��5 =
.
��= >
IcDialogAlert
��> K
)
��K L
.
��L M
SetTitle
�� $
(
��$ %
$str
��% .
)
��. /
.
��/ 0

SetMessage
�� &
(
��& '
$str
��' U
)
��U V
.
��V W
SetPositiveButton
�� -
(
��- .
$str
��. 3
,
��3 4
(
��5 6
c
��6 7
,
��7 8
ev
��9 ;
)
��; <
=>
��= ?
{
�� 
bool
��  $
res
��% (
=
��) *
_bookingFacade
��+ 9
.
��9 :
Cancel
��: @
(
��@ A
booking
��A H
.
��H I
Id
��I K
)
��K L
.
��L M
Result
��M S
;
��S T
if
��  "
(
��# $
res
��$ '
)
��' (
{
��  !
Toast
��$ )
.
��) *
MakeText
��* 2
(
��2 3
Activity
��3 ;
,
��; <
$str
��= P
,
��P Q
ToastLength
��R ]
.
��] ^
Long
��^ b
)
��b c
.
��c d
Show
��d h
(
��h i
)
��i j
;
��j k
Fragment
��$ ,
fragment
��- 5
=
��6 7"
BookingIndexFragment
��8 L
.
��L M
NewInstance
��M X
(
��X Y
)
��Y Z
;
��Z [
FragmentManager
��$ 3
.
��3 4
BeginTransaction
��4 D
(
��D E
)
��E F
.
��, -
Replace
��- 4
(
��4 5
Resource
��5 =
.
��= >
Id
��> @
.
��@ A
content_frame
��A N
,
��N O
fragment
��P X
)
��X Y
.
��, -
Commit
��- 3
(
��3 4
)
��4 5
;
��5 6
}
��  !
else
��  $
{
��  !
Toast
��$ )
.
��) *
MakeText
��* 2
(
��2 3
Activity
��3 ;
,
��; <
$str
��= y
,
��y z
ToastLength��{ �
.��� �
Long��� �
)��� �
.��� �
Show��� �
(��� �
)��� �
;��� �
}
��  !
}
�� 
)
�� 
.
�� 
SetNegativeButton
�� -
(
��- .
$str
��. 2
,
��2 3
(
��4 5
c
��5 6
,
��6 7
ev
��8 :
)
��: ;
=>
��< >
{
�� 
}
�� 
)
�� 
.
�� 
Show
��  
(
��  !
)
��! "
;
��" #
}
�� 
}
�� 
return
�� 
base
�� 
.
�� #
OnOptionsItemSelected
�� -
(
��- .
item
��. 2
)
��2 3
;
��3 4
}
�� 	
}
�� 
}�� ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Booking\BookingNewDialogFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class $
BookingNewDialogFragment )
:* +
DialogFragment, :
{ 
private 
readonly 

MenuFacade #
_menuFacade$ /
=0 1
new2 5

MenuFacade6 @
(@ A
)A B
;B C
private 
readonly 
RestaurantFacade )
_restaurantFacade* ;
=< =
new> A
RestaurantFacadeB R
(R S
)S T
;T U
private 
readonly 
BookingFacade &
_bookingFacade' 5
=6 7
new8 ;
BookingFacade< I
(I J
)J K
;K L
private 
readonly 
PaymentFacade &
_paymentFacade' 5
=6 7
new8 ;
PaymentFacade< I
(I J
)J K
;K L
private 
readonly 
MenuItemTypeFacade +
_menuItemTypeFacade, ?
=@ A
newB E
MenuItemTypeFacadeF X
(X Y
)Y Z
;Z [
private 
View 
view 
; 
private 

Dictionary 
< 
MenuItem #
,# $
int% (
>( )
miCounts* 2
=3 4
new5 8

Dictionary9 C
<C D
MenuItemD L
,L M
intN Q
>Q R
(R S
)S T
;T U
private 
Booking 

newBooking "
;" #
private   
Payment   

newPayment   "
;  " #
public"" 
static"" $
BookingNewDialogFragment"" .
NewInstance""/ :
("": ;
int""; >
id""? A
)""A B
{## 	$
BookingNewDialogFragment$$ $
f$$% &
=$$' (
new$$) ,$
BookingNewDialogFragment$$- E
($$E F
)$$F G
;$$G H
Bundle%% 
args%% 
=%% 
new%% 
Bundle%% $
(%%$ %
)%%% &
;%%& '
args&& 
.&& 
PutInt&& 
(&& 
$str&& 
,&& 
id&&  
)&&  !
;&&! "
f'' 
.'' 
	Arguments'' 
='' 
args'' 
;'' 
return(( 
f(( 
;(( 
})) 	
public++ 
override++ 
Dialog++ 
OnCreateDialog++ -
(++- .
Bundle++. 4
savedInstanceState++5 G
)++G H
{,, 	
return-- 
base-- 
.-- 
OnCreateDialog-- &
(--& '
savedInstanceState--' 9
)--9 :
;--: ;
}.. 	
public00 
override00 
void00 
OnCreate00 %
(00% &
Bundle00& ,
savedInstanceState00- ?
)00? @
{11 	
base22 
.22 
OnCreate22 
(22 
savedInstanceState22 ,
)22, -
;22- .
SetStyle33 
(33 
DialogFragmentStyle33 (
.33( )
Normal33) /
,33/ 0
Resource331 9
.339 :
Style33: ?
.33? @
Theme_MyTheme33@ M
)33M N
;33N O
SetHasOptionsMenu55 
(55 
true55 "
)55" #
;55# $
}66 	
public88 
override88 
View88 
OnCreateView88 )
(88) *
LayoutInflater88* 8
inflater889 A
,88A B
	ViewGroup88C L
	container88M V
,88V W
Bundle88X ^
savedInstanceState88_ q
)88q r
{99 	
view:: 
=:: 
inflater:: 
.:: 
Inflate:: #
(::# $
Resource::$ ,
.::, -
Layout::- 3
.::3 4
booking_new::4 ?
,::? @
null::A E
)::E F
;::F G
miCounts;; 
=;; 
new;; 

Dictionary;; %
<;;% &
MenuItem;;& .
,;;. /
int;;0 3
>;;3 4
(;;4 5
);;5 6
;;;6 7

newBooking<< 
=<< 
new<< 
Booking<< $
(<<$ %
)<<% &
;<<& '

newPayment== 
=== 
new== 
Payment== $
(==$ %
)==% &
;==& '

newBooking?? 
.?? 

CustomerId?? !
=??" #
GenericFacade??$ 1
.??1 2
UserId??2 8
;??8 9

newPayment@@ 
.@@ 

CustomerId@@ !
=@@" #
GenericFacade@@$ 1
.@@1 2
UserId@@2 8
;@@8 9
AndroidBB 
.BB 
SupportBB 
.BB 
V7BB 
.BB 
WidgetBB %
.BB% &
ToolbarBB& -
toolbarBB. 5
=BB6 7
viewBB8 <
.BB< =
FindViewByIdBB= I
<BBI J
AndroidBBJ Q
.BBQ R
SupportBBR Y
.BBY Z
V7BBZ \
.BB\ ]
WidgetBB] c
.BBc d
ToolbarBBd k
>BBk l
(BBl m
ResourceBBm u
.BBu v
IdBBv x
.BBx y 
toolbar_new_booking	BBy �
)
BB� �
;
BB� �
toolbarCC 
.CC 
SetTitleCC 
(CC 
ResourceCC %
.CC% &
StringCC& ,
.CC, -!
bookingNewDialogTitleCC- B
)CCB C
;CCC D
(EE 
(EE 
AppCompatActivityEE 
)EE  
ActivityEE  (
)EE( )
.EE) *
SetSupportActionBarEE* =
(EE= >
toolbarEE> E
)EEE F
;EEF G
AndroidGG 
.GG 
SupportGG 
.GG 
V7GG 
.GG 
AppGG "
.GG" #
	ActionBarGG# ,
	actionBarGG- 6
=GG7 8
(GG9 :
(GG: ;
AppCompatActivityGG; L
)GGL M
ActivityGGM U
)GGU V
.GGV W
SupportActionBarGGW g
;GGg h
ifHH 
(HH 
	actionBarHH 
!=HH 
nullHH !
)HH! "
{II 
	actionBarJJ 
.JJ %
SetDisplayHomeAsUpEnabledJJ 3
(JJ3 4
trueJJ4 8
)JJ8 9
;JJ9 :
	actionBarKK 
.KK  
SetHomeButtonEnabledKK .
(KK. /
trueKK/ 3
)KK3 4
;KK4 5
	actionBarLL 
.LL  
SetHomeAsUpIndicatorLL .
(LL. /
ResourceLL/ 7
.LL7 8
DrawableLL8 @
.LL@ A
ic_clear_whiteLLA O
)LLO P
;LLP Q
}MM 
SetupOO 
(OO 
)OO 
;OO 
returnQQ 
viewQQ 
;QQ 
}RR 	
privateTT 
voidTT 
SetupTT 
(TT 
)TT 
{UU 	
intVV 
idVV 
=VV 
	ArgumentsVV 
.VV 
GetIntVV %
(VV% &
$strVV& *
)VV* +
;VV+ ,
ifXX 
(XX 
idXX 
>XX 
$numXX 
)XX 
{YY 
LibBookingServiceZZ !
.ZZ! "
DtosZZ" &
.ZZ& '

RestaurantZZ' 1

restaurantZZ2 <
=ZZ= >
_restaurantFacadeZZ? P
.ZZP Q
FindByIdZZQ Y
(ZZY Z
idZZZ \
)ZZ\ ]
.ZZ] ^
ResultZZ^ d
;ZZd e
IEnumerablemm 
<mm 
MenuItemTypemm (
>mm( )
typesmm* /
=mm0 1
_menuItemTypeFacademm2 E
.mmE F
GetmmF I
(mmI J
)mmJ K
.mmK L
ResultmmL R
;mmR S

newBookingvv 
.vv 
RestaurantIdvv '
=vv( )

restaurantvv* 4
.vv4 5
Idvv5 7
;vv7 8
viewxx 
.xx 
FindViewByIdxx !
<xx! "
TextViewxx" *
>xx* +
(xx+ ,
Resourcexx, 4
.xx4 5
Idxx5 7
.xx7 8'
booking_new_restaurant_namexx8 S
)xxS T
.xxT U
TextxxU Y
=xxZ [

restaurantxx\ f
.xxf g
Namexxg k
;xxk l
viewyy 
.yy 
FindViewByIdyy !
<yy! "
TextViewyy" *
>yy* +
(yy+ ,
Resourceyy, 4
.yy4 5
Idyy5 7
.yy7 8*
booking_new_restaurant_addressyy8 V
)yyV W
.yyW X
TextyyX \
=yy] ^

restaurantyy_ i
.yyi j
AddressStreetyyj w
+yyx y
$stryyz ~
+	yy �

restaurant
yy� �
.
yy� �
AddressTown
yy� �
+
yy� �
$str
yy� �
+
yy� �

restaurant
yy� �
.
yy� �
AddressCounty
yy� �
+
yy� �
$str
yy� �
+
yy� �

restaurant
yy� �
.
yy� �
AddressPostalCode
yy� �
;
yy� �
Spinner{{ 
time{{ 
={{ 
view{{ #
.{{# $
FindViewById{{$ 0
<{{0 1
Spinner{{1 8
>{{8 9
({{9 :
Resource{{: B
.{{B C
Id{{C E
.{{E F
booking_new_time{{F V
){{V W
;{{W X
Spinner|| 
paymentMethod|| %
=||& '
view||( ,
.||, -
FindViewById||- 9
<||9 :
Spinner||: A
>||A B
(||B C
Resource||C K
.||K L
Id||L N
.||N O&
booking_new_payment_method||O i
)||i j
;||j k
List~~ 
<~~ 
TimeSpan~~ 
>~~ 
times~~ $
=~~% &
GetTimes~~' /
(~~/ 0
)~~0 1
;~~1 2
List
�� 
<
�� 
PaymentMethod
�� "
>
��" #
paymentMethods
��$ 2
=
��3 4
new
��5 8
List
��9 =
<
��= >
PaymentMethod
��> K
>
��K L
{
�� 
new
�� 
PaymentMethod
�� %
{
��& '
Name
��( ,
=
��- .
$str
��/ O
}
��P Q
}
�� 
;
�� 
paymentMethods
�� 
.
�� 
AddRange
�� '
(
��' (
_paymentFacade
��( 6
.
��6 7
GetPaymentMethod
��7 G
(
��G H
)
��H I
.
��I J
Result
��J P
)
��P Q
;
��Q R
var
�� 
timeAdapter
�� 
=
��  !
new
��" %
ArrayAdapter
��& 2
<
��2 3
TimeSpan
��3 ;
>
��; <
(
��< =
Activity
��= E
,
��E F
Android
��G N
.
��N O
Resource
��O W
.
��W X
Layout
��X ^
.
��^ _'
SimpleSpinnerDropDownItem
��_ x
,
��x y
times
��z 
)�� �
;��� �
timeAdapter
�� 
.
�� %
SetDropDownViewResource
�� 3
(
��3 4
Android
��4 ;
.
��; <
Resource
��< D
.
��D E
Layout
��E K
.
��K L'
SimpleSpinnerDropDownItem
��L e
)
��e f
;
��f g
time
�� 
.
�� 
Adapter
�� 
=
�� 
timeAdapter
�� *
;
��* +
var
�� "
paymentMethodAdapter
�� (
=
��) *
new
��+ .
ArrayAdapter
��/ ;
<
��; <
PaymentMethod
��< I
>
��I J
(
��J K
Activity
��K S
,
��S T
Android
��U \
.
��\ ]
Resource
��] e
.
��e f
Layout
��f l
.
��l m(
SimpleSpinnerDropDownItem��m �
,��� �
paymentMethods��� �
)��� �
;��� �"
paymentMethodAdapter
�� $
.
��$ %%
SetDropDownViewResource
��% <
(
��< =
Android
��= D
.
��D E
Resource
��E M
.
��M N
Layout
��N T
.
��T U'
SimpleSpinnerDropDownItem
��U n
)
��n o
;
��o p
paymentMethod
�� 
.
�� 
Adapter
�� %
=
��& '"
paymentMethodAdapter
��( <
;
��< =
int
�� $
initialSpinnerPosition
�� *
=
��+ ,
time
��- 1
.
��1 2"
SelectedItemPosition
��2 F
;
��F G
time
�� 
.
�� 
ItemSelected
�� !
+=
��" $
(
��% &
sender
��& ,
,
��, -
args
��. 2
)
��2 3
=>
��4 6
{
�� 
if
�� 
(
�� 
args
�� 
.
�� 
Position
�� %
!=
��& ($
initialSpinnerPosition
��) ?
)
��? @
{
�� 

newBooking
�� "
.
��" #
	StartTime
��# ,
=
��- .
times
��/ 4
[
��4 5
args
��5 9
.
��9 :
Position
��: B
]
��B C
;
��C D
}
�� 
}
�� 
;
�� 
paymentMethod
�� 
.
�� 
ItemSelected
�� *
+=
��+ -
(
��. /
sender
��/ 5
,
��5 6
args
��7 ;
)
��; <
=>
��= ?
{
�� 
if
�� 
(
�� 
args
�� 
.
�� 
Position
�� %
!=
��& ($
initialSpinnerPosition
��) ?
)
��? @
{
�� 

newPayment
�� "
.
��" #
PaymentMethod
��# 0
=
��1 2
paymentMethods
��3 A
[
��A B
args
��B F
.
��F G
Position
��G O
]
��O P
;
��P Q
}
�� 
}
�� 
;
�� 
LinearLayout
�� 
layoutContainer
�� ,
=
��- .
view
��/ 3
.
��3 4
FindViewById
��4 @
<
��@ A
LinearLayout
��A M
>
��M N
(
��N O
Resource
��O W
.
��W X
Id
��X Z
.
��Z [#
booking_new_container
��[ p
)
��p q
;
��q r
miCounts
�� 
=
�� 
new
�� 

Dictionary
�� )
<
��) *
MenuItem
��* 2
,
��2 3
int
��4 7
>
��7 8
(
��8 9
)
��9 :
;
��: ;
foreach
�� 
(
�� 
var
�� 
mi
�� 
in
��  "

restaurant
��# -
.
��- .
	MenuItems
��. 7
)
��7 8
{
�� 
View
�� 
menuItem
�� !
=
��" #
LayoutInflater
��$ 2
.
��2 3
From
��3 7
(
��7 8
Activity
��8 @
)
��@ A
.
��A B
Inflate
��B I
(
��I J
Resource
��J R
.
��R S
Layout
��S Y
.
��Y Z
booking_new_menu
��Z j
,
��j k
null
��l p
)
��p q
;
��q r
LinearLayout
��  
.
��  !
LayoutParams
��! -
layout
��. 4
=
��5 6
new
��7 :
LinearLayout
��; G
.
��G H
LayoutParams
��H T
(
��T U
LinearLayout
��U a
.
��a b
LayoutParams
��b n
.
��n o
MatchParent
��o z
,
��z {
LinearLayout��| �
.��� �
LayoutParams��� �
.��� �
WrapContent��� �
)��� �
{
�� 
	TopMargin
�� !
=
��" #
$num
��$ &
}
�� 
;
�� 
menuItem
�� 
.
�� 
LayoutParameters
�� -
=
��. /
layout
��0 6
;
��6 7
menuItem
�� 
.
�� 
FindViewById
�� )
<
��) *
TextView
��* 2
>
��2 3
(
��3 4
Resource
��4 <
.
��< =
Id
��= ?
.
��? @#
booking_new_menu_item
��@ U
)
��U V
.
��V W
Text
��W [
=
��\ ]
mi
��^ `
.
��` a
Name
��a e
+
��f g
$str
��h m
+
��n o
String
��p v
.
��v w
Join
��w {
(
��{ |
$str��| �
,��� �
mi��� �
.��� �
Types��� �
.��� �
Select��� �
(��� �
t��� �
=>��� �
t��� �
.��� �
Name��� �
)��� �
)��� �
;��� �
miCounts
�� 
.
�� 
Add
��  
(
��  !
mi
��! #
,
��# $
$num
��% &
)
��& '
;
��' (
TextView
�� 
miCount
�� $
=
��% &
menuItem
��' /
.
��/ 0
FindViewById
��0 <
<
��< =
TextView
��= E
>
��E F
(
��F G
Resource
��G O
.
��O P
Id
��P R
.
��R S)
booking_new_menu_item_count
��S n
)
��n o
;
��o p
FrameLayout
�� 
miMinus
��  '
=
��( )
menuItem
��* 2
.
��2 3
FindViewById
��3 ?
<
��? @
FrameLayout
��@ K
>
��K L
(
��L M
Resource
��M U
.
��U V
Id
��V X
.
��X Y*
booking_new_menu_item_remove
��Y u
)
��u v
;
��v w
FrameLayout
�� 
miAdd
��  %
=
��& '
menuItem
��( 0
.
��0 1
FindViewById
��1 =
<
��= >
FrameLayout
��> I
>
��I J
(
��J K
Resource
��K S
.
��S T
Id
��T V
.
��V W'
booking_new_menu_item_add
��W p
)
��p q
;
��q r
miAdd
�� 
.
�� 
Click
�� 
+=
��  "
delegate
��# +
{
�� 
miCounts
��  
[
��  !
mi
��! #
]
��# $
+=
��% '
$num
��( )
;
��) *
miCount
�� 
.
��  
Text
��  $
=
��% &
miCounts
��' /
[
��/ 0
mi
��0 2
]
��2 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
;
��> ?
}
�� 
;
�� 
miMinus
�� 
.
�� 
Click
�� !
+=
��" $
delegate
��% -
{
�� 
if
�� 
(
�� 
miCounts
�� $
[
��$ %
mi
��% '
]
��' (
>
��) *
$num
��+ ,
)
��, -
miCounts
�� $
[
��$ %
mi
��% '
]
��' (
=
��) *
miCounts
��+ 3
[
��3 4
mi
��4 6
]
��6 7
-
��8 9
$num
��: ;
;
��; <
miCount
�� 
.
��  
Text
��  $
=
��% &
miCounts
��' /
[
��/ 0
mi
��0 2
]
��2 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
;
��> ?
}
�� 
;
�� 
layoutContainer
�� #
.
��# $
AddView
��$ +
(
��+ ,
menuItem
��, 4
)
��4 5
;
��5 6
}
�� 
}
�� 
}
�� 	
private
�� 
List
�� 
<
�� 
TimeSpan
�� 
>
�� 
GetTimes
�� '
(
��' (
)
��( )
{
�� 	
List
�� 
<
�� 
TimeSpan
�� 
>
�� 
times
��  
=
��! "
new
��# &
List
��' +
<
��+ ,
TimeSpan
��, 4
>
��4 5
(
��5 6
)
��6 7
;
��7 8
List
�� 
<
�� 
int
�� 
>
�� 
minutes
�� 
=
�� 
new
��  #
List
��$ (
<
��( )
int
��) ,
>
��, -
{
�� 
$num
�� 
,
�� 
$num
�� 
,
�� 
$num
�� 
,
�� 
$num
�� 
}
�� 
;
�� 
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
$num
��  "
;
��" #
i
��$ %
++
��% '
)
��' (
{
�� 
foreach
�� 
(
�� 
int
�� 
ii
�� 
in
��  "
minutes
��# *
)
��* +
{
�� 
times
�� 
.
�� 
Add
�� 
(
�� 
new
�� !
TimeSpan
��" *
(
��* +
i
��+ ,
,
��, -
ii
��. 0
,
��0 1
$num
��2 3
)
��3 4
)
��4 5
;
��5 6
}
�� 
}
�� 
return
�� 
times
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
void
�� !
OnCreateOptionsMenu
�� 0
(
��0 1
IMenu
��1 6
menu
��7 ;
,
��; <
MenuInflater
��= I
inflater
��J R
)
��R S
{
�� 	
menu
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
Activity
�� 
.
�� 
MenuInflater
�� !
.
��! "
Inflate
��" )
(
��) *
Resource
��* 2
.
��2 3
Menu
��3 7
.
��7 8!
booking_new_options
��8 K
,
��K L
menu
��M Q
)
��Q R
;
��R S
}
�� 	
public
�� 
override
�� 
bool
�� #
OnOptionsItemSelected
�� 2
(
��2 3
	IMenuItem
��3 <
item
��= A
)
��A B
{
�� 	
int
�� 
id
�� 
=
�� 
item
�� 
.
�� 
ItemId
��  
;
��  !
if
�� 
(
�� 
id
�� 
==
�� 
Android
�� 
.
�� 
Resource
�� &
.
��& '
Id
��' )
.
��) *
Home
��* .
)
��. /
{
�� 
new
�� 
Android
�� 
.
�� 
App
�� 
.
��  
AlertDialog
��  +
.
��+ ,
Builder
��, 3
(
��3 4
Activity
��4 <
)
��< =
.
��= >
SetIcon
�� 
(
��  
Android
��  '
.
��' (
Resource
��( 0
.
��0 1
Drawable
��1 9
.
��9 :
IcDialogAlert
��: G
)
��G H
.
��H I
SetTitle
��  
(
��  !
$str
��! *
)
��* +
.
��+ ,

SetMessage
�� "
(
��" #
$str
��# Q
)
��Q R
.
��R S
SetPositiveButton
�� )
(
��) *
$str
��* /
,
��/ 0
(
��1 2
c
��2 3
,
��3 4
ev
��5 7
)
��7 8
=>
��9 ;
{
�� 
Dismiss
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
)
�� 
.
�� 
SetNegativeButton
�� )
(
��) *
$str
��* .
,
��. /
(
��0 1
c
��1 2
,
��2 3
ev
��4 6
)
��6 7
=>
��8 :
{
�� 
}
�� 
)
�� 
.
�� 
Show
�� 
(
�� 
)
�� 
;
�� 
return
�� 
true
�� 
;
�� 
}
�� 
else
�� 
if
�� 
(
�� 
id
�� 
==
�� 
Resource
�� #
.
��# $
Id
��$ &
.
��& '
save_booking
��' 3
)
��3 4
{
�� 
string
�� 
noCustomers
�� "
=
��# $
view
��% )
.
��) *
FindViewById
��* 6
<
��6 7
TextView
��7 ?
>
��? @
(
��@ A
Resource
��A I
.
��I J
Id
��J L
.
��L M#
booking_new_customers
��M b
)
��b c
.
��c d
Text
��d h
;
��h i
DateTime
�� 
date
�� 
=
�� 
view
��  $
.
��$ %
FindViewById
��% 1
<
��1 2

DatePicker
��2 <
>
��< =
(
��= >
Resource
��> F
.
��F G
Id
��G I
.
��I J
booking_new_date
��J Z
)
��Z [
.
��[ \
DateTime
��\ d
;
��d e
if
�� 
(
�� 
noCustomers
�� 
.
��  
Trim
��  $
(
��$ %
)
��% &
!=
��' )
$str
��* ,
&&
��- /
int
��0 3
.
��3 4
Parse
��4 9
(
��9 :
noCustomers
��: E
)
��E F
>
��G H
$num
��I J
&&
��K M
date
��N R
!=
��S U
null
��V Z
&&
��[ ]
date
��^ b
!=
��c e
DateTime
��f n
.
��n o
MinValue
��o w
&&
��x z

newBooking��{ �
.��� �
	StartTime��� �
!=��� �
null��� �
&&��� �

newBooking��� �
.��� �
	StartTime��� �
!=��� �
TimeSpan��� �
.��� �
MinValue��� �
)��� �
{
�� 

newBooking
�� 
.
�� 
BookingMadeDate
�� .
=
��/ 0
DateTime
��1 9
.
��9 :
Now
��: =
;
��= >

newBooking
�� 
.
�� 
BookingMadeTime
�� .
=
��/ 0
DateTime
��1 9
.
��9 :
Now
��: =
.
��= >
	TimeOfDay
��> G
;
��G H

newBooking
�� 
.
�� 
BookingDate
�� *
=
��+ ,
date
��- 1
;
��1 2

newBooking
�� 
.
�� 
EndTime
�� &
=
��' (

newBooking
��) 3
.
��3 4
	StartTime
��4 =
.
��= >
Add
��> A
(
��A B
new
��B E
TimeSpan
��F N
(
��N O
$num
��O P
,
��P Q
$num
��R T
,
��T U
$num
��V X
)
��X Y
)
��Y Z
;
��Z [
Table
�� 
table
�� 
=
��  !
_bookingFacade
��" 0
.
��0 1
GetAvailableTable
��1 B
(
��B C

newBooking
��C M
)
��M N
.
��N O
Result
��O U
;
��U V
if
�� 
(
�� 
table
�� 
!=
��  
null
��! %
)
��% &
{
�� 
List
�� 
<
�� 
Table
�� "
>
��" #
	resTables
��$ -
=
��. /
new
��0 3
List
��4 8
<
��8 9
Table
��9 >
>
��> ?
{
�� 
table
�� !
}
�� 
;
�� 

newBooking
�� "
.
��" #
Tables
��# )
=
��* +
	resTables
��, 5
.
��5 6
AsEnumerable
��6 B
(
��B C
)
��C D
;
��D E

newPayment
�� "
.
��" #
Comments
��# +
=
��, -
view
��. 2
.
��2 3
FindViewById
��3 ?
<
��? @
TextView
��@ H
>
��H I
(
��I J
Resource
��J R
.
��R S
Id
��S U
.
��U V*
booking_new_payment_comments
��V r
)
��r s
.
��s t
Text
��t x
;
��x y
double
�� 
totalPayment
�� +
=
��, -
$num
��. /
;
��/ 0
foreach
�� 
(
��  !
KeyValuePair
��! -
<
��- .
MenuItem
��. 6
,
��6 7
int
��8 ;
>
��; <
entry
��= B
in
��C E
miCounts
��F N
)
��N O
{
�� 
if
�� 
(
��  
entry
��  %
.
��% &
Value
��& +
>
��, -
$num
��. /
)
��/ 0
{
�� 
totalPayment
��  ,
+=
��- /
(
��0 1
entry
��1 6
.
��6 7
Key
��7 :
.
��: ;
Price
��; @
*
��A B
entry
��C H
.
��H I
Value
��I N
)
��N O
;
��O P
}
�� 
}
�� 

newPayment
�� "
.
��" #
Amount
��# )
=
��* +
Convert
��, 3
.
��3 4
	ToDecimal
��4 =
(
��= >
totalPayment
��> J
)
��J K
;
��K L

newBooking
�� "
.
��" #
PaymentTotal
��# /
=
��0 1
Convert
��2 9
.
��9 :
	ToDecimal
��: C
(
��C D
totalPayment
��D P
)
��P Q
;
��Q R

newBooking
�� "
.
��" #
PaymentMadeDate
��# 2
=
��3 4
DateTime
��5 =
.
��= >
Now
��> A
;
��A B
if
�� 
(
�� 

newPayment
�� &
.
��& '
Amount
��' -
>
��. /
$num
��0 1
)
��1 2
{
�� 
if
�� 
(
��  

newPayment
��  *
.
��* +
PaymentMethod
��+ 8
!=
��9 ;
null
��< @
)
��@ A
{
�� 
List
��  $
<
��$ %
BookingMenuItem
��% 4
>
��4 5
	menuItems
��6 ?
=
��@ A
new
��B E
List
��F J
<
��J K
BookingMenuItem
��K Z
>
��Z [
(
��[ \
)
��\ ]
;
��] ^
foreach
��  '
(
��( )
KeyValuePair
��) 5
<
��5 6
MenuItem
��6 >
,
��> ?
int
��@ C
>
��C D
entry
��E J
in
��K M
miCounts
��N V
)
��V W
{
��  !
if
��$ &
(
��' (
entry
��( -
.
��- .
Value
��. 3
>
��4 5
$num
��6 7
)
��7 8
{
��$ %
	menuItems
��( 1
.
��1 2
Add
��2 5
(
��5 6
new
��6 9
BookingMenuItem
��: I
{
��( )

MenuItemId
��, 6
=
��7 8
entry
��9 >
.
��> ?
Key
��? B
.
��B C
Id
��C E
,
��E F
Quantity
��, 4
=
��5 6
entry
��7 <
.
��< =
Value
��= B
}
��( )
)
��) *
;
��* +
}
��$ %
}
��  !

newBooking
��  *
.
��* +
	MenuItems
��+ 4
=
��5 6
	menuItems
��7 @
.
��@ A
AsEnumerable
��A M
(
��M N
)
��N O
;
��O P
CompleteSave
��  ,
(
��, -
)
��- .
;
��. /
}
�� 
else
��  
{
�� 
Toast
��  %
.
��% &
MakeText
��& .
(
��. /
Activity
��/ 7
,
��7 8
$str
��9 h
,
��h i
ToastLength
��j u
.
��u v
Long
��v z
)
��z {
.
��{ |
Show��| �
(��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
CompleteSave
�� (
(
��( )
)
��) *
;
��* +
}
�� 
}
�� 
else
�� 
{
�� 
Toast
�� 
.
�� 
MakeText
�� &
(
��& '
Activity
��' /
,
��/ 0
$str
��1 W
,
��W X
ToastLength
��Y d
.
��d e
Long
��e i
)
��i j
.
��j k
Show
��k o
(
��o p
)
��p q
;
��q r
}
�� 
}
�� 
else
�� 
{
�� 
Toast
�� 
.
�� 
MakeText
�� "
(
��" #
Activity
��# +
,
��+ ,
$str
��- {
,
��{ |
ToastLength��} �
.��� �
Long��� �
)��� �
.��� �
Show��� �
(��� �
)��� �
;��� �
}
�� 
return
�� 
true
�� 
;
�� 
}
�� 
return
�� 
base
�� 
.
�� #
OnOptionsItemSelected
�� -
(
��- .
item
��. 2
)
��2 3
;
��3 4
}
�� 	
private
�� 
void
�� 
CompleteSave
�� !
(
��! "
)
��" #
{
�� 	
string
�� 
message
�� 
=
�� 
$str
�� B
;
��B C
if
�� 
(
�� 

newPayment
�� 
.
�� 
Amount
�� !
>
��" #
$num
��$ %
)
��% &
message
�� 
+=
�� 
$str
�� "
+
��# $

newPayment
��% /
.
��/ 0
Amount
��0 6
+
��7 8
$str
��9 <
;
��< =
new
�� 
Android
�� 
.
�� 
App
�� 
.
�� 
AlertDialog
�� '
.
��' (
Builder
��( /
(
��/ 0
Activity
��0 8
)
��8 9
.
��9 :
SetIcon
�� 
(
�� 
Android
�� 
.
��  
Resource
��  (
.
��( )
Drawable
��) 1
.
��1 2
IcDialogAlert
��2 ?
)
��? @
.
��@ A
SetTitle
�� 
(
�� 
$str
�� "
)
��" #
.
��# $

SetMessage
�� 
(
�� 
message
�� "
)
��" #
.
��# $
SetPositiveButton
�� !
(
��! "
$str
��" '
,
��' (
(
��) *
c
��* +
,
��+ ,
ev
��- /
)
��/ 0
=>
��1 3
{
�� 
Booking
�� 

svdBooking
�� &
=
��' (
_bookingFacade
��) 7
.
��7 8
Create
��8 >
(
��> ?

newBooking
��? I
)
��I J
.
��J K
Result
��K Q
;
��Q R

newPayment
�� 
.
�� 
	BookingId
�� (
=
��) *

svdBooking
��+ 5
.
��5 6
Id
��6 8
;
��8 9
if
�� 
(
�� 

newPayment
�� "
.
��" #
Amount
��# )
>
��* +
$num
��, -
)
��- .
{
�� 
Payment
�� 

svdPayment
��  *
=
��+ ,
_paymentFacade
��- ;
.
��; <
Create
��< B
(
��B C

newPayment
��C M
)
��M N
.
��N O
Result
��O U
;
��U V
}
�� 
Toast
�� 
.
�� 
MakeText
�� "
(
��" #
Activity
��# +
,
��+ ,
$str
��- @
,
��@ A
ToastLength
��B M
.
��M N
Long
��N R
)
��R S
.
��S T
Show
��T X
(
��X Y
)
��Y Z
;
��Z [
Dismiss
�� 
(
�� 
)
�� 
;
�� 
}
�� 
)
�� 
.
�� 
SetNegativeButton
�� !
(
��! "
$str
��" &
,
��& '
(
��( )
c
��) *
,
��* +
ev
��, .
)
��. /
=>
��0 2
{
�� 
}
�� 
)
�� 
.
�� 
Show
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
void
�� 
	OnDismiss
�� &
(
��& '
IDialogInterface
��' 7
dialog
��8 >
)
��> ?
{
�� 	$
RestaurantViewFragment
�� "
.
��" #
IsActive
��# +
=
��, -
true
��. 2
;
��2 3
base
�� 
.
�� 
	OnDismiss
�� 
(
�� 
dialog
�� !
)
��! "
;
��" #
}
�� 	
}
�� 
}�� �7
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Menu\MenuItemTypeDialogAdapter.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
Menu( ,
{ 
public 

class %
MenuItemTypeDialogAdapter *
:+ ,
RecyclerView- 9
.9 :
Adapter: A
{ 
private 
readonly 
ImageFacade $
_imageFacade% 1
=2 3
new4 7
ImageFacade8 C
(C D
)D E
;E F
public 
List 
< 
MenuItem 
> 
Items #
;# $
public %
MenuItemTypeDialogAdapter (
(( )
List) -
<- .
MenuItem. 6
>6 7
items8 =
)= >
{ 	
Items 
= 
items 
; 
} 	
public 
override 
int 
	ItemCount %
{ 	
get 
{ 
return 
Items 
. 
Count $
($ %
)% &
;& '
}( )
}   	
public"" 
override"" 
RecyclerView"" $
.""$ %

ViewHolder""% /
OnCreateViewHolder""0 B
(""B C
	ViewGroup""C L
parent""M S
,""S T
int""U X
viewType""Y a
)""a b
{## 	
View$$ 
view$$ 
=$$ 
LayoutInflater$$ &
.$$& '
From$$' +
($$+ ,
parent$$, 2
.$$2 3
Context$$3 :
)$$: ;
.$$; <
Inflate$$< C
($$C D
Resource$$D L
.$$L M
Layout$$M S
.$$S T*
menu_index_view_items_recycler$$T r
,$$r s
parent$$t z
,$$z {
false	$$| �
)
$$� �
;
$$� �
return%% 
new%% 
MenuItemViewHolder%% )
(%%) *
view%%* .
)%%. /
;%%/ 0
}&& 	
public(( 
override(( 
void(( 
OnBindViewHolder(( -
(((- .
RecyclerView((. :
.((: ;

ViewHolder((; E
holder((F L
,((L M
int((N Q
position((R Z
)((Z [
{)) 	
MenuItemViewHolder** 
vh** !
=**" #
holder**$ *
as**+ -
MenuItemViewHolder**. @
;**@ A
vh++ 
.++ 
Item++ 
=++ 
Items++ 
[++ 
position++ $
]++$ %
;++% &
Image-- 
img-- 
=-- 
_imageFacade-- $
.--$ %
	LoadImage--% .
(--. /
vh--/ 1
.--1 2
Item--2 6
.--6 7
ImageId--7 >
.--> ?
Value--? D
)--D E
.--E F
Result--F L
;--L M
vh.. 
... 
Img.. 
... 
SetImageBitmap.. !
(..! "
BitmapFactory.." /
.../ 0
DecodeByteArray..0 ?
(..? @
img..@ C
...C D
FileContent..D O
,..O P
$num..Q R
,..R S
img..T W
...W X
FileContent..X c
...c d
Length..d j
)..j k
)..k l
;..l m
vh00 
.00 
Name00 
.00 
Text00 
=00 
vh00 
.00 
Item00 "
.00" #
Name00# '
;00' (
vh11 
.11 
Description11 
.11 
Text11 
=11  !
vh11" $
.11$ %
Item11% )
.11) *
Description11* 5
;115 6
vh22 
.22 
Price22 
.22 
Text22 
=22 
$str22 
+22  !
string22" (
.22( )
Format22) /
(22/ 0
$str220 8
,228 9
Math22: >
.22> ?
Round22? D
(22D E
vh22E G
.22G H
Item22H L
.22L M
Price22M R
,22R S
$num22T U
,22U V
MidpointRounding22W g
.22g h
AwayFromZero22h t
)22t u
)22u v
;22v w
}33 	
}44 
public66 

class66 
MenuItemViewHolder66 #
:66$ %
RecyclerView66& 2
.662 3

ViewHolder663 =
{77 
public88 
MenuItem88 
Item88 
{88 
get88 "
;88" #
set88$ '
;88' (
}88) *
public99 
View99 
View99 
{99 
get99 
;99 
set99  #
;99# $
}99% &
public:: 
	ImageView:: 
Img:: 
{:: 
get:: "
;::" #
set::$ '
;::' (
}::) *
public;; 
TextView;; 
Name;; 
{;; 
get;; "
;;;" #
set;;$ '
;;;' (
};;) *
public<< 
TextView<< 
Description<< #
{<<$ %
get<<& )
;<<) *
set<<+ .
;<<. /
}<<0 1
public== 
TextView== 
Price== 
{== 
get==  #
;==# $
set==% (
;==( )
}==* +
public?? 
MenuItemViewHolder?? !
(??! "
View??" &
view??' +
)??+ ,
:??- .
base??/ 3
(??3 4
view??4 8
)??8 9
{@@ 	
ViewAA 
=AA 
viewAA 
;AA 
ImgBB 
=BB 
viewBB 
.BB 
FindViewByIdBB #
<BB# $
	ImageViewBB$ -
>BB- .
(BB. /
ResourceBB/ 7
.BB7 8
IdBB8 :
.BB: ;#
menu_index_recycler_imgBB; R
)BBR S
;BBS T
NameCC 
=CC 
viewCC 
.CC 
FindViewByIdCC $
<CC$ %
TextViewCC% -
>CC- .
(CC. /
ResourceCC/ 7
.CC7 8
IdCC8 :
.CC: ;$
menu_index_recycler_nameCC; S
)CCS T
;CCT U
DescriptionDD 
=DD 
viewDD 
.DD 
FindViewByIdDD +
<DD+ ,
TextViewDD, 4
>DD4 5
(DD5 6
ResourceDD6 >
.DD> ?
IdDD? A
.DDA B+
menu_index_recycler_descriptionDDB a
)DDa b
;DDb c
PriceEE 
=EE 
viewEE 
.EE 
FindViewByIdEE %
<EE% &
TextViewEE& .
>EE. /
(EE/ 0
ResourceEE0 8
.EE8 9
IdEE9 ;
.EE; <%
menu_index_recycler_priceEE< U
)EEU V
;EEV W
}FF 	
}GG 
}HH �:
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Menu\MenuIndexFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
{ 
public 

class 
MenuIndexFragment "
:# $
Android% ,
., -
App- 0
.0 1
Fragment1 9
{ 
private 
readonly 
MenuItemTypeFacade +
_menuItemTypeFacade, ?
=@ A
newB E
MenuItemTypeFacadeF X
(X Y
)Y Z
;Z [
private 
View 
view 
; 
private 
RecyclerView 
recyclerView )
;) *
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
private 
List 
< 
MenuItem 
> 
	menuItems (
=) *
new+ .
List/ 3
<3 4
MenuItem4 <
>< =
(= >
)> ?
;? @
private 
List 
< 
MenuItemType !
>! "
menuItemTypes# 0
=1 2
new3 6
List7 ;
<; <
MenuItemType< H
>H I
(I J
)J K
;K L
public 
static 
MenuIndexFragment '
NewInstance( 3
(3 4
)4 5
{ 	
var 
frag1 
= 
new 
MenuIndexFragment -
{. /
	Arguments0 9
=: ;
new< ?
Bundle@ F
(F G
)G H
}I J
;J K
return 
frag1 
; 
}   	
public"" 
override"" 
void"" 
OnCreate"" %
(""% &
Bundle""& ,
savedInstanceState""- ?
)""? @
{## 	
base$$ 
.$$ 
OnCreate$$ 
($$ 
savedInstanceState$$ ,
)$$, -
;$$- .
}'' 	
public)) 
override)) 
View)) 
OnCreateView)) )
())) *
LayoutInflater))* 8
inflater))9 A
,))A B
	ViewGroup))C L
	container))M V
,))V W
Bundle))X ^
savedInstanceState))_ q
)))q r
{** 	
var++ 
ignored++ 
=++ 
base++ 
.++ 
OnCreateView++ +
(+++ ,
inflater++, 4
,++4 5
	container++6 ?
,++? @
savedInstanceState++A S
)++S T
;++T U
view,, 
=,, 
inflater,, 
.,, 
Inflate,, #
(,,# $
Resource,,$ ,
.,,, -
Layout,,- 3
.,,3 4

menu_index,,4 >
,,,> ?
null,,@ D
),,D E
;,,E F
swipeRefresh.. 
=.. 
view.. 
...  
FindViewById..  ,
<.., -
SwipeRefreshLayout..- ?
>..? @
(..@ A
Resource..A I
...I J
Id..J L
...L M
menu_index_swipe..M ]
)..] ^
;..^ _
swipeRefresh00 
.00 
Refresh00  
+=00! #
delegate00$ ,
{11 
backgroundWorker22  
.22  !
RunWorkerAsync22! /
(22/ 0
)220 1
;221 2
}33 
;33 
swipeRefresh55 
.55 

Refreshing55 #
=55$ %
true55& *
;55* +
backgroundWorker77 
=77 
new77 "
BackgroundWorker77# 3
(773 4
)774 5
;775 6
backgroundWorker88 
.88 
DoWork88 #
+=88$ &
Bworker_DoWork88' 5
;885 6
backgroundWorker99 
.99 
RunWorkerCompleted99 /
+=990 2&
Bworker_RunWorkerCompleted993 M
;99M N
backgroundWorker:: 
.:: 
RunWorkerAsync:: +
(::+ ,
)::, -
;::- .
return<< 
view<< 
;<< 
}== 	
private?? 
void?? 
Setup?? 
(?? 
)?? 
{@@ 	
recyclerViewAA 
=AA 
viewAA 
.AA  
FindViewByIdAA  ,
<AA, -
RecyclerViewAA- 9
>AA9 :
(AA: ;
ResourceAA; C
.AAC D
IdAAD F
.AAF G

menu_indexAAG Q
)AAQ R
;AAR S
recyclerViewBB 
.BB 
SetLayoutManagerBB )
(BB) *
newBB* -
LinearLayoutManagerBB. A
(BBA B
ActivityBBB J
)BBJ K
)BBK L
;BBL M
MenuIndexAdapterDD 
adapterDD $
=DD% &
newDD' *
MenuIndexAdapterDD+ ;
(DD; <
menuItemTypesDD< I
)DDI J
;DDJ K
adapterEE 
.EE 
	ItemClickEE 
+=EE  
MAdapter_ItemClickEE! 3
;EE3 4
recyclerViewFF 
.FF 

SetAdapterFF #
(FF# $
adapterFF$ +
)FF+ ,
;FF, -
}GG 	
privateII 
asyncII 
TaskII 
	GetValuesII $
(II$ %
)II% &
{JJ 	
menuItemTypesKK 
=KK 
awaitKK !
_menuItemTypeFacadeKK" 5
.KK5 6
GetKK6 9
(KK9 :
)KK: ;
;KK; <
}LL 	
privateNN 
voidNN &
Bworker_RunWorkerCompletedNN /
(NN/ 0
objectNN0 6
senderNN7 =
,NN= >'
RunWorkerCompletedEventArgsNN? Z
eNN[ \
)NN\ ]
{OO 	
SetupPP 
(PP 
)PP 
;PP 
swipeRefreshQQ 
.QQ 

RefreshingQQ #
=QQ$ %
falseQQ& +
;QQ+ ,
}RR 	
privateTT 
asyncTT 
voidTT 
Bworker_DoWorkTT )
(TT) *
objectTT* 0
senderTT1 7
,TT7 8
DoWorkEventArgsTT9 H
eTTI J
)TTJ K
{UU 	
awaitVV 
	GetValuesVV 
(VV 
)VV 
;VV 
}WW 	
privateYY 
voidYY 
MAdapter_ItemClickYY '
(YY' (
objectYY( .
senderYY/ 5
,YY5 6
intYY7 :
iYY; <
)YY< =
{ZZ 	
MainActivity\\ 
.\\ 
IsNavDisabled\\ &
=\\' (
true\\) -
;\\- .
Android]] 
.]] 
App]] 
.]] 
DialogFragment]] &
dialog]]' -
=]]. /&
MenuItemTypeDialogFragment]]0 J
.]]J K
NewInstance]]K V
(]]V W
menuItemTypes]]W d
[]]d e
i]]e f
]]]f g
.]]g h
Id]]h j
)]]j k
;]]k l
dialog^^ 
.^^ 
Show^^ 
(^^ 
FragmentManager^^ '
,^^' (
$str^^) 9
)^^9 :
;^^: ;
}__ 	
}`` 
}aa �-
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Menu\MenuIndexAdapter.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
Menu( ,
{ 
public 

class 
MenuIndexAdapter !
:" #
RecyclerView$ 0
.0 1
Adapter1 8
{ 
public 
event 
EventHandler !
<! "
int" %
>% &
	ItemClick' 0
;0 1
public 
List 
< 
MenuItemType  
>  !
Items" '
;' (
public 
MenuIndexAdapter 
(  
List  $
<$ %
MenuItemType% 1
>1 2
items3 8
)8 9
{ 	
Items 
= 
items 
; 
} 	
public 
override 
int 
	ItemCount %
{ 	
get 
{ 
return 
Items 
. 
Count $
($ %
)% &
;& '
}( )
} 	
public   
override   
RecyclerView   $
.  $ %

ViewHolder  % /
OnCreateViewHolder  0 B
(  B C
	ViewGroup  C L
parent  M S
,  S T
int  U X
viewType  Y a
)  a b
{!! 	
View"" 
view"" 
="" 
LayoutInflater"" &
.""& '
From""' +
(""+ ,
parent"", 2
.""2 3
Context""3 :
)"": ;
.""; <
Inflate""< C
(""C D
Resource""D L
.""L M
Layout""M S
.""S T
menu_index_recycler""T g
,""g h
parent""i o
,""o p
false""q v
)""v w
;""w x"
MenuItemTypeViewHolder## "
vh### %
=##& '
new##( +"
MenuItemTypeViewHolder##, B
(##B C
view##C G
,##G H
OnClick##I P
)##P Q
;##Q R
return$$ 
vh$$ 
;$$ 
}%% 	
public'' 
override'' 
void'' 
OnBindViewHolder'' -
(''- .
RecyclerView''. :
.'': ;

ViewHolder''; E
holder''F L
,''L M
int''N Q
position''R Z
)''Z [
{(( 	"
MenuItemTypeViewHolder)) "
vh))# %
=))& '
holder))( .
as))/ 1"
MenuItemTypeViewHolder))2 H
;))H I
vh** 
.** 
Item** 
=** 
Items** 
[** 
position** $
]**$ %
;**% &
vh++ 
.++ 
Name++ 
.++ 
Text++ 
=++ 
vh++ 
.++ 
Item++ "
.++" #
Name++# '
;++' (
},, 	
private.. 
void.. 
OnClick.. 
(.. 
int..  
obj..! $
)..$ %
{// 	
	ItemClick00 
?00 
.00 
Invoke00 
(00 
this00 "
,00" #
obj00$ '
)00' (
;00( )
}11 	
}22 
public44 

class44 "
MenuItemTypeViewHolder44 '
:44( )
RecyclerView44* 6
.446 7

ViewHolder447 A
{55 
public66 
MenuItemType66 
Item66  
{66! "
get66# &
;66& '
set66( +
;66+ ,
}66- .
public77 
View77 
View77 
{77 
get77 
;77 
set77  #
;77# $
}77% &
public88 
	ImageView88 
Img88 
{88 
get88 "
;88" #
set88$ '
;88' (
}88) *
public99 
TextView99 
Name99 
{99 
get99 "
;99" #
set99$ '
;99' (
}99) *
public:: 
TextView:: 
Description:: #
{::$ %
get::& )
;::) *
set::+ .
;::. /
}::0 1
public;; 
TextView;; 
Price;; 
{;; 
get;;  #
;;;# $
set;;% (
;;;( )
};;* +
public== "
MenuItemTypeViewHolder== %
(==% &
View==& *
view==+ /
,==/ 0
Action==1 7
<==7 8
int==8 ;
>==; <
listener=== E
)==E F
:==G H
base==I M
(==M N
view==N R
)==R S
{>> 	
View?? 
=?? 
view?? 
;?? 
Img@@ 
=@@ 
view@@ 
.@@ 
FindViewById@@ #
<@@# $
	ImageView@@$ -
>@@- .
(@@. /
Resource@@/ 7
.@@7 8
Id@@8 :
.@@: ;#
menu_index_recycler_img@@; R
)@@R S
;@@S T
NameAA 
=AA 
viewAA 
.AA 
FindViewByIdAA $
<AA$ %
TextViewAA% -
>AA- .
(AA. /
ResourceAA/ 7
.AA7 8
IdAA8 :
.AA: ;$
menu_index_recycler_nameAA; S
)AAS T
;AAT U
viewCC 
.CC 
ClickCC 
+=CC 
(CC 
senderCC !
,CC! "
eCC# $
)CC$ %
=>CC& (
listenerCC) 1
(CC1 2
baseCC2 6
.CC6 7
PositionCC7 ?
)CC? @
;CC@ A
}DD 	
}EE 
}FF �Y
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Menu\MenuItemTypeDialogFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
Menu( ,
{ 
public 

class &
MenuItemTypeDialogFragment +
:, -
DialogFragment. <
{ 
private 
readonly 

MenuFacade #
_menuFacade$ /
=0 1
new2 5

MenuFacade6 @
(@ A
)A B
;B C
private 
List 
< 
MenuItem 
> 
	menuItems (
=) *
new+ .
List/ 3
<3 4
MenuItem4 <
>< =
(= >
)> ?
;? @
private 
View 
view 
; 
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
public 
static &
MenuItemTypeDialogFragment 0
NewInstance1 <
(< =
int= @
idA C
)C D
{   	&
MenuItemTypeDialogFragment!! &
f!!' (
=!!) *
new!!+ .&
MenuItemTypeDialogFragment!!/ I
(!!I J
)!!J K
;!!K L
Bundle"" 
args"" 
="" 
new"" 
Bundle"" $
(""$ %
)""% &
;""& '
args## 
.## 
PutInt## 
(## 
$str## 
,## 
id##  
)##  !
;##! "
f$$ 
.$$ 
	Arguments$$ 
=$$ 
args$$ 
;$$ 
return%% 
f%% 
;%% 
}&& 	
public(( 
override(( 
Dialog(( 
OnCreateDialog(( -
(((- .
Bundle((. 4
savedInstanceState((5 G
)((G H
{)) 	
return** 
base** 
.** 
OnCreateDialog** &
(**& '
savedInstanceState**' 9
)**9 :
;**: ;
}++ 	
public-- 
override-- 
void-- 
OnCreate-- %
(--% &
Bundle--& ,
savedInstanceState--- ?
)--? @
{.. 	
base// 
.// 
OnCreate// 
(// 
savedInstanceState// ,
)//, -
;//- .
SetStyle00 
(00 
DialogFragmentStyle00 (
.00( )
Normal00) /
,00/ 0
Resource001 9
.009 :
Style00: ?
.00? @
Theme_MyTheme00@ M
)00M N
;00N O
}11 	
public33 
override33 
View33 
OnCreateView33 )
(33) *
LayoutInflater33* 8
inflater339 A
,33A B
	ViewGroup33C L
	container33M V
,33V W
Bundle33X ^
savedInstanceState33_ q
)33q r
{44 	
view55 
=55 
inflater55 
.55 
Inflate55 #
(55# $
Resource55$ ,
.55, -
Layout55- 3
.553 4!
menu_index_view_items554 I
,55I J
null55K O
)55O P
;55P Q
Toolbar77 
toolbar77 
=77 
view77 "
.77" #
FindViewById77# /
<77/ 0
Toolbar770 7
>777 8
(778 9
Resource779 A
.77A B
Id77B D
.77D E
toolbar_menu_items77E W
)77W X
;77X Y
toolbar88 
.88 
SetTitle88 
(88 
Resource88 %
.88% &
String88& ,
.88, -
menuItemDialogTitle88- @
)88@ A
;88A B
SetHasOptionsMenu:: 
(:: 
true:: "
)::" #
;::# $
(<< 
(<< 
AppCompatActivity<< 
)<<  
Activity<<  (
)<<( )
.<<) *
SetSupportActionBar<<* =
(<<= >
toolbar<<> E
)<<E F
;<<F G
Android>> 
.>> 
Support>> 
.>> 
V7>> 
.>> 
App>> "
.>>" #
	ActionBar>># ,
	actionBar>>- 6
=>>7 8
(>>9 :
(>>: ;
AppCompatActivity>>; L
)>>L M
Activity>>M U
)>>U V
.>>V W
SupportActionBar>>W g
;>>g h
if?? 
(?? 
	actionBar?? 
!=?? 
null?? !
)??! "
{@@ 
	actionBarAA 
.AA %
SetDisplayHomeAsUpEnabledAA 3
(AA3 4
trueAA4 8
)AA8 9
;AA9 :
	actionBarBB 
.BB  
SetHomeButtonEnabledBB .
(BB. /
trueBB/ 3
)BB3 4
;BB4 5
	actionBarCC 
.CC  
SetHomeAsUpIndicatorCC .
(CC. /
ResourceCC/ 7
.CC7 8
DrawableCC8 @
.CC@ A
ic_clear_whiteCCA O
)CCO P
;CCP Q
}DD 
swipeRefreshFF 
=FF 
viewFF 
.FF  
FindViewByIdFF  ,
<FF, -
SwipeRefreshLayoutFF- ?
>FF? @
(FF@ A
ResourceFFA I
.FFI J
IdFFJ L
.FFL M,
 menu_index_view_item_types_swipeFFM m
)FFm n
;FFn o
swipeRefreshHH 
.HH 
RefreshHH  
+=HH! #
delegateHH$ ,
{II 
backgroundWorkerJJ  
.JJ  !
RunWorkerAsyncJJ! /
(JJ/ 0
)JJ0 1
;JJ1 2
}KK 
;KK 
swipeRefreshMM 
.MM 

RefreshingMM #
=MM$ %
trueMM& *
;MM* +
backgroundWorkerOO 
=OO 
newOO "
BackgroundWorkerOO# 3
(OO3 4
)OO4 5
;OO5 6
backgroundWorkerPP 
.PP 
DoWorkPP #
+=PP$ &
Bworker_DoWorkPP' 5
;PP5 6
backgroundWorkerQQ 
.QQ 
RunWorkerCompletedQQ /
+=QQ0 2&
Bworker_RunWorkerCompletedQQ3 M
;QQM N
backgroundWorkerRR 
.RR 
RunWorkerAsyncRR +
(RR+ ,
)RR, -
;RR- .
returnTT 
viewTT 
;TT 
}UU 	
privateWW 
voidWW 
SetupWW 
(WW 
)WW 
{XX 	
RecyclerViewYY 
recyclerViewYY %
=YY& '
viewYY( ,
.YY, -
FindViewByIdYY- 9
<YY9 :
RecyclerViewYY: F
>YYF G
(YYG H
ResourceYYH P
.YYP Q
IdYYQ S
.YYS T&
menu_index_view_item_typesYYT n
)YYn o
;YYo p
recyclerViewZZ 
.ZZ 
SetLayoutManagerZZ )
(ZZ) *
newZZ* -
LinearLayoutManagerZZ. A
(ZZA B
ActivityZZB J
)ZZJ K
)ZZK L
;ZZL M%
MenuItemTypeDialogAdapter\\ %
adapter\\& -
=\\. /
new\\0 3%
MenuItemTypeDialogAdapter\\4 M
(\\M N
	menuItems\\N W
)\\W X
;\\X Y
recyclerView]] 
.]] 

SetAdapter]] #
(]]# $
adapter]]$ +
)]]+ ,
;]], -
}^^ 	
private`` 
async`` 
Task`` 
	GetValues`` $
(``$ %
)``% &
{aa 	
intbb 
idbb 
=bb 
	Argumentsbb 
.bb 
GetIntbb %
(bb% &
$strbb& *
)bb* +
;bb+ ,
ifdd 
(dd 
iddd 
>dd 
$numdd 
)dd 
{ee 
	menuItemsff 
=ff 
awaitff !
_menuFacadeff" -
.ff- .
Getff. 1
(ff1 2
)ff2 3
;ff3 4
	menuItemsgg 
=gg 
	menuItemsgg %
.gg% &
Wheregg& +
(gg+ ,
mgg, -
=>gg. 0
mgg1 2
.gg2 3
Typesgg3 8
.gg8 9
Wheregg9 >
(gg> ?
tgg? @
=>ggA C
tggD E
.ggE F
IdggF H
==ggI K
idggL N
)ggN O
.ggO P
AnyggP S
(ggS T
)ggT U
)ggU V
.ggV W
ToListggW ]
(gg] ^
)gg^ _
;gg_ `
}hh 
}ii 	
privatekk 
voidkk &
Bworker_RunWorkerCompletedkk /
(kk/ 0
objectkk0 6
senderkk7 =
,kk= >'
RunWorkerCompletedEventArgskk? Z
ekk[ \
)kk\ ]
{ll 	
Setupmm 
(mm 
)mm 
;mm 
swipeRefreshnn 
.nn 

Refreshingnn #
=nn$ %
falsenn& +
;nn+ ,
}oo 	
privateqq 
asyncqq 
voidqq 
Bworker_DoWorkqq )
(qq) *
objectqq* 0
senderqq1 7
,qq7 8
DoWorkEventArgsqq9 H
eqqI J
)qqJ K
{rr 	
awaitss 
	GetValuesss 
(ss 
)ss 
;ss 
}tt 	
publicvv 
overridevv 
voidvv 
OnCreateOptionsMenuvv 0
(vv0 1
IMenuvv1 6
menuvv7 ;
,vv; <
MenuInflatervv= I
inflatervvJ R
)vvR S
{ww 	
menuxx 
.xx 
Clearxx 
(xx 
)xx 
;xx 
Activityyy 
.yy 
MenuInflateryy !
.yy! "
Inflateyy" )
(yy) *
Resourceyy* 2
.yy2 3
Menuyy3 7
.yy7 8&
default_no_toolbar_optionsyy8 R
,yyR S
menuyyT X
)yyX Y
;yyY Z
}zz 	
public|| 
override|| 
bool|| !
OnOptionsItemSelected|| 2
(||2 3
	IMenuItem||3 <
item||= A
)||A B
{}} 	
int~~ 
id~~ 
=~~ 
item~~ 
.~~ 
ItemId~~  
;~~  !
if
�� 
(
�� 
id
�� 
==
�� 
Android
�� 
.
�� 
Resource
�� &
.
��& '
Id
��' )
.
��) *
Home
��* .
)
��. /
{
�� 
Dismiss
�� 
(
�� 
)
�� 
;
�� 
return
�� 
true
�� 
;
�� 
}
�� 
return
�� 
base
�� 
.
�� #
OnOptionsItemSelected
�� -
(
��- .
item
��. 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
override
�� 
void
�� 
	OnDismiss
�� &
(
��& '
IDialogInterface
��' 7
dialog
��8 >
)
��> ?
{
�� 	
MainActivity
�� 
.
�� 
IsNavDisabled
�� &
=
��' (
false
��) .
;
��. /
base
�� 
.
�� 
	OnDismiss
�� 
(
�� 
dialog
�� !
)
��! "
;
��" #
}
�� 	
}
�� 
}�� �2
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Restaurant\RestaurantIndexAdapter.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class "
RestaurantIndexAdapter '
:( )
RecyclerView* 6
.6 7
Adapter7 >
{ 
public 
event 
EventHandler !
<! "
int" %
>% &
	ItemClick' 0
;0 1
public 
List 
< 
LibBookingService %
.% &
Dtos& *
.* +

Restaurant+ 5
>5 6
Restaurants7 B
;B C
public "
RestaurantIndexAdapter %
(% &
List& *
<* +
LibBookingService+ <
.< =
Dtos= A
.A B

RestaurantB L
>L M
restaurantsN Y
)Y Z
{ 	
Restaurants 
= 
restaurants %
;% &
} 	
public 
override 
int 
	ItemCount %
{ 	
get 
{ 
return 
Restaurants $
.$ %
Count% *
(* +
)+ ,
;, -
}. /
} 	
public   
override   
RecyclerView   $
.  $ %

ViewHolder  % /
OnCreateViewHolder  0 B
(  B C
	ViewGroup  C L
parent  M S
,  S T
int  U X
viewType  Y a
)  a b
{!! 	
View"" 
view"" 
="" 
LayoutInflater"" &
.""& '
From""' +
(""+ ,
parent"", 2
.""2 3
Context""3 :
)"": ;
.""; <
Inflate""< C
(""C D
Resource""D L
.""L M
Layout""M S
.""S T%
restaurant_index_recycler""T m
,""m n
parent""o u
,""u v
false""w |
)""| }
;""} ~ 
RestaurantViewHolder##  
vh##! #
=##$ %
new##& ) 
RestaurantViewHolder##* >
(##> ?
view##? C
,##C D
OnClick##E L
)##L M
;##M N
return$$ 
vh$$ 
;$$ 
}%% 	
public'' 
override'' 
void'' 
OnBindViewHolder'' -
(''- .
RecyclerView''. :
.'': ;

ViewHolder''; E
holder''F L
,''L M
int''N Q
position''R Z
)''Z [
{(( 	 
RestaurantViewHolder))  
vh))! #
=))$ %
holder))& ,
as))- / 
RestaurantViewHolder))0 D
;))D E
vh** 
.** 

Restaurant** 
=** 
Restaurants** '
[**' (
position**( 0
]**0 1
;**1 2
vh++ 
.++ 
Name++ 
.++ 
Text++ 
=++ 
vh++ 
.++ 

Restaurant++ (
.++( )
Name++) -
;++- .
vh,, 
.,, 
Address,, 
.,, 
Text,, 
=,, 
vh,,  
.,,  !

Restaurant,,! +
.,,+ ,
AddressStreet,,, 9
+,,: ;
$str,,< @
+,,A B
vh,,C E
.,,E F

Restaurant,,F P
.,,P Q
AddressTown,,Q \
+,,] ^
$str,,_ c
+,,d e
vh,,f h
.,,h i

Restaurant,,i s
.,,s t
AddressCounty	,,t �
+
,,� �
$str
,,� �
+
,,� �
vh
,,� �
.
,,� �

Restaurant
,,� �
.
,,� �
AddressPostalCode
,,� �
;
,,� �
}-- 	
private// 
void// 
OnClick// 
(// 
int//  
obj//! $
)//$ %
{00 	
	ItemClick11 
?11 
.11 
Invoke11 
(11 
this11 "
,11" #
obj11$ '
)11' (
;11( )
}22 	
}33 
public55 

class55  
RestaurantViewHolder55 %
:55& '
RecyclerView55( 4
.554 5

ViewHolder555 ?
{66 
public77 
LibBookingService77  
.77  !
Dtos77! %
.77% &

Restaurant77& 0

Restaurant771 ;
{77< =
get77> A
;77A B
set77C F
;77F G
}77H I
public88 
View88 
View88 
{88 
get88 
;88 
set88  #
;88# $
}88% &
public99 
TextView99 
Name99 
{99 
get99 "
;99" #
set99$ '
;99' (
}99) *
public:: 
TextView:: 
Address:: 
{::  !
get::" %
;::% &
set::' *
;::* +
}::, -
public<<  
RestaurantViewHolder<< #
(<<# $
View<<$ (
view<<) -
,<<- .
Action<</ 5
<<<5 6
int<<6 9
><<9 :
listener<<; C
)<<C D
:<<E F
base<<G K
(<<K L
view<<L P
)<<P Q
{== 	
View>> 
=>> 
view>> 
;>> 
Name?? 
=?? 
view?? 
.?? 
FindViewById?? $
<??$ %
TextView??% -
>??- .
(??. /
Resource??/ 7
.??7 8
Id??8 :
.??: ;*
restaurant_index_recycler_name??; Y
)??Y Z
;??Z [
Address@@ 
=@@ 
view@@ 
.@@ 
FindViewById@@ '
<@@' (
TextView@@( 0
>@@0 1
(@@1 2
Resource@@2 :
.@@: ;
Id@@; =
.@@= >-
!restaurant_index_recycler_address@@> _
)@@_ `
;@@` a
viewBB 
.BB 
ClickBB 
+=BB 
(BB 
senderBB !
,BB! "
eBB# $
)BB$ %
=>BB& (
listenerBB) 1
(BB1 2
baseBB2 6
.BB6 7
PositionBB7 ?
)BB? @
;BB@ A
}CC 	
}DD 
}EE �2
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Restaurant\RestaurantMenuItemDialogAdapter.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class +
RestaurantMenuItemDialogAdapter 0
:1 2
RecyclerView3 ?
.? @
Adapter@ G
{ 
private 
readonly 
ImageFacade $
_imageFacade% 1
=2 3
new4 7
ImageFacade8 C
(C D
)D E
;E F
public 
List 
< 
MenuItem 
> 
Items #
;# $
public +
RestaurantMenuItemDialogAdapter .
(. /
List/ 3
<3 4
MenuItem4 <
>< =
items> C
)C D
{ 	
Items 
= 
items 
; 
} 	
public 
override 
int 
	ItemCount %
{ 	
get 
{ 
return 
Items 
. 
Count $
($ %
)% &
;& '
}( )
}   	
public"" 
override"" 
RecyclerView"" $
.""$ %

ViewHolder""% /
OnCreateViewHolder""0 B
(""B C
	ViewGroup""C L
parent""M S
,""S T
int""U X
viewType""Y a
)""a b
{## 	
View$$ 
view$$ 
=$$ 
LayoutInflater$$ &
.$$& '
From$$' +
($$+ ,
parent$$, 2
.$$2 3
Context$$3 :
)$$: ;
.$$; <
Inflate$$< C
($$C D
Resource$$D L
.$$L M
Layout$$M S
.$$S T*
menu_index_view_items_recycler$$T r
,$$r s
parent$$t z
,$$z {
false	$$| �
)
$$� �
;
$$� �
return%% 
new%% 
MenuItemViewHolder%% )
(%%) *
view%%* .
)%%. /
;%%/ 0
}&& 	
public(( 
override(( 
void(( 
OnBindViewHolder(( -
(((- .
RecyclerView((. :
.((: ;

ViewHolder((; E
holder((F L
,((L M
int((N Q
position((R Z
)((Z [
{)) 	
MenuItemViewHolder** 
vh** !
=**" #
holder**$ *
as**+ -
MenuItemViewHolder**. @
;**@ A
vh++ 
.++ 
Item++ 
=++ 
Items++ 
[++ 
position++ $
]++$ %
;++% &
vh00 
.00 
Name00 
.00 
Text00 
=00 
vh00 
.00 
Item00 "
.00" #
Name00# '
;00' (
vh11 
.11 
Description11 
.11 
Text11 
=11  !
vh11" $
.11$ %
Item11% )
.11) *
Description11* 5
;115 6
vh22 
.22 
Price22 
.22 
Text22 
=22 
$str22 
+22  !
string22" (
.22( )
Format22) /
(22/ 0
$str220 8
,228 9
Math22: >
.22> ?
Round22? D
(22D E
vh22E G
.22G H
Item22H L
.22L M
Price22M R
,22R S
$num22T U
,22U V
MidpointRounding22W g
.22g h
AwayFromZero22h t
)22t u
)22u v
;22v w
}33 	
}44 
public66 

class66 
MenuItemViewHolder66 #
:66$ %
RecyclerView66& 2
.662 3

ViewHolder663 =
{77 
public88 
MenuItem88 
Item88 
{88 
get88 "
;88" #
set88$ '
;88' (
}88) *
public99 
View99 
View99 
{99 
get99 
;99 
set99  #
;99# $
}99% &
public:: 
	ImageView:: 
Img:: 
{:: 
get:: "
;::" #
set::$ '
;::' (
}::) *
public;; 
TextView;; 
Name;; 
{;; 
get;; "
;;;" #
set;;$ '
;;;' (
};;) *
public<< 
TextView<< 
Description<< #
{<<$ %
get<<& )
;<<) *
set<<+ .
;<<. /
}<<0 1
public== 
TextView== 
Price== 
{== 
get==  #
;==# $
set==% (
;==( )
}==* +
public?? 
MenuItemViewHolder?? !
(??! "
View??" &
view??' +
)??+ ,
:??- .
base??/ 3
(??3 4
view??4 8
)??8 9
{@@ 	
ViewAA 
=AA 
viewAA 
;AA 
ImgBB 
=BB 
viewBB 
.BB 
FindViewByIdBB #
<BB# $
	ImageViewBB$ -
>BB- .
(BB. /
ResourceBB/ 7
.BB7 8
IdBB8 :
.BB: ;#
menu_index_recycler_imgBB; R
)BBR S
;BBS T
NameCC 
=CC 
viewCC 
.CC 
FindViewByIdCC $
<CC$ %
TextViewCC% -
>CC- .
(CC. /
ResourceCC/ 7
.CC7 8
IdCC8 :
.CC: ;$
menu_index_recycler_nameCC; S
)CCS T
;CCT U
DescriptionDD 
=DD 
viewDD 
.DD 
FindViewByIdDD +
<DD+ ,
TextViewDD, 4
>DD4 5
(DD5 6
ResourceDD6 >
.DD> ?
IdDD? A
.DDA B+
menu_index_recycler_descriptionDDB a
)DDa b
;DDb c
PriceEE 
=EE 
viewEE 
.EE 
FindViewByIdEE %
<EE% &
TextViewEE& .
>EE. /
(EE/ 0
ResourceEE0 8
.EE8 9
IdEE9 ;
.EE; <%
menu_index_recycler_priceEE< U
)EEU V
;EEV W
}FF 	
}GG 
}HH �L
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Restaurant\RestaurantMenuItemDialogFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class ,
 RestaurantMenuItemDialogFragment 1
:2 3
DialogFragment4 B
{ 
private 
readonly 

MenuFacade #
_menuFacade$ /
=0 1
new2 5

MenuFacade6 @
(@ A
)A B
;B C
private 
readonly 
RestaurantFacade )
_restaurantFacade* ;
=< =
new> A
RestaurantFacadeB R
(R S
)S T
;T U
public 
static ,
 RestaurantMenuItemDialogFragment 6
NewInstance7 B
(B C
intC F
idG I
,I J
intK N
resIdO T
)T U
{ 	,
 RestaurantMenuItemDialogFragment ,
f- .
=/ 0
new1 4,
 RestaurantMenuItemDialogFragment5 U
(U V
)V W
;W X
Bundle 
args 
= 
new 
Bundle $
($ %
)% &
;& '
args 
. 
PutInt 
( 
$str 
, 
id  
)  !
;! "
args 
. 
PutInt 
( 
$str 
,  
resId! &
)& '
;' (
f 
. 
	Arguments 
= 
args 
; 
return 
f 
; 
} 	
public!! 
override!! 
Dialog!! 
OnCreateDialog!! -
(!!- .
Bundle!!. 4
savedInstanceState!!5 G
)!!G H
{"" 	
return## 
base## 
.## 
OnCreateDialog## &
(##& '
savedInstanceState##' 9
)##9 :
;##: ;
}$$ 	
public&& 
override&& 
void&& 
OnCreate&& %
(&&% &
Bundle&&& ,
savedInstanceState&&- ?
)&&? @
{'' 	
base(( 
.(( 
OnCreate(( 
((( 
savedInstanceState(( ,
)((, -
;((- .
SetStyle)) 
()) 
DialogFragmentStyle)) (
.))( )
Normal))) /
,))/ 0
Resource))1 9
.))9 :
Style)): ?
.))? @
Theme_MyTheme))@ M
)))M N
;))N O
}** 	
public,, 
override,, 
View,, 
OnCreateView,, )
(,,) *
LayoutInflater,,* 8
inflater,,9 A
,,,A B
	ViewGroup,,C L
	container,,M V
,,,V W
Bundle,,X ^
savedInstanceState,,_ q
),,q r
{-- 	
View.. 
view.. 
=.. 
inflater..  
...  !
Inflate..! (
(..( )
Resource..) 1
...1 2
Layout..2 8
...8 9!
menu_index_view_items..9 N
,..N O
null..P T
)..T U
;..U V
Toolbar00 
toolbar00 
=00 
view00 "
.00" #
FindViewById00# /
<00/ 0
Toolbar000 7
>007 8
(008 9
Resource009 A
.00A B
Id00B D
.00D E
toolbar_menu_items00E W
)00W X
;00X Y
toolbar11 
.11 
SetTitle11 
(11 
Resource11 %
.11% &
String11& ,
.11, -
menuItemDialogTitle11- @
)11@ A
;11A B
SetHasOptionsMenu33 
(33 
true33 "
)33" #
;33# $
(55 
(55 
AppCompatActivity55 
)55  
Activity55  (
)55( )
.55) *
SetSupportActionBar55* =
(55= >
toolbar55> E
)55E F
;55F G
Android77 
.77 
Support77 
.77 
V777 
.77 
App77 "
.77" #
	ActionBar77# ,
	actionBar77- 6
=777 8
(779 :
(77: ;
AppCompatActivity77; L
)77L M
Activity77M U
)77U V
.77V W
SupportActionBar77W g
;77g h
if88 
(88 
	actionBar88 
!=88 
null88 !
)88! "
{99 
	actionBar:: 
.:: %
SetDisplayHomeAsUpEnabled:: 3
(::3 4
true::4 8
)::8 9
;::9 :
	actionBar;; 
.;;  
SetHomeButtonEnabled;; .
(;;. /
true;;/ 3
);;3 4
;;;4 5
	actionBar<< 
.<<  
SetHomeAsUpIndicator<< .
(<<. /
Resource<</ 7
.<<7 8
Drawable<<8 @
.<<@ A
ic_clear_white<<A O
)<<O P
;<<P Q
}== 
int?? 
id?? 
=?? 
	Arguments?? 
.?? 
GetInt?? %
(??% &
$str??& *
)??* +
;??+ ,
int@@ 
resId@@ 
=@@ 
	Arguments@@ !
.@@! "
GetInt@@" (
(@@( )
$str@@) 0
)@@0 1
;@@1 2
ifBB 
(BB 
idBB 
>BB 
$numBB 
&&BB 
resIdBB 
>BB  !
$numBB" #
)BB# $
{CC 
LibBookingServiceDD !
.DD! "
DtosDD" &
.DD& '

RestaurantDD' 1

restaurantDD2 <
=DD= >
_restaurantFacadeDD? P
.DDP Q
FindByIdDDQ Y
(DDY Z
resIdDDZ _
)DD_ `
.DD` a
ResultDDa g
;DDg h
RecyclerViewWW 
recyclerViewWW )
=WW* +
viewWW, 0
.WW0 1
FindViewByIdWW1 =
<WW= >
RecyclerViewWW> J
>WWJ K
(WWK L
ResourceWWL T
.WWT U
IdWWU W
.WWW X&
menu_index_view_item_typesWWX r
)WWr s
;WWs t
recyclerViewXX 
.XX 
SetLayoutManagerXX -
(XX- .
newXX. 1
LinearLayoutManagerXX2 E
(XXE F
ActivityXXF N
)XXN O
)XXO P
;XXP Q
ListZZ 
<ZZ 
MenuItemZZ 
>ZZ 
	menuItemsZZ (
=ZZ) *

restaurantZZ+ 5
.ZZ5 6
	MenuItemsZZ6 ?
.ZZ? @
ToListZZ@ F
(ZZF G
)ZZG H
;ZZH I
	menuItems[[ 
=[[ 
	menuItems[[ %
.[[% &
Where[[& +
([[+ ,
m[[, -
=>[[. 0
m[[1 2
.[[2 3
Types[[3 8
.[[8 9
Where[[9 >
([[> ?
t[[? @
=>[[A C
t[[D E
.[[E F
Id[[F H
==[[I K
id[[L N
)[[N O
.[[O P
Any[[P S
([[S T
)[[T U
)[[U V
.[[V W
ToList[[W ]
([[] ^
)[[^ _
;[[_ `+
RestaurantMenuItemDialogAdapter]] /
adapter]]0 7
=]]8 9
new]]: =+
RestaurantMenuItemDialogAdapter]]> ]
(]]] ^
	menuItems]]^ g
)]]g h
;]]h i
recyclerView^^ 
.^^ 

SetAdapter^^ '
(^^' (
adapter^^( /
)^^/ 0
;^^0 1
}__ 
returnaa 
viewaa 
;aa 
}bb 	
publicdd 
overridedd 
voiddd 
OnCreateOptionsMenudd 0
(dd0 1
IMenudd1 6
menudd7 ;
,dd; <
MenuInflaterdd= I
inflaterddJ R
)ddR S
{ee 	
menuff 
.ff 
Clearff 
(ff 
)ff 
;ff 
Activitygg 
.gg 
MenuInflatergg !
.gg! "
Inflategg" )
(gg) *
Resourcegg* 2
.gg2 3
Menugg3 7
.gg7 8&
default_no_toolbar_optionsgg8 R
,ggR S
menuggT X
)ggX Y
;ggY Z
}hh 	
publicjj 
overridejj 
booljj !
OnOptionsItemSelectedjj 2
(jj2 3
	IMenuItemjj3 <
itemjj= A
)jjA B
{kk 	
intll 
idll 
=ll 
itemll 
.ll 
ItemIdll  
;ll  !
ifnn 
(nn 
idnn 
==nn 
Androidnn 
.nn 
Resourcenn &
.nn& '
Idnn' )
.nn) *
Homenn* .
)nn. /
{oo 
Dismisspp 
(pp 
)pp 
;pp 
returnqq 
trueqq 
;qq 
}rr 
returntt 
basett 
.tt !
OnOptionsItemSelectedtt -
(tt- .
itemtt. 2
)tt2 3
;tt3 4
}uu 	
publicww 
overrideww 
voidww 
	OnDismissww &
(ww& '
IDialogInterfaceww' 7
dialogww8 >
)ww> ?
{xx 	"
RestaurantViewFragmentyy "
.yy" #
IsActiveyy# +
=yy, -
trueyy. 2
;yy2 3
basezz 
.zz 
	OnDismisszz 
(zz 
dialogzz !
)zz! "
;zz" #
}{{ 	
}|| 
}}} ǘ
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Restaurant\RestaurantViewFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class "
RestaurantViewFragment '
:( )
Fragment* 2
{ 
private 
readonly 
RestaurantFacade )
_restaurantFacade* ;
=< =
new> A
RestaurantFacadeB R
(R S
)S T
;T U
private 
readonly 
MenuItemTypeFacade +
_menuItemTypeFacade, ?
=@ A
newB E
MenuItemTypeFacadeF X
(X Y
)Y Z
;Z [
private 
readonly 
ImageFacade $
_imageFacade% 1
=2 3
new4 7
ImageFacade8 C
(C D
)D E
;E F
private 
View 
view 
; 
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
private 
LibBookingService !
.! "
Dtos" &
.& '

Restaurant' 1

restaurant2 <
;< =
private 
List 
< 
MenuItemType !
>! "
types# (
=) *
new+ .
List/ 3
<3 4
MenuItemType4 @
>@ A
(A B
)B C
;C D
public!! 
static!! 
bool!! 
IsActive!! #
=!!$ %
true!!& *
;!!* +
public## 
static## "
RestaurantViewFragment## ,
NewInstance##- 8
(##8 9
int##9 <
id##= ?
)##? @
{$$ 	
var%% 
f%% 
=%% 
new%% "
RestaurantViewFragment%% .
{%%/ 0
	Arguments%%1 :
=%%; <
new%%= @
Bundle%%A G
(%%G H
)%%H I
}%%J K
;%%K L
Bundle&& 
args&& 
=&& 
new&& 
Bundle&& $
(&&$ %
)&&% &
;&&& '
args'' 
.'' 
PutInt'' 
('' 
$str'' 
,'' 
id''  
)''  !
;''! "
f(( 
.(( 
	Arguments(( 
=(( 
args(( 
;(( 
return)) 
f)) 
;)) 
}** 	
public,, 
override,, 
void,, 
OnCreate,, %
(,,% &
Bundle,,& ,
savedInstanceState,,- ?
),,? @
{-- 	
base.. 
... 
OnCreate.. 
(.. 
savedInstanceState.. ,
).., -
;..- .
}11 	
public33 
override33 
View33 
OnCreateView33 )
(33) *
LayoutInflater33* 8
inflater339 A
,33A B
	ViewGroup33C L
	container33M V
,33V W
Bundle33X ^
savedInstanceState33_ q
)33q r
{44 	
(55 
(55 
MainActivity55 
)55 
Activity55 #
)55# $
.55$ %"
SetAsNavigationToolbar55% ;
(55; <
)55< =
;55= >
SetHasOptionsMenu66 
(66 
true66 "
)66" #
;66# $
var77 
ignored77 
=77 
base77 
.77 
OnCreateView77 +
(77+ ,
inflater77, 4
,774 5
	container776 ?
,77? @
savedInstanceState77A S
)77S T
;77T U
view88 
=88 
inflater88 
.88 
Inflate88 #
(88# $
Resource88$ ,
.88, -
Layout88- 3
.883 4
restaurant_view884 C
,88C D
null88E I
)88I J
;88J K
swipeRefresh99 
=99 
view99 
.99  
FindViewById99  ,
<99, -
SwipeRefreshLayout99- ?
>99? @
(99@ A
Resource99A I
.99I J
Id99J L
.99L M!
restaurant_view_swipe99M b
)99b c
;99c d
swipeRefresh;; 
.;; 
Refresh;;  
+=;;! #
delegate;;$ ,
{<< 
backgroundWorker==  
.==  !
RunWorkerAsync==! /
(==/ 0
)==0 1
;==1 2
}>> 
;>> 
swipeRefresh@@ 
.@@ 

Refreshing@@ #
=@@$ %
true@@& *
;@@* +
backgroundWorkerBB 
=BB 
newBB "
BackgroundWorkerBB# 3
(BB3 4
)BB4 5
;BB5 6
backgroundWorkerCC 
.CC 
DoWorkCC #
+=CC$ &
Bworker_DoWorkCC' 5
;CC5 6
backgroundWorkerDD 
.DD 
RunWorkerCompletedDD /
+=DD0 2&
Bworker_RunWorkerCompletedDD3 M
;DDM N
backgroundWorkerEE 
.EE 
RunWorkerAsyncEE +
(EE+ ,
)EE, -
;EE- .
returnGG 
viewGG 
;GG 
}HH 	
privateJJ 
voidJJ 
SetupJJ 
(JJ 
)JJ 
{KK 	
ifLL 
(LL 

restaurantLL 
!=LL 
nullLL "
)LL" #
{MM 
LinearLayoutNN 
imageLayoutNN (
=NN) *
viewNN+ /
.NN/ 0
FindViewByIdNN0 <
<NN< =
LinearLayoutNN= I
>NNI J
(NNJ K
ResourceNNK S
.NNS T
IdNNT V
.NNV W"
restaurant_view_imagesNNW m
)NNm n
;NNn o
ifPP 
(PP 

restaurantPP 
.PP 
ImageIdsPP '
.PP' (
AnyPP( +
(PP+ ,
)PP, -
)PP- .
{QQ 
foreachRR 
(RR 
intRR  
imageIdRR! (
inRR) +

restaurantRR, 6
.RR6 7
ImageIdsRR7 ?
)RR? @
{SS 
ViewTT 
imgViewTT $
=TT% &
LayoutInflaterTT' 5
.TT5 6
FromTT6 :
(TT: ;
ActivityTT; C
)TTC D
.TTD E
InflateTTE L
(TTL M
ResourceTTM U
.TTU V
LayoutTTV \
.TT\ ]!
restaurant_view_imageTT] r
,TTr s
nullTTt x
)TTx y
;TTy z
	ImageViewUU !
imgUU" %
=UU& '
imgViewUU( /
.UU/ 0
FindViewByIdUU0 <
<UU< =
	ImageViewUU= F
>UUF G
(UUG H
ResourceUUH P
.UUP Q
IdUUQ S
.UUS T
restaurant_view_imgUUT g
)UUg h
;UUh i
ImageVV 
dbImgVV #
=VV$ %
_imageFacadeVV& 2
.VV2 3
	LoadImageVV3 <
(VV< =
imageIdVV= D
)VVD E
.VVE F
ResultVVF L
;VVL M
ifXX 
(XX 
dbImgXX !
==XX" $
nullXX% )
)XX) *
{YY 
imgZZ 
.ZZ  
SetImageResourceZZ  0
(ZZ0 1
ResourceZZ1 9
.ZZ9 :
DrawableZZ: B
.ZZB C
nophotoZZC J
)ZZJ K
;ZZK L
}[[ 
else\\ 
{]] 
img^^ 
.^^  
SetImageBitmap^^  .
(^^. /
BitmapFactory^^/ <
.^^< =
DecodeByteArray^^= L
(^^L M
dbImg^^M R
.^^R S
FileContent^^S ^
,^^^ _
$num^^` a
,^^a b
dbImg^^c h
.^^h i
FileContent^^i t
.^^t u
Length^^u {
)^^{ |
)^^| }
;^^} ~
}__ 
imageLayoutaa #
.aa# $
AddViewaa$ +
(aa+ ,
imgaa, /
)aa/ 0
;aa0 1
Viewbb 
dividerbb $
=bb% &
LayoutInflaterbb' 5
.bb5 6
Frombb6 :
(bb: ;
Activitybb; C
)bbC D
.bbD E
InflatebbE L
(bbL M
ResourcebbM U
.bbU V
LayoutbbV \
.bb\ ]!
vertical_divider_fullbb] r
,bbr s
nullbbt x
)bbx y
;bby z
imageLayoutcc #
.cc# $
AddViewcc$ +
(cc+ ,
dividercc, 3
)cc3 4
;cc4 5
}dd 
}ee 
elseff 
{gg 
Viewhh 
imgViewhh  
=hh! "
LayoutInflaterhh# 1
.hh1 2
Fromhh2 6
(hh6 7
Activityhh7 ?
)hh? @
.hh@ A
InflatehhA H
(hhH I
ResourcehhI Q
.hhQ R
LayouthhR X
.hhX Y!
restaurant_view_imagehhY n
,hhn o
nullhhp t
)hht u
;hhu v
	ImageViewii 
imgii !
=ii" #
imgViewii$ +
.ii+ ,
FindViewByIdii, 8
<ii8 9
	ImageViewii9 B
>iiB C
(iiC D
ResourceiiD L
.iiL M
IdiiM O
.iiO P
restaurant_view_imgiiP c
)iic d
;iid e
imgjj 
.jj 
SetImageResourcejj (
(jj( )
Resourcejj) 1
.jj1 2
Drawablejj2 :
.jj: ;
nophotojj; B
)jjB C
;jjC D
imageLayoutll 
.ll  
AddViewll  '
(ll' (
imgll( +
)ll+ ,
;ll, -
}mm 
viewoo 
.oo 
FindViewByIdoo !
<oo! "
TextViewoo" *
>oo* +
(oo+ ,
Resourceoo, 4
.oo4 5
Idoo5 7
.oo7 8 
restaurant_view_nameoo8 L
)ooL M
.ooM N
TextooN R
=ooS T

restaurantooU _
.oo_ `
Nameoo` d
;ood e
viewpp 
.pp 
FindViewByIdpp !
<pp! "
TextViewpp" *
>pp* +
(pp+ ,
Resourcepp, 4
.pp4 5
Idpp5 7
.pp7 8!
restaurant_view_phonepp8 M
)ppM N
.ppN O
TextppO S
=ppT U

restaurantppV `
.pp` a
PhoneNoppa h
;pph i
viewqq 
.qq 
FindViewByIdqq !
<qq! "
TextViewqq" *
>qq* +
(qq+ ,
Resourceqq, 4
.qq4 5
Idqq5 7
.qq7 8#
restaurant_view_addressqq8 O
)qqO P
.qqP Q
TextqqQ U
=qqV W

restaurantqqX b
.qqb c
AddressStreetqqc p
+qqq r
$strqqs w
+qqx y

restaurant	qqz �
.
qq� �
AddressTown
qq� �
+
qq� �
$str
qq� �
+
qq� �

restaurant
qq� �
.
qq� �
AddressCounty
qq� �
+
qq� �
$str
qq� �
+
qq� �

restaurant
qq� �
.
qq� �
AddressPostalCode
qq� �
;
qq� �
LinearLayoutss 
	containerss &
=ss' (
viewss) -
.ss- .
FindViewByIdss. :
<ss: ;
LinearLayoutss; G
>ssG H
(ssH I
ResourcessI Q
.ssQ R
IdssR T
.ssT U*
restaurant_view_menu_containerssU s
)sss t
;sst u
foreachuu 
(uu 
varuu 
catuu  
inuu! #
typesuu$ )
)uu) *
{vv 
Viewww 
viewCatww  
=ww! "
LayoutInflaterww# 1
.ww1 2
Fromww2 6
(ww6 7
Activityww7 ?
)ww? @
.ww@ A
InflatewwA H
(wwH I
ResourcewwI Q
.wwQ R
LayoutwwR X
.wwX Y 
restaurant_view_menuwwY m
,wwm n
nullwwo s
)wws t
;wwt u
LinearLayoutxx  
.xx  !
LayoutParamsxx! -
layoutxx. 4
=xx5 6
newxx7 :
LinearLayoutxx; G
.xxG H
LayoutParamsxxH T
(xxT U
LinearLayoutxxU a
.xxa b
LayoutParamsxxb n
.xxn o
MatchParentxxo z
,xxz {
LinearLayout	xx| �
.
xx� �
LayoutParams
xx� �
.
xx� �
WrapContent
xx� �
)
xx� �
{yy 
	TopMarginzz !
=zz" #
$numzz$ &
}{{ 
;{{ 
viewCat|| 
.|| 
LayoutParameters|| ,
=||- .
layout||/ 5
;||5 6
viewCat}} 
.}} 
FindViewById}} (
<}}( )
TextView}}) 1
>}}1 2
(}}2 3
Resource}}3 ;
.}}; <
Id}}< >
.}}> ?%
restaurant_view_menu_type}}? X
)}}X Y
.}}Y Z
Text}}Z ^
=}}_ `
cat}}a d
.}}d e
Name}}e i
;}}i j
	container 
. 
AddView %
(% &
viewCat& -
)- .
;. /
viewCat
�� 
.
�� 
Click
�� !
+=
��" $
delegate
��% -
{
�� 
MainActivity
�� $
.
��$ %
IsNavDisabled
��% 2
=
��3 4
true
��5 9
;
��9 :
IsActive
��  
=
��! "
false
��# (
;
��( )
Android
�� 
.
��  
App
��  #
.
��# $
DialogFragment
��$ 2
dialog
��3 9
=
��: ;.
 RestaurantMenuItemDialogFragment
��< \
.
��\ ]
NewInstance
��] h
(
��h i
cat
��i l
.
��l m
Id
��m o
,
��o p

restaurant
��q {
.
��{ |
Id
��| ~
)
��~ 
;�� �
dialog
�� 
.
�� 
Show
�� #
(
��# $
FragmentManager
��$ 3
,
��3 4
$str
��5 E
)
��E F
;
��F G
}
�� 
;
�� 
}
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
	GetValues
�� $
(
��$ %
)
��% &
{
�� 	
int
�� 
id
�� 
=
�� 
	Arguments
�� 
.
�� 
GetInt
�� %
(
��% &
$str
��& *
)
��* +
;
��+ ,
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 

restaurant
�� 
=
�� 
await
�� "
_restaurantFacade
��# 4
.
��4 5
FindById
��5 =
(
��= >
id
��> @
)
��@ A
;
��A B
types
�� 
=
�� 
await
�� !
_menuItemTypeFacade
�� 1
.
��1 2
Get
��2 5
(
��5 6
)
��6 7
;
��7 8
}
�� 
}
�� 	
private
�� 
void
�� (
Bworker_RunWorkerCompleted
�� /
(
��/ 0
object
��0 6
sender
��7 =
,
��= >)
RunWorkerCompletedEventArgs
��? Z
e
��[ \
)
��\ ]
{
�� 	
Setup
�� 
(
�� 
)
�� 
;
�� 
swipeRefresh
�� 
.
�� 

Refreshing
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 	
private
�� 
async
�� 
void
�� 
Bworker_DoWork
�� )
(
��) *
object
��* 0
sender
��1 7
,
��7 8
DoWorkEventArgs
��9 H
e
��I J
)
��J K
{
�� 	
await
�� 
	GetValues
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
override
�� 
void
�� !
OnCreateOptionsMenu
�� 0
(
��0 1
IMenu
��1 6
menu
��7 ;
,
��; <
MenuInflater
��= I
inflater
��J R
)
��R S
{
�� 	
inflater
�� 
.
�� 
Inflate
�� 
(
�� 
Resource
�� %
.
��% &
Menu
��& *
.
��* +%
restaurant_view_options
��+ B
,
��B C
menu
��D H
)
��H I
;
��I J
}
�� 	
public
�� 
override
�� 
bool
�� #
OnOptionsItemSelected
�� 2
(
��2 3
	IMenuItem
��3 <
item
��= A
)
��A B
{
�� 	
if
�� 
(
�� 
IsActive
�� 
)
�� 
{
�� 
int
�� 
id
�� 
=
�� 
item
�� 
.
�� 
ItemId
�� $
;
��$ %
if
�� 
(
�� 
id
�� 
==
�� 
Android
�� !
.
��! "
Resource
��" *
.
��* +
Id
��+ -
.
��- .
Home
��. 2
)
��2 3
{
�� 
MainActivity
��  
.
��  !
IsNavDisabled
��! .
=
��/ 0
false
��1 6
;
��6 7
Activity
�� 
.
�� 
OnBackPressed
�� *
(
��* +
)
��+ ,
;
��, -
return
�� 
true
�� 
;
��  
}
�� 
else
�� 
if
�� 
(
�� 
id
�� 
==
�� 
Resource
�� '
.
��' (
Id
��( *
.
��* +

book_table
��+ 5
)
��5 6
{
�� 
if
�� 
(
�� 
GenericFacade
�� %
.
��% &
UserName
��& .
!=
��/ 1
null
��2 6
&&
��7 9
GenericFacade
��: G
.
��G H
UserName
��H P
!=
��Q S
$str
��T V
)
��V W
{
�� 
MainActivity
�� $
.
��$ %
IsNavDisabled
��% 2
=
��3 4
true
��5 9
;
��9 :
IsActive
��  
=
��! "
false
��# (
;
��( )
Android
�� 
.
��  
App
��  #
.
��# $
DialogFragment
��$ 2
dialog
��3 9
=
��: ;&
BookingNewDialogFragment
��< T
.
��T U
NewInstance
��U `
(
��` a

restaurant
��a k
.
��k l
Id
��l n
)
��n o
;
��o p
dialog
�� 
.
�� 
Show
�� #
(
��# $
FragmentManager
��$ 3
,
��3 4
$str
��5 E
)
��E F
;
��F G
}
�� 
else
�� 
{
�� 
Toast
�� 
.
�� 
MakeText
�� &
(
��& '
Activity
��' /
,
��/ 0
$str
��1 V
,
��V W
ToastLength
��X c
.
��c d
Long
��d h
)
��h i
.
��i j
Show
��j n
(
��n o
)
��o p
;
��p q
}
�� 
}
�� 
}
�� 
return
�� 
base
�� 
.
�� #
OnOptionsItemSelected
�� -
(
��- .
item
��. 2
)
��2 3
;
��3 4
}
�� 	
}
�� 
}�� �F
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\User\UserDetailsFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
User( ,
{ 
public 

class 
UserDetailsFragment $
:% &
Fragment' /
{ 
private 
View 
view 
; 
private 
readonly 
CustomerFacade '
_customerFacade( 7
=8 9
new: =
CustomerFacade> L
(L M
)M N
;N O
private 
Customer 
customer !
;! "
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
public 
override 
void 
OnCreate %
(% &
Bundle& ,
savedInstanceState- ?
)? @
{ 	
base 
. 
OnCreate 
( 
savedInstanceState ,
), -
;- .
} 	
public 
static 
UserDetailsFragment )
NewInstance* 5
(5 6
)6 7
{   	
var!! 
frag1!! 
=!! 
new!! 
UserDetailsFragment!! /
{!!0 1
	Arguments!!2 ;
=!!< =
new!!> A
Bundle!!B H
(!!H I
)!!I J
}!!K L
;!!L M
return"" 
frag1"" 
;"" 
}## 	
public%% 
override%% 
View%% 
OnCreateView%% )
(%%) *
LayoutInflater%%* 8
inflater%%9 A
,%%A B
	ViewGroup%%C L
	container%%M V
,%%V W
Bundle%%X ^
savedInstanceState%%_ q
)%%q r
{&& 	
('' 
('' 
MainActivity'' 
)'' 
Activity'' #
)''# $
.''$ %
SetAsDrawerToolbar''% 7
(''7 8
)''8 9
;''9 :
var(( 
ignored(( 
=(( 
base(( 
.(( 
OnCreateView(( +
(((+ ,
inflater((, 4
,((4 5
	container((6 ?
,((? @
savedInstanceState((A S
)((S T
;((T U
view)) 
=)) 
inflater)) 
.)) 
Inflate)) #
())# $
Resource))$ ,
.)), -
Layout))- 3
.))3 4
user_details))4 @
,))@ A
null))B F
)))F G
;))G H
swipeRefresh++ 
=++ 
view++ 
.++  
FindViewById++  ,
<++, -
SwipeRefreshLayout++- ?
>++? @
(++@ A
Resource++A I
.++I J
Id++J L
.++L M
user_details_swipe++M _
)++_ `
;++` a
swipeRefresh-- 
.-- 
Refresh--  
+=--! #
delegate--$ ,
{.. 
backgroundWorker//  
.//  !
RunWorkerAsync//! /
(/// 0
)//0 1
;//1 2
}00 
;00 
swipeRefresh22 
.22 

Refreshing22 #
=22$ %
true22& *
;22* +
backgroundWorker44 
=44 
new44 "
BackgroundWorker44# 3
(443 4
)444 5
;445 6
backgroundWorker55 
.55 
DoWork55 #
+=55$ &
Bworker_DoWork55' 5
;555 6
backgroundWorker66 
.66 
RunWorkerCompleted66 /
+=660 2&
Bworker_RunWorkerCompleted663 M
;66M N
backgroundWorker77 
.77 
RunWorkerAsync77 +
(77+ ,
)77, -
;77- .
return99 
view99 
;99 
}:: 	
private<< 
void<< 
Setup<< 
(<< 
)<< 
{== 	
if>> 
(>> 
customer>> 
!=>> 
null>>  
)>>  !
{?? 
view@@ 
.@@ 
FindViewById@@ !
<@@! "
TextView@@" *
>@@* +
(@@+ ,
Resource@@, 4
.@@4 5
Id@@5 7
.@@7 8!
user_details_username@@8 M
)@@M N
.@@N O
Text@@O S
=@@T U
customer@@V ^
.@@^ _
UserName@@_ g
;@@g h
viewAA 
.AA 
FindViewByIdAA !
<AA! "
TextViewAA" *
>AA* +
(AA+ ,
ResourceAA, 4
.AA4 5
IdAA5 7
.AA7 8
user_details_nameAA8 I
)AAI J
.AAJ K
TextAAK O
=AAP Q
customerAAR Z
.AAZ [
ForenameAA[ c
+AAd e
$strAAf i
+AAj k
customerAAl t
.AAt u
SurnameAAu |
;AA| }
viewBB 
.BB 
FindViewByIdBB !
<BB! "
TextViewBB" *
>BB* +
(BB+ ,
ResourceBB, 4
.BB4 5
IdBB5 7
.BB7 8
user_details_dobBB8 H
)BBH I
.BBI J
TextBBJ N
=BBO P
customerBBQ Y
.BBY Z
DoBBBZ ]
.BB] ^
ToShortDateStringBB^ o
(BBo p
)BBp q
;BBq r
viewCC 
.CC 
FindViewByIdCC !
<CC! "
TextViewCC" *
>CC* +
(CC+ ,
ResourceCC, 4
.CC4 5
IdCC5 7
.CC7 8 
user_details_addressCC8 L
)CCL M
.CCM N
TextCCN R
=CCS T
customerCCU ]
.CC] ^
AddressStreetCC^ k
+CCl m
$strCCn r
+CCs t
customerCCu }
.CC} ~
AddressTown	CC~ �
+
CC� �
$str
CC� �
+
CC� �
customer
CC� �
.
CC� �
AddressCounty
CC� �
+
CC� �
$str
CC� �
+
CC� �
customer
CC� �
.
CC� �
AddressPostalCode
CC� �
;
CC� �
viewDD 
.DD 
FindViewByIdDD !
<DD! "
TextViewDD" *
>DD* +
(DD+ ,
ResourceDD, 4
.DD4 5
IdDD5 7
.DD7 8&
user_details_home_phone_noDD8 R
)DDR S
.DDS T
TextDDT X
=DDY Z
customerDD[ c
.DDc d
HomePhoneNoDDd o
;DDo p
viewEE 
.EE 
FindViewByIdEE !
<EE! "
TextViewEE" *
>EE* +
(EE+ ,
ResourceEE, 4
.EE4 5
IdEE5 7
.EE7 8&
user_details_work_phone_noEE8 R
)EER S
.EES T
TextEET X
=EEY Z
customerEE[ c
.EEc d
WorkPhoneNoEEd o
;EEo p
viewFF 
.FF 
FindViewByIdFF !
<FF! "
TextViewFF" *
>FF* +
(FF+ ,
ResourceFF, 4
.FF4 5
IdFF5 7
.FF7 8(
user_details_mobile_phone_noFF8 T
)FFT U
.FFU V
TextFFV Z
=FF[ \
customerFF] e
.FFe f
MobilePhoneNoFFf s
;FFs t
viewGG 
.GG 
FindViewByIdGG !
<GG! "
TextViewGG" *
>GG* +
(GG+ ,
ResourceGG, 4
.GG4 5
IdGG5 7
.GG7 8
user_details_emailGG8 J
)GGJ K
.GGK L
TextGGL P
=GGQ R
customerGGS [
.GG[ \
EmailGG\ a
;GGa b
}HH 
}II 	
privateKK 
asyncKK 
TaskKK 
	GetValuesKK $
(KK$ %
)KK% &
{LL 	
intMM 
idMM 
=MM 
GenericFacadeMM "
.MM" #
UserIdMM# )
;MM) *
CustomerOO 
cOO 
=OO 
awaitOO 
_customerFacadeOO .
.OO. /
GetOO/ 2
(OO2 3
)OO3 4
;OO4 5
}PP 	
privateRR 
voidRR &
Bworker_RunWorkerCompletedRR /
(RR/ 0
objectRR0 6
senderRR7 =
,RR= >'
RunWorkerCompletedEventArgsRR? Z
eRR[ \
)RR\ ]
{SS 	
SetupTT 
(TT 
)TT 
;TT 
swipeRefreshUU 
.UU 

RefreshingUU #
=UU$ %
falseUU& +
;UU+ ,
}VV 	
privateXX 
asyncXX 
voidXX 
Bworker_DoWorkXX )
(XX) *
objectXX* 0
senderXX1 7
,XX7 8
DoWorkEventArgsXX9 H
eXXI J
)XXJ K
{YY 	
awaitZZ 
	GetValuesZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 	
}\\ 
}]] ��
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\User\RegisterFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
User( ,
{ 
public 

class 
RegisterFragment !
:" #
Fragment$ ,
{ 
private 
readonly 

AuthFacade #
_authFacade$ /
=0 1
new2 5

AuthFacade6 @
(@ A
)A B
;B C
private 
readonly 
CustomerFacade '
_customerFacade( 7
=8 9
new: =
CustomerFacade> L
(L M
)M N
;N O
private 
View 
view 
; 
private 
Customer 
customer !
;! "
public 
override 
void 
OnCreate %
(% &
Bundle& ,
savedInstanceState- ?
)? @
{ 	
base 
. 
OnCreate 
( 
savedInstanceState ,
), -
;- .
} 	
public 
static 
RegisterFragment &
NewInstance' 2
(2 3
)3 4
{ 	
var 
frag1 
= 
new 
RegisterFragment ,
{- .
	Arguments/ 8
=9 :
new; >
Bundle? E
(E F
)F G
}H I
;I J
return   
frag1   
;   
}!! 	
public$$ 
override$$ 
View$$ 
OnCreateView$$ )
($$) *
LayoutInflater$$* 8
inflater$$9 A
,$$A B
	ViewGroup$$C L
	container$$M V
,$$V W
Bundle$$X ^
savedInstanceState$$_ q
)$$q r
{%% 	
(&& 
(&& 
MainActivity&& 
)&& 
Activity&& #
)&&# $
.&&$ %
SetAsDrawerToolbar&&% 7
(&&7 8
)&&8 9
;&&9 :
var'' 
ignored'' 
='' 
base'' 
.'' 
OnCreateView'' +
(''+ ,
inflater'', 4
,''4 5
	container''6 ?
,''? @
savedInstanceState''A S
)''S T
;''T U
view(( 
=(( 
inflater(( 
.(( 
Inflate(( #
(((# $
Resource(($ ,
.((, -
Layout((- 3
.((3 4
register((4 <
,((< =
null((> B
)((B C
;((C D
customer)) 
=)) 
new)) 
Customer)) #
())# $
)))$ %
;))% &
List++ 
<++ 
string++ 
>++ 
titles++ 
=++  !
new++" %
List++& *
<++* +
string+++ 1
>++1 2
{,, 
$str-- '
}.. 
;.. 
titles// 
.// 
AddRange// 
(// 
Enum//  
.//  !
GetNames//! )
(//) *
typeof//* 0
(//0 1
Title//1 6
)//6 7
)//7 8
.//8 9
ToList//9 ?
(//? @
)//@ A
)//A B
;//B C
Spinner00 
titleSpinner00  
=00! "
view00# '
.00' (
FindViewById00( 4
<004 5
Spinner005 <
>00< =
(00= >
Resource00> F
.00F G
Id00G I
.00I J
register_title00J X
)00X Y
;00Y Z
var22 
adapter22 
=22 
new22 
ArrayAdapter22 *
<22* +
string22+ 1
>221 2
(222 3
Activity223 ;
,22; <
Android22= D
.22D E
Resource22E M
.22M N
Layout22N T
.22T U%
SimpleSpinnerDropDownItem22U n
,22n o
titles22p v
)22v w
;22w x
adapter33 
.33 #
SetDropDownViewResource33 +
(33+ ,
Android33, 3
.333 4
Resource334 <
.33< =
Layout33= C
.33C D%
SimpleSpinnerDropDownItem33D ]
)33] ^
;33^ _
titleSpinner44 
.44 
Adapter44  
=44! "
adapter44# *
;44* +
int66 "
initialSpinnerPosition66 &
=66' (
titleSpinner66) 5
.665 6 
SelectedItemPosition666 J
;66J K
titleSpinner77 
.77 
ItemSelected77 %
+=77& (
(77) *
sender77* 0
,770 1
args772 6
)776 7
=>778 :
{88 
if99 
(99 
args99 
.99 
Position99 !
!=99" $"
initialSpinnerPosition99% ;
)99; <
{:: 
customer;; 
.;; 
Title;; "
=;;# $
titles;;% +
[;;+ ,
args;;, 0
.;;0 1
Position;;1 9
];;9 :
;;;: ;
}<< 
}== 
;== 
Button?? 
register?? 
=?? 
view?? "
.??" #
FindViewById??# /
<??/ 0
Button??0 6
>??6 7
(??7 8
Resource??8 @
.??@ A
Id??A C
.??C D
register_btn??D P
)??P Q
;??Q R
register@@ 
.@@ 
Click@@ 
+=@@ 
delegate@@ &
{AA 
stringBB 
passwordBB 
=BB  !
viewBB" &
.BB& '
FindViewByIdBB' 3
<BB3 4
TextViewBB4 <
>BB< =
(BB= >
ResourceBB> F
.BBF G
IdBBG I
.BBI J
register_passwordBBJ [
)BB[ \
.BB\ ]
TextBB] a
;BBa b
stringCC 
confirmPasswordCC &
=CC' (
viewCC) -
.CC- .
FindViewByIdCC. :
<CC: ;
TextViewCC; C
>CCC D
(CCD E
ResourceCCE M
.CCM N
IdCCN P
.CCP Q%
register_password_confirmCCQ j
)CCj k
.CCk l
TextCCl p
;CCp q
customerEE 
.EE 
UserNameEE !
=EE" #
viewEE$ (
.EE( )
FindViewByIdEE) 5
<EE5 6
TextViewEE6 >
>EE> ?
(EE? @
ResourceEE@ H
.EEH I
IdEEI K
.EEK L
register_usernameEEL ]
)EE] ^
.EE^ _
TextEE_ c
;EEc d
customerFF 
.FF 
ForenameFF !
=FF" #
viewFF$ (
.FF( )
FindViewByIdFF) 5
<FF5 6
TextViewFF6 >
>FF> ?
(FF? @
ResourceFF@ H
.FFH I
IdFFI K
.FFK L
register_forenameFFL ]
)FF] ^
.FF^ _
TextFF_ c
;FFc d
customerGG 
.GG 
SurnameGG  
=GG! "
viewGG# '
.GG' (
FindViewByIdGG( 4
<GG4 5
TextViewGG5 =
>GG= >
(GG> ?
ResourceGG? G
.GGG H
IdGGH J
.GGJ K
register_surnameGGK [
)GG[ \
.GG\ ]
TextGG] a
;GGa b
customerHH 
.HH 
DoBHH 
=HH 
viewHH #
.HH# $
FindViewByIdHH$ 0
<HH0 1

DatePickerHH1 ;
>HH; <
(HH< =
ResourceHH= E
.HHE F
IdHHF H
.HHH I
register_dobHHI U
)HHU V
.HHV W
DateTimeHHW _
;HH_ `
customerII 
.II 
AddressStreetII &
=II' (
viewII) -
.II- .
FindViewByIdII. :
<II: ;
TextViewII; C
>IIC D
(IID E
ResourceIIE M
.IIM N
IdIIN P
.IIP Q
register_streetIIQ `
)II` a
.IIa b
TextIIb f
;IIf g
customerJJ 
.JJ 
AddressTownJJ $
=JJ% &
viewJJ' +
.JJ+ ,
FindViewByIdJJ, 8
<JJ8 9
TextViewJJ9 A
>JJA B
(JJB C
ResourceJJC K
.JJK L
IdJJL N
.JJN O
register_townJJO \
)JJ\ ]
.JJ] ^
TextJJ^ b
;JJb c
customerKK 
.KK 
AddressCountyKK &
=KK' (
viewKK) -
.KK- .
FindViewByIdKK. :
<KK: ;
TextViewKK; C
>KKC D
(KKD E
ResourceKKE M
.KKM N
IdKKN P
.KKP Q
register_countyKKQ `
)KK` a
.KKa b
TextKKb f
;KKf g
customerLL 
.LL 
AddressPostalCodeLL *
=LL+ ,
viewLL- 1
.LL1 2
FindViewByIdLL2 >
<LL> ?
TextViewLL? G
>LLG H
(LLH I
ResourceLLI Q
.LLQ R
IdLLR T
.LLT U 
register_postal_codeLLU i
)LLi j
.LLj k
TextLLk o
;LLo p
customerMM 
.MM 
HomePhoneNoMM $
=MM% &
viewMM' +
.MM+ ,
FindViewByIdMM, 8
<MM8 9
TextViewMM9 A
>MMA B
(MMB C
ResourceMMC K
.MMK L
IdMML N
.MMN O"
register_home_phone_noMMO e
)MMe f
.MMf g
TextMMg k
;MMk l
customerNN 
.NN 
WorkPhoneNoNN $
=NN% &
viewNN' +
.NN+ ,
FindViewByIdNN, 8
<NN8 9
TextViewNN9 A
>NNA B
(NNB C
ResourceNNC K
.NNK L
IdNNL N
.NNN O"
register_work_phone_noNNO e
)NNe f
.NNf g
TextNNg k
;NNk l
customerOO 
.OO 
MobilePhoneNoOO &
=OO' (
viewOO) -
.OO- .
FindViewByIdOO. :
<OO: ;
TextViewOO; C
>OOC D
(OOD E
ResourceOOE M
.OOM N
IdOON P
.OOP Q$
register_mobile_phone_noOOQ i
)OOi j
.OOj k
TextOOk o
;OOo p
customerPP 
.PP 
EmailPP 
=PP  
viewPP! %
.PP% &
FindViewByIdPP& 2
<PP2 3
TextViewPP3 ;
>PP; <
(PP< =
ResourcePP= E
.PPE F
IdPPF H
.PPH I"
register_email_addressPPI _
)PP_ `
.PP` a
TextPPa e
;PPe f
ifRR 
(RR 
ValidateRR 
(RR 
)RR 
)RR 
{SS 
ifTT 
(TT 
_authFacadeTT #
.TT# $
RegisterTT$ ,
(TT, -
customerTT- 5
.TT5 6
UserNameTT6 >
,TT> ?
passwordTT@ H
,TTH I
confirmPasswordTTJ Y
)TTY Z
)TTZ [
{UU 
_authFacadeVV #
.VV# $
GetTokenVV$ ,
(VV, -
customerVV- 5
.VV5 6
UserNameVV6 >
,VV> ?
passwordVV@ H
)VVH I
;VVI J
GenericFacadeXX %
.XX% &
UserNameXX& .
=XX/ 0
customerXX1 9
.XX9 :
UserNameXX: B
;XXB C
stringZZ 
owinIdZZ %
=ZZ& '
_authFacadeZZ( 3
.ZZ3 4
	GetUserIdZZ4 =
(ZZ= >
)ZZ> ?
;ZZ? @
GenericFacade\\ %
.\\% &
OwinId\\& ,
=\\- .
owinId\\/ 5
;\\5 6
_authFacade]] #
.]]# $
AddCustomerRole]]$ 3
(]]3 4
)]]4 5
;]]5 6
customer__  
.__  !

OwinUserId__! +
=__, -
owinId__. 4
;__4 5
Customeraa  
newCustomeraa! ,
=aa- .
_customerFacadeaa/ >
.aa> ?
Createaa? E
(aaE F
customeraaF N
)aaN O
.aaO P
ResultaaP V
;aaV W
GenericFacadecc %
.cc% &
UserIdcc& ,
=cc- .
newCustomercc/ :
.cc: ;
Idcc; =
;cc= >
Toastee 
.ee 
MakeTextee &
(ee& '
Activityee' /
,ee/ 0
$stree1 J
,eeJ K
ToastLengtheeL W
.eeW X
LongeeX \
)ee\ ]
.ee] ^
Showee^ b
(eeb c
)eec d
;eed e
Fragmentgg  
fragmentgg! )
=gg* +
HomeFragmentgg, 8
.gg8 9
NewInstancegg9 D
(ggD E
)ggE F
;ggF G
FragmentManagerhh '
.hh' (
BeginTransactionhh( 8
(hh8 9
)hh9 :
.ii  !
Replaceii! (
(ii( )
Resourceii) 1
.ii1 2
Idii2 4
.ii4 5
content_frameii5 B
,iiB C
fragmentiiD L
)iiL M
.jj  !
Commitjj! '
(jj' (
)jj( )
;jj) *
(ll 
(ll 
MainActivityll &
)ll& '
Activityll' /
)ll/ 0
.ll0 1
ToggleLoginll1 <
(ll< =
)ll= >
;ll> ?
}mm 
elsenn 
{oo 
Toastpp 
.pp 
MakeTextpp &
(pp& '
Activitypp' /
,pp/ 0
$strpp1 n
,ppn o
ToastLengthppp {
.pp{ |
Long	pp| �
)
pp� �
.
pp� �
Show
pp� �
(
pp� �
)
pp� �
;
pp� �
}qq 
}rr 
elsess 
{tt 
Toastuu 
.uu 
MakeTextuu "
(uu" #
Activityuu# +
,uu+ ,
$struu- I
,uuI J
ToastLengthuuK V
.uuV W
LonguuW [
)uu[ \
.uu\ ]
Showuu] a
(uua b
)uub c
;uuc d
}vv 
}ww 
;ww 
returnyy 
viewyy 
;yy 
}zz 	
private|| 
bool|| 
Validate|| 
(|| 
)|| 
{}} 	
bool~~ 
valid~~ 
=~~ 
true~~ 
;~~ 
if
�� 
(
�� 
customer
�� 
.
�� 
UserName
�� !
.
��! "
Trim
��" &
(
��& '
)
��' (
==
��) +
$str
��, .
)
��. /
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
Title
�� 
==
�� !
null
��" &
||
��' )
customer
��* 2
.
��2 3
Title
��3 8
.
��8 9
Trim
��9 =
(
��= >
)
��> ?
==
��@ B
$str
��C E
)
��E F
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
Forename
�� !
.
��! "
Trim
��" &
(
��& '
)
��' (
==
��) +
$str
��, .
)
��. /
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
Surname
��  
.
��  !
Trim
��! %
(
��% &
)
��& '
==
��( *
$str
��+ -
)
��- .
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
DoB
�� 
==
�� 
null
��  $
||
��% '
customer
��( 0
.
��0 1
DoB
��1 4
==
��5 7
DateTime
��8 @
.
��@ A
MinValue
��A I
)
��I J
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
AddressStreet
�� &
.
��& '
Trim
��' +
(
��+ ,
)
��, -
==
��. 0
$str
��1 3
)
��3 4
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
AddressTown
�� $
.
��$ %
Trim
��% )
(
��) *
)
��* +
==
��, .
$str
��/ 1
)
��1 2
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
AddressCounty
�� &
.
��& '
Trim
��' +
(
��+ ,
)
��, -
==
��. 0
$str
��1 3
)
��3 4
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
AddressPostalCode
�� *
.
��* +
Trim
��+ /
(
��/ 0
)
��0 1
==
��2 4
$str
��5 7
)
��7 8
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
HomePhoneNo
�� $
.
��$ %
Trim
��% )
(
��) *
)
��* +
==
��, .
$str
��/ 1
)
��1 2
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
MobilePhoneNo
�� &
.
��& '
Trim
��' +
(
��+ ,
)
��, -
==
��. 0
$str
��1 3
)
��3 4
valid
�� 
=
�� 
false
�� 
;
�� 
if
�� 
(
�� 
customer
�� 
.
�� 
Email
�� 
.
�� 
Trim
�� #
(
��# $
)
��$ %
==
��& (
$str
��) +
)
��+ ,
valid
�� 
=
�� 
false
�� 
;
�� 
return
�� 
valid
�� 
;
�� 
}
�� 	
}
�� 
}�� �G
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\User\LoginFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (
User( ,
{ 
public 

class 
LoginFragment 
:  
Fragment! )
{ 
private 
readonly 

AuthFacade #
_authFacade$ /
=0 1
new2 5

AuthFacade6 @
(@ A
)A B
;B C
private 
readonly 
CustomerFacade '
_customerFacade( 7
=8 9
new: =
CustomerFacade> L
(L M
)M N
;N O
private 
View 
view 
; 
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
private 
Customer 
customer !
;! "
private 
string 
username 
;  
private 
string 
password 
;  
public 
override 
void 
OnCreate %
(% &
Bundle& ,
savedInstanceState- ?
)? @
{ 	
base 
. 
OnCreate 
( 
savedInstanceState ,
), -
;- .
}   	
public"" 
static"" 
LoginFragment"" #
NewInstance""$ /
(""/ 0
)""0 1
{## 	
var$$ 
frag1$$ 
=$$ 
new$$ 
LoginFragment$$ )
{$$* +
	Arguments$$, 5
=$$6 7
new$$8 ;
Bundle$$< B
($$B C
)$$C D
}$$E F
;$$F G
return%% 
frag1%% 
;%% 
}&& 	
public)) 
override)) 
View)) 
OnCreateView)) )
())) *
LayoutInflater))* 8
inflater))9 A
,))A B
	ViewGroup))C L
	container))M V
,))V W
Bundle))X ^
savedInstanceState))_ q
)))q r
{** 	
(++ 
(++ 
MainActivity++ 
)++ 
Activity++ #
)++# $
.++$ %
SetAsDrawerToolbar++% 7
(++7 8
)++8 9
;++9 :
var,, 
ignored,, 
=,, 
base,, 
.,, 
OnCreateView,, +
(,,+ ,
inflater,,, 4
,,,4 5
	container,,6 ?
,,,? @
savedInstanceState,,A S
),,S T
;,,T U
view-- 
=-- 
inflater-- 
.-- 
Inflate-- #
(--# $
Resource--$ ,
.--, -
Layout--- 3
.--3 4
login--4 9
,--9 :
null--; ?
)--? @
;--@ A
swipeRefresh// 
=// 
view// 
.//  
FindViewById//  ,
<//, -
SwipeRefreshLayout//- ?
>//? @
(//@ A
Resource//A I
.//I J
Id//J L
.//L M
swipe_refresh//M Z
)//Z [
;//[ \
swipeRefresh00 
.00 
Refresh00  
+=00! #
delegate00$ ,
{11 
}33 
;33 
Button55 
login55 
=55 
view55 
.55  
FindViewById55  ,
<55, -
Button55- 3
>553 4
(554 5
Resource555 =
.55= >
Id55> @
.55@ A
	login_btn55A J
)55J K
;55K L
login66 
.66 
Click66 
+=66 
delegate66 #
{77 
swipeRefresh88 
.88 

Refreshing88 '
=88( )
true88* .
;88. /
username99 
=99 
view99 
.99  
FindViewById99  ,
<99, -
TextView99- 5
>995 6
(996 7
Resource997 ?
.99? @
Id99@ B
.99B C
login_username99C Q
)99Q R
.99R S
Text99S W
;99W X
password:: 
=:: 
view:: 
.::  
FindViewById::  ,
<::, -
TextView::- 5
>::5 6
(::6 7
Resource::7 ?
.::? @
Id::@ B
.::B C
login_password::C Q
)::Q R
.::R S
Text::S W
;::W X
if<< 
(<< 
username<< 
.<< 
Trim<< !
(<<! "
)<<" #
!=<<$ &
$str<<' )
&&<<* ,
password<<- 5
.<<5 6
Trim<<6 :
(<<: ;
)<<; <
!=<<= ?
$str<<@ B
)<<B C
{== 
backgroundWorker>> $
=>>% &
new>>' *
BackgroundWorker>>+ ;
(>>; <
)>>< =
;>>= >
backgroundWorker?? $
.??$ %
DoWork??% +
+=??, .
Bworker_DoWork??/ =
;??= >
backgroundWorker@@ $
.@@$ %
RunWorkerCompleted@@% 7
+=@@8 :&
Bworker_RunWorkerCompleted@@; U
;@@U V
backgroundWorkerAA $
.AA$ %
RunWorkerAsyncAA% 3
(AA3 4
)AA4 5
;AA5 6
}BB 
elseCC 
{DD 
ToastEE 
.EE 
MakeTextEE "
(EE" #
ActivityEE# +
,EE+ ,
$strEE- Y
,EEY Z
ToastLengthEE[ f
.EEf g
LongEEg k
)EEk l
.EEl m
ShowEEm q
(EEq r
)EEr s
;EEs t
}FF 
swipeRefreshHH 
.HH 

RefreshingHH '
=HH( )
falseHH* /
;HH/ 0
}II 
;II 
returnKK 
viewKK 
;KK 
}LL 	
privateNN 
asyncNN 
TaskNN 
	GetValuesNN $
(NN$ %
)NN% &
{OO 	
_authFacadePP 
.PP 
GetTokenPP  
(PP  !
usernamePP! )
,PP) *
passwordPP+ 3
)PP3 4
;PP4 5
customerRR 
=RR 
awaitRR 
_customerFacadeRR ,
.RR, -
GetRR- 0
(RR0 1
)RR1 2
;RR2 3
}SS 	
privateUU 
voidUU &
Bworker_RunWorkerCompletedUU /
(UU/ 0
objectUU0 6
senderUU7 =
,UU= >'
RunWorkerCompletedEventArgsUU? Z
eUU[ \
)UU\ ]
{VV 	
swipeRefreshWW 
.WW 

RefreshingWW #
=WW$ %
falseWW& +
;WW+ ,
ifXX 
(XX 
customerXX 
!=XX 
nullXX  
)XX  !
{YY 
GenericFacadeZZ 
.ZZ 
UserNameZZ &
=ZZ' (
usernameZZ) 1
;ZZ1 2
GenericFacade[[ 
.[[ 
UserId[[ $
=[[% &
customer[[' /
.[[/ 0
Id[[0 2
;[[2 3
swipeRefresh]] 
.]] 

Refreshing]] '
=]]( )
false]]* /
;]]/ 0
Toast__ 
.__ 
MakeText__ 
(__ 
Activity__ '
,__' (
$str__) ;
,__; <
ToastLength__= H
.__H I
Long__I M
)__M N
.__N O
Show__O S
(__S T
)__T U
;__U V
Fragmentaa 
fragmentaa !
=aa" #
HomeFragmentaa$ 0
.aa0 1
NewInstanceaa1 <
(aa< =
)aa= >
;aa> ?
FragmentManagerbb 
.bb  
BeginTransactionbb  0
(bb0 1
)bb1 2
.cc 
Replacecc  
(cc  !
Resourcecc! )
.cc) *
Idcc* ,
.cc, -
content_framecc- :
,cc: ;
fragmentcc< D
)ccD E
.dd 
Commitdd 
(dd  
)dd  !
;dd! "
(ff 
(ff 
MainActivityff 
)ff 
Activityff '
)ff' (
.ff( )
ToggleLoginff) 4
(ff4 5
)ff5 6
;ff6 7
}gg 
elsehh 
{ii 
Toastjj 
.jj 
MakeTextjj 
(jj 
Activityjj '
,jj' (
$strjj) U
,jjU V
ToastLengthjjW b
.jjb c
Longjjc g
)jjg h
.jjh i
Showjji m
(jjm n
)jjn o
;jjo p
}kk 
}ll 	
privatenn 
asyncnn 
voidnn 
Bworker_DoWorknn )
(nn) *
objectnn* 0
sendernn1 7
,nn7 8
DoWorkEventArgsnn9 H
ennI J
)nnJ K
{oo 	
awaitpp 
	GetValuespp 
(pp 
)pp 
;pp 
}qq 	
}rr 
}ss ��
wC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\MainActivity.cs
	namespace 	
BookingSystemMobile
 
{ 
[ 
Activity 
( 
Label 
= 
$str (
,( ) 
ConfigurationChanges* >
=? @
AndroidA H
.H I
ContentI P
.P Q
PMQ S
.S T
ConfigChangesT a
.a b

ScreenSizeb l
|m n
Androido v
.v w
Contentw ~
.~ 
PM	 �
.
� �
ConfigChanges
� �
.
� �
Orientation
� �
)
� �
]
� �
public   

class   
MainActivity   
:   
AppCompatActivity    1
{!! 
public"" 
static"" 
bool"" 
IsNavDisabled"" (
="") *
false""+ 0
;""0 1
DrawerLayout$$ 
drawerLayout$$ !
;$$! "
NavigationView%% 
navigationView%% %
;%%% &
	IMenuItem'' 
previousItem'' 
;'' 
	protected(( 
override(( 
void(( 
OnCreate((  (
(((( )
Bundle(() /
savedInstanceState((0 B
)((B C
{)) 	
base** 
.** 
OnCreate** 
(** 
savedInstanceState** ,
)**, -
;**- .
SetContentView++ 
(++ 
Resource++ #
.++# $
Layout++$ *
.++* +
main+++ /
)++/ 0
;++0 1!
SetupNavigationDrawer,, !
(,,! "
),," #
;,,# $
if// 
(// 
savedInstanceState// "
==//# %
null//& *
)//* +
{00 
navigationView11 
.11 
SetCheckedItem11 -
(11- .
Resource11. 6
.116 7
Id117 9
.119 :
nav_home11: B
)11B C
;11C D
ListItemClicked22 
(22  
$num22  !
)22! "
;22" #
}33 
GenericFacade55 
.55 
Token55 
=55  !
$str55" $
;55$ %
GenericFacade66 
.66 
UserName66 "
=66# $
$str66% '
;66' (
GenericFacade77 
.77 
UserId77  
=77! "
$num77# $
;77$ %
}88 	
int:: 
oldPosition:: 
=:: 
-:: 
$num:: 
;:: 
private;; 
void;; 
ListItemClicked;; $
(;;$ %
int;;% (
position;;) 1
);;1 2
{<< 	
if>> 
(>> 
position>> 
==>> 
oldPosition>> '
)>>' (
return?? 
;?? 
oldPositionAA 
=AA 
positionAA "
;AA" #
FragmentCC 
fragmentCC 
=CC 
nullCC  $
;CC$ %
switchDD 
(DD 
positionDD 
)DD 
{EE 
caseFF 
$numFF 
:FF 
fragmentGG 
=GG 
HomeFragmentGG +
.GG+ ,
NewInstanceGG, 7
(GG7 8
)GG8 9
;GG9 :
breakHH 
;HH 
caseII 
$numII 
:II 
fragmentJJ 
=JJ #
RestaurantIndexFragmentJJ 6
.JJ6 7
NewInstanceJJ7 B
(JJB C
)JJC D
;JJD E
breakKK 
;KK 
caseLL 
$numLL 
:LL 
fragmentMM 
=MM 
MenuIndexFragmentMM 0
.MM0 1
NewInstanceMM1 <
(MM< =
)MM= >
;MM> ?
breakNN 
;NN 
caseOO 
$numOO 
:OO 
fragmentPP 
=PP 
LoginFragmentPP ,
.PP, -
NewInstancePP- 8
(PP8 9
)PP9 :
;PP: ;
breakQQ 
;QQ 
caseRR 
$numRR 
:RR 
fragmentSS 
=SS 
RegisterFragmentSS /
.SS/ 0
NewInstanceSS0 ;
(SS; <
)SS< =
;SS= >
breakTT 
;TT 
caseUU 
$numUU 
:UU 
fragmentVV 
=VV 
UserDetailsFragmentVV 2
.VV2 3
NewInstanceVV3 >
(VV> ?
)VV? @
;VV@ A
breakWW 
;WW 
caseXX 
$numXX 
:XX 
fragmentYY 
=YY  
BookingIndexFragmentYY 3
.YY3 4
NewInstanceYY4 ?
(YY? @
)YY@ A
;YYA B
breakZZ 
;ZZ 
case[[ 
$num[[ 
:[[ 
new\\ 
Android\\ 
.\\  
App\\  #
.\\# $
AlertDialog\\$ /
.\\/ 0
Builder\\0 7
(\\7 8
this\\8 <
)\\< =
.\\= >
SetIcon]] 
(]]  
Android]]  '
.]]' (
Resource]]( 0
.]]0 1
Drawable]]1 9
.]]9 :
IcDialogAlert]]: G
)]]G H
.]]H I
SetTitle^^  
(^^  !
$str^^! *
)^^* +
.^^+ ,

SetMessage__ "
(__" #
$str__# E
)__E F
.__F G
SetPositiveButton`` )
(``) *
$str``* /
,``/ 0
(``1 2
c``2 3
,``3 4
ev``5 7
)``7 8
=>``9 ;
{aa 
GenericFacadebb )
.bb) *
Tokenbb* /
=bb0 1
$strbb2 4
;bb4 5
GenericFacadecc )
.cc) *
UserNamecc* 2
=cc3 4
$strcc5 7
;cc7 8
GenericFacadedd )
.dd) *
UserIddd* 0
=dd1 2
$numdd3 4
;dd4 5
ToggleLogoutee (
(ee( )
)ee) *
;ee* +
}ff 
)ff 
.ff 
SetNegativeButtongg )
(gg) *
$strgg* .
,gg. /
(gg0 1
cgg1 2
,gg2 3
evgg4 6
)gg6 7
=>gg8 :
{hh 
}jj 
)jj 
.jj 
Showkk 
(kk 
)kk 
;kk 
breakll 
;ll 
casemm 
$nummm 
:mm 
ExitAppnn 
(nn 
)nn 
;nn 
breakoo 
;oo 
}pp 
ifrr 
(rr 
fragmentrr 
!=rr 
nullrr  
)rr  !
{ss 
FragmentManagertt 
.tt  
BeginTransactiontt  0
(tt0 1
)tt1 2
.uu 
Replaceuu 
(uu 
Resourceuu %
.uu% &
Iduu& (
.uu( )
content_frameuu) 6
,uu6 7
fragmentuu8 @
)uu@ A
.vv 
Commitvv 
(vv 
)vv 
;vv 
}ww 
}xx 	
publiczz 
overridezz 
boolzz !
OnOptionsItemSelectedzz 2
(zz2 3
	IMenuItemzz3 <
itemzz= A
)zzA B
{{{ 	
if|| 
(|| 
!|| 
IsNavDisabled|| 
)|| 
{}} 
switch~~ 
(~~ 
item~~ 
.~~ 
ItemId~~ #
)~~# $
{ 
case
�� 
Android
��  
.
��  !
Resource
��! )
.
��) *
Id
��* ,
.
��, -
Home
��- 1
:
��1 2
drawerLayout
�� $
.
��$ %

OpenDrawer
��% /
(
��/ 0
GravityCompat
��0 =
.
��= >
Start
��> C
)
��C D
;
��D E
return
�� 
true
�� #
;
��# $
}
�� 
}
�� 
return
�� 
base
�� 
.
�� #
OnOptionsItemSelected
�� -
(
��- .
item
��. 2
)
��2 3
;
��3 4
}
�� 	
public
�� 
override
�� 
void
�� 
OnBackPressed
�� *
(
��* +
)
��+ ,
{
�� 	
if
�� 
(
�� 

IsTaskRoot
�� 
&&
�� 
FragmentManager
�� -
.
��- .!
BackStackEntryCount
��. A
==
��B D
$num
��E F
)
��F G
{
�� 
ExitApp
�� 
(
�� 
)
�� 
;
�� 
}
�� 
else
�� 
{
�� 
base
�� 
.
�� 
OnBackPressed
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
}
�� 	
public
�� 
void
�� 
ToggleLogin
�� 
(
��  
)
��  !
{
�� 	
navigationView
�� 
.
�� 
Menu
�� 
.
��  
FindItem
��  (
(
��( )
Resource
��) 1
.
��1 2
Id
��2 4
.
��4 5!
user_menu_logged_in
��5 H
)
��H I
.
��I J

SetVisible
��J T
(
��T U
true
��U Y
)
��Y Z
;
��Z [
navigationView
�� 
.
�� 
Menu
�� 
.
��  
FindItem
��  (
(
��( )
Resource
��) 1
.
��1 2
Id
��2 4
.
��4 5"
user_menu_logged_out
��5 I
)
��I J
.
��J K

SetVisible
��K U
(
��U V
false
��V [
)
��[ \
;
��\ ]
FindViewById
�� 
<
�� 
TextView
�� !
>
��! "
(
��" #
Resource
��# +
.
��+ ,
Id
��, .
.
��. /
	user_text
��/ 8
)
��8 9
.
��9 :
Text
��: >
=
��? @
GenericFacade
��A N
.
��N O
UserName
��O W
;
��W X
}
�� 	
public
�� 
void
�� 
ToggleLogout
��  
(
��  !
)
��! "
{
�� 	
navigationView
�� 
.
�� 
Menu
�� 
.
��  
FindItem
��  (
(
��( )
Resource
��) 1
.
��1 2
Id
��2 4
.
��4 5!
user_menu_logged_in
��5 H
)
��H I
.
��I J

SetVisible
��J T
(
��T U
false
��U Z
)
��Z [
;
��[ \
navigationView
�� 
.
�� 
Menu
�� 
.
��  
FindItem
��  (
(
��( )
Resource
��) 1
.
��1 2
Id
��2 4
.
��4 5"
user_menu_logged_out
��5 I
)
��I J
.
��J K

SetVisible
��K U
(
��U V
true
��V Z
)
��Z [
;
��[ \
FindViewById
�� 
<
�� 
TextView
�� !
>
��! "
(
��" #
Resource
��# +
.
��+ ,
Id
��, .
.
��. /
	user_text
��/ 8
)
��8 9
.
��9 :
Text
��: >
=
��? @
$str
��A M
;
��M N
}
�� 	
public
�� 
void
��  
SetAsDrawerToolbar
�� &
(
��& '
)
��' (
{
�� 	#
SetupNavigationDrawer
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
private
�� 
void
�� #
SetupNavigationDrawer
�� *
(
��* +
)
��+ ,
{
�� 	
var
�� 
toolbar
�� 
=
�� 
FindViewById
�� &
<
��& '
Android
��' .
.
��. /
Support
��/ 6
.
��6 7
V7
��7 9
.
��9 :
Widget
��: @
.
��@ A
Toolbar
��A H
>
��H I
(
��I J
Resource
��J R
.
��R S
Id
��S U
.
��U V
toolbar
��V ]
)
��] ^
;
��^ _
if
�� 
(
�� 
toolbar
�� 
!=
�� 
null
�� 
)
��  
{
�� !
SetSupportActionBar
�� #
(
��# $
toolbar
��$ +
)
��+ ,
;
��, -
SupportActionBar
��  
.
��  !'
SetDisplayHomeAsUpEnabled
��! :
(
��: ;
true
��; ?
)
��? @
;
��@ A
SupportActionBar
��  
.
��  !"
SetHomeButtonEnabled
��! 5
(
��5 6
true
��6 :
)
��: ;
;
��; <
}
�� 
drawerLayout
�� 
=
�� 
FindViewById
�� '
<
��' (
DrawerLayout
��( 4
>
��4 5
(
��5 6
Resource
��6 >
.
��> ?
Id
��? A
.
��A B
drawer_layout
��B O
)
��O P
;
��P Q
SupportActionBar
�� 
.
�� "
SetHomeAsUpIndicator
�� 1
(
��1 2
Resource
��2 :
.
��: ;
Drawable
��; C
.
��C D
ic_menu
��D K
)
��K L
;
��L M
navigationView
�� 
=
�� 
FindViewById
�� )
<
��) *
NavigationView
��* 8
>
��8 9
(
��9 :
Resource
��: B
.
��B C
Id
��C E
.
��E F
nav_view
��F N
)
��N O
;
��O P
navigationView
�� 
.
�� $
NavigationItemSelected
�� 1
+=
��2 4
(
��5 6
sender
��6 <
,
��< =
e
��> ?
)
��? @
=>
��A C
{
�� 
if
�� 
(
�� 
previousItem
��  
!=
��! #
null
��$ (
)
��( )
previousItem
��  
.
��  !

SetChecked
��! +
(
��+ ,
false
��, 1
)
��1 2
;
��2 3
navigationView
�� 
.
�� 
SetCheckedItem
�� -
(
��- .
e
��. /
.
��/ 0
MenuItem
��0 8
.
��8 9
ItemId
��9 ?
)
��? @
;
��@ A
previousItem
�� 
=
�� 
e
��  
.
��  !
MenuItem
��! )
;
��) *
switch
�� 
(
�� 
e
�� 
.
�� 
MenuItem
�� "
.
��" #
ItemId
��# )
)
��) *
{
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %
nav_home
��% -
:
��- .
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %
nav_restaurants
��% 4
:
��4 5
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %
nav_menu
��% -
:
��- .
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %
	nav_login
��% .
:
��. /
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %
nav_register
��% 1
:
��1 2
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %!
nav_account_details
��% 8
:
��8 9
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %"
nav_account_bookings
��% 9
:
��9 :
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %

nav_logout
��% /
:
��/ 0
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
case
�� 
Resource
�� !
.
��! "
Id
��" $
.
��$ %
nav_exit
��% -
:
��- .
ListItemClicked
�� '
(
��' (
$num
��( )
)
��) *
;
��* +
break
�� 
;
�� 
}
�� 
drawerLayout
�� 
.
�� 
CloseDrawers
�� )
(
��) *
)
��* +
;
��+ ,
}
�� 
;
�� 
}
�� 	
public
�� 
void
�� $
SetAsNavigationToolbar
�� *
(
��* +
Android
��+ 2
.
��2 3
Support
��3 :
.
��: ;
V7
��; =
.
��= >
Widget
��> D
.
��D E
Toolbar
��E L
toolbar
��M T
=
��U V
null
��W [
)
��[ \
{
�� 	
SupportActionBar
�� 
.
�� "
SetHomeAsUpIndicator
�� 1
(
��1 2
Resource
��2 :
.
��: ;
Drawable
��; C
.
��C D#
ic_chevron_left_white
��D Y
)
��Y Z
;
��Z [
}
�� 	
private
�� 
void
�� 
ExitApp
�� 
(
�� 
)
�� 
{
�� 	
new
�� 
Android
�� 
.
�� 
App
�� 
.
�� 
AlertDialog
�� '
.
��' (
Builder
��( /
(
��/ 0
this
��0 4
)
��4 5
.
��5 6
SetIcon
�� 
(
�� 
Android
�� #
.
��# $
Resource
��$ ,
.
��, -
Drawable
��- 5
.
��5 6
IcDialogAlert
��6 C
)
��C D
.
��D E
SetTitle
�� 
(
�� 
$str
�� &
)
��& '
.
��' (

SetMessage
�� 
(
�� 
$str
�� ?
)
��? @
.
��@ A
SetPositiveButton
�� %
(
��% &
$str
��& +
,
��+ ,
(
��- .
c
��. /
,
��/ 0
ev
��1 3
)
��3 4
=>
��5 7
{
�� 
FinishAffinity
�� &
(
��& '
)
��' (
;
��( )
}
�� 
)
�� 
.
�� 
SetNegativeButton
�� %
(
��% &
$str
��& *
,
��* +
(
��, -
c
��- .
,
��. /
ev
��0 2
)
��2 3
=>
��4 6
{
�� 
}
�� 
)
�� 
.
�� 
Show
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �0
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\HomeFragment.cs
	namespace		 	
BookingSystemMobile		
 
.		 
	Fragments		 '
{

 
public 

class 
HomeFragment 
: 
Fragment  (
{ 
private 
readonly 
RestaurantFacade )
_restaurantFacade* ;
=< =
new> A
RestaurantFacadeB R
(R S
)S T
;T U
private 
View 
view 
; 
public 
override 
void 
OnCreate %
(% &
Bundle& ,
savedInstanceState- ?
)? @
{ 	
base 
. 
OnCreate 
( 
savedInstanceState ,
), -
;- .
} 	
public 
static 
HomeFragment "
NewInstance# .
(. /
)/ 0
{ 	
var 
frag1 
= 
new 
HomeFragment (
{) *
	Arguments+ 4
=5 6
new7 :
Bundle; A
(A B
)B C
}D E
;E F
return 
frag1 
; 
} 	
public 
override 
View 
OnCreateView )
() *
LayoutInflater* 8
inflater9 A
,A B
	ViewGroupC L
	containerM V
,V W
BundleX ^
savedInstanceState_ q
)q r
{   	
(!! 
(!! 
MainActivity!! 
)!! 
Activity!! #
)!!# $
.!!$ %
SetAsDrawerToolbar!!% 7
(!!7 8
)!!8 9
;!!9 :
var"" 
ignored"" 
="" 
base"" 
."" 
OnCreateView"" +
(""+ ,
inflater"", 4
,""4 5
	container""6 ?
,""? @
savedInstanceState""A S
)""S T
;""T U
view## 
=## 
inflater## 
.## 
Inflate## #
(### $
Resource##$ ,
.##, -
Layout##- 3
.##3 4
home##4 8
,##8 9
null##: >
)##> ?
;##? @
Spinner%% 
spinner%% 
=%% 
view%% "
.%%" #
FindViewById%%# /
<%%/ 0
Spinner%%0 7
>%%7 8
(%%8 9
Resource%%9 A
.%%A B
Id%%B D
.%%D E
spinner_home%%E Q
)%%Q R
;%%R S
List'' 
<'' 
LibBookingService'' "
.''" #
Dtos''# '
.''' (

Restaurant''( 2
>''2 3
restaurants''4 ?
=''@ A
new''B E
List''F J
<''J K
LibBookingService''K \
.''\ ]
Dtos''] a
.''a b

Restaurant''b l
>''l m
{(( 
new)) 
LibBookingService)) %
.))% &
Dtos))& *
.))* +

Restaurant))+ 5
{** 
Name++ 
=++ 
$str++ *
},, 
}-- 
;-- 
restaurants// 
.// 
AddRange//  
(//  !
_restaurantFacade//! 2
.//2 3
Get//3 6
(//6 7
)//7 8
.//8 9
Result//9 ?
)//? @
;//@ A
var66 
adapter66 
=66 
new66 
ArrayAdapter66 *
<66* +
LibBookingService66+ <
.66< =
Dtos66= A
.66A B

Restaurant66B L
>66L M
(66M N
Activity66N V
,66V W
Android66X _
.66_ `
Resource66` h
.66h i
Layout66i o
.66o p&
SimpleSpinnerDropDownItem	66p �
,
66� �
restaurants
66� �
)
66� �
;
66� �
adapter77 
.77 #
SetDropDownViewResource77 +
(77+ ,
Android77, 3
.773 4
Resource774 <
.77< =
Layout77= C
.77C D%
SimpleSpinnerDropDownItem77D ]
)77] ^
;77^ _
spinner88 
.88 
Adapter88 
=88 
adapter88 %
;88% &
int:: "
initialSpinnerPosition:: &
=::' (
spinner::) 0
.::0 1 
SelectedItemPosition::1 E
;::E F
spinner;; 
.;; 
ItemSelected;;  
+=;;! #
(;;$ %
sender;;% +
,;;+ ,
args;;- 1
);;1 2
=>;;3 5
{<< 
if== 
(== 
args== 
.== 
Position== !
!===" $"
initialSpinnerPosition==% ;
)==; <
{>> 
MainActivity??  
.??  !
IsNavDisabled??! .
=??/ 0
true??1 5
;??5 6
spinner@@ 
.@@ 
SetSelection@@ (
(@@( )
$num@@) *
)@@* +
;@@+ ,
FragmentAA 
fragmentAA %
=AA& '

RestaurantAA( 2
.AA2 3"
RestaurantViewFragmentAA3 I
.AAI J
NewInstanceAAJ U
(AAU V
restaurantsAAV a
[AAa b
argsAAb f
.AAf g
PositionAAg o
]AAo p
.AAp q
IdAAq s
)AAs t
;AAt u
FragmentManagerBB #
.BB# $
BeginTransactionBB$ 4
(BB4 5
)BB5 6
.BB6 7
ReplaceBB7 >
(BB> ?
ResourceBB? G
.BBG H
IdBBH J
.BBJ K
content_frameBBK X
,BBX Y
fragmentBBZ b
)BBb c
.BBc d
AddToBackStackBBd r
(BBr s
nullBBs w
)BBw x
.BBx y
CommitBBy 
(	BB �
)
BB� �
;
BB� �
}CC 
}DD 
;DD 
returnFF 
viewFF 
;FF 
}GG 	
}HH 
}II �<
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Fragments\Restaurant\RestaurantIndexFragment.cs
	namespace 	
BookingSystemMobile
 
. 
	Fragments '
.' (

Restaurant( 2
{ 
public 

class #
RestaurantIndexFragment (
:) *
Fragment+ 3
{ 
private 
readonly 
RestaurantFacade )
_restaurantFacade* ;
=< =
new> A
RestaurantFacadeB R
(R S
)S T
;T U
private 
View 
view 
; 
private 
RecyclerView 
recyclerView )
;) *
private 
SwipeRefreshLayout "
swipeRefresh# /
;/ 0
private 
List 
< 
LibBookingService &
.& '
Dtos' +
.+ ,

Restaurant, 6
>6 7
restaurants8 C
=D E
newF I
ListJ N
<N O
LibBookingServiceO `
.` a
Dtosa e
.e f

Restaurantf p
>p q
(q r
)r s
;s t
private 
BackgroundWorker  
backgroundWorker! 1
;1 2
public 
static #
RestaurantIndexFragment -
NewInstance. 9
(9 :
): ;
{ 	
var 
frag2 
= 
new #
RestaurantIndexFragment 3
{4 5
	Arguments6 ?
=@ A
newB E
BundleF L
(L M
)M N
}O P
;P Q
return 
frag2 
; 
} 	
public   
override   
void   
OnCreate   %
(  % &
Bundle  & ,
savedInstanceState  - ?
)  ? @
{!! 	
base"" 
."" 
OnCreate"" 
("" 
savedInstanceState"" ,
)"", -
;""- .
}## 	
public%% 
override%% 
View%% 
OnCreateView%% )
(%%) *
LayoutInflater%%* 8
inflater%%9 A
,%%A B
	ViewGroup%%C L
	container%%M V
,%%V W
Bundle%%X ^
savedInstanceState%%_ q
)%%q r
{&& 	
('' 
('' 
MainActivity'' 
)'' 
Activity'' #
)''# $
.''$ %
SetAsDrawerToolbar''% 7
(''7 8
)''8 9
;''9 :
var(( 
ignored(( 
=(( 
base(( 
.(( 
OnCreateView(( +
(((+ ,
inflater((, 4
,((4 5
	container((6 ?
,((? @
savedInstanceState((A S
)((S T
;((T U
view)) 
=)) 
inflater)) 
.)) 
Inflate)) #
())# $
Resource))$ ,
.)), -
Layout))- 3
.))3 4
restaurant_index))4 D
,))D E
null))F J
)))J K
;))K L
swipeRefresh** 
=** 
view** 
.**  
FindViewById**  ,
<**, -
SwipeRefreshLayout**- ?
>**? @
(**@ A
Resource**A I
.**I J
Id**J L
.**L M"
restaurant_index_swipe**M c
)**c d
;**d e
swipeRefresh,, 
.,, 
Refresh,,  
+=,,! #
delegate,,$ ,
{-- 
backgroundWorker..  
...  !
RunWorkerAsync..! /
(../ 0
)..0 1
;..1 2
}// 
;// 
swipeRefresh11 
.11 

Refreshing11 #
=11$ %
true11& *
;11* +
backgroundWorker33 
=33 
new33 "
BackgroundWorker33# 3
(333 4
)334 5
;335 6
backgroundWorker44 
.44 
DoWork44 #
+=44$ &
Bworker_DoWork44' 5
;445 6
backgroundWorker55 
.55 
RunWorkerCompleted55 /
+=550 2&
Bworker_RunWorkerCompleted553 M
;55M N
backgroundWorker66 
.66 
RunWorkerAsync66 +
(66+ ,
)66, -
;66- .
return88 
view88 
;88 
}99 	
private;; 
void;; 
Setup;; 
(;; 
);; 
{<< 	
recyclerView== 
=== 
view== 
.==  
FindViewById==  ,
<==, -
RecyclerView==- 9
>==9 :
(==: ;
Resource==; C
.==C D
Id==D F
.==F G
restaurant_index==G W
)==W X
;==X Y
recyclerView>> 
.>> 
SetLayoutManager>> )
(>>) *
new>>* -
LinearLayoutManager>>. A
(>>A B
Activity>>B J
)>>J K
)>>K L
;>>L M"
RestaurantIndexAdapter@@ "
adapter@@# *
=@@+ ,
new@@- 0"
RestaurantIndexAdapter@@1 G
(@@G H
restaurants@@H S
)@@S T
;@@T U
adapterAA 
.AA 
	ItemClickAA 
+=AA  
MAdapter_ItemClickAA! 3
;AA3 4
recyclerViewBB 
.BB 

SetAdapterBB #
(BB# $
adapterBB$ +
)BB+ ,
;BB, -
}CC 	
privateEE 
asyncEE 
TaskEE 
	GetValuesEE $
(EE$ %
)EE% &
{FF 	
restaurantsGG 
=GG 
awaitGG 
_restaurantFacadeGG  1
.GG1 2
GetGG2 5
(GG5 6
)GG6 7
;GG7 8
}HH 	
privateJJ 
voidJJ 
MAdapter_ItemClickJJ '
(JJ' (
objectJJ( .
senderJJ/ 5
,JJ5 6
intJJ7 :
iJJ; <
)JJ< =
{KK 	
MainActivityLL 
.LL 
IsNavDisabledLL &
=LL' (
trueLL) -
;LL- .
FragmentMM 
fragmentMM 
=MM "
RestaurantViewFragmentMM  6
.MM6 7
NewInstanceMM7 B
(MMB C
restaurantsMMC N
[MMN O
iMMO P
]MMP Q
.MMQ R
IdMMR T
)MMT U
;MMU V
FragmentManagerNN 
.NN 
BeginTransactionNN ,
(NN, -
)NN- .
.OO 
ReplaceOO 
(OO 
ResourceOO %
.OO% &
IdOO& (
.OO( )
content_frameOO) 6
,OO6 7
fragmentOO8 @
)OO@ A
.PP 
AddToBackStackPP #
(PP# $
nullPP$ (
)PP( )
.QQ 
CommitQQ 
(QQ 
)QQ 
;QQ 
}RR 	
privateTT 
voidTT &
Bworker_RunWorkerCompletedTT /
(TT/ 0
objectTT0 6
senderTT7 =
,TT= >'
RunWorkerCompletedEventArgsTT? Z
eTT[ \
)TT\ ]
{UU 	
SetupVV 
(VV 
)VV 
;VV 
swipeRefreshWW 
.WW 

RefreshingWW #
=WW$ %
falseWW& +
;WW+ ,
}XX 	
privateZZ 
asyncZZ 
voidZZ 
Bworker_DoWorkZZ )
(ZZ) *
objectZZ* 0
senderZZ1 7
,ZZ7 8
DoWorkEventArgsZZ9 H
eZZI J
)ZZJ K
{[[ 	
await\\ 
	GetValues\\ 
(\\ 
)\\ 
;\\ 
}]] 	
}^^ 
}__ �
�C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\Properties\AssemblyInfo.cs
[		 
assembly		 	
:			 

AssemblyTitle		 
(		 
$str		 .
)		. /
]		/ 0
[

 
assembly

 	
:

	 

AssemblyDescription

 
(

 
$str

 !
)

! "
]

" #
[ 
assembly 	
:	 
!
AssemblyConfiguration  
(  !
$str! #
)# $
]$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

AssemblyVersion 
( 
$str $
)$ %
]% &
[ 
assembly 	
:	 

AssemblyFileVersion 
( 
$str (
)( )
]) *�
yC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\BookingSystemMobile\SplashActivity.cs
	namespace 	
BookingSystemMobile
 
{ 
[ 
Activity 
( 
Theme 
= 
$str -
,- .
MainLauncher/ ;
=< =
true> B
,B C
	NoHistoryD M
=N O
trueP T
,T U
IconV Z
=[ \
$str] r
,r s!
ConfigurationChanges	t �
=
� �
Android
� �
.
� �
Content
� �
.
� �
PM
� �
.
� �
ConfigChanges
� �
.
� �

ScreenSize
� �
|
� �
Android
� �
.
� �
Content
� �
.
� �
PM
� �
.
� �
ConfigChanges
� �
.
� �
Orientation
� �
)
� �
]
� �
public 

class 
SplashActivity 
:  !
AppCompatActivity" 3
{ 
static 
readonly 
string 
TAG "
=# $
$str% )
+* +
typeof, 2
(2 3
SplashActivity3 A
)A B
.B C
NameC G
;G H
	protected 
override 
void 
OnCreate  (
(( )
Bundle) /
savedInstanceState0 B
)B C
{ 	
base 
. 
OnCreate 
( 
savedInstanceState ,
), -
;- .
Log 
. 
Debug 
( 
TAG 
, 
$str 4
)4 5
;5 6
} 	
	protected 
override 
void 
OnResume  (
(( )
)) *
{ 	
base   
.   
OnResume   
(   
)   
;   
Task!! 
startupWork!! 
=!! 
new!! "
Task!!# '
(!!' (
(!!( )
)!!) *
=>!!+ -
{!!. /
SimulateStartup!!0 ?
(!!? @
)!!@ A
;!!A B
}!!C D
)!!D E
;!!E F
startupWork"" 
."" 
Start"" 
("" 
)"" 
;""  
}## 	
async&& 
void&& 
SimulateStartup&& "
(&&" #
)&&# $
{'' 	
Log(( 
.(( 
Debug(( 
((( 
TAG(( 
,(( 
$str(( S
)((S T
;((T U
await)) 
Task)) 
.)) 
Delay)) 
()) 
$num)) !
)))! "
;))" #
Log** 
.** 
Debug** 
(** 
TAG** 
,** 
$str** N
)**N O
;**O P
StartActivity++ 
(++ 
new++ 
Intent++ $
(++$ %
Application++% 0
.++0 1
Context++1 8
,++8 9
typeof++: @
(++@ A
MainActivity++A M
)++M N
)++N O
)++O P
;++P Q
},, 	
}-- 
}.. 