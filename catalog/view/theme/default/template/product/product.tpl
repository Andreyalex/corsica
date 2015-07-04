<?php echo $header; ?>

<div class="container">
    <div id="content" class="product">

        <div class="group" id="product">

            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>">

            <div class="col-2 product-image">
                <?php if ($thumb || $popup) { ?>
                    <a class="image-big" href="<?php echo $popup; ?>">
                        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                    </a>
                <?php } ?>

                <?php if ($images) { ?>
                    <div class="thumbnails">
                        <?php foreach ($images as $image) { ?>
                            <a href="<?php echo $image['popup']; ?>" class="col-4 image-thumbnail thumbnail">
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                            </a>
                        <?php } ?>
                    </div>
                <?php } ?>
            </div>
            <div class="col-2 product-content">
                <h1><?php echo $model; ?></h1>
                <div class="product-sku">
                    Art: <?php echo $sku; ?>
                </div>

                <div class="product-description">
                    <?php echo $description; ?>
                </div>

                <div class="product-table">
                    <?php foreach ($options as $option) { ?>
                        <?php if ($option['option_id'] == CorsicaConfig::PRODUCT_OPTION_COLOR_ID) { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>" style="overflow: hidden">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>" style="overflow: hidden">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <div style="float:left;">
                                            <label class="color-item">
                                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                <span class="color-box <?php echo CorsicaConfig::$productOptionColorMap[$option_value['option_value_id']]; ?>"></span>
                                            </label>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                    <?php } ?>

                    <?php foreach ($options as $option) { ?>
                        <?php if ($option['option_id'] == CorsicaConfig::PRODUCT_OPTION_SIZE_ID) { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>" style="overflow: hidden">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>" style="overflow: hidden">
                                    <div class="table-size">
                                        <?php foreach (CorsicaConfig::$productOptionSizeMap as $name => $sizeArray) { ?>
                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <?php if ($option_value['name'] == $name) { ?>
                                                    <div class="size-items">
                                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" style="display: none;" />
                                                        <div class="size-item"><?php echo $sizeArray[0]; ?></div>
                                                        <div class="size-item"><?php echo $sizeArray[1]; ?></div>
                                                        <div class="size-item"><?php echo $sizeArray[2]; ?></div>
                                                    </div>
                                                <?php break; } ?>
                                            <?php } ?>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    <?php } ?>

                    <?php if ($price) { ?>
                        <ul class="list-unstyled">
                            <?php if (!$special) { ?>
                                <li>
                                    <h2><?php echo $price; ?></h2>
                                </li>
                            <?php } else { ?>
                                <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
                                <li>
                                    <h2><?php echo $special; ?></h2>
                                </li>
                            <?php } ?>
                            <?php if ($tax) { ?>
                                <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                            <?php } ?>
                            <?php if ($points) { ?>
                                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                            <?php } ?>
                            <?php if ($discounts) { ?>
                                <li>
                                    <hr>
                                </li>
                                <?php foreach ($discounts as $discount) { ?>
                                    <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                                <?php } ?>
                            <?php } ?>
                        </ul>
                        <br/>
                    <?php } ?>

                    <div class="form-group">
                        <label class="control-label" for="input-quantity">Количество</label>
                        <input type="text" name="quantity" value="1" size="2" id="input-quantity" class="form-control">
                    </div>

                </div>

                <div class="product-add">

                    <button id="button-cart" class="btn btn-default">Добавить в корзину</button>
                    <button class="btn btn-default">Сделать заказ</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});

$('.size-items').on('click', function(ev) {
  if ($(this).hasClass('disabled')) return;
  if (ev.target && $(ev.target).prop("tagName") == 'INPUT') return;
  $(this).find('input').click();
  $(this).parent().find('.size-items').removeClass('selected');
  $(this).addClass('selected');
});


$(document).ready(function() {
    $('.thumbnails, .product-image').magnificPopup({
        type:'image',
        delegate: 'a',
        gallery: {
            enabled:true
        }
    });
});

</script>

<?php echo $footer; ?>