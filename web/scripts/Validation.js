/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validate()
{
    var result = true;
    usname = $("#username").val();
    passw = $("#password").val();
    if (usname === "")
    {
        $("#sp1").html("Please Enter Username");
         $("#sp1").css("color","#B93578");
         $("#sp1").fadeOut(2000);
        result = false;
    }
    if (passw === "")
    {
        $("#sp2").html("Please Enter Password");
        $("#sp2").css("color","#B93578");
        $("#sp2").fadeOut(2000);
        result = false;
    }
    return result;

}
function doValidate()
{
    if (!validate())
    {
        setTimeout(reload,2000);
        return;
    }
    utype=$("input[name='utype']:checked").val();
    var data = {uname: usname, pass: passw,utype:utype};
    var jqajx = $.get("LoginControllerServlet", data, processResponse);
    jqajx.error(handleError);
}
function processResponse(responseText, textStatus, xhr)
{
    var resp = responseText;
    var pagename;
    resp = resp.trim();
    //alert(resp);
        if (resp.indexOf("jsessionid")!==-1) {
            $("#result").css("color","green");
            if(utype==="ADMIN")
            {
                pagename="Options";
            }
            else
                pagename = "Store";
            $("#result").html("Login Accepted Redirecting to "+pagename);
             url = resp;
             $("#result").fadeOut(4000);
             window.location="StoreControllerServlet";
        }
        else if (resp==="error")
        {
          $("#result").html("Login Regected");
          $("#result").css("color","#793E79");
          $("#result").fadeOut(4000);
          setTimeout(reload,2000);
        }
        else
        {
          $("#result").html("Some Error Occured At Server At Server");
          $("#result").css("color","red");   
        }

    
}
function handleError(xhr)
{
    $("#result").text("Error in DB" + xhr.statusText + " " + xhr.status);
}
function reload()
{
    document.location.reload();   
}


