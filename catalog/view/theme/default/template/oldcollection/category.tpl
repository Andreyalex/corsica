<?php
    $header = CorsicaHelper::renderPageTitle(
        $header,
        CorsicaHelper::createBreadcrumbsString($breadcrumbs)
    );
    echo $header;
?>

    <div id="content" class="catalog">
	<div class="group">
        <?php foreach ($products as $product) { ?>
            <a href="<?php echo $product['href']; ?>">
                <div class="col-6 product-item">
                    <img src="<?php echo $product['thumb']; ?>" />
                    <div class="product-desc text-center">
                        <div class="product-name">
                            <h2><?php echo $product['name']; ?></h2>
                        </div>
                        <div class="product-size">
                            <h4>Доступные размеры</h4>
                            <div class="size-item">
                                <?php foreach ($product['options'] as $option) { ?>
                                    <?php if ($option['option_id'] == CorsicaConfig::PRODUCT_OPTION_SIZE_ID) { ?>
                                        <?php echo $option['name']; ?>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="product-color">
                            <h4>Доступные цвета</h4>
                            <div class="color-item">
                            <?php foreach ($product['options'] as $option) { ?>
                                <?php if ($option['option_id'] == CorsicaConfig::PRODUCT_OPTION_COLOR_ID) { ?>
                                    <span class="color-box <?php echo CorsicaConfig::$productOptionColorMap[$option['option_value_id']]; ?>"></span>
                                <?php } ?>
                            <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        <?php } ?>
    </div>
</div>

<?php echo $footer; ?>