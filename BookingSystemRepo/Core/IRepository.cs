﻿using LibBookingService;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BookingSystemRepo
{
    public interface IRepository<T> where T : Dto
    {
        Task<IEnumerable<T>> Get();

        Task<T> FindById(int id);

        Task<T> Create(T model);

        Task<T> Update(T model);

        Task<bool> Delete(int id);
    }
}
