/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */function dovalidate()
{
    isRegChecked = $("#rbtnReg").is(":checked");
    isLogChecked = $("#rbtnLog").is(":checked");
    var status =true;
    if(isRegChecked===false&&isLogChecked===false)
    {
        $("#result").text("Please select an option first");
        $("#result").css("font-weight","bold");
        $("#result").css("color","red");
        $("#result").fadeOut(4000);
        status=false;
    }
    return status;
}
function doTask()
{
    var ans = dovalidate();
    if(ans===false)
        return;
    if(isRegChecked===true)
        window.location="registration.html";
    else if(isLogChecked===true)
        window.location="login.html";
}


