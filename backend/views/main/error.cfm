<cfset request.layout = false />
<!--- courtesy of Andreas Schuldhaus --->
<div style="width: 50%; color: red; border: 2px dotted red; background-color: #f9f9f9; padding: 10px;">
  <h1 style="color: red;">ERROR!</h1>
  <div style="width: 100%; text-align: left;">
    <p><b>An error occurred!</b></p>
    <cfoutput>
      <cfif structKeyExists(request, "failedAction")>
        <b>Action:</b> #encodeForHTML(request.failedAction)#<br/>
      <cfelse>
        <b>Action:</b> unknown<br/>
      </cfif>

      <cfif structKeyExists(request, "exception")>
        <cfif structKeyExists(request.exception, "cause")>
          <b>Error:</b> #encodeForHTML(request.exception.cause.message)#<br/>
          <b>Type:</b> #encodeForHTML(request.exception.cause.type)#<br/>
          <b>Details:</b> #encodeForHTML(request.exception.cause.detail)#<br/>
        <cfelse>
          <b>Error:</b> Unknown<br/>
          <b>Type:</b> Unknown<br/>
          <b>Details:</b> No additional details available.<br/>
        </cfif>
      <cfelse>
        <b>Error:</b> No exception data available.<br/>
      </cfif>
    </cfoutput>

    <cfif structKeyExists(request, "exception")>
      <cfdump var="#request.exception#" />
    </cfif>
  </div>
</div>
