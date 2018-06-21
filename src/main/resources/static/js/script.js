
function tokenSetUp(){
(function () {
    $.ajaxSetup({
        beforeSend: function (xhr) {
            var token = $("input[name='_csrf']").val();
            var header = $("input[name='_csrf_header']").val();
            if(token && header){
                xhr.setRequestHeader(header, token);
            }
        }
    });
})();
}

function ajaxMenu() {
    $('a.menu-option').each(function (index) {
        var url = $(this).attr('href');
        $(this).attr('value', url);
        $(this).attr('href', '#');
    });
    $('a.menu-option').click(function () {
        var title = $(this).text();
        var url = $(this).attr('value');
        $("#container").load(url, function () {

        });
    });
}

function message(message, type, tit, size) {
    tit = tit || "Message";
    type = type || "notice";
    if (typeof size == 'undefined')
    {
        size = "medium";

    }
    $.growl({
        title: tit,
        message: message,
        duration: 5000,
        style: type,
        location: "tr",
        delayOnHover: true,
        size: size
    });
}


