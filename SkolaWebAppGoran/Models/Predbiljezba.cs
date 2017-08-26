namespace SkolaWebAppGoran.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Predbiljezba")]
    public partial class Predbiljezba
    {
        [Key]
        public int IdPredbiljezba { get; set; }

        [Column(TypeName = "date")]
        public DateTime Datum { get; set; }

        [Required]
        [StringLength(200)]
        public string Ime { get; set; }

        [Required]
        [StringLength(200)]
        public string Prezime { get; set; }

        [Required]
        [StringLength(200)]
        public string Adresa { get; set; }

        [Required]
        [StringLength(200)]
        public string Email { get; set; }

        [Required]
        [StringLength(25)]
        public string Telefon { get; set; }

        [StringLength(20)]
        public string Status { get; set; }

        public int IdSeminar { get; set; }

        public virtual Seminar Seminar { get; set; }
    }
}
