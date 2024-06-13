using System;
using System.Collections.Generic;

namespace pks2;

public partial class Rieltor
{
    public int RieltorCode { get; set; }

    public string? RieltorName { get; set; }

    public string? RieltorLastname { get; set; }

    public string? RieltorSurname { get; set; }

    public string? RieltorPhoneNumber { get; set; }

    public virtual ICollection<Selling> Sellings { get; set; } = new List<Selling>();
}
