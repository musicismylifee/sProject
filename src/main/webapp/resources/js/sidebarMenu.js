$(document).ready(function(){ 
   $(".menu a").click(function(){
        var submenu = $(this).next("ul");
        if( submenu.is(":visible")){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });

    $(".menu .sub-menu a").click(function(){
        var submenuclick = $(this).next("");
        if( submenuclick.is("")){
            submenu.slideUp();
        }else{
            submenuclick.slideDown();
        }
    });

});


