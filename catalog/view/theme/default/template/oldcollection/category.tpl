<?php
    $header = CorsicaHelper::renderPageTitle(
        $header,
        CorsicaHelper::createBreadcrumbsString($breadcrumbs)
    );
    echo $header;
?>

    <div id="content" class="catalog">
	<div class="group categories-previous">
        <?php foreach ($categories as $category) { ?>
            <a class="item" href="<?php echo $category['href']; ?>">
                <div class="col-6 product-item">
                    <img src="/<?php echo $category['image']; ?>" />
                    <div class="product-desc text-center">
                        <div class="product-name">
                            <h2><?php echo $category['name']; ?></h2>
                        </div>
                    </div>
                </div>
            </a>
        <?php } ?>
    </div>
</div>

<?php echo $footer; ?>