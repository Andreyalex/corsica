</div>

<footer>
	<div class="group">
		<div class="col-md-9"></div>
		<div class="col-md-3 callback">
			<h4 class="title text-right"><?php echo $callback_header ?></h4>
			<form class="form-callback">
				<input class="form-control" type="text" name="phone" value="" placeholder="<?php echo $callback_placeholder; ?>" pattern="\d*" />
				<button class="btn btn-callback" type="submit"><?php echo $callback_button; ?></button>
			</form>
		</div>
	</div>
</footer>

<div id="ohsnap"></div>

<script type="text/javascript">
	$('.form-callback').on('submit', function() {
		var form = $(this),
			input = form.find('input'),
			error = false;

		if (input.val() == '') {
			input.addClass('error');
			error = true;
		} else {
			input.removeClass('error');
			error = false;
		}

		if (!error) {
			$.ajax({
				type: 'POST',
				url: 'index.php?route=mail/mail',
				dataType: 'json',
				data: form.serialize(),
				beforeSend: function(data) {
					form.find('input[type="submit"]').attr('disabled', true);
				},
				success: function(data) {
					if (data.status == 'ok') {
						ohSnap(data.data, 'green');
					} else {
						ohSnap(data.data, 'red');
					}

					setTimeout(function() {
						$('#ohsnap').fadeOut('fast');
						input.val('');
					}, 2500);
				},

				complete: function(data) {
					form.find('input[type="submit"]').attr('disabled', false);
				}
			});
		}

		return false;
	});
</script>

</body>
</html>