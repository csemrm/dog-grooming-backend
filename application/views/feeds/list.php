<div class="m-content">
    <?php
    $this->lang->load('ps', 'english');
    ?>
    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <?php echo $this->lang->line('feed_list_label') ?> 
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
                                    echo form_open(site_url('feeds/search'), $attributes);
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
                        <a href="<?php echo site_url('feeds/add'); ?>" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill">
                            <span>
                                <i class="la la-cart-plus"></i>
                                <span> <?php echo $this->lang->line('add_new_feed_button') ?>
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
                        <th>Date</th>
                        <th>Expires On</th>
                        <th><?php echo $this->lang->line('feed_title_label') ?></th>
                        <th><?php echo $this->lang->line('description_label') ?></th>
                        <th>Status</th> 
                        <th>Send Push</th> 
                        <th><?php echo $this->lang->line('edit_label') ?>  </th> <th><?php echo $this->lang->line('delete_label') ?></th> 
                    </tr>
                    <?php
                    if (!$count = $this->uri->segment(3))
                        $count = 0;
                    if (isset($feeds) && count($feeds->result()) > 0):
                        foreach ($feeds->result() as $feed):
                            ?>
                            <tr>
                                <td><?php echo english_date_verbose($feed->added); ?></td>
                                <td><?php echo english_date_verbose($feed->expired_date); ?></td>
                                <td><?php echo $feed->title; ?></td>
                                <td><?php echo $feed->description; ?></td>
                                <td>
                                    <?php if ($feed->is_published == 1): ?>

                                        <button class="btn btn-sm btn-primary unpublish"   
                                                feedId='<?php echo $feed->id; ?>'>Yes
                                        </button>

                                    <?php else: ?>

                                        <button class="btn btn-sm btn-danger publish"
                                                feedId='<?php echo $feed->id; ?>'>No</button>

                                    <?php endif; ?>
                                </td>
                                <td><a href="<?php echo site_url("feeds/sendpush/" . $feed->id); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Send Push">Send</a> 
                                </td>
                                <td><a href="<?php echo site_url("feeds/edit/" . $feed->id); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details"><i class="la la-edit"></i></a> 
                                </td>

                                <td> <a class='btn-delete' data-toggle="modal" data-target="#myModal" id="<?php echo $feed->id; ?>"class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete"><i class="la la-trash"></i></a></td>


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

<div class="modal fade"  id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Delete</h4>
            </div>
            <div class="modal-body">
                <p><?php echo $this->lang->line('delete_confirm_message') ?></p>  
            </div>
            <div class="modal-footer"> 
                <a type="button" class="btn btn-primary btn-no" href='<?php echo site_url("feeds/delete/"); ?>'>
                    <?php echo $this->lang->line('yes_all_label') ?></a>
                <a type="button" class="btn btn-secondary" data-dismiss="modal">
                    <?php echo $this->lang->line('cancel_button') ?></a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(document).ready(function () {
        $('.btn-delete').click(function () {
            var id = $(this).attr('id');
            var btnYes = $('.btn-yes').attr('href');
            var btnNo = $('.btn-no').attr('href');
            $('.btn-yes').attr('href', btnYes + "/" + id);
            $('.btn-no').attr('href', btnNo + "/" + id);
        });
        $(document).on('click', '.publish', function () {

            var btn = $(this);
            var id = $(this).attr('feedId');

            $.ajax({
                url: '<?php echo site_url('feeds/publish'); ?>/' + id,
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

        $(document).on('click', '.unpublish', function () {

            var btn = $(this);
            var id = $(this).attr('feedId');

            $.ajax({
                url: '<?php echo site_url('feeds/unpublish'); ?>/' + id,
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
    });
</script>


