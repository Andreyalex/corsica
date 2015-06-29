<?php echo $header; ?>

<?php if ($error_warning) { ?>
    <div class="alert alert-danger">
        <div class="container">
            <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        </div>
    </div>
<?php } ?>

<div class="container">
	<div id="content" class="forgotten-form"><?php echo $content_top; ?>
		<h1 class="page-title"><?php echo $heading_title; ?></h1>
		<p><?php echo $text_email; ?></p>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
			<div class="form-group required">
				<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
				<input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
			</div>
			<div class="group">
				<div class="col-2 text-left">
					<a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a>
				</div>
				<div class="col-2 text-right">
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-default" />
				</div>
			</div>
		</form>
	</div>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>