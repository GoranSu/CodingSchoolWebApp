namespace SkolaWebAppGoran.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Seminar")]
    public partial class Seminar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Seminar()
        {
            Predbiljezbas = new HashSet<Predbiljezba>();
        }

        [Key]
        public int IdSeminar { get; set; }

        [Required]
        [StringLength(50)]
        public string Naziv { get; set; }

        public string Opis { get; set; }

        [Column(TypeName = "date")]
        public DateTime Datum { get; set; }

        public bool? Popunjen { get; set; }

        public int? IdZaposlenik { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Predbiljezba> Predbiljezbas { get; set; }

        public virtual Zaposlenik Zaposlenik { get; set; }
    }
}
