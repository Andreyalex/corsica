<?php
    $header = CorsicaHelper::renderPageTitle(
        $header,
        CorsicaHelper::createBreadcrumbsString($breadcrumbs)
    );
    echo $header;
?>

<div id="content" class="old-collection">
    <?php foreach ($categories as $category) { ?>
    	<a href="<?php echo $category['href']; ?>">
            <div class="col-md-6 collection">
                <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>"/>
                <div class="inner fade">
                    <div class="label"></div>
                    <div class="title"><?php echo $category['name']; ?></div>
                </div>
            </div>
        </a>
    <?php } ?>
</div>

<?php echo $footer; ?>