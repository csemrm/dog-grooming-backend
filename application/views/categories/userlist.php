
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
        <!--begin: Datatable -->
        <div class="m_datatable" id="ajax_data">
            <table class="table table-striped table-bordered">
                <tr>
                    <th><?php echo $this->lang->line('cat_photo_label') ?></th>
                    <th><?php echo $this->lang->line('category_name_label') ?></th>
                    <th>Type</th>
                    <th>Gender</th>
                    <th>Weight</th>
                    <th>Bread</th>
                    <th><?php echo $this->lang->line('edit_label') ?></th>
                    <th>Set App.</th>
                </tr>
                <?php
                $count = 0;
                if (isset($categories) > 0):
                    foreach ($categories as $category):
                        ?>
                        <tr>
                            <td>
                                <?php
                                $images = $this->image->get_all_by_type($category->id, "category")->result();
                                if (count($images) > 0):
                                    $i = 0;
                                    foreach ($images as $img) {
                                        echo '<div class="col-md-4" style="height:100">'
                                        . '<div class="thumbnail">' .
                                        '<img src="' . base_url('uploads/thumbnail/' . $img->path) . '"><br/>' .
                                        '</div></div>';
                                        $i++;
                                    }
                                endif;
                                ?> 
                            </td>

                            <td><?php echo $category->name; ?></td>
                            <td><?php echo $category->type; ?></td>
                            <td><?php echo $category->gender; ?></td>
                            <td><?php echo $category->weight; ?></td>
                            <td><?php echo $category->bread; ?></td>
                            <td><a href="<?php echo site_url("appusers/petedit/" . $category->id); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details"><i class="la la-edit"></i></a></td>
                            <td><a href="<?php echo site_url("appusers/petappointment/" . $category->id); ?>" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="new">New</a></td>

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