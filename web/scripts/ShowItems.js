/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var ajaxreq = new XMLHttpRequest();
var item;
function getItemNames(itemType)
{
    item = itemType;
    var para = document.getElementById(itemType);
    var span = para.getElementsByTagName("span")[0];
    var spantext = span.innerHTML.trim();
    if(spantext.indexOf("+")!=-1)
    {
        span.innerHTML="-"+itemType;
    }
    else if(spantext.indexOf("-")!=-1)
    {
        span.innerHTML="+"+itemType;
        $("#"+item+ " .itemnames").hide("slow");
        return;
    }
    ajaxreq.onreadystatechange=processresponse;
    ajaxreq.open("POST","StoreControllerServlet",true)
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("itemType="+itemType);
}
function processresponse()
{
    if(ajaxreq.readyState===4){
    var para = document.getElementById(item);
    var resp = ajaxreq.responseText;
    resp = resp.trim();
    //alert(resp);
    var olddiv = para.getElementsByClassName("itemnames");
    if(olddiv.length>0)
    {
        para.removeChild(olddiv[0]);
    }
    var newdiv = document.createElement("div");
    newdiv.setAttribute("class","itemnames");
    newdiv.innerHTML=resp;
    para.appendChild(newdiv);
    }
    
}

