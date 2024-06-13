using System;
using System.Collections.Generic;

namespace pks2;

public partial class MarksCriteria
{
    public int CriteriaCode { get; set; }

    public string? CriteriaName { get; set; }

    public virtual ICollection<Mark> Marks { get; set; } = new List<Mark>();
}
