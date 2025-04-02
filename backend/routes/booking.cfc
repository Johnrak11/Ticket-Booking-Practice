
component accessors="true" {
    
    function getRoute() {
        return [
            { "$POST/booking/$" = "/booking/createFromReservation" },
            { "$PUT/booking/$" = "/booking/updateFromReservation" },
            { "$GET/booking/$" = "/booking/getBooking" }
        ];
    };
}