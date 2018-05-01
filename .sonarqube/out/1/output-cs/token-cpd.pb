º
lC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dto.cs
	namespace 	
LibBookingService
 
{ 
public		 

class		 
Dto		 
{

 
public 
virtual 
int 
Id 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} Ú
uC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Booking.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
Booking 
: 
Dto 
{ 
public 
virtual 
int 

CustomerId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
int 
RestaurantId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
virtual 
DateTime 
BookingMadeDate  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
TimeSpan 
BookingMadeTime  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
DateTime 
BookingDate  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
TimeSpan 
	StartTime  )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
TimeSpan 
EndTime  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
virtual 
decimal 
PaymentTotal +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
DateTime 
?  
PaymentMadeDate! 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
virtual 
int 
NoCustomers &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public!! 
virtual!! 
string!! 
Comments!! &
{!!' (
get!!) ,
;!!, -
set!!. 1
;!!1 2
}!!3 4
public## 
virtual## 
bool## 
	Cancelled## %
{##& '
get##( +
;##+ ,
set##- 0
;##0 1
}##2 3
public%% 
virtual%% 

Restaurant%% !

Restaurant%%" ,
{%%- .
get%%/ 2
;%%2 3
set%%4 7
;%%7 8
}%%9 :
public'' 
virtual'' 
IEnumerable'' "
<''" #
BookingMenuItem''# 2
>''2 3
	MenuItems''4 =
{''> ?
get''@ C
;''C D
set''E H
;''H I
}''J K
public)) 
virtual)) 
IEnumerable)) "
<))" #
Payment))# *
>))* +
Payments)), 4
{))5 6
get))7 :
;)): ;
set))< ?
;))? @
}))A B
public++ 
virtual++ 
IEnumerable++ "
<++" #
Table++# (
>++( )
Tables++* 0
{++1 2
get++3 6
;++6 7
set++8 ;
;++; <
}++= >
},, 
}-- °
}C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\BookingMenuItem.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
BookingMenuItem  
:! "
Dto# &
{ 
public		 
virtual		 
int		 
	BookingId		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public 
virtual 
int 

MenuItemId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
int 
Quantity #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
virtual 
double 

TotalPrice (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} è
uC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Company.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
Company 
: 
Dto 
{ 
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
string 
Description )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
string 
PhoneNo %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
string 
AddressStreet +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
AddressCounty +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
AddressTown )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
string 
AddressPostalCode /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
string 
Email #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
virtual 
IEnumerable "
<" #

Restaurant# -
>- .
Restaurants/ :
{; <
get= @
;@ A
setB E
;E F
}G H
} 
}   û
vC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Customer.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
Customer 
: 
Dto 
{ 
public 
virtual 
string 
Title #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
virtual 
string 
UserName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
string 

OwinUserId (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
virtual 
string 
Forename &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
string 
Surname %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
DateTime 
DoB  #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
virtual 
string 
AddressStreet +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
AddressTown )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
string 
AddressCounty +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
AddressPostalCode /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public!! 
virtual!! 
string!! 
HomePhoneNo!! )
{!!* +
get!!, /
;!!/ 0
set!!1 4
;!!4 5
}!!6 7
public## 
virtual## 
string## 
WorkPhoneNo## )
{##* +
get##, /
;##/ 0
set##1 4
;##4 5
}##6 7
public%% 
virtual%% 
string%% 
MobilePhoneNo%% +
{%%, -
get%%. 1
;%%1 2
set%%3 6
;%%6 7
}%%8 9
public'' 
virtual'' 
string'' 
Email'' #
{''$ %
get''& )
;'') *
set''+ .
;''. /
}''0 1
public)) 
virtual)) 
IEnumerable)) "
<))" #
Booking))# *
>))* +
Bookings)), 4
{))5 6
get))7 :
;)): ;
set))< ?
;))? @
}))A B
public++ 
virtual++ 
IEnumerable++ "
<++" #
Payment++# *
>++* +
Payments++, 4
{++5 6
get++7 :
;++: ;
set++< ?
;++? @
}++A B
},, 
}-- 
vC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\DietInfo.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
DietInfo 
: 
Dto 
{ 
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Õ
sC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Image.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public		 

class		 
Image		 
:		 
Dto		 
{

 
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
long 
Size  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 
string 
Type "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
byte 
[ 
] 
FileContent )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
DateTime 
	CreatedOn  )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
DateTime 
?  

ModifiedOn! +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
int 
Source !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ‚
vC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\MenuItem.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
MenuItem 
: 
Dto 
{ 
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
string 
Description )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
double 
Price #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
virtual 
IEnumerable "
<" #
MenuItemType# /
>/ 0
Types1 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
virtual 
IEnumerable "
<" #
DietInfo# +
>+ ,
DietInfo- 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
virtual 
int 
? 
ImageId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} —
zC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\MenuItemType.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
MenuItemType 
: 
Dto  #
{ 
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Ý	
uC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Payment.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
Payment 
: 
Dto 
{ 
public 
virtual 
int 

CustomerId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
int 
	BookingId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
decimal 
Amount %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
string 
Comments &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
PaymentMethod $
PaymentMethod% 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} ô
{C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\PaymentMethod.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
PaymentMethod 
:  
Dto! $
{ 
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
bool 
Active "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
IEnumerable "
<" #
Payment# *
>* +
Payments, 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
override 
string 
ToString '
(' (
)( )
{ 	
return 
Name 
; 
} 	
} 
} ¯
xC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Restaurant.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 

Restaurant 
: 
Dto !
{ 
public 
virtual 
int 
	CompanyId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
Name "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
string 
PhoneNo %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
string 
AddressStreet +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
AddressCounty +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
AddressTown )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
virtual 
string 
AddressPostalCode /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
IEnumerable "
<" #
Booking# *
>* +
Bookings, 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
virtual 
IEnumerable "
<" #
MenuItem# +
>+ ,
	MenuItems- 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
virtual 
IEnumerable "
<" #
Table# (
>( )
Tables* 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public!! 
virtual!! 
IEnumerable!! "
<!!" #
int!!# &
>!!& '
ImageIds!!( 0
{!!1 2
get!!3 6
;!!6 7
set!!8 ;
;!!; <
}!!= >
public## 
override## 
string## 
ToString## '
(##' (
)##( )
{$$ 	
return%% 
Name%% 
;%% 
}&& 	
}'' 
}(( Í	
sC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Dtos\Table.cs
	namespace 	
LibBookingService
 
. 
Dtos  
{ 
public 

class 
Table 
: 
Dto 
{ 
public 
virtual 
int 
RestaurantId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
virtual 
int 
TableNo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
string 
AdditionalNotes -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
virtual 
int 
NoSeats "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
bool 
Active "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ¬
€C:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Properties\AssemblyInfo.cs
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
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *ä
nC:\Users\matty\Documents\Development\Uni\Year 5\FYP\Uni-FYP-RestaurantBookingSystem\LibBookingService\Title.cs
	namespace 	
LibBookingService
 
{ 
public		 

enum		 
Title		 
{

 
Mr 

,
 
Mrs 
, 
Ms 

} 
} 