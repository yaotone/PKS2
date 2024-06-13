using System;
using System.Collections.Generic;

namespace pks2;

public partial class Typess
{
    public int TypeCode { get; set; }

    public char? TypeName { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
