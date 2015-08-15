<?php
    $header = CorsicaHelper::renderPageTitle(
        $header,
        CorsicaHelper::createBreadcrumbsString($breadcrumbs)
    );
    echo $header;
?>

<div class="container">
    <div id="content" class="information">
	    <?php echo $description; ?>
	</div>
</div>

<?php echo $footer; ?>