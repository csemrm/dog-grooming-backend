<div class="m-content">
    <?php
    $this->lang->load('ps', 'english');
    ?>
    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <?php echo $this->lang->line('search_result_label') ?> 
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
                                    echo form_open(site_url('appusers/search'), $attributes);
                                    ?>
                                    <div class="form-group">
                                        <input type="text" name="searchterm" class="form-control m-input" placeholder="<?php echo $this->lang->line('search_message') ?>" value="<?php echo $searchterm; ?>">
                                    </div>
                                    <button type="submit" class="btn btn-default"><?php echo $this->lang->line('search_button') ?></button>
                                    <?php echo form_close() ?>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 order-1 order-xl-2 m--align-right">

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
                        <th><?php echo $this->lang->line('appuser_name_label') ?></th>
                        <th><?php echo $this->lang->line('email_label') ?></th>
                        <th>Phone</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>City</th>
                        <th>Address</th>
                        <th>Subscribe</th>
                        <th><?php echo $this->lang->line('detail_label') ?></th>
                        <?php if (in_array('ban', $allowed_accesses)): ?>
                            <th><?php echo $this->lang->line('ban_label') ?></th>
                        <?php endif; ?>
                    </tr>
                    <?php
                    if (!$count = $this->uri->segment(3))
                        $count = 0;
                    if (isset($appusers) && count($appusers->result()) > 0):
                        foreach ($appusers->result() as $appuser):
                            ?>
                            <tr>
                                <td><?php echo ++$count; ?></td>
                                <td><?php echo $appuser->username; ?></td>
                                <td><?php echo $appuser->email; ?></td>
                                <td><?php echo $appuser->phone; ?></td>
                                <td><?php echo $appuser->dob; ?></td>
                                <td><?php echo $appuser->gender=='M'? 'Male': 'Female'; ?></td>
                                <td><?php echo $appuser->city; ?></td>
                                <td><?php echo $appuser->address; ?></td>
                                <td><?php echo $appuser->subscribe; ?></td>
                                <td><a href='<?php echo site_url('appusers/detail/' . $appuser->id); ?>'><?php echo $this->lang->line('detail_label') ?></a></td>
                                <?php if (in_array('ban', $allowed_accesses)): ?>
                                    <td>
                                        <?php if ($appuser->is_banned == 1): ?><button class="btn btn-sm btn-danger unban" 
                                                    appuserid='<?php echo $appuser->id; ?>'><?php echo $this->lang->line('unban_label') ?></button>
                                        <?php else: ?><button class="btn btn-sm btn-primary ban" 
                                                    appuserid='<?php echo $appuser->id; ?>'><?php echo $this->lang->line('ban_label') ?></button><?php endif; ?>
                                    </td>
                                <?php endif; ?>
                            </tr>
                            <?php
                        endforeach;
                    else:
                        ?>
                        <tr>
                            <td colspan='7'>
                                <span class='glyphicon glyphicon-warning-sign menu-icon'></span>
                                <?php echo $this->lang->line('no_appuser_data_message') ?>
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
        $(document).on('click', '.ban', function () {
            var btn = $(this);
            var id = $(this).attr('appuserid');
            $.ajax({
                url: '<?php echo site_url('appusers/ban'); ?>/' + id,
                method: 'GET',
                success: function (msg) {
                    if (msg == 'true')
                        btn.addClass('unban').addClass('btn-danger').removeClass('btn-primary').removeClass('ban').html('Unban');
                    else
                        alert('System error occured. Please contact your system administrator.');
                }
            });
        });

        $(document).on('click', '.unban', function () {
            var btn = $(this);
            var id = $(this).attr('appuserid');
            $.ajax({
                url: '<?php echo site_url('appusers/unban'); ?>/' + id,
                method: 'GET',
                success: function (msg) {
                    if (msg == 'true')
                        btn.addClass('ban').addClass('btn-primary').removeClass('btn-danger').removeClass('unban').html('Ban');
                    else
                        alert('System error occured. Please contact your system administrator.');
                }
            })
        });
    });
</script>

