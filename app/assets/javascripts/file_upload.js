$(function () {
    $('.directUpload').find("input:file").each(function (i, elem) {
        var fileInput = $(elem);
        var form = $(fileInput.parents('form:first'));
        var submitButton = form.find('input[type="submit"]');
        var progressBar = $("<div class='bar'></div>");
        var barContainer = $("<div class='progress'></div>").append(progressBar);
        var url = $('#upload_url').attr('value');
        var host = $('#upload_host').attr('value');
        var formData = $('#form_data').attr('value');
        fileInput.after(barContainer);
        fileInput.fileupload({
            fileInput: fileInput,
            url: url,
            type: 'POST',
            autoUpload: true,
            formData: $.parseJSON(formData),
            paramName: 'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
            dataType: 'XML',  // S3 returns XML if success_action_status is set to 201
            replaceFileInput: false,
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                progressBar.css('width', progress + '%')
            },
            start: function (e) {
                submitButton.prop('disabled', true);

                progressBar.
                        css('background', 'green').
                        css('display', 'block').
                        css('width', '0%').
                        text("Cargando...");
            },
            done: function (e, data) {
                submitButton.prop('disabled', false);
                progressBar.text("Listo !");
                progressBar.fadeOut(10000);

                // extract key and generate URL from response
                var key = $(data.jqXHR.responseXML).find("Key").text();
                var url = host +"/"+ key;

                // create hidden field
                var input = $("<input />", { type: 'hidden', name: fileInput.attr('name'), value: url })
                form.append(input);
                var uploded_image_url = "http://"+url+"";
                $(pet_image).prop('src', uploded_image_url);
            },
            fail: function (e, data) {
                submitButton.prop('disabled', false);

                progressBar.
                        css("background", "red").
                        text("Error :c");
            }
        });
    });
});
