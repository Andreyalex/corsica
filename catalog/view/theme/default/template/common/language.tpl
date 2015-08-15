<?php if (count($languages) > 1) { ?>
<div class="languages">
    <div class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        <span><?php echo substr($this->registry->get('config')->get('config_language_name'), 0, 3); ?></span>
        <i class="fa fa-angle-down"></i>
    </div>
    <ul class="dropdown-menu dropdown-menu-right">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
            <?php foreach ($languages as $language) { ?>
		    	<li class="menu-item"><a href="<?php echo $language['code']; ?>" class="btn-lang"><?php echo substr($language['name'], 0, 3); ?></a></li>
		    <?php } ?>
            <input type="hidden" name="code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
    </ul>
</div>
<?php } ?>
