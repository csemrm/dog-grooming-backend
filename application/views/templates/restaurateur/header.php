<!DOCTYPE html>
<html lang="en" >
    <!-- begin::Head -->
    <head>
        <meta charset="utf-8" />
        <title>
            <?php
            $this->lang->load('ps', 'english');
            echo $this->lang->line('site_title');
            ?>
        </title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script>
            WebFont.load({
                google: {"families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>
        <!--end::Web font -->
        <!--begin::Base Styles -->
        <link href="<?php echo base_url('/theme/assets/vendors/base/vendors.bundle.css'); ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo base_url('/theme/assets/default/base/style.bundle.css'); ?>" rel="stylesheet" type="text/css" />
        <!--end::Base Styles -->
        <link rel="shortcut icon" href="<?php echo base_url('/theme/assets/default/media/img/logo/favicon.ico'); ?>" />

        <link href="<?php echo base_url('css/fullcalendar/fullcalendar.css'); ?>" rel="stylesheet">
        <link href="<?php echo base_url('css/fullcalendar/fullcalendar.print.css'); ?>" rel='stylesheet' media='print'>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="<?php echo base_url('js/jquery.js'); ?>"></script>
        <script src="<?php echo base_url('js/bootstrap.min.js'); ?>"></script>

        <script src="<?php echo base_url('js/dashboard.js'); ?>"></script>
        <script src="<?php echo base_url('js/jquery.validate.js'); ?>"></script>
        <script src="<?php echo base_url('js/modernizr.custom.js'); ?>"></script>
        <script src="<?php echo base_url('js/bootstrap-datetimepicker.min.js'); ?>"></script>


        <script src="<?php echo base_url('js/fullcalendar/moment.min.js'); ?>"></script>
         <!--<script src="<?php echo base_url('js/fullcalendar/jquery-2.1.1.js'); ?>"></script>
        <script src="<?php echo base_url('js/fullcalendar/jquery-ui.custom.min.js'); ?>"></script>
        -->
        <script src="<?php echo base_url('js/fullcalendar/fullcalendar.min.js'); ?>"></script>
        <script src="<?php echo base_url('js/fullcalendar/icheck.min.js'); ?>"></script>
    </head>
    <!-- end::Head -->