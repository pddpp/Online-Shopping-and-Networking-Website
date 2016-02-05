
$(function () {
    $('#MainContent_smallimg img:eq(0)').css("border", '5px solid grey');
    $('#MainContent_smallimg img').mouseenter(function () {
        $('#MainContent_smallimg img').css("border", "");
        $(this).css("border", '5px solid grey');
        var path = $(this).attr("src");
        $('#MainContent_bigimg img').attr("src", path);
    })

    var array = new Array('0.jpg', '1.jpg', '2.jpg', '3.jpg');
})