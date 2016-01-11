

$(function() {

	$('body').on('click','#slider_entry_submit',function(){
      
        var formData = $("#upload_file").serialize();
        var formData = new FormData($('form')[0]);

        $.ajax({
                url: "../home/slider_save",
                type: 'POST',
                data: formData,
                mimeType: "multipart/form-data",
                contentType: false,
                cache: false,
                processData: false,
                dateType:"json",
                success: function(data, textSatus, jqXHR){
                        //now get here response returned by PHP in JSON fomat you can parse it using JSON.parse(data)
                  console.log(data);
                 $("#upload_file")[0].reset();
                 refresh_files();
                },
                error: function(jqXHR, textStatus, errorThrown){
                        //handle here error returned
                }
        });
	});

	refresh_files();

		function refresh_files()
		{
			$.get('./slider_list/')
			.success(function (data){
				$('#files').html(data);
			});
		}



		$('body').on('click','.delete_file_link', function(e) {
			e.preventDefault();
			if (confirm('Are you sure you want to delete this file?'))
			{
				var link = $(this);
				$.ajax({
					url			: './slider_remove/' + link.data('file_id'),
					dataType	: 'json',
					success		: function (data)
					{
						console.log(data);
						refresh_files();

						
					}
				});
			}
		});

		$('#login').modal("show");
});