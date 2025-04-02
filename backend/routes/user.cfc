
component accessors="true" {
    
    function getRoute() {
        return [
            { "$POST/auth/login/$" = "/user/authenticate" },
            { "$POST/auth/register/$" = "/user/register" }
        ];
    };
}