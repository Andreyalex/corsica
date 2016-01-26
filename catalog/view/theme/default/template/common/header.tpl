<?php

$theme = HTTP_SERVER . 'catalog/view/theme/default';

?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>

<?php if ($keywords) { ?>
	<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<?php if ($icon) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>

<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans&amp;subset=latin,cyrillic" rel="stylesheet" type="text/css">
<link href="<?php echo $theme; ?>/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo $theme; ?>/css/grid.css" rel="stylesheet" type="text/css">
<link href="<?php echo $theme; ?>/css/style.css"  rel="stylesheet" type="text/css">
<script src="<?php echo $theme; ?>/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="<?php echo $theme; ?>/js/validate.min.js" type="text/javascript"></script>
<script src="<?php echo $theme; ?>/js/common.js" type="text/javascript"></script>
<script src="<?php echo $theme; ?>/js/ohsnap.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<?php echo $google_analytics; ?>

</head>
<body class="<?php echo $class; ?>">

<div class="page">

<header>
	<nav class="navbar-top">
		<div class="top-menu">
			<ul class="left-menu">
				<li class="menu-item">
                    <a id="logo" href="/">
                        <img src="<?php echo $theme; ?>/image/icon-logo.png" />
                    </a>
                </li>
                <!--{{pageTitle}}-->
			</ul>

			<ul class="right-menu">
                <li class="menu-item">
                    <?php echo $cart; ?>
                </li>

                <?php if ($logged) { ?>
		            <li class="menu-item"><a href="<?php echo $logout; ?>"><i class="fa fa-lock"></i> <?php echo $text_logout; ?></a></li>
				<?php } else { ?>
					<li class="menu-item"><a href="<?php echo $login; ?>" class="btn btn-login"><i class="fa fa-unlock-alt"></i> <?php echo $text_login; ?></a></li>
				<?php } ?>

				<?php foreach ($informations as $information) { ?>
					<li class="menu-item"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>

                <li class="menu-item">
                    <?php echo $language; ?>
                </li>

                <li class="menu-item">
                	<?php echo $currency; ?>
                </li>
			</ul>

			<div class="button__mobile-menu">
				<i class="fa fa-navicon"></i>
			</div>
		</div>

		<ul class="mobile-menu">
			<li></li>
		</ul>
	</nav>
</header>
