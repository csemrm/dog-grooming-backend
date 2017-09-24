<?php
$this->lang->load('ps', 'english');
?>
<div class="m-portlet m-portlet--mobile">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                    <?php echo $this->lang->line('reservations_label') ?> 
                </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">

        <!--begin: Datatable -->
        <div class="m_datatable" id="ajax_data"><table class="table table-striped table-bordered">
                <tr>
                    <th><?php echo $this->lang->line('no_label') ?></th>
                    <th><?php echo $this->lang->line('cat_label') ?></th> 
                    <th><?php echo $this->lang->line('resv_note') ?></th>
                    <th><?php echo $this->lang->line('resv_date_label') ?></th>
                    <th><?php echo $this->lang->line('resv_time_label') ?></th>
                    <th><?php echo $this->lang->line('resv_status') ?></th>
                    <th><?php echo $this->lang->line('edit_label') ?></th> 
                </tr>
                <?php
                $count = 0;
                if (isset($reservations)):
                    foreach ($reservations as $reservation):
                        ?>
                        <tr>
                            <td><?php echo ++$count; ?></td>
                            <td><?php echo $reservation->dog->name; ?></td> 
                            <td><?php echo $reservation->note; ?></td>
                            <td><?php echo english_date_verbose( $reservation->resv_date); ?></td>
                            <td><?php echo $reservation->resv_time; ?></td>
                            <td><?php echo $reservation->reservation_status->title; ?></td>


                            <td><a href="<?php echo site_url("reservations/edit/" . $reservation->id.'/redirect'); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details"><i class="la la-edit"></i></a></td>
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
        </div>
        <!--end: Datatable -->
    </div>
</div>