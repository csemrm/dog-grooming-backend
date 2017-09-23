<div class="m-content">
    <?php
    $this->lang->load('ps', 'english');
    ?>
    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <?php echo $this->lang->line('cat_list_label') ?> 
                    </h3>
                </div>
            </div>
        </div>
        <div class="m-portlet__body">
            <!--begin: Search Form -->
            <div class="m-form m-form--label-align-right m--margin-top-20 m--margin-bottom-30">
                <div class="row align-items-center">
                    <div class="col-xl-8 order-2 order-xl-1">
                        <div class="form-group m-form__group row align-items-center">


                            <div class="col-md-8">
                                <div class="m-input-icon m-input-icon--left">

                                    <?php
                                    $attributes = array('class' => 'form-inline');
                                    echo form_open(site_url('dogs/search'), $attributes);
                                    ?>
                                    <div class="form-group">
                                        <input type="text" name="searchterm" class="form-control m-input" placeholder="<?php echo $this->lang->line('search_message') ?>">
                                    </div>
                                    <button type="submit" class="btn btn-default"><?php echo $this->lang->line('search_button') ?></button>
                                    <?php echo form_close() ?>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 order-1 order-xl-2 m--align-right">
                        <a href="<?php echo site_url('dogs/add'); ?>" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill">
                            <span>
                                <i class="la la-cart-plus"></i>
                                <span> <?php echo $this->lang->line('add_new_cat_button') ?>
                                </span>
                            </span>
                        </a>
                        <div class="m-separator m-separator--dashed d-xl-none"></div>
                    </div>
                </div>
            </div>
            <!--end: Search Form -->
            <!-- Message -->
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
            <!--begin: Datatable -->
            <div class="m_datatable" id="ajax_data">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th><?php echo $this->lang->line('no_label') ?></th>
                        <th><?php echo $this->lang->line('category_name_label') ?></th>
                        <?php
                        if (!$this->session->userdata('is_shop_admin')) {
                            if (in_array('edit', $allowed_accesses)):
                                ?>
                                <th><?php echo $this->lang->line('edit_label') ?></th>
                                <?php
                            endif;
                        } else {
                            ?>
                            <th><?php echo $this->lang->line('edit_label') ?></th>
                        <?php } ?>

                        <?php
                        if (!$this->session->userdata('is_shop_admin')) {
                            if (in_array('delete', $allowed_accesses)):
                                ?>
                                <th><?php echo $this->lang->line('delete_label') ?></th>
                                <?php
                            endif;
                        } else {
                            ?>
                            <th><?php echo $this->lang->line('delete_label') ?></th>
                        <?php } ?>

                        <?php
                        if (!$this->session->userdata('is_shop_admin')) {
                            if (in_array('publish', $allowed_accesses)):
                                ?>
                                <th><?php echo $this->lang->line('publish_label') ?></th>
                                <?php
                            endif;
                        } else {
                            ?>
                            <th><?php echo $this->lang->line('publish_label') ?></th>
                        <?php } ?>
                    </tr>
                    <?php
                    if (!$count = $this->uri->segment(3))
                        $count = 0;
                    if (isset($categories) && count($categories->result()) > 0):
                        foreach ($categories->result() as $category):
                            ?>
                            <tr>
                                <td><?php echo ++$count; ?></td>
                                <td><?php echo $category->name; ?></td>
                                <?php
                                if (in_array('edit', $allowed_accesses)):
                                    ?>
                                    <td><a href="<?php echo site_url("dogs/edit/" . $category->id); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details"><i class="la la-edit"></i></a></td>
                                    <?php
                                endif;
                                ?>


                                <?php
                                if (in_array('delete', $allowed_accesses)):
                                    ?>
                                    <td><a class='btn-delete' data-toggle="modal" data-target="#myModal" id="<?php echo $category->id; ?>"class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete"><i class="la la-trash"></i></a></td>
                                    <?php
                                endif;
                                ?>

                                <?php
                                if (in_array('publish', $allowed_accesses)):
                                    ?>
                                    <td>
                                        <?php if ($category->is_published == 1): ?>
                                            <button class="btn btn-sm btn-primary unpublish"   
                                                    catId='<?php echo $category->id; ?>'>Yes</button>
                                                <?php else: ?>
                                            <button class="btn btn-sm btn-danger publish"
                                                    catId='<?php echo $category->id; ?>'>No</button><?php endif; ?>
                                    </td>
                                <?php endif;
                                ?>

                            </tr>
                            <?php
                        endforeach;
                    else:
                        ?>
                        <tr>
                            <td colspan='7'>
                                <span class='glyphicon glyphicon-warning-sign menu-icon'></span>
                                <?php echo $this->lang->line('no_sub_cat_data_message') ?>
                            </td>
                        </tr>
                    <?php
                    endif;
                    ?>
                </table>
                <?php
                $this->pagination->initialize($pag);
                echo $this->pagination->create_links();
                ?>
            </div>
            <!--end: Datatable -->
        </div>
    </div>
</div> 

<script>
    $(document).ready(function () {
        $(document).delegate('.publish', 'click', function () {
            var btn = $(this);
            var id = $(this).attr('catid');
            $.ajax({
                url: '<?php echo site_url('dogs/publish'); ?>/' + id,
                method: 'GET',
                success: function (msg) {
                    if (msg == 'true')
                        btn.addClass('unpublish').addClass('btn-primary')
                                .removeClass('publish').removeClass('btn-danger')
                                .html('Yes');
                    else
                        alert('System error occured. Please contact your system administrator.');
                }
            });
        });

        $(document).delegate('.unpublish', 'click', function () {
            var btn = $(this);
            var id = $(this).attr('catid');
            $.ajax({
                url: '<?php echo site_url('dogs/unpublish'); ?>/' + id,
                method: 'GET',
                success: function (msg) {
                    if (msg == 'true')
                        btn.addClass('publish').addClass('btn-danger')
                                .removeClass('unpublish').removeClass('btn-primary')
                                .html('No');
                    else
                        alert('System error occured. Please contact your system administrator.');
                }
            });
        });

        $('.btn-delete').click(function () {
            var id = $(this).attr('id');
            var btnYes = $('.btn-yes').attr('href');
            var btnNo = $('.btn-no').attr('href');
            $('.btn-yes').attr('href', btnYes + "/" + id);
            $('.btn-no').attr('href', btnNo + "/" + id);
        });
    });
</script>

<div class="modal fade"  id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"><?php echo $this->lang->line('delete_cat_label') ?></h4>
            </div>
            <div class="modal-body">
                <p><?php echo $this->lang->line('delete_confirm_message') ?></p>  
            </div>
            <div class="modal-footer"> 
                <a type="button" class="btn btn-primary btn-no" href='<?php echo site_url("dogs/delete/"); ?>'>
                    <?php echo $this->lang->line('yes_all_label') ?></a>
                <a type="button" class="btn btn-secondary" data-dismiss="modal">
                    <?php echo $this->lang->line('cancel_button') ?></a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->






