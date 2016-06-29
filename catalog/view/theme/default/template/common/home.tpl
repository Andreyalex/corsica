<?php echo $header; ?>

<div class="group">

	<?php $i = 1; ?>

	<?php if ($categories) { ?>
		<?php foreach ($categories as $i => $category) { ?>
			<?php if ($i == 0) { ?>
					<a href="<?php echo $category['href']; ?>">
						<div class="col-md-6 collection">
							<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>
							<div class="inner fadeIn">
								<!-- <div class="label"></div> -->
								<h2 class="title"><?php echo $text_collection; ?></h2>
							</div>
						</div>
					</a>
			<?php } else { ?>
				<a href="<?php echo $category['href']; ?>">
					<div class="col-md-6 collection">
						<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>
						<div class="inner fadeIn">
							<!-- <div class="label"></div> -->
							<h2 class="title"><?php echo $category['name']; ?></h2>
						</div>
					</div>
				</a>
			<?php } ?>
		<?php } ?>
	<?php } ?>

</div>

<div class="group">
	<a href="/shop">

		<div class="col-md-12 magazine">
			 <img src="image/catalog/Covers/bg-store.jpg" alt="<?php echo $text_store; ?>"/> 
				<!--<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/>-->

			<div class="inner fadeIn">
				<!-- <div class="label"></div> -->
				<h2 class="title"><?php echo $text_store; ?></h2>
			</div>
		</div>
	</a>
</div>

<?php echo $footer; ?>