using System;
using System.Collections.Generic;
using NodaTime;

namespace pks2;

public partial class Selling
{
    public int SellingCode { get; set; }

    public int? PropertyCode { get; set; }

    public LocalDate SellingDate { get; set; }

    public int? RieltorCode { get; set; }

    public float? Price { get; set; }

    public virtual Property PropertyCodeNavigation { get; set; }

    public virtual Rieltor RieltorCodeNavigation { get; set; }
}
