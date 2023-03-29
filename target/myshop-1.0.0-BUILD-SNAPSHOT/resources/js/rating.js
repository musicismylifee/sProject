$(document).ready(function(){ 

    //상세페이지 별표
    if($('.review_content').length) {
        var rating = $('.review_content li .rating');
        var ratingStar = rating.find('svg');
        
        rating.each(function(){
            var starscore = $(this).attr('data-rate');
            $(this).find('svg:nth-child(-n+' + starscore + ')').css({color:'#F05522'});
        });
    }
    
});