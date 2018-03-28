using LibBookingService;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BookingSystemApp.Repo.Core
{
    public interface IRepository<T> where T : Dto
    {
        IEnumerable<T> Get();

        T FindById(int id);

        T Create(T model);

        T Update(T model);

        bool Delete(int id);
    }
}
