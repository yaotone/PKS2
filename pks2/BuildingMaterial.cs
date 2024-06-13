using System;
using System.Collections.Generic;

namespace pks2;

public partial class BuildingMaterial
{
    public int MaterialCode { get; set; }

    public string? MaterialName { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
