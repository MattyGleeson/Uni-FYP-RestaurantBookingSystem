using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibBookingService.Dtos
{
    public class Image : Dto
    {
        public virtual string Name { get; set; }

        public virtual long Size { get; set; }

        public virtual string Type { get; set; }

        public virtual byte[] FileContent { get; set; }

        public virtual DateTime CreatedOn { get; set; }

        public virtual DateTime? ModifiedOn { get; set; }

        public virtual int Source { get; set; }
    }
}
