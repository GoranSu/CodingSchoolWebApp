using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SkolaWebAppGoran.Models
{
    public class PredbiljezbaViewModel
    {
        public int IdPredbiljezba { get; set; }
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime Datum { get; set; }

        public string Ime { get; set; }

        public string Prezime { get; set; }

        public string Adresa { get; set; }

        public string Email { get; set; }

        public string Telefon { get; set; }

        public string Status { get; set; }

        public int IdSeminar { get; set; }

        public string NazivSeminara { get; set; }
    }
}