component persistent="true" accessors="true" table="bookings" entityName="Booking" {
    property name="id" generator="native" ormtype="integer" fieldtype="id";
    property name="name" ormtype="string" length="255";
    property name="date" ormtype="timestamp";
    property name="time" ormtype="timestamp";
    property name="created" ormtype="timestamp";
    property name="edited" ormtype="timestamp";

    // Relationships
    property name="customer" fieldType="many-to-one" cfc="User" fkcolumn="customerId";
    property name="owner" fieldType="many-to-one" cfc="User" fkcolumn="ownerId";
}
