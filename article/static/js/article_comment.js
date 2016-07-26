$(function () {


        $('#comment-form').submit(function (e) {
            e.preventDefault();
            if ($('#comment-form').find('textarea[name=text]').val() == "") {
                if(!$('.error').is('#label-error'))
                {
                     $('#comment-form').find('textarea[name=text]').after("<label id='label-error' class='error'>Заполните поле комментария</label>");
                }
            }
            else{
                if($('.error').is('#label-error'))
                {
                    $('#label-error').remove();
                }
                $.ajax({
                type: "POST",
                url: $('#comment-form').attr('action'),
                data: $('#comment-form').serialize(),
                success: function (data) {
                    if (data.status == 'success') {
                        console.log($(this));
                        $('#comments').append("<p><i><b>" + data.username + "</b></i>: " + $('#comment-form').find('textarea[name=text]').val() + " </p>");
                        $('#comment-form').find('textarea[name=text]').val(null);
                        $('#comment-form').find('textarea[name=text]').focus();
                    }
                }
            });
            }

        });



});