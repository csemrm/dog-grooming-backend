<div class="m-content">
    <?php
    $this->lang->load('ps', 'english');
    ?>
    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <?php echo $this->lang->line('users_list_label') ?> 
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
                                    echo form_open(site_url('users/search'), $attributes);
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
                        <a href="<?php echo site_url('users/add'); ?>" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill">
                            <span>
                                <i class="la la-cart-plus"></i>
                                <span> <?php echo $this->lang->line('add_new_user_button') ?>
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
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Phone#</th>
                        
                        <th><?php echo $this->lang->line('username_label') ?></th>
                        <th><?php echo $this->lang->line('email_label') ?></th>
                        <th><?php echo $this->lang->line('user_role_label') ?></th>
                        
                        <?php if (in_array('edit', $allowed_accesses)): ?>
                            <th><?php echo $this->lang->line('edit_label') ?></th>
                        <?php endif; ?>



                    </tr>
                    <?php
                    if (!$count = $this->uri->segment(3))
                        $count = 0;
                    if (isset($users) && count($users->result()) > 0):
                        foreach ($users->result() as $user):
                            ?>
                            <tr>
                                <td><?php echo ++$count; ?></td>
                                <td><?php echo $user->first_name; ?></td>
                                <td><?php echo $user->last_name; ?></td>
                                <td><?php echo $user->phone; ?></td>
                                <td><?php echo $user->user_name; ?></td>
                                <td><?php echo $user->user_email; ?></td>
                                <td><?php echo $this->role->get_name($user->role_id); ?></td>

                                <?php if (in_array('edit', $allowed_accesses)): ?>
                                    <td><a href="<?php echo site_url("users/edit/" . $user->user_id); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details"><i class="la la-edit"></i></a></td>
                                <?php endif; ?>


                            </tr>
                            <?php
                        endforeach;
                    else:
                        ?>
                        <tr>
                            <td colspan='7'>
                                <span class='glyphicon glyphicon-warning-sign menu-icon'></span>
                                <?php echo $this->lang->line('no_user_data_message') ?>
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
