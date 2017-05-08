$(function(){

    if (window.FB == undefined
        || window.settingObj.facebook_login == undefined)
        return false;

    /**
     * Options
     *
     * @type {Object}
     */
    var facebook_login = $.extend({},{

        app_id                : '',
        success_process_url   : '',
        success_redirect_url  : '',
        login_status          : 'no',
        redirect_msg          : '',
        return_link           : '',
        reg_role_id           : '',

    }, settingObj.facebook_login);

    // Show Hide based on value
    $("#fb_login_btn").toggle(facebook_login.login_status == 'yes' && facebook_login.app_id != '');

    /**
     * Facebook Login App Object
     *
     * @type {Object}
     */
    var facebookApp = {

        /**
         * Profile Fields
         *
         * @type {Array}
         */
        profile_fields : ['email','first_name','middle_name','last_name','gender','birthday','location','website'],

        /**
         * Initialize
         *
         * @return {self}
         */
        init : function() {
            FB.init({
                appId   : facebook_login.app_id,
                version : 'v2.5',
                oauth   : true,
                status  : true,
                cookie  : true,
                xfbml   : true
            });

            return this;
        },

        /**
         * Login
         *
         * @param  {Dom} self
         * @return {void}
         */
        login : function(self) {

            var obj = this;
            var $selfBtn = $(self);

            FB.login(function(response) {

                if (response.authResponse) {

                    var access_token = response.authResponse.accessToken;
                    var user_id      = response.authResponse.userID;

                    FB.api('/me?fields=' + obj.profile_fields.join(','), function(response){
                        var infoFromFb = obj.fetchProfile(response);

                        if (obj.allowedToAuthenticate(infoFromFb)) {

                            obj.authenticateInSystem($selfBtn, infoFromFb);

                        } else {

                            $actionMessage = $('#'+settingObj.form_action.common_msg_field_id);
                            $actionMessage.html(errMsgDesign(settingObj.messages.facebook_no_email_reg));

                        }

                    });


                } else {

                    console.log('User cancelled login or did not fully authorize.');

                }

            }, {
                scope: 'public_profile,email,user_location,user_website,user_birthday'
            });

        },

        /**
         * Fetch Profile Data
         *
         * @param  {Object} response
         * @return {Object}
         */
        fetchProfile : function(response) {

            var country = '',state = '', city = '';
            if (response.location)
            {
                var location = response.location.name.split(",");

                if (location)
                {
                    var city    = $.trim(location.slice(0,1).join(' '));
                    var state   = $.trim(location.slice(1,-1).join(' '));
                    var country = $.trim(location.slice(-1).join(' '));
                }
            }

            var infoFromFb = {
                first_name : (response.first_name || '') + (response.middle_name ? ' ' + response.middle_name : ''),
                last_name  : response.last_name || '',
                title     : response.gender == 'male' ? 'Mr.' : (response.gender == 'female' ? "Ms." : ''),
                gender    : response.gender || '',
                username  : response.email || '',
                password  : facebookApp.randomPassword(),
                state     : state,
                country   : country,
                city      : city,
                website   : response.website || '',
                role_id   : facebook_login.reg_role_id,
                status    : 1,
                security  : $('input[name="security"]').val(),
            };

            return infoFromFb;
        },

        /**
         * Authenticate On Site
         *
         * @param  {jQuery.Object} $selfBtn
         * @param  {Object} infoFromFb
         * @return {Void}
         */
        authenticateInSystem : function($selfBtn, infoFromFb) {

            var previous = $selfBtn.html();

            $actionMessage = $('#'+settingObj.form_action.common_msg_field_id);

            $.ajax({
                type: 'post',
                url: facebook_login.success_process_url,
                data: infoFromFb,
                beforeSend: function(){
                    $selfBtn.html(settingObj.messages.common_loading);
                },
                success: function(response) {
                    try
                    {
                        $selfBtn.html(previous);
                        var json_arr = $.parseJSON(response);

                        if (json_arr.status == 'err')
                        {
                            $actionMessage.html(errMsgDesign(json_arr.msg));
                        }
                        else
                        {
                            $actionMessage.html(succMsgDesign(json_arr.msg));
                            $('#mem_link').attr('href', facebook_login.success_redirect_url);
                            $('#login_box').css('display','none');
                            $('#logout_box').css('display','');

                            if ( facebook_login.return_link != '') {
                                $actionMessage.html(succMsgDesign(json_arr.msg + facebook_login.redirect_msg));
                                document.location.href = facebook_login.return_link;
                            }
                        }
                    }
                    catch(error)
                    {
                        $selfBtn.html(previous);
                        var error_arr = [error, response];
                        var msg = commonErrMsgException(error_arr);
                        $actionMessage.html(errMsgDesign(msg));
                    }
                },
                error: function(xhr, status, error){
                    $selfBtn.html(previous);
                    var msg = xhr.status + " " + error;
                    $actionMessage.html(errMsgDesign(msg));
                }
            });

        },

        allowedToAuthenticate : function(infoFromFb) {

            return infoFromFb.username && infoFromFb.username != '';

        },

        /**
         * Generate Random Password
         *
         * @return {String}
         */
        randomPassword : function() {

            return '123456';

        }
    };

    /**
     * FB Login Click event
     *
     * @param  {Callback} e
     * @return {void}
     */
    $('a.facebook-login-action').click(function(e) {

        var self = this;

        commonRemoveFormError(settingObj);

        if (!settingObj.facebook_login) {
            console.log('settingObj does not have the "facebook_login" key');
            return false;
        }

        if (settingObj.facebook_login.app_id == '') {
            commonMsgDialog(settingObj, errMsgDesign(settingObj.messages.facebook_app_id_empty));
        } else {
            facebookApp.init().login(self);
        }

    });

});