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
        $("#sp1").html("*Please Enter Username");
         $("#sp1").css("color","#B93578");
         $("#sp1").fadeOut(2000);
        result = false;
    }
    if (passw === "")
    {
        $("#sp2").html("*Please Enter Password");
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
    var data = {username: usname, password: passw};
    var jqajx = $.post("RegistrationControllerServlet", data, processResponse);
    jqajx.error(handleError);
}
function processResponse(responseText, textStatus, xhr)
{
    var resp = responseText;
    resp = resp.trim();
        if (resp==="uap") {
            $("#result").css("color","red");
            $("#result").html("Sorry! Username is Already Present");
            $("#result").fadeOut(4000);
            setTimeout(reload,2000);
        }
        else if(resp==="failure")
        {
          $("#result").html("Error in DB,Please Try Again Later");
          $("#result").css("color","red");
          $("#result").fadeOut(4000);
        }
        else if(resp==="success")
        {
          $("#result").html('Registration Success click '+'<a href="login.html">Here</a>'+'to login');
          $("#result").css("color","#793E79");   
        }
        else{
            alert("error");
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




