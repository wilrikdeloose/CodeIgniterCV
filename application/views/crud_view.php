<?php 

// I used the hooks to pre-render the header of my webpage, so the Grocery CRUD
// stylesheets and JavaScripts are loaded somewhere in between my HTML page.

foreach($css_files as $file) {
	echo '<link type="text/css" rel="stylesheet" href="' . $file . '" />';
}

foreach($js_files as $file) {
	echo '<script src="' . $file . '"></script>';
}

?>

<br />
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
  <a href="<?php echo site_url('crud/lang')?>" class="btn btn-default btn-lg" role="button">Languages</a>
  <a href="<?php echo site_url('crud/country')?>" class="btn btn-default btn-lg" role="button">Country</a>
  <a href="<?php echo site_url('crud/city')?>" class="btn btn-default btn-lg" role="button">City</a>
</div>
<br />
<br />

<?php
  echo $output;
?>