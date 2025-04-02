component accessors="true" {
    /**
     * Function to get all defined routes from different route files.
     * @return array of all routes
     */
    function getRoutes() {
        router = [];

        // Instantiate the 'routes.booking' component
        booking = new routes.booking();
        router.append(booking.getRoute(), true);

        // Instantiate the 'routes.user' component
        user = new routes.user();
        router.append(user.getRoute(), true);

        return router;
    }
}
