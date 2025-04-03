component accessors="true" {

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
}
