
component accessors="true" {
    property userService;
    property fw;

    function init( any fw ) {
        variables.fw = fw;
        return this;
    }
    public void function missingView(event, rc) {
        variables.fw.renderData()
            .type("json")
            .data({
                "error": "The requested resource could not be found.",
                "status": 404
            });
    }

    public void function authenticate(required struct rc) {
        // event.noViews();
        try {
            // Validate input using middleware
            local.validator = new middleware.validators.users.login(arguments.rc);

            if (local.validator.fails()) {
                variables.fw.renderData("json", {
                    "message" = "Validation failed",
                    "errors" = local.validator.getErrors()
                }, 400);
                return;
            }

            // Authenticate User
            local.authResponse = variables.userService.login(rc.email, rc.password);

            // 3. Return success response with token
            variables.fw.renderData("json", local.authResponse, 200);
            
        } catch (any exception) {
            // Handle authentication errors
            variables.fw.renderData().type('json').data({
                "success": false,
                "message": exception.message
            }).statusCode(401);
        }
    }


    public struct function register(rc) {
        // event.noViews();
        try {
            // Validate input using middleware
            local.validator = new middleware.validators.users.register(arguments.rc);

            if (local.validator.fails()) {

                variables.fw.renderData("json", {"message" = "Parameters validation error", "errors" = local.validator.getErrors()}, 400);

            } else {

                local.newUser = {
                    username = rc.username,
                    password = rc.password,
                    email = rc.email,
                    roleId = rc.roleId
                };
                
                local.user = variables.userService.store(argumentCollection = local.newUser );

                variables.fw.renderData().type( 'json' ).data( {
                    "data" : local.user,
                    "success" : true,
                    "message" : "User has been register successfully"
                }).statusCode(201);
            }
        } catch (any exception) {
            variables.fw.renderData().type( 'json' ).data( {
                "success" : false,
                "message" :  exception.Message
            }).statusCode(404);
        }
        
    }
}