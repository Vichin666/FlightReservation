//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Flight_Reservation
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ticket
    {
        public int ticketID { get; set; }
        public decimal ticketPrice { get; set; }
        public string seatNo { get; set; }
        public int reservationID { get; set; }
    
        public virtual Reservation Reservation { get; set; }
    }
}
