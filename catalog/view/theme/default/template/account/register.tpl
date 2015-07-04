<?php echo $header; ?>

<?php if ($error_warning) { ?>
    <div class="alert alert-danger">
        <div class="container">
            <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        </div>
    </div>
<?php } ?>

<div class="container">
    <div id="content" class="register-form">
        <h1 class="page-title"><?php echo $heading_title; ?></h1>
        <p><?php echo $text_account_already; ?></p>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <div class="form-group required">
                <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?> <abbr>*</abbr></label>
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control"/>
                <?php if ($error_firstname) { ?>
                    <div class="text-danger"><?php echo $error_firstname; ?></div>
                <?php } ?>
            </div>

            <div class="form-group required">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?> <abbr>*</abbr></label>
                <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control"/>
                <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                <?php } ?>
            </div>

            <div class="form-group required">
                <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?> <abbr>*</abbr></label>
                <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control"/>
                <?php if ($error_telephone) { ?>
                    <div class="text-danger"><?php echo $error_telephone; ?></div>
                <?php } ?>
            </div>

            <div class="form-group required">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?> <abbr>*</abbr></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control"/>
                <?php if ($error_password) { ?>
                    <div class="text-danger"><?php echo $error_password; ?></div>
                <?php } ?>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?> <abbr>*</abbr></label>
                <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control"/>
                <?php if ($error_confirm) { ?>
                    <div class="text-danger"><?php echo $error_confirm; ?></div>
                <?php } ?>
            </div>

            <div class="form-group required">
                <label class="control-label" for="input-city"><?php echo $entry_city; ?> <abbr>*</abbr></label>
                <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control"/>
                <?php if ($error_city) { ?>
                    <div class="text-danger"><?php echo $error_city; ?></div>
                <?php } ?>
            </div>

<!--            <div class="form-group required">-->
<!--                <label class="control-label" for="select-activity">Вид деятельности <abbr>*</abbr></label>-->
<!--                <select name="activity" class="form-control">-->
<!--                    <option value="0" >Розница</option>-->
<!--                    <option value="1" >Оптовы закупки</option>-->
<!--                </select>-->
<!--            </div>-->

<!--            <div class="form-group required">-->
<!--                <label class="control-label" for="input-magazine">Название магазина <abbr>*</abbr></label>-->
<!--                <input disabled type="text" name="magazine" value="" placeholder="Название магазина" id="input-magazine" class="form-control"/>-->
<!--            </div>-->

            <?php foreach ($custom_fields as $custom_field) { ?>
                <?php if ($custom_field['location'] == 'account') { ?>
                    <?php if ($custom_field['type'] == 'select') { ?>
                        <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                    <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                        <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                            <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                            <?php } ?>
                        </div>
                    <?php } ?>
                <?php } ?>
            <?php } ?>

            <?php if ($text_agree) { ?>
            <div class="buttons">
                <div class="pull-right"><?php echo $text_agree; ?>
                    <?php if ($agree) { ?>
                    <input type="checkbox" name="agree" value="1" checked="checked"/>
                    <?php } else { ?>
                    <input type="checkbox" name="agree" value="1"/>
                    <?php } ?>
                    &nbsp;
                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-default"/>
                </div>
            </div>
            <?php } else { ?>
            <div class="buttons">
                <div class="pull-right">
                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-default"/>
                </div>
            </div>
            <?php } ?>
        </form>
    </div>
</div>

<script type="text/javascript"><!--
    $('select[name=\'activity\']').on('change', function() {
        var option = $('select[name=\'activity\'] option:selected').val();

        if (option == '1') {
            $('input[name=\'magazine\']').attr('disabled', false);
        } else {
            $('input[name=\'magazine\']').attr('disabled', true);
        }
    });

    $('select[name=\'country_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/account/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function () {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function () {
                $('.fa-spin').remove();
            },
            success: function (json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] && json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'zone_id\']').html(html);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
    //--></script>
<?php echo $footer; ?>