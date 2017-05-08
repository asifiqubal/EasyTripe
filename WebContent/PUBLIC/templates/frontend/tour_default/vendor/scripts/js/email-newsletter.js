function resetNewsLetterFields()
{
    $( "#newsletter_form_box" )[0].reset();
}

function removeNewsLetterError()
{
    $('#actionMessage_newsletter').html('');
    $('#newsletter_form_box').find('.input-errors').html('');
    $('#newsletter_form_box').find(':input').removeClass('ui-state-error');
}

$(document).ready(function() {

    $('input.newsletter_snd_btn').click(function() {

        var formData = commonGetFormData('newsletter_form_box',false);

        $.ajax({
            url: $('#newsletter_form_box').attr('action'),
            type: 'POST',
            data: formData,
            dataType : 'json',
            beforeSend: function(){
                removeNewsLetterError();
                $('#newsletter_form_box').css('display','none');
                $('#newsletter_loader_process').css('display','');
            },
            success: function(json_arr){
                if(json_arr.status == 'ok')
                {
                    $('#actionMessage_newsletter').html(succMsgDesign(json_arr.msg));
                    $('#newsletter_loader_process').css('display','none');
                    $('#newsletter_form_box').css('display','');
                    resetNewsLetterFields();
                }
                else if(json_arr.status == 'errV')
                {
                    $('#actionMessage_newsletter').html( errMsgDesign( $('#newsletter_common_err_msg').val() ));
                    $('#newsletter_form_box').css('display','');
                    $('#newsletter_loader_process').css('display','none');

                    for(var i= 0; i < json_arr.msg.length; i++)
                    {
                        commonAddFormError(json_arr.msg[i].key, json_arr.msg[i].value);
                    }
                }
                else
                {
                    $('#newsletter_form_box').css('display','');
                    $('#newsletter_loader_process').css('display','none');
                    $('#actionMessage_newsletter').html(errMsgDesign(json_arr.msg));
                }
            }
        });
    });
});