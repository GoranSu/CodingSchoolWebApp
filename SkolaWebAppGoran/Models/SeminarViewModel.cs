using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SkolaWebAppGoran.Models
{
    public class SeminarViewModel
    {
        public int IdSeminar { get; set; }

        public string Naziv { get; set; }

        public string Opis { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime Datum { get; set; }

        public bool? Popunjen { get; set; }

        public int? SelectedZaposlenikId { get; set; }


        //Lista zaposlenika za dropdown menu u viewu
        public SelectList Zaposlenici { get; set; }
    }
}