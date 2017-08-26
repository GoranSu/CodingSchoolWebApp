namespace SkolaWebAppGoran.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Zaposlenik")]
    public partial class Zaposlenik
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Zaposlenik()
        {
            Seminars = new HashSet<Seminar>();
        }

        [Key]
        public int IdZaposlenik { get; set; }

        [Required]
        [StringLength(200)]
        public string Ime { get; set; }

        [Required]
        [StringLength(200)]
        public string Prezime { get; set; }

        [Required]
        [StringLength(200)]
        public string KorisnickoIme { get; set; }

        [Required]
        [StringLength(200)]
        public string Password { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Seminar> Seminars { get; set; }
    }
}
