<?php
$this->lang->load('ps', 'english');
?>
<!-- BEGIN: Subheader -->
<div class="m-subheader ">
    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title ">
                Dashboard
            </h3>
        </div>

    </div>
</div>



<?php if ($this->session->flashdata('success')): ?>
    <div class="alert alert-success fade in">
        <?php echo $this->session->flashdata('success'); ?>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
<?php elseif ($this->session->flashdata('error')): ?>
    <div class="alert alert-danger fade in">
        <?php echo $this->session->flashdata('error'); ?>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
<?php endif; ?>

<!-- END: Subheader -->
<div class="m-content">

    <div class="row">

    </div>
</div>


