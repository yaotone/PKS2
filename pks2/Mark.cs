using System;
using System.Collections.Generic;
using NodaTime;

namespace pks2;

public partial class Mark
{
    public int MarkCode { get; set; }

    public int? PropertyCode { get; set; }

    public LocalDate? DateOfMark { get; set; }

    public int? CriteriaCode { get; set; }

    public int? Mark1 { get; set; }

    public virtual MarksCriteria? CriteriaCodeNavigation { get; set; }

    public virtual Property? PropertyCodeNavigation { get; set; }
}
