<div class="m-content">
    <?php
    $this->lang->load('ps', 'english');
    ?>
    <div class="m-portlet m-portlet--mobile">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <?php echo $this->lang->line('appuser_detail_label') ?> 
                    </h3>
                </div>
            </div>
        </div>
        <div class="m-portlet__body">

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
                        <th><?php echo $this->lang->line('appuser_name_label') ?></th>
                        <th><?php echo $this->lang->line('email_label') ?></th>
                        <th>Phone</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>City</th>
                        <th>Address</th>
                        <th>Subscribe</th>
                    </tr>
                    <tr>
                        <td><?php echo $appuser->username; ?></td>
                        <td><?php echo $appuser->email; ?></td>
                        <td><?php echo $appuser->phone; ?></td>
                        <td><?php echo $appuser->dob; ?></td>
                        <td><?php echo $appuser->gender == 'M' ? 'Male' : 'Female'; ?></td>
                        <td><?php echo $appuser->city; ?></td>
                        <td><?php echo $appuser->address; ?></td>
                        <td><?php echo $appuser->subscribe; ?></td>
                    </tr>


                </table>
            </div>
            <!--end: Datatable -->


        </div>
    </div>
    <?php echo $pets; ?>
    <?php echo $appointments; ?>
</div>     