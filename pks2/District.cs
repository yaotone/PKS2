using System;
using System.Collections.Generic;

namespace pks2;

public partial class District
{
    public int DistrictCode { get; set; }

    public string? DistrictName { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
