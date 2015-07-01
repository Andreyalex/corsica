<?php echo $header; ?>

<div class="container">
	<div id="content" class="<?php echo $class; ?>">
		<h1 class="page-title"><?php echo $heading_title; ?></h1>
		<?php echo $text_message; ?>
		<div class="text-right">
			<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
		</div>
	</div>
</div>

<?php echo $footer; ?>