using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace pks2;

public partial class Pks2Context : DbContext
{
    public Pks2Context()
    {
    }

    public Pks2Context(DbContextOptions<Pks2Context> options)
        : base(options)
    {
    }

    public virtual DbSet<BuildingMaterial> BuildingMaterials { get; set; }

    public virtual DbSet<District> Districts { get; set; }

    public virtual DbSet<Mark> Marks { get; set; }

    public virtual DbSet<MarksCriteria> MarksCriterias { get; set; }

    public virtual DbSet<Property> Properties { get; set; }

    public virtual DbSet<Rieltor> Rieltors { get; set; }

    public virtual DbSet<Selling> Sellings { get; set; }

    public virtual DbSet<Typess> Typesses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)

        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=DATABASENAME;Username=postgres;Password=PASSOWRD", x => x.UseNodaTime());

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BuildingMaterial>(entity =>
        {
            entity.HasKey(e => e.MaterialCode).HasName("building_materials_pkey");

            entity.ToTable("building_materials");

            entity.Property(e => e.MaterialCode)
                .ValueGeneratedNever()
                .HasColumnName("material_code");
            entity.Property(e => e.MaterialName).HasColumnName("material_name");
        });

        modelBuilder.Entity<District>(entity =>
        {
            entity.HasKey(e => e.DistrictCode).HasName("districts_pkey");

            entity.ToTable("districts");

            entity.Property(e => e.DistrictCode)
                .ValueGeneratedNever()
                .HasColumnName("district_code");
            entity.Property(e => e.DistrictName).HasColumnName("district_name");
        });

        modelBuilder.Entity<Mark>(entity =>
        {
            entity.HasKey(e => e.MarkCode).HasName("marks_pkey");

            entity.ToTable("marks");

            entity.Property(e => e.MarkCode)
                .ValueGeneratedNever()
                .HasColumnName("mark_code");
            entity.Property(e => e.CriteriaCode).HasColumnName("criteria_code");
            entity.Property(e => e.DateOfMark).HasColumnName("date_of_mark");
            entity.Property(e => e.Mark1).HasColumnName("mark");
            entity.Property(e => e.PropertyCode).HasColumnName("property_code");

            entity.HasOne(d => d.CriteriaCodeNavigation).WithMany(p => p.Marks)
                .HasForeignKey(d => d.CriteriaCode)
                .HasConstraintName("marks_criteria_code_fkey");

            entity.HasOne(d => d.PropertyCodeNavigation).WithMany(p => p.Marks)
                .HasForeignKey(d => d.PropertyCode)
                .HasConstraintName("marks_property_code_fkey");
        });

        modelBuilder.Entity<MarksCriteria>(entity =>
        {
            entity.HasKey(e => e.CriteriaCode).HasName("marks_criterias_pkey");

            entity.ToTable("marks_criterias");

            entity.Property(e => e.CriteriaCode)
                .ValueGeneratedNever()
                .HasColumnName("criteria_code");
            entity.Property(e => e.CriteriaName).HasColumnName("criteria_name");
        });

        modelBuilder.Entity<Property>(entity =>
        {
            entity.HasKey(e => e.PropertyCode).HasName("property_pkey");

            entity.ToTable("property");

            entity.Property(e => e.PropertyCode)
                .ValueGeneratedNever()
                .HasColumnName("property_code");
            entity.Property(e => e.AdDate).HasColumnName("ad_date");
            entity.Property(e => e.Adress).HasColumnName("adress");
            entity.Property(e => e.District).HasColumnName("district");
            entity.Property(e => e.Floorr).HasColumnName("floorr");
            entity.Property(e => e.Price).HasColumnName("price");
            entity.Property(e => e.PropertyDescription).HasColumnName("property_description");
            entity.Property(e => e.PropertyMaterial).HasColumnName("property_material");
            entity.Property(e => e.PropertySquare).HasColumnName("property_square");
            entity.Property(e => e.QuantityOfRooms).HasColumnName("quantity_of_rooms");
            entity.Property(e => e.Status).HasColumnName("status");
            entity.Property(e => e.Typess).HasColumnName("typess");

            entity.HasOne(d => d.DistrictNavigation).WithMany(p => p.Properties)
                .HasForeignKey(d => d.District)
                .HasConstraintName("property_district_fkey");

            entity.HasOne(d => d.PropertyMaterialNavigation).WithMany(p => p.Properties)
                .HasForeignKey(d => d.PropertyMaterial)
                .HasConstraintName("property_property_material_fkey");

            entity.HasOne(d => d.TypessNavigation).WithMany(p => p.Properties)
                .HasForeignKey(d => d.Typess)
                .HasConstraintName("property_typess_fkey");
        });

        modelBuilder.Entity<Rieltor>(entity =>
        {
            entity.HasKey(e => e.RieltorCode).HasName("rieltor_pkey");

            entity.ToTable("rieltor");

            entity.Property(e => e.RieltorCode)
                .ValueGeneratedNever()
                .HasColumnName("rieltor_code");
            entity.Property(e => e.RieltorLastname).HasColumnName("rieltor_lastname");
            entity.Property(e => e.RieltorName).HasColumnName("rieltor_name");
            entity.Property(e => e.RieltorPhoneNumber).HasColumnName("rieltor_phone_number");
            entity.Property(e => e.RieltorSurname).HasColumnName("rieltor_surname");
        });

        modelBuilder.Entity<Selling>(entity =>
        {
            entity.HasKey(e => e.SellingCode).HasName("selling_pkey");

            entity.ToTable("selling");

            entity.Property(e => e.SellingCode)
                .ValueGeneratedNever()
                .HasColumnName("selling_code");
            entity.Property(e => e.Price).HasColumnName("price");
            entity.Property(e => e.PropertyCode).HasColumnName("property_code");
            entity.Property(e => e.RieltorCode).HasColumnName("rieltor_code");
            entity.Property(e => e.SellingDate).HasColumnName("selling_date");

            entity.HasOne(d => d.PropertyCodeNavigation).WithMany(p => p.Sellings)
                .HasForeignKey(d => d.PropertyCode)
                .HasConstraintName("selling_property_code_fkey");

            entity.HasOne(d => d.RieltorCodeNavigation).WithMany(p => p.Sellings)
                .HasForeignKey(d => d.RieltorCode)
                .HasConstraintName("selling_rieltor_code_fkey");
        });

        modelBuilder.Entity<Typess>(entity =>
        {
            entity.HasKey(e => e.TypeCode).HasName("typess_pkey");

            entity.ToTable("typess");

            entity.Property(e => e.TypeCode)
                .ValueGeneratedNever()
                .HasColumnName("type_code");
            entity.Property(e => e.TypeName)
                .HasMaxLength(1)
                .HasColumnName("type_name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
