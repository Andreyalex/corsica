<?php if (count($languages) > 1) { ?>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
		<ul class="lang">
			<?php foreach ($languages as $language) { ?>
		    	<li><a href="<?php echo $language['code']; ?>" class="btn-lang"><?php echo substr($language['name'], 0, 3); ?></a></li>
		    <?php } ?>
		</ul>
		<input type="hidden" name="code" value="" />
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
<?php } ?>
