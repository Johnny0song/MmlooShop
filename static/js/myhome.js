
$(function () {
    $('img').each(function () {
        //路径
        var imgPath = $(this).attr('src')
    //  拼接
    //     imgPath = "{% static 'login-images/top.jpg' %}"
        imgPath = "{% static '" + imgPath +"' %}"
        $(this).attr('src',imgPath)

        // console.log($(this).attr('src'))
    })
    console.log($('body').html())
})
