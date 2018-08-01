
//    获取验证码倒计时

$("li.code button").click(function(){
    var num=59;
    var html;
    html=`已发送(${num}s)`;
    $(this).html(html);
    $(this).css({
        background:'#353535',
        color:'#fff'
    });
    $(this).prop('disabled',true);
    var timer=setInterval(function(){
        num--;
//                console.log(num);
        if(num>0){
            html=`已发送(${num}s)`;
            //console.log(html);
            $("li.code button").html(html);
            // console.log($("li.code button").html());
        }else{
            html="获取验证码";
            $("li.code button").css({
                background:'#c2c2c2',
                color:'#000'
            });
            $("li.code button").html(html);
            $("li.code button").prop('disabled',false);
            clearInterval(timer);
        }
    },1000);


});
