 $(document).ready(function(){
        setInterval(get_comments,10000);
        get_comments();


    });
    function get_comments() {
        $.ajax({
            url:$('#comment-form').attr('action'),
            type:'GET',
            cache: false,
            success: function (data) {
                $("#comments").empty();
                $.each(data.result,function(){
                    $("#comments").append("<p><i><b>"+this[0]+"</b></i>: "+this[1]+"</p>");
                });
            }
        });
    }