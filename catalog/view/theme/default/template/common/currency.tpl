<?php if (count($currencies) > 1) { ?>
<div class="currency">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
    <div class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        <?php foreach ($currencies as $currency) { ?>
          <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
            <span><?php echo $currency['symbol_left']; ?></span>
          <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
            <span><?php echo $currency['symbol_right']; ?></span>
          <?php } ?>
        <?php } ?>
        <i class="fa fa-angle-down"></i>
    </div>
    <ul class="dropdown-menu dropdown-menu-right">
      <?php foreach ($currencies as $currency) { ?>
        <li class="menu-item">
          <?php if ($currency['symbol_left']) { ?>
            <button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?>
          <?php } elseif ($currency['symbol_right']) { ?>
            <button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?>
          <?php } ?>
        </li>
      <?php } ?>
    </ul>
    <input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </form>
</div>
<?php } ?>
