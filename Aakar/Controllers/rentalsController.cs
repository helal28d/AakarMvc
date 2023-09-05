using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Aakar.Models;

namespace Aakar.Controllers
{
    public class rentalsController : Controller
    {
        private AakarEntities1 db = new AakarEntities1();

        // GET: rentals
        public ActionResult Index()
        {
            var rentals = db.rentals.Include(r => r.apartment).Include(r => r.user);
            return View(rentals.ToList());
        }

        // GET: rentals/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            rental rental = db.rentals.Find(id);
            if (rental == null)
            {
                return HttpNotFound();
            }
            return View(rental);
        }

        // GET: rentals/Create
        public ActionResult Create()
        {
            ViewBag.apartment_id = new SelectList(db.apartments, "id", "country");
            ViewBag.user_id = new SelectList(db.users, "id", "user_name");
            return View();
        }

        // POST: rentals/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,user_id,apartment_id,rental_date,rental_period,price")] rental rental)
        {
            if (ModelState.IsValid)
            {
                db.rentals.Add(rental);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.apartment_id = new SelectList(db.apartments, "id", "country", rental.apartment_id);
            ViewBag.user_id = new SelectList(db.users, "id", "user_name", rental.user_id);
            return View(rental);
        }

        // GET: rentals/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            rental rental = db.rentals.Find(id);
            if (rental == null)
            {
                return HttpNotFound();
            }
            ViewBag.apartment_id = new SelectList(db.apartments, "id", "country", rental.apartment_id);
            ViewBag.user_id = new SelectList(db.users, "id", "user_name", rental.user_id);
            return View(rental);
        }

        // POST: rentals/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,user_id,apartment_id,rental_date,rental_period,price")] rental rental)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rental).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.apartment_id = new SelectList(db.apartments, "id", "country", rental.apartment_id);
            ViewBag.user_id = new SelectList(db.users, "id", "user_name", rental.user_id);
            return View(rental);
        }

        // GET: rentals/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            rental rental = db.rentals.Find(id);
            if (rental == null)
            {
                return HttpNotFound();
            }
            return View(rental);
        }

        // POST: rentals/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            rental rental = db.rentals.Find(id);
            db.rentals.Remove(rental);
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
