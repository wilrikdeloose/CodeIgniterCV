<div class="content-frame">
  <h1><?php echo $title; ?></h1>
  <hr />
  
  <?php // Only do this when we have data
  foreach ($content->result() as $row)
  {
    $beginDate = date_format(date_create($row->BeginDate), 'F Y');
    if ($row->EndDate == "")
    {
      $endDate = "Now";
    }
    else
    {
      $endDate = date_format(date_create($row->EndDate), 'F Y');
    }
  ?>

  <p class="text-title"><?php echo $row->Title ?></p>
  <p class="text-subscript"><?php echo $beginDate . " - " . $endDate . ", " . $row->City . " (" . $row->Country . ")"; ?></p>
  <br />
  <p class="text-normal text-justify"><?php echo nl2br(auto_link($row->Description, "url", true)); ?></p>
  <hr />

  <?php } ?>
</div>