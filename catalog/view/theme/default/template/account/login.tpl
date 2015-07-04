<?php echo $header; ?>

<?php if ($success) { ?>
    <div class="alert alert-danger">
        <div class="container">
            <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        </div>
    </div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="alert alert-danger">
        <div class="container">
            <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        </div>
    </div>
<?php } ?>

<div class="container">
<?php echo $column_left; ?>
	<div id="content" class="login-form"><?php echo $content_top; ?>
		<h1 class="page-title"><?php echo $text_i_am_returning_customer; ?></h1>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
			<div class="form-group">
				<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
				<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
			</div>
			
			<div class="form-group">
				<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
				<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
			</div>

			<div class="group">
				<div class="col-2 text-left">
					<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				</div>
				<div class="col-2 text-right">
					<input type="submit" value="<?php echo $button_login; ?>" class="btn btn-default" />
					<?php if ($redirect) { ?>
						<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					<?php } ?>
				</div>
			</div>
		</form>
	</div>
</div>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>

<?php echo $footer; ?>