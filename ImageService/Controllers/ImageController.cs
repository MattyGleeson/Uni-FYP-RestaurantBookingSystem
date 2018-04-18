using DatabaseContext.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ImageService.Controllers
{
    public class ImageController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public ImageController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public ImageController(BookingSystemDb db)
        {
            this._db = db;
        }

        [Route("UploadMenuItemImage")]
        [HttpPost]
        public async Task<HttpResponseMessage> UploadMenuItemImage(LibBookingService.Dtos.Image image)
        {
            try
            {
                if (_db.MenuItemImages.Where(m => m.Id == image.Source && !m.Deleted).Count() > 0)
                {
                    Image img = await _db.MenuItemImages.Where(m => m.Id == image.Source && !m.Deleted).Select(m => m.Image).Where(m => !m.Deleted).FirstOrDefaultAsync();

                    img.Name = image.Name;
                    img.Size = image.Size;
                    img.Type = image.Type;
                    img.FileContent = image.FileContent;
                    img.ModifiedOn = image.CreatedOn;

                    _db.SetModified(img);
                    await _db.SaveChangesAsync();

                    return Request.CreateResponse(HttpStatusCode.OK, new LibBookingService.Dtos.Image
                    {
                        Id = img.Id,
                        Name = img.Name,
                        Size = img.Size,
                        Type = img.Type,
                        FileContent = img.FileContent,
                        CreatedOn = img.CreatedOn,
                        ModifiedOn = img.ModifiedOn ?? null
                    });
                }
                else
                {
                    Image img = _db.Images.Add(new Image
                    {
                        Name = image.Name,
                        Size = image.Size,
                        Type = image.Type,
                        FileContent = image.FileContent,
                        CreatedOn = image.CreatedOn
                    });
                    await _db.SaveChangesAsync();

                    _db.MenuItemImages.Add(new MenuItemImage
                    {
                        Image_id = img.Id,
                        MenuItem_id = image.Source
                    });
                    await _db.SaveChangesAsync();

                    return Request.CreateResponse(HttpStatusCode.OK, new LibBookingService.Dtos.Image
                    {
                        Id = img.Id,
                        Name = img.Name,
                        Size = img.Size,
                        Type = img.Type,
                        FileContent = img.FileContent,
                        CreatedOn = img.CreatedOn,
                        ModifiedOn = img.ModifiedOn ?? null
                    });
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        [Route("LoadImage/{id:int}")]
        [HttpGet]
        public async Task<HttpResponseMessage> LoadImage(int id)
        {
            Image res = await _db.Images.Where(i => i.Id == id && !i.Deleted).FirstOrDefaultAsync();

            if (res == null)
                return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Image Found With ID");

            LibBookingService.Dtos.Image image = new LibBookingService.Dtos.Image
            {
                Id = res.Id,
                Name = res.Name,
                Size = res.Size,
                Type = res.Type,
                FileContent = res.FileContent,
                CreatedOn = res.CreatedOn,
                ModifiedOn = res.ModifiedOn ?? null
            };

            return Request.CreateResponse(HttpStatusCode.OK, image);
        }
    }
}
