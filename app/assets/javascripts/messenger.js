
function toggle_chat(id) {
   if(id=='messages'){
    document.getElementById("aufmachen").style.display = 'block';
    document.getElementById("messages").style.display = 'none';
   }
   else{
    document.getElementById("aufmachen").style.display = 'none';
    document.getElementById("messages").style.display = 'block';
   }
  }
