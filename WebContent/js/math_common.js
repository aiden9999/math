$(document).ready(function(){
 
    var sn = $(".fade_in").index();
     
    setTimeout(fadeAni, 3000);
     
    function fadeAni(){
        $(".main_slideCont_sel").removeClass("main_slideCont_sel");
        $(".main_slide").eq( sn++ ).removeClass("fade_in");
        if ( sn == $(".main_slide").length ) {
            sn = 0;
        }
        $(".main_slide").eq( sn ).addClass("fade_in");
        $(".main_slideCont").eq( sn ).addClass("main_slideCont_sel");
         
        setTimeout(fadeAni, 3000);
    }

     
    $(".main_slideCont").click(function(){
         
        var pn = $(this).index();
         
        $(".main_slideCont_sel").removeClass("main_slideCont_sel");
        $(this).addClass("main_slideCont_sel");
         
        $(".main_slide").eq( sn ).removeClass("fade_in");
        sn = pn;
        $(".main_slide").eq( sn ).addClass("fade_in");
         
    });
     
     
});

$(document).ready(function(){
                 
    var fileTarget = $('.board_add_wrap .board_add_hidden');
    
    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        }
        
        else { 
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $(this).siblings('.add_upload_name').val(filename);
        
    });
});

$(document).ready(function(){              

  $(".send_btn").click(function(){
        $(".popup_wrap").css("display","none");
        $(".popup_cover").css("display","none");
    });
});