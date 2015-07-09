<?php echo $header; ?>

<div class="group">
	<?php if ($logged) { ?>
		<a href="<?php echo $category['href']; ?>">
			<div class="col-md-7 collection">
				<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>
				<div class="inner fade">
					<div class="label"></div>
					<div class="title"><?php echo $text_collection; ?></div>
				</div>
			</div>
		</a>
	<?php } else { ?>
		<a href="index.php?route=account/login">
			<div class="col-md-7 collection">
				<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>
				<div class="inner fade">
					<div class="lock"><i class="fa fa-lock fa-4x"></i></div>
					<div class="title"><?php echo $text_logout; ?></div>
				</div>
			</div>
		</a>
	<?php } ?>
	<a href="/aboutus">
		<div class="col-md-5 about">
			<img src="image/catalog/bg-about.jpg" alt="<?php echo $text_about; ?>" />
			<div class="inner fade">
				<div class="label"></div>
				<div class="title"><?php echo $text_about; ?></div>
			</div>
		</div>
	</a>
</div>

<div class="group">
	<a href="/shop">
		<div class="col-md-5 magazine">
			<img src="" alt="<?php echo $text_store; ?>"/>
			<div class="inner fade">
				<div class="label"></div>
				<div class="title"><?php echo $text_store; ?></div>
			</div>
		</div>
	</a>
	<a href="/previous-collections">
		<div class="col-md-7 old-collection">
			<img src="" alt="<?php echo $text_oldcollection; ?>"/>
			<div class="inner fade">
				<div class="label"></div>
				<div class="title"><?php echo $text_oldcollection; ?></div>
			</div>
		</div>
	</a>
</div>

<?php echo $footer; ?>