using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseContext.Data.Core
{
    public class GenericDbContext : DbContext
    {
        public GenericDbContext(string nameOrConnectionString) : base(nameOrConnectionString)
        {
        }

        public virtual void SetModified(object entity)
        {
            Entry(entity).State = EntityState.Modified;
        }
    }
}
