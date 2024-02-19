//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RealEstateAgency
{
    using System;
    using System.Collections.Generic;
    
    public partial class Skyscraper
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Skyscraper()
        {
            this.Flat = new HashSet<Flat>();
        }
    
        public int IdSkyscraper { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int NumberOfFloors { get; set; }
        public int NumberOfEntrances { get; set; }
        public int NumberOfApartments { get; set; }
        public int IdDistrict { get; set; }
        public int IdMaterial { get; set; }
        public int IdDeveloper { get; set; }
    
        public virtual Developer Developer { get; set; }
        public virtual District District { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Flat> Flat { get; set; }
        public virtual Material Material { get; set; }
    }
}
