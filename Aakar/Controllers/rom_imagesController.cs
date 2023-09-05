using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Aakar.Models;
using System.IO;

namespace Aakar.Controllers
{
    public class rom_imagesController : Controller
    {
        private AakarEntities1 db = new AakarEntities1();

        // GET: rom_images
        public ActionResult Index(int? id)
        {
          
            return PartialView(db.rom_images.Where(x => x.apart_id == id).ToList());
        }
        [HttpPost]
        public ActionResult Index(HttpPostedFileBase postedFile)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(postedFile.InputStream))
            {
                bytes = br.ReadBytes(postedFile.ContentLength);
            }
             
            db.rom_images.Add(new rom_images
            {
                //Name = Path.GetFileName(postedFile.FileName),
                
             image = bytes
            });
            
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        // GET: rom_images/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            rom_images rom_images = db.rom_images.Find(id);
            if (rom_images == null)
            {
                return HttpNotFound();
            }
            return View(rom_images);
        }

        // GET: rom_images/Create
        public ActionResult Create(int? id)
        {
            ViewBag.apart_id = id;
            return View();
        }

        // POST: rom_images/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,image,apart_id")] rom_images rom_images, HttpPostedFileBase postedFile)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(postedFile.InputStream))
            {
                bytes = br.ReadBytes(postedFile.ContentLength);
            }
           rom_images.image = bytes;
            if (ModelState.IsValid)
            {
                db.rom_images.Add(rom_images);
                db.SaveChanges();
                return RedirectToAction("Index",rom_images.apart_id);
            }

            ViewBag.apart_id = new SelectList(db.apartments, "id", "country", rom_images.apart_id);
            return View(rom_images);
        }

        // GET: rom_images/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            rom_images rom_images = db.rom_images.Find(id);
            if (rom_images == null)
            {
                return HttpNotFound();
            }
            ViewBag.apart_id = new SelectList(db.apartments, "id", "country", rom_images.apart_id);
            return View(rom_images);
        }

        // POST: rom_images/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,image,apart_id")] rom_images rom_images)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rom_images).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.apart_id = new SelectList(db.apartments, "id", "country", rom_images.apart_id);
            return View(rom_images);
        }

        // GET: rom_images/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            rom_images rom_images = db.rom_images.Find(id);
            if (rom_images == null)
            {
                return HttpNotFound();
            }
            return View(rom_images);
        }

        // POST: rom_images/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            rom_images rom_images = db.rom_images.Find(id);
            db.rom_images.Remove(rom_images);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
