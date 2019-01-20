$(function () {
    console.log('hello')
    // 设置用户名
    $('#username').blur(function () {
        if ($(this).val().length >= 3 && $(this).val().length <= 10) {
            $('.tips0').html('ok')
        } else {
            $('.tips0').html('用户名错误')
        }
    });

    //设置手机号

    $('#phonenum').blur(function () {
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (myreg.test($(this).val())) {
            $.get('/checkiphone/', {'phone': $(this).val()}, function (response) {
                if (response.status) {
                    $(".tips1").html("ok");
                } else {
                    $(".tips1").html(response.msg);
                }
            })

        } else {
            $(".tips1").html("手机号不正确");
        }

    })

    $('#pwd').blur(function () {
        var myreg = /(?=.*[\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+).{6,20}/;
        if (myreg.test($(this).val())) {
            $(".tips2").html("ok");
        } else {

            $(".tips2").html("密码不正确");
        }

    })


    $('.u-btn-reg').click(function () {
        var s = true;
        $('.tip').each(function () {
            var val1 = $(this).html();

            if( val1!='ok'){

                console.log('no');
               s = false
            }
        })
        if (s){
            console.log('ok');
            $('.register').submit()
        }

    })

})






















