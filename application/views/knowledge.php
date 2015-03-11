<div class="content-frame">
  <h1><?php echo $title; ?></h1>
  <hr />
  
  <?php // Only do this when we have data
  if (count($content) > 0) {
    echo '<dl class="dl-horizontal text-list">';
    
    foreach ($content->result() as $row)
    {
      echo '<dt>' . $row->Title . '</dt><dd>' . $row->Description . '</dd>';
    }
    
    echo '</dl>';
  } ?>
</div>