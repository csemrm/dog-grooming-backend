<?php $this->load->view('templates/restaurateur/header'); ?> 
<!-- end::Body -->
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default"  >
    <!-- begin:: Page -->
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <!-- BEGIN: Header -->
        <?php
        if ($edit_mode) {
            $data['mode'] = $edit_mode;
            //echo " >>>here " . $edit_mode;
            $this->load->view('templates/restaurateur/nav', $data);
        } else {
            $this->load->view('templates/restaurateur/nav');
        }
        ?>
        <!-- END: Header -->
        <!-- begin::Body -->
        <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
            <!-- BEGIN: Left Aside -->
            <?php
            if ($sidebar) {
                $this->load->view('templates/restaurateur/sidebar');
            }
            ?>
            <!-- END: Left Aside -->
            <div class="m-grid__item m-grid__item--fluid m-wrapper">
                <?php print_r($content['content']); ?>
                
            </div>
        </div>
        <!-- end:: Body -->
        <?php $this->load->view('templates/restaurateur/footer'); ?> 
    </div>
    <!-- end:: Page -->

    <!-- begin::Scroll Top -->
    <div class="m-scroll-top m-scroll-top--skin-top" data-toggle="m-scroll-top" data-scroll-offset="500" data-scroll-speed="300">
        <i class="la la-arrow-up"></i>
    </div>
    <!-- end::Scroll Top -->
    <!-- begin::Quick Nav -->

    <!-- begin::Quick Nav -->
    <!--begin::Base Scripts -->
    <script src="<?php echo base_url('/theme/assets/vendors/base/vendors.bundle.js'); ?>" type="text/javascript"></script>
    <script src="<?php echo base_url('/theme/assets/default/base/scripts.bundle.js'); ?>" type="text/javascript"></script>
    <!--end::Base Scripts -->
    <!--begin::Page Snippets -->
    <script src="<?php echo base_url('/theme/assets/app/js/dashboard.js'); ?>" type="text/javascript"></script>
    <!--end::Page Snippets -->
</body>
<!-- end::Body -->
</html>