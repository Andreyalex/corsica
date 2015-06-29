<?php echo $header; ?>

<div class="container">
    <div id="content" class="product">

        <div class="group">
            <div class="col-2 product-image">
                <?php if ($thumb) { ?>
                    <div class="image-big">
                        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                    </div>
                <?php } ?>

                <?php if ($images) { ?>
                    <?php foreach ($images as $image) { ?>
                        <div class="col-4 image-thumbnail">
                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                        </div>
                    <?php } ?>
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
                    <table class="table-size">
                        <tr>
                            <td>XS</td>
                            <td>S</td>
                            <td>M</td>
                            <td>L</td>
                            <th>WORLD</th>
                        </tr>
                        <tr>
                            <td>40-42</td>
                            <td>44-46</td>
                            <td>48-50</td>
                            <td>52</td>
                            <th>UKR / RUS</th>
                        </tr>
                        <tr>
                            <td>34-36</td>
                            <td>38-40</td>
                            <td>42-44</td>
                            <td>52</td>
                            <th>EUR</th>
                        </tr>
                    </table>
                </div>
                <div class="product-add">
                    <button class="btn btn-default" onclick="cart.add('<?php echo $product_id; ?>')">Добавить в корзину</button>
                    <button class="btn btn-default">Сделать заказ</button>
                </div>
                <div class="product-cart">
                    <?php echo $cart; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
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
//--></script>

<?php echo $footer; ?>