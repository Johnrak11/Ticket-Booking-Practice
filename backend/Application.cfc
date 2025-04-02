component extends="framework.one" {

    // Global application name
    this.name = "Ticket-Booking";

    // Enable session management with a 1-hour timeout
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 1, 0, 0);
    this.applicationTimeout = createTimeSpan(1, 0, 0, 0); // 1-day app timeout

    // Mapping framework and essential paths for FW/1 and application
    this.mappings["/framework"] = expandPath("./framework");
    this.mappings["/bx-orm"] = expandPath("./modules/bx-orm");
    this.mappings["/bx-mssql"] = expandPath("./modules/bx-mssql");
    this.mappings["/routes"] = expandPath("./routes");


    // Enable ORM and configure settings
    this.ormEnabled = true;
    this.ormsettings = {
        cfclocation = "./model/beans",
        dbcreate = "dropcreate", //dropcreate
        dialect =  "MicrosoftSQLServer", //"MySQL5InnoDB",
        eventhandling = true,
        eventhandler = "model.beans.eventhandler",
        flushAtRequestEnd =  false,
        logsql = true,
        // secondaryCacheEnabled = true,
        // cacheconfig = "/ehcache.xml",
        datasource = "ticket_booking"
    };

    // FW/1 Configuration
    this.framework = {
        // Automatically decode JSON request bodies
        decodeRequestBody = true,
        // For development mode
        reloadApplicationOnEveryRequest = true,
        // Enable tracing for detailed debugging
        trace = true,
        // Fallback view
        missingview = "main.missingView",
        // Load routes dynamically from router
        routes = new routes.router().getRoutes()
    };

    // Delegate lifecycle events to FW/1
    function onApplicationStart() {
        return super.onApplicationStart();
    }

    function onError(exception, event) {
        return super.onError(exception, event);
    }

    function onRequest(targetPath) {
        return super.onRequest(targetPath);
    }

    // Lifecycle event to reload ORM when needed
    function onRequestStart(targetPath) {
        if (structKeyExists(url, "init")) {
            ormReload(); // Reload ORM mappings
        }
        return super.onRequestStart(targetPath);
    }

    function onSessionStart() {
        return super.onSessionStart();
    }
}
