<div class="content-frame">
  <h1><?php echo $content->Name; ?></h1>
  <hr />
  
  <?php // Only do this when we have data
  if (count($content) > 0) {

    $birthday = date_format(date_create($content->Birthday), 'jS F Y');
    $born = $birthday . ", " . $content->Birthplace . " (" . $content->BirthcountryAbbreviation . ")";
  ?>

  <p class="text-subscript"><?php echo $content->Street . ", " . $content->ZipCode; ?><br />
  <?php echo $content->City . ", " . $content->Country; ?></p>
  
  <dl class="dl-horizontal text-list">
    <dt>Phone</dt><dd><?php echo $content->Phone; ?></dd>
    <dt>E-mail</dt><dd><?php echo safe_mailto($content->Email, $content->Email); ?></dd>
    <dt>Born</dt><dd><?php echo $born; ?></dd>
    <dt>Nationality</dt><dd><?php echo $content->Nationality; ?></dd>
    <dt>Driver's licence</dt><dd><?php echo $content->DriversLicence == 1 ? "Yes" : "No"; ?></dd>
  </dl>
  
  <?php // End of the optional part of the person view
  } ?>
</div>