using System;
using System.Collections.Generic;
using NodaTime;

namespace pks2;

public partial class Property
{
    public int PropertyCode { get; set; }

    public int? District { get; set; }

    public string? Adress { get; set; }

    public int? Floorr { get; set; }

    public int? QuantityOfRooms { get; set; }

    public int? Typess { get; set; }

    public int? Status { get; set; }

    public float? Price { get; set; }

    public string? PropertyDescription { get; set; }

    public int? PropertyMaterial { get; set; }

    public float? PropertySquare { get; set; }

    public LocalDate AdDate { get; set; }

    public virtual District DistrictNavigation { get; set; }

    public virtual ICollection<Mark> Marks { get; set; } = new List<Mark>();

    public virtual BuildingMaterial? PropertyMaterialNavigation { get; set; }

    public virtual ICollection<Selling> Sellings { get; set; } = new List<Selling>();

    public virtual Typess? TypessNavigation { get; set; }
}
