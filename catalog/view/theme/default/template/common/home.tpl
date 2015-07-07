<?php echo $header; ?>

<div class="group">
	<?php if ($logged) { ?>
	<a href="<?php echo $category['href']; ?>">
		<div class="col-md-7 collection">
			<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>
			<div class="inner fade">
				<div class="label"></div>
				<div class="title"><?php echo $category['name']; ?></div>
			</div>
		</div>
	</a>
	<?php } else { ?>
	<a href="<?php echo $category['href']; ?>">
		<div class="col-md-7 collection">
			<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>
			<div class="inner fade">
				<div class="lock"><i class="fa fa-lock fa-4x"></i></div>
				<div class="title">Просмотр только для байеров</div>
			</div>
		</div>
	</a>
	<?php } ?>
	<a href="/aboutus">
		<div class="col-md-5 about">
			<img src="image/catalog/bg-about.jpg" alt="О нас"/>
			<div class="inner fade">
				<div class="label"></div>
				<div class="title">О нас</div>
			</div>
		</div>
	</a>
</div>

<div class="group">
	<a href="/shop">
		<div class="col-md-5 magazine">
			<img src="" alt="Магазин"/>
			<div class="inner fade">
				<div class="label"></div>
				<div class="title">Магазин</div>
			</div>
		</div>
	</a>
	<a href="#">
		<div class="col-md-7 old-collection">
			<img src="" alt="Предыдущие коллекции"/>
			<div class="inner fade">
				<div class="label"></div>
				<div class="title">Предыдущие коллекции</div>
			</div>
		</div>
	</a>
</div>

<?php echo $footer; ?>