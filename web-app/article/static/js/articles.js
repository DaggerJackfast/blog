$(document).ready(function () {
    $('a.like-link').click(function () {
        var span = $(this).parent().find('span');
        $.ajax({
            type: "GET",
            url: this.toString(),
            success: function (data) {
                span.text(data.like_count);
            }
        });
    });
});
