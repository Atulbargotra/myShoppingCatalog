/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function remove(itemd,no)
{
       curitems = (no-1)
       it = itemd
       var data = {item:itemd};
       var jqajx = $.get("removeitem.jsp",data,processResponse);
       jqajx.error(handleError);
}
function processResponse(responseText, textStatus, xhr)
{
  if(textStatus=="success")
  {
    $("#"+it).remove();
    $("#cartitems").text("hello");
  }
}
function handleError(xhr)
{
    $("#result").text("Error in DB" + xhr.statusText + " " + xhr.status);
}

