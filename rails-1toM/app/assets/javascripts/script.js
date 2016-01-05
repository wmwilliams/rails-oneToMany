$(document).ready(function() {
	$('.js-delete-btn').on('click', function(e) {
		e.preventDefault();
		var btn = $(this);
		var requestType = btn.data('request-type');
		$.ajax({
			url: btn.attr('href'),
			method: 'DELETE',
			dataType: 'json',
		}).done(function(data) {
			if(requestType === 'html') {
				window.location = '/';
			} else if (data) {
				btn.closest('.panel').remove();
			}
		})
	});
});