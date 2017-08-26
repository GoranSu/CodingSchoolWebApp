using SkolaWebAppGoran.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace SkolaWebAppGoran.Controllers
{
    public class HomeController : Controller
    {
        SkolaWebApp _db = new SkolaWebApp();

        //Dio dostupan bez autorizacije
        #region Anonymus
        //Dozvoljava anonimnim posjetiteljima pregled dostupnih seminara i link na predbilježbu 
        #region Index
        public ActionResult Index(string searchString)
        {
            IQueryable<Seminar> seminariQueryable = _db.Seminars.AsQueryable();

            if (!String.IsNullOrEmpty(searchString))
            {
                seminariQueryable = seminariQueryable.Where(s => s.Naziv.Contains(searchString));
            }

            List<Seminar> seminari = seminariQueryable.ToList();

            return View(seminari.Where(p => p.Popunjen == false));
        }
        #endregion

        //Dozvoljava anonimnim posjetiteljima da naprave predbilježbu na željeni seminar
        #region Predbilježbe
        public ActionResult Predbiljezba(int seminarId)
        {
            Seminar seminar = _db.Seminars.Where(s => s.IdSeminar == seminarId).FirstOrDefault();

            PredbiljezbaViewModel novaPredbiljezba = new PredbiljezbaViewModel { IdSeminar = seminarId };

            Seminar dbSeminar = _db.Seminars.Find(novaPredbiljezba.IdSeminar);

            novaPredbiljezba.NazivSeminara = dbSeminar.Naziv;

            return View(novaPredbiljezba);
        }

        [HttpPost]
        public ActionResult Predbiljezba(Predbiljezba novaPredbiljezba)
        {
            novaPredbiljezba.Datum = DateTime.Now;

            if (ModelState.IsValid)
            {
                _db.Predbiljezbas.Add(novaPredbiljezba);
                _db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        #endregion

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }
        #endregion

        //Edit seminara za zaposlenike
        #region Edit Seminar
        [Authorize(Roles = "Admin")]
        public ActionResult SeminariEdit(string searchString)
        {
            IQueryable<Seminar> seminariQueryable = _db.Seminars.AsQueryable();

            if (!String.IsNullOrEmpty(searchString))
            {
                seminariQueryable = seminariQueryable
                    .Where(s => s.Naziv.Contains(searchString));
            }

            List<Seminar> seminari = seminariQueryable.ToList();

            return View(seminari);
        }

        //Kreiranje novog seminara za zaposlenike
        public ActionResult Create()
        {
            List<Zaposlenik> zaposlenici = _db.Zaposleniks.ToList();

            SeminarViewModel noviSeminar = new SeminarViewModel() { Datum = DateTime.Now };

            noviSeminar.Zaposlenici = new SelectList(zaposlenici, "IdZaposlenik", "Ime");

            return View(noviSeminar);
        }
        [HttpPost]
        public ActionResult Create(SeminarViewModel noviSeminar)
        {
            Seminar seminar = new Seminar();

            seminar.IdSeminar = 0;
            seminar.Datum = noviSeminar.Datum;
            seminar.IdZaposlenik = noviSeminar.SelectedZaposlenikId;
            seminar.Naziv = noviSeminar.Naziv;
            seminar.Opis = noviSeminar.Opis;
            seminar.Popunjen = noviSeminar.Popunjen;

            if (ModelState.IsValid)
            {
                _db.Seminars.Add(seminar);
                _db.SaveChanges();
            }

            return RedirectToAction("SeminariEdit");
        }

        //Edit seminara za zaposlenike
        public ActionResult EditSeminar(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seminar seminar = _db.Seminars.Find(id);

            List<Zaposlenik> zaposlenici = _db.Zaposleniks.ToList();

            SeminarViewModel editSeminar = new SeminarViewModel()
            {
                IdSeminar = seminar.IdSeminar,
                Naziv = seminar.Naziv,
                Datum = seminar.Datum,
                Opis = seminar.Opis,
                Popunjen = seminar.Popunjen,
                SelectedZaposlenikId = seminar.IdZaposlenik
            };

            editSeminar.Zaposlenici = new SelectList(zaposlenici, "IdZaposlenik", "Ime");
            
            if (seminar == null)
            {
                return HttpNotFound();
            }

            return View(editSeminar);
        }
        [HttpPost]
        public ActionResult EditSeminar(SeminarViewModel editSeminar)
        {
            if (ModelState.IsValid)
            {
                Seminar editiraniSeminar = new Seminar
                {
                    IdSeminar = editSeminar.IdSeminar,
                    Naziv = editSeminar.Naziv,
                    Datum = editSeminar.Datum,
                    Opis = editSeminar.Opis,
                    Popunjen = editSeminar.Popunjen,
                    IdZaposlenik = editSeminar.SelectedZaposlenikId
                };

                _db.Entry(editiraniSeminar).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction("SeminariEdit");
            }
            return RedirectToAction("SeminariEdit");
        }

        //Delete seminara za zaposlenike
        public ActionResult SeminarDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seminar seminar = _db.Seminars.Find(id);
            if (seminar == null)
            {
                return HttpNotFound();
            }
            return View(seminar);
        }
        [HttpPost]
        public ActionResult SeminarDelete(int id)
        {
            Seminar seminar = _db.Seminars.Find(id);
            _db.Seminars.Remove(seminar);
            _db.SaveChanges();

            return RedirectToAction("SeminariEdit");
        }
        #endregion
       
        //Edit Predbiljezbi za zaposlenike
        #region Edit Predbiljezbe
        [Authorize(Roles ="Admin")]
        public ActionResult PredbiljezbaEdit(string searchString, string searchStatus)
        {
            IQueryable<Predbiljezba> predbiljezbeQueryable = _db.Predbiljezbas.AsQueryable();

            if (!String.IsNullOrEmpty(searchString))
            {
                predbiljezbeQueryable = predbiljezbeQueryable
                    .Where(s => s.Seminar.Naziv.Contains(searchString)
                              || s.Status.Contains(searchString)
                              || s.Ime.Contains(searchString)
                              || s.Prezime.Contains(searchString)
                              || s.Adresa.Contains(searchString)
                              || s.Email.Contains(searchString)
                              || s.Telefon.Contains(searchString));
            }

            List<Predbiljezba> predbiljezbe = predbiljezbeQueryable.ToList();

            return View(predbiljezbe);
        }

        //Edit predbiljezbi za zaposlenike
        public ActionResult EditPredbiljezba(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Predbiljezba predbiljezba = _db.Predbiljezbas.Find(id);

            if (predbiljezba == null)
            {
                return HttpNotFound();
            }

            Seminar dbSeminar = _db.Seminars.Find(predbiljezba.IdSeminar);

            PredbiljezbaViewModel editPredbiljezba = new PredbiljezbaViewModel();
            editPredbiljezba.NazivSeminara = dbSeminar.Naziv;
            editPredbiljezba.Datum = predbiljezba.Datum;
            editPredbiljezba.Email = predbiljezba.Email;
            editPredbiljezba.Adresa = predbiljezba.Adresa;
            editPredbiljezba.IdPredbiljezba = predbiljezba.IdPredbiljezba;
            editPredbiljezba.IdSeminar = predbiljezba.IdSeminar;
            editPredbiljezba.Ime = predbiljezba.Ime;
            editPredbiljezba.Prezime = predbiljezba.Prezime;
            editPredbiljezba.Telefon = predbiljezba.Telefon;
            editPredbiljezba.Status = predbiljezba.Status;

            return View(editPredbiljezba);
        }

        [HttpPost]
        public ActionResult EditPredbiljezba(PredbiljezbaViewModel editPredbiljezba)
        {
            if (ModelState.IsValid)
            {
                Predbiljezba editiranaPredbiljezba = new Predbiljezba();

                editiranaPredbiljezba.IdPredbiljezba = editPredbiljezba.IdPredbiljezba;
                editiranaPredbiljezba.IdSeminar = editPredbiljezba.IdSeminar;
                editiranaPredbiljezba.Datum = editPredbiljezba.Datum;
                editiranaPredbiljezba.Ime = editPredbiljezba.Ime;
                editiranaPredbiljezba.Prezime = editPredbiljezba.Prezime;
                editiranaPredbiljezba.Telefon = editPredbiljezba.Telefon;
                editiranaPredbiljezba.Adresa = editPredbiljezba.Adresa;
                editiranaPredbiljezba.Email = editPredbiljezba.Email;
                editiranaPredbiljezba.Status = editPredbiljezba.Status;

                _db.Entry(editiranaPredbiljezba).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction("PredbiljezbaEdit");
            }
            return RedirectToAction("PredbiljezbaEdit");
        }

        //Nikada brisati podatke iz baze, eventualno filtirati da se ne prikazuju

        //public ActionResult PredbiljezbaDelete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Predbiljezba predbiljezba = _db.Predbiljezbas.Find(id);
        //    if (predbiljezba == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(predbiljezba);
        //}
        //[HttpPost]
        //public ActionResult PredbiljezbaDelete(int id)
        //{
        //    Predbiljezba predbiljezba = _db.Predbiljezbas.Find(id);
        //    _db.Predbiljezbas.Remove(predbiljezba);
        //    _db.SaveChanges();

        //    return RedirectToAction("PredbiljezbaEdit");
        //}
    
        #endregion

    }
}