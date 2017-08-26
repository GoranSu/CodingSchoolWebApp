namespace SkolaWebAppGoran.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SkolaWebApp : DbContext
    {
        public SkolaWebApp()
            : base("name=SkolaWebApp")
        {
        }

        public virtual DbSet<Predbiljezba> Predbiljezbas { get; set; }
        public virtual DbSet<Seminar> Seminars { get; set; }
        public virtual DbSet<Zaposlenik> Zaposleniks { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Predbiljezba>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Predbiljezba>()
                .Property(e => e.Telefon)
                .IsUnicode(false);

            modelBuilder.Entity<Predbiljezba>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<Seminar>()
                .Property(e => e.Opis)
                .IsUnicode(false);

            modelBuilder.Entity<Seminar>()
                .HasMany(e => e.Predbiljezbas)
                .WithRequired(e => e.Seminar)
                .WillCascadeOnDelete(false);
        }
    }
}
