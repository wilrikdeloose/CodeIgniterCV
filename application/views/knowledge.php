<div class="content-frame">
  <h1><?php echo $title; ?></h1>
  <hr />
  
  <?php
  if ($error != "")
  {
    echo '<p class="lead text-danger">' . $error . '</p>';
  }
  ?>
  
  <form action="<?php echo site_url(); ?>/site/addKnowledge" method="post">
    <div class="form-group">
      <input type="text" class="form-control" name="title" placeholder="Enter a hobby">
    </div>
    <div class="form-group">
      <textarea class="form-control" name="description" rows="3" placeholder="Description..."></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Add to <?php echo strtolower($title); ?></button>
  </form>
  <br />
  
  <?php // Only do this when we have data
  if (count($content) > 0) {
    echo '<dl class="dl-horizontal text-list">';
    
    foreach ($content->result() as $row)
    {
      echo '<dt>' . $row->Title . '</dt><dd><p class="text-justify">' . $row->Description . '</p></dd>';
    }
    
    echo '</dl>';
  } ?>
</div>