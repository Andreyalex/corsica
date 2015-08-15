</div>

<footer>
	<div class="group">
        <div class="col-md-4"></div>
		<div class="col-md-4 center">
            <span class="copyright">2015 &copy; Corsica</span>
        </div>
		<div class="col-md-4 callback">
			<form class="form-callback form-inline pull-right">
                <div class="title text-right"><?php echo $callback_header ?></div>
                <div class="input-group">
			    	<input class="form-control" type="text" name="phone" value="" placeholder="<?php echo $callback_placeholder; ?>" pattern="\d*" />
		    		<span class="input-group-btn">
		        		<button class="btn btn-callback" type="submit"><?php echo $callback_button; ?></button>
		      		</span>
			    </div>
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