using Moq;
using DatabaseContext.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingService.Tests.Data
{
    public class SampleData : MoqTestHandlers
    {
        public Mock<DbSet<Company>> Companies;
        public Mock<DbSet<Restaurant>> Restaurants;
        public Mock<DbSet<RestaurantMenuItem>> RestaurantMenuItems;
        public Mock<DbSet<MenuItem>> MenuItems;
        public Mock<DbSet<MenuItemDietInfo>> MenuItemDietInfos;
        public Mock<DbSet<DietInfo>> DietInfos;
        public Mock<DbSet<MenuItemType>> MenuItemTypes;
        public Mock<DbSet<DatabaseContext.Data.Type>> Types;
        public Mock<DbSet<Table>> Tables;
        public Mock<DbSet<TableBooking>> TableBookings;
        public Mock<DbSet<Booking>> Bookings;
        public Mock<DbSet<BookingMenuItem>> BookingMenuItems;
        public Mock<DbSet<Payment>> Payments;
        public Mock<DbSet<PaymentMethod>> PaymentMethods;
        public Mock<DbSet<Customer>> Customers;

        public SampleData()
        {
            Companies = GetCompanies();
            Restaurants = GetRestaurants();
            RestaurantMenuItems = GetRestaurantMenuItems();
            MenuItems = GetMenuItems();
            MenuItemDietInfos = GetMenuItemDietInfo();
            DietInfos = GetDietInfo();
            MenuItemTypes = GetMenuItemTypes();
            Types = GetTypes();
            Tables = GetTables();
            TableBookings = GetTableBookings();
            Bookings = GetBookings();
            BookingMenuItems = GetBookingMenuItems();
            Payments = GetPayments();
            PaymentMethods = GetPaymentMethods();
            Customers = GetCustomers();
        }

        public SampleData(bool data)
        {
            Companies = GetCompanies(data);
            Restaurants = GetRestaurants(data);
            RestaurantMenuItems = GetRestaurantMenuItems(data);
            MenuItems = GetMenuItems(data);
            MenuItemDietInfos = GetMenuItemDietInfo(data);
            DietInfos = GetDietInfo(data);
            MenuItemTypes = GetMenuItemTypes(data);
            Types = GetTypes(data);
            Tables = GetTables(data);
            TableBookings = GetTableBookings(data);
            Bookings = GetBookings(data);
            BookingMenuItems = GetBookingMenuItems(data);
            Payments = GetPayments(data);
            PaymentMethods = GetPaymentMethods(data);
            Customers = GetCustomers(data);
        }

        private Mock<DbSet<Company>> GetCompanies(bool data = true)
        {
            IQueryable<Company> companyData;

            if (data)
            {
                companyData = new List<Company>()
                {
                    new Company()
                    {
                        Id = 1,
                        Name = "Restaurant Co.",
                        Description = "Restaurant Co is a company which drives to be the best. All of our restaurants are welcoming with a staff who are happy to make your time with us enjoyable. All of our food is made from fresh local ingredients and we have a whole host of diet options available.",
                        PhoneNo = "01429897987",
                        AddressStreet = "432 Industrial Estate",
                        AddressTown = "Hartlepool",
                        AddressCounty = "Cleveland",
                        AddressPostalCode = "TS248GX",
                        Email = "enquiries@restaurantco.co.uk",
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                companyData = Enumerable.Empty<Company>().AsQueryable();
            }

            Mock<DbSet<Company>> mockCompaniesSet = new Mock<DbSet<Company>>();
            mockCompaniesSet.As<IDbAsyncEnumerable<Company>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<Company>(companyData.GetEnumerator()));
            mockCompaniesSet.As<IQueryable<Company>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Company>(companyData.Provider));
            mockCompaniesSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Company>(companyData.Provider));
            mockCompaniesSet.As<IQueryable<Company>>().Setup(m => m.Expression).Returns(companyData.Expression);
            mockCompaniesSet.As<IQueryable<Company>>().Setup(m => m.ElementType).Returns(companyData.ElementType);
            mockCompaniesSet.As<IQueryable<Company>>().Setup(m => m.GetEnumerator()).Returns(companyData.GetEnumerator());
            mockCompaniesSet.Setup(m => m.Add(It.IsAny<Company>())).Returns((Company r) => r);

            return mockCompaniesSet;
        }

        private Mock<DbSet<Restaurant>> GetRestaurants(bool data = true)
        {
            IQueryable<Restaurant> restaurantData;

            if (data)
            {
                restaurantData = new List<Restaurant>()
                {
                    new Restaurant()
                    {
                        Id = 1,
                        Company_id = 1,
                        Name = "Restaurant 1",
                        PhoneNo = "01429354096",
                        AddressStreet = "21 Restaurant Road",
                        AddressTown = "Hartlepool",
                        AddressCounty = "Cleveland",
                        AddressPostalCode = "TS248GX",
                        Deleted = false
                    },
                    new Restaurant()
                    {
                        Id = 1,
                        Company_id = 1,
                        Name = "Restaurant 2",
                        PhoneNo = "01429409235",
                        AddressStreet = "45 Business Road",
                        AddressTown = "Newcastle",
                        AddressCounty = "Tyne and Wear",
                        AddressPostalCode = "NE11DF",
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                restaurantData = Enumerable.Empty<Restaurant>().AsQueryable();
            }

            Mock<DbSet<Restaurant>> mockRestaurantsSet = new Mock<DbSet<Restaurant>>();
            mockRestaurantsSet.As<IDbAsyncEnumerable<Restaurant>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<Restaurant>(restaurantData.GetEnumerator()));
            mockRestaurantsSet.As<IQueryable<Restaurant>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Restaurant>(restaurantData.Provider));
            mockRestaurantsSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Restaurant>(restaurantData.Provider));
            mockRestaurantsSet.As<IQueryable<Restaurant>>().Setup(m => m.Expression).Returns(restaurantData.Expression);
            mockRestaurantsSet.As<IQueryable<Restaurant>>().Setup(m => m.ElementType).Returns(restaurantData.ElementType);
            mockRestaurantsSet.As<IQueryable<Restaurant>>().Setup(m => m.GetEnumerator()).Returns(restaurantData.GetEnumerator());
            mockRestaurantsSet.Setup(m => m.Add(It.IsAny<Restaurant>())).Returns((Restaurant r) => r);

            return mockRestaurantsSet;
        }

        private Mock<DbSet<RestaurantMenuItem>> GetRestaurantMenuItems(bool data = true)
        {
            IQueryable<RestaurantMenuItem> menuData;

            if (data)
            {
                menuData = new List<RestaurantMenuItem>()
                {
                    new RestaurantMenuItem { Id = 1, MenuItem_id = 1, Restaurant_id = 1, Deleted = false },
                    new RestaurantMenuItem { Id = 2, MenuItem_id = 2, Restaurant_id = 1, Deleted = false },
                    new RestaurantMenuItem { Id = 3, MenuItem_id = 3, Restaurant_id = 1, Deleted = false },
                    new RestaurantMenuItem { Id = 4, MenuItem_id = 4, Restaurant_id = 1, Deleted = false }
                }.AsQueryable();
            }
            else
            {
                menuData = Enumerable.Empty<RestaurantMenuItem>().AsQueryable();
            }

            Mock<DbSet<RestaurantMenuItem>> mockMenuSet = new Mock<DbSet<RestaurantMenuItem>>();
            mockMenuSet.As<IDbAsyncEnumerable<RestaurantMenuItem>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<RestaurantMenuItem>(menuData.GetEnumerator()));
            mockMenuSet.As<IQueryable<RestaurantMenuItem>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<RestaurantMenuItem>(menuData.Provider));
            mockMenuSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<RestaurantMenuItem>(menuData.Provider));
            mockMenuSet.As<IQueryable<RestaurantMenuItem>>().Setup(m => m.Expression).Returns(menuData.Expression);
            mockMenuSet.As<IQueryable<RestaurantMenuItem>>().Setup(m => m.ElementType).Returns(menuData.ElementType);
            mockMenuSet.As<IQueryable<RestaurantMenuItem>>().Setup(m => m.GetEnumerator()).Returns(menuData.GetEnumerator());
            mockMenuSet.Setup(m => m.Add(It.IsAny<RestaurantMenuItem>())).Returns((RestaurantMenuItem r) => r);

            return mockMenuSet;
        }

        private Mock<DbSet<MenuItem>> GetMenuItems(bool data = true)
        {
            IQueryable<MenuItem> menuData;

            if (data)
            {
                menuData = new List<MenuItem>()
                {
                    new MenuItem { Id = 1, Name = "Tomato soup", Description = "A bowl of our delicious tomato soup", Price = Convert.ToDecimal(3.4500), Deleted = false },
                    new MenuItem { Id = 2, Name = "Fish and Chips", Description = "A fresh cod fillet served with thick cut chips and mushy peas", Price = Convert.ToDecimal(6.7800), Deleted = false },
                    new MenuItem { Id = 3, Name = "Chocolate Fudge Cake", Description = "A slice of our homemade chocolate fudge cake smothered in chocolate sauce with a side of ice cream", Price = Convert.ToDecimal(3.5900), Deleted = false },
                    new MenuItem { Id = 4, Name = "Coca Cola", Description = "A can of coca cola", Price = Convert.ToDecimal(0.6800), Deleted = false }
                }.AsQueryable();
            }
            else
            {
                menuData = Enumerable.Empty<MenuItem>().AsQueryable();
            }

            Mock<DbSet<MenuItem>> mockMenuSet = new Mock<DbSet<MenuItem>>();
            mockMenuSet.As<IDbAsyncEnumerable<MenuItem>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<MenuItem>(menuData.GetEnumerator()));
            mockMenuSet.As<IQueryable<MenuItem>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<MenuItem>(menuData.Provider));
            mockMenuSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<MenuItem>(menuData.Provider));
            mockMenuSet.As<IQueryable<MenuItem>>().Setup(m => m.Expression).Returns(menuData.Expression);
            mockMenuSet.As<IQueryable<MenuItem>>().Setup(m => m.ElementType).Returns(menuData.ElementType);
            mockMenuSet.As<IQueryable<MenuItem>>().Setup(m => m.GetEnumerator()).Returns(menuData.GetEnumerator());
            mockMenuSet.Setup(m => m.Add(It.IsAny<MenuItem>())).Returns((MenuItem r) => r);

            return mockMenuSet;
        }

        private Mock<DbSet<MenuItemDietInfo>> GetMenuItemDietInfo(bool dataAllowed = true)
        {
            IQueryable<MenuItemDietInfo> data;

            if (dataAllowed)
            {
                data = new List<MenuItemDietInfo>()
                {
                    new MenuItemDietInfo { Id = 1, MenuItem_id = 1, DietInfo_id = 1, Deleted = false }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<MenuItemDietInfo>().AsQueryable();
            }

            Mock<DbSet<MenuItemDietInfo>> dataSet = new Mock<DbSet<MenuItemDietInfo>>();
            dataSet.As<IDbAsyncEnumerable<MenuItemDietInfo>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<MenuItemDietInfo>(data.GetEnumerator()));
            dataSet.As<IQueryable<MenuItemDietInfo>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<MenuItemDietInfo>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<MenuItemDietInfo>(data.Provider));
            dataSet.As<IQueryable<MenuItemDietInfo>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<MenuItemDietInfo>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<MenuItemDietInfo>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<MenuItemDietInfo>())).Returns((MenuItemDietInfo r) => r);

            return dataSet;
        }

        private Mock<DbSet<DietInfo>> GetDietInfo(bool dataAllowed = true)
        {
            IQueryable<DietInfo> data;

            if (dataAllowed)
            {
                data = new List<DietInfo>()
                {
                    new DietInfo { Id = 1, Name = "Vegetarian", Deleted = false },
                    new DietInfo { Id = 2, Name = "Vegan", Deleted = false },
                    new DietInfo { Id = 3, Name = "Contains Nuts", Deleted = false }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<DietInfo>().AsQueryable();
            }

            Mock<DbSet<DietInfo>> dataSet = new Mock<DbSet<DietInfo>>();
            dataSet.As<IDbAsyncEnumerable<DietInfo>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<DietInfo>(data.GetEnumerator()));
            dataSet.As<IQueryable<DietInfo>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<DietInfo>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<DietInfo>(data.Provider));
            dataSet.As<IQueryable<DietInfo>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<DietInfo>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<DietInfo>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<DietInfo>())).Returns((DietInfo r) => r);

            return dataSet;
        }

        private Mock<DbSet<MenuItemType>> GetMenuItemTypes(bool dataAllowed = true)
        {
            IQueryable<MenuItemType> data;

            if (dataAllowed)
            {
                data = new List<MenuItemType>()
                {
                    new MenuItemType { Id = 1, MenuItem_id = 1, Type_id = 1, Deleted = false },
                    new MenuItemType { Id = 2, MenuItem_id = 2, Type_id = 2, Deleted = false },
                    new MenuItemType { Id = 3, MenuItem_id = 3, Type_id = 3, Deleted = false }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<MenuItemType>().AsQueryable();
            }

            Mock<DbSet<MenuItemType>> dataSet = new Mock<DbSet<MenuItemType>>();
            dataSet.As<IDbAsyncEnumerable<MenuItemType>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<MenuItemType>(data.GetEnumerator()));
            dataSet.As<IQueryable<MenuItemType>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<MenuItemType>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<MenuItemType>(data.Provider));
            dataSet.As<IQueryable<MenuItemType>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<MenuItemType>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<MenuItemType>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<MenuItemType>())).Returns((MenuItemType r) => r);

            return dataSet;
        }

        private Mock<DbSet<DatabaseContext.Data.Type>> GetTypes(bool dataAllowed = true)
        {
            IQueryable<DatabaseContext.Data.Type> data;

            if (dataAllowed)
            {
                data = new List<DatabaseContext.Data.Type>()
                {
                    new DatabaseContext.Data.Type { Id = 1, Name = "Starter", Deleted = false },
                    new DatabaseContext.Data.Type { Id = 2, Name = "Main", Deleted = false },
                    new DatabaseContext.Data.Type { Id = 3, Name = "Dessert", Deleted = false }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<DatabaseContext.Data.Type>().AsQueryable();
            }

            Mock<DbSet<DatabaseContext.Data.Type>> dataSet = new Mock<DbSet<DatabaseContext.Data.Type>>();
            dataSet.As<IDbAsyncEnumerable<DatabaseContext.Data.Type>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<DatabaseContext.Data.Type>(data.GetEnumerator()));
            dataSet.As<IQueryable<DatabaseContext.Data.Type>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<DatabaseContext.Data.Type>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<DatabaseContext.Data.Type>(data.Provider));
            dataSet.As<IQueryable<DatabaseContext.Data.Type>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<DatabaseContext.Data.Type>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<DatabaseContext.Data.Type>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<DatabaseContext.Data.Type>())).Returns((DatabaseContext.Data.Type r) => r);

            return dataSet;
        }

        private Mock<DbSet<Table>> GetTables(bool dataAllowed = true)
        {
            IQueryable<Table> data;

            if (dataAllowed)
            {
                data = new List<Table>()
                {
                    new Table { Id = 1, Restaurant_id = 1, NoSeats = 4, TableNo = 1, Active = true, Deleted = false },
                    new Table { Id = 2, Restaurant_id = 1, NoSeats = 6, TableNo = 2, Active = true, Deleted = false }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<Table>().AsQueryable();
            }

            Mock<DbSet<Table>> dataSet = new Mock<DbSet<Table>>();
            dataSet.As<IDbAsyncEnumerable<Table>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<Table>(data.GetEnumerator()));
            dataSet.As<IQueryable<Table>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Table>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Table>(data.Provider));
            dataSet.As<IQueryable<Table>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<Table>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<Table>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<Table>())).Returns((Table r) => r);

            return dataSet;
        }

        private Mock<DbSet<Booking>> GetBookings(bool dataAllowed = true)
        {
            IQueryable<Booking> data;

            if (dataAllowed)
            {
                data = new List<Booking>()
                {
                    new Booking
                    {
                        Id = 1,
                        Customer_id = 1,
                        Restaurant_id = 1,
                        BookingDate = DateTime.Now,
                        BookingMadeDate = DateTime.Now,
                        BookingMadeTime = TimeSpan.MinValue,
                        NoCustomers = 4,
                        StartTime = TimeSpan.MinValue,
                        EndTime = TimeSpan.MinValue.Add(TimeSpan.FromHours(1)),
                        PaymentTotal = Convert.ToDecimal(6.7800),
                        PaymentMadeDate = DateTime.Now,
                        Cancelled = false,
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<Booking>().AsQueryable();
            }

            Mock<DbSet<Booking>> dataSet = new Mock<DbSet<Booking>>();
            dataSet.As<IDbAsyncEnumerable<Booking>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<Booking>(data.GetEnumerator()));
            dataSet.As<IQueryable<Booking>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Booking>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Booking>(data.Provider));
            dataSet.As<IQueryable<Booking>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<Booking>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<Booking>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<Booking>())).Returns((Booking r) => r);

            return dataSet;
        }

        private Mock<DbSet<TableBooking>> GetTableBookings(bool dataAllowed = true)
        {
            IQueryable<TableBooking> data;

            if (dataAllowed)
            {
                data = new List<TableBooking>()
                {
                    new TableBooking
                    {
                        Id = 1,
                        Booking_id = 1,
                        Table_id = 1,
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<TableBooking>().AsQueryable();
            }

            Mock<DbSet<TableBooking>> dataSet = new Mock<DbSet<TableBooking>>();
            dataSet.As<IDbAsyncEnumerable<TableBooking>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<TableBooking>(data.GetEnumerator()));
            dataSet.As<IQueryable<TableBooking>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<TableBooking>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<TableBooking>(data.Provider));
            dataSet.As<IQueryable<TableBooking>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<TableBooking>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<TableBooking>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<TableBooking>())).Returns((TableBooking r) => r);

            return dataSet;
        }

        private Mock<DbSet<BookingMenuItem>> GetBookingMenuItems(bool dataAllowed = true)
        {
            IQueryable<BookingMenuItem> data;

            if (dataAllowed)
            {
                data = new List<BookingMenuItem>()
                {
                    new BookingMenuItem
                    {
                        Id = 1,
                        Booking_id = 1,
                        MenuItem_id = 2,
                        Quantity = 1,
                        Total = Convert.ToDecimal(6.7800),
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<BookingMenuItem>().AsQueryable();
            }

            Mock<DbSet<BookingMenuItem>> dataSet = new Mock<DbSet<BookingMenuItem>>();
            dataSet.As<IDbAsyncEnumerable<BookingMenuItem>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<BookingMenuItem>(data.GetEnumerator()));
            dataSet.As<IQueryable<BookingMenuItem>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<BookingMenuItem>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<BookingMenuItem>(data.Provider));
            dataSet.As<IQueryable<BookingMenuItem>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<BookingMenuItem>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<BookingMenuItem>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<BookingMenuItem>())).Returns((BookingMenuItem r) => r);

            return dataSet;
        }

        private Mock<DbSet<PaymentMethod>> GetPaymentMethods(bool dataAllowed = true)
        {
            IQueryable<PaymentMethod> data;

            if (dataAllowed)
            {
                data = new List<PaymentMethod>()
                {
                    new PaymentMethod
                    {
                        Id = 1,
                        Name = "Card",
                        Active = true,
                        Deleted = false
                    },
                    new PaymentMethod
                    {
                        Id = 2,
                        Name = "PayPal",
                        Active = true,
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<PaymentMethod>().AsQueryable();
            }

            Mock<DbSet<PaymentMethod>> dataSet = new Mock<DbSet<PaymentMethod>>();
            dataSet.As<IDbAsyncEnumerable<PaymentMethod>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<PaymentMethod>(data.GetEnumerator()));
            dataSet.As<IQueryable<PaymentMethod>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<PaymentMethod>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<PaymentMethod>(data.Provider));
            dataSet.As<IQueryable<PaymentMethod>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<PaymentMethod>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<PaymentMethod>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<PaymentMethod>())).Returns((PaymentMethod r) => r);

            return dataSet;
        }

        private Mock<DbSet<Payment>> GetPayments(bool dataAllowed = true)
        {
            IQueryable<Payment> data;

            if (dataAllowed)
            {
                data = new List<Payment>()
                {
                    new Payment
                    {
                        Id = 1,
                        Booking_id = 1,
                        Customer_id = 1,
                        PaymentMethod_id = 2,
                        Amount = Convert.ToDecimal(6.7800),
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<Payment>().AsQueryable();
            }

            Mock<DbSet<Payment>> dataSet = new Mock<DbSet<Payment>>();
            dataSet.As<IDbAsyncEnumerable<Payment>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<Payment>(data.GetEnumerator()));
            dataSet.As<IQueryable<Payment>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Payment>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Payment>(data.Provider));
            dataSet.As<IQueryable<Payment>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<Payment>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<Payment>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<Payment>())).Returns((Payment r) => r);

            return dataSet;
        }

        private Mock<DbSet<Customer>> GetCustomers(bool dataAllowed = true)
        {
            IQueryable<Customer> data;

            if (dataAllowed)
            {
                data = new List<Customer>()
                {
                    new Customer
                    {
                        Id = 1,
                        UserName = "user",
                        OwinUserId = "5844ad61-a3b1-44a5-ba10-aaa752f828c6",
                        Title = "Mr",
                        Forename = "User",
                        Surname = "Userson",
                        Dob = DateTime.Now,
                        AddressStreet = "56 Users Road",
                        AddressTown = "User Town",
                        AddressCounty = "User County",
                        AddressPostalCode = "TS24 8HG",
                        HomePhoneNo = "07423536456",
                        MobilePhoneNo = "07423536456",
                        Email = "user@user.com",
                        Deleted = false
                    }
                }.AsQueryable();
            }
            else
            {
                data = Enumerable.Empty<Customer>().AsQueryable();
            }

            Mock<DbSet<Customer>> dataSet = new Mock<DbSet<Customer>>();
            dataSet.As<IDbAsyncEnumerable<Customer>>().Setup(m => m.GetAsyncEnumerator()).Returns(new TestDbAsyncEnumerator<Customer>(data.GetEnumerator()));
            dataSet.As<IQueryable<Customer>>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Customer>(data.Provider));
            dataSet.As<IQueryable>().Setup(m => m.Provider).Returns(new TestDbAsyncQueryProvider<Customer>(data.Provider));
            dataSet.As<IQueryable<Customer>>().Setup(m => m.Expression).Returns(data.Expression);
            dataSet.As<IQueryable<Customer>>().Setup(m => m.ElementType).Returns(data.ElementType);
            dataSet.As<IQueryable<Customer>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
            dataSet.Setup(m => m.Add(It.IsAny<Customer>())).Returns((Customer r) => r);

            return dataSet;
        }

        public Mock<BookingSystemDb> Context()
        {
            Mock<BookingSystemDb> mockDb = new Mock<BookingSystemDb>();
            mockDb.Setup(m => m.Companies).Returns(Companies.Object);
            mockDb.Setup(m => m.Restaurants).Returns(Restaurants.Object);
            mockDb.Setup(m => m.RestaurantMenuItems).Returns(RestaurantMenuItems.Object);
            mockDb.Setup(m => m.MenuItems).Returns(MenuItems.Object);
            mockDb.Setup(m => m.MenuItemDietInfoes).Returns(MenuItemDietInfos.Object);
            mockDb.Setup(m => m.DietInfoes).Returns(DietInfos.Object);
            mockDb.Setup(m => m.MenuItemTypes).Returns(MenuItemTypes.Object);
            mockDb.Setup(m => m.Types).Returns(Types.Object);
            mockDb.Setup(m => m.Tables).Returns(Tables.Object);
            mockDb.Setup(m => m.TableBookings).Returns(TableBookings.Object);
            mockDb.Setup(m => m.Bookings).Returns(Bookings.Object);
            mockDb.Setup(m => m.BookingMenuItems).Returns(BookingMenuItems.Object);
            mockDb.Setup(m => m.Payments).Returns(Payments.Object);
            mockDb.Setup(m => m.PaymentMethods).Returns(PaymentMethods.Object);
            mockDb.Setup(m => m.Customers).Returns(Customers.Object);

            mockDb.Setup(m => m.SetModified(It.IsAny<object>())).Callback((object entity) => { });

            return mockDb;
        }
        
    }
}
