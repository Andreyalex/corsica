<?php
    $header = CorsicaHelper::renderPageTitle(
        $header,
        CorsicaHelper::createBreadcrumbsString($breadcrumbs)
    );
    echo $header;
?>

<div class="container">
    <div id="content" class="information">
	    <h1 class="page-title"><?php echo $heading_title; ?></h1>
	    <?php echo $description; ?>
	</div>
</div>

<?php echo $footer; ?>