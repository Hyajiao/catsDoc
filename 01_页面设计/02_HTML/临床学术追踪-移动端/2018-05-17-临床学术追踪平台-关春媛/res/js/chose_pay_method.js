$(function(){
    $(".chose_pay_method a").click(function(e){
        //e.preventDefault();
        console.log($(e.target));
        if($(e.target).hasClass('chose')==true){
            $(e.target).siblings().removeClass('chose');
        }else{
            $(e.target).addClass('chose').siblings().removeClass('chose');
        }
    });
    $(".pay_list_bottom a.chose_active").click(function(e){
        e.preventDefault();
        if($(e.target).hasClass('labelCheck')==true){
            $(e.target).parent().parent().parent().siblings().find('label').removeClass('labelCheck');
        }else{
            $(e.target).addClass('labelCheck').parent().parent().parent().siblings().find('label').removeClass('labelCheck')
        }

    });
    //    删除的弹窗
    var h=$(window).height();
    var bH=$("body").height();
    console.log(h);
    console.log(bH);
    if(bH<h){
        $(".del_pop").height(h);
    }else{
        $(".del_pop").height(bH);
    }
    $(".pay_list_bottom .del").click(function(){
        $(".del_pop").css('display','block');
    });
    //删除弹框点击取消的时候
    $(".pop_cancel").click(function(){
        $(".del_pop").css('display','none');
    });

});