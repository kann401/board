<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- ##js,css  -->
<style>
        /* Loading Spinner */
        .spinner{margin:0;width:70px;height:18px;margin:-35px 0 0 -9px;position:absolute;top:50%;left:50%;text-align:center}.spinner > div{width:18px;height:18px;background-color:#333;border-radius:100%;display:inline-block;-webkit-animation:bouncedelay 1.4s infinite ease-in-out;animation:bouncedelay 1.4s infinite ease-in-out;-webkit-animation-fill-mode:both;animation-fill-mode:both}.spinner .bounce1{-webkit-animation-delay:-.32s;animation-delay:-.32s}.spinner .bounce2{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bouncedelay{0%,80%,100%{-webkit-transform:scale(0.0)}40%{-webkit-transform:scale(1.0)}}@keyframes bouncedelay{0%,80%,100%{transform:scale(0.0);-webkit-transform:scale(0.0)}40%{transform:scale(1.0);-webkit-transform:scale(1.0)}}
    </style>
    <meta charset="UTF-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Favicons -->

<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../resources/assets/images/icons/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../resources/assets/images/icons/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../resources/assets/images/icons/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="../resources/assets/images/icons/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="../resources/assets/images/icons/favicon.png">
<link rel="stylesheet" type="text/css" href="../resources/assets/bootstrap/css/bootstrap.css">


<!-- HELPERS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/animate.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/backgrounds.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/boilerplate.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/border-radius.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/grid.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/page-transitions.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/spacing.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/typography.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/utils.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/colors.css">

<!-- ELEMENTS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/elements/badges.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/buttons.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/content-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/dashboard-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/forms.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/images.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/info-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/invoice.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/loading-indicators.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/menus.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/panel-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/response-messages.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/responsive-tables.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/ribbon.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/social-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/tables.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/tile-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/elements/timeline.css">

<!-- FRONTEND ELEMENTS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/blog.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/cta-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/feature-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/footer.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/hero-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/icon-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/portfolio-navigation.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/pricing-table.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/sliders.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/frontend-elements/testimonial-box.css">

<!-- ICONS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/icons/fontawesome/fontawesome.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/icons/linecons/linecons.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/icons/spinnericon/spinnericon.css">


<!-- WIDGETS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/accordion-ui/accordion.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/calendar/calendar.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/carousel/carousel.css">

<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/charts/justgage/justgage.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/charts/morris/morris.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/charts/piegage/piegage.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/charts/xcharts/xcharts.css">

<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/chosen/chosen.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/colorpicker/colorpicker.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/datatable/datatable.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/datepicker/datepicker.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/datepicker-ui/datepicker.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/dialog/dialog.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/dropdown/dropdown.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/dropzone/dropzone.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/file-input/fileinput.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/input-switch/inputswitch.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/input-switch/inputswitch-alt.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/ionrangeslider/ionrangeslider.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/jcrop/jcrop.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/jgrowl-notifications/jgrowl.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/loading-bar/loadingbar.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/maps/vector-maps/vectormaps.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/markdown/markdown.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/modal/modal.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/multi-select/multiselect.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/multi-upload/fileupload.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/nestable/nestable.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/noty-notifications/noty.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/popover/popover.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/pretty-photo/prettyphoto.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/progressbar/progressbar.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/range-slider/rangeslider.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/slidebars/slidebars.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/slider-ui/slider.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/tabs-ui/tabs.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/theme-switcher/themeswitcher.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/timepicker/timepicker.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/tocify/tocify.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/tooltip/tooltip.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/touchspin/touchspin.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/uniform/uniform.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/wizard/wizard.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/xeditable/xeditable.css">

<!-- FRONTEND WIDGETS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/layerslider/layerslider.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/owlcarousel/owlcarousel.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/fullpage/fullpage.css">

<!-- SNIPPETS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/chat.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/files-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/login-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/notification-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/progress-box.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/todo.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/user-profile.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/snippets/mobile-navigation.css">

<!-- Components theme -->

<link rel="stylesheet" type="text/css" href="../resources/assets/themes/components/default.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/themes/components/border-radius.css">

<!-- Frontend responsive -->

<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/responsive-elements.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/frontend-responsive.css">

<!-- Frontend theme -->

<link rel="stylesheet" type="text/css" href="../resources/assets/themes/frontend/layout.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/themes/frontend/color-schemes/default.css">

<!-- APPLICATIONS -->

<link rel="stylesheet" type="text/css" href="../resources/assets/applications/mailbox.css">

<!-- Admin theme -->

<link rel="stylesheet" type="text/css" href="../resources/assets/themes/admin/layout.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/themes/admin/color-schemes/default.css">

<!-- Components theme -->

<link rel="stylesheet" type="text/css" href="../resources/assets/themes/components/default.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/themes/components/border-radius.css">

<!-- Admin responsive -->

<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/responsive-elements.css">
<link rel="stylesheet" type="text/css" href="../resources/assets/helpers/admin-responsive.css">

    <!-- JS Core -->
	

    <script type="text/javascript" src="../resources/assets/js-core/jquery-core.js"></script>
    <script type="text/javascript" src="../resources/assets/js-core/jquery-ui-core.js"></script>
    <script type="text/javascript" src="../resources/assets/js-core/jquery-ui-widget.js"></script>
    <script type="text/javascript" src="../resources/assets/js-core/jquery-ui-mouse.js"></script>
    <script type="text/javascript" src="../resources/assets/js-core/jquery-ui-position.js"></script>
    <!--<script type="text/javascript" src="../resources/assets/js-core/transition.js"></script>-->
    <script type="text/javascript" src="../resources/assets/js-core/modernizr.js"></script>
    <script type="text/javascript" src="../resources/assets/js-core/jquery-cookie.js"></script>





    <script type="text/javascript">
        $(window).load(function(){
            setTimeout(function() {
                $('#loading').fadeOut( 400, "linear" );
            }, 300);
        });
    </script>
    

<!-- 부트스트랩 영역 -->
<div id="page-header" class="bg-gradient-9">
    <div id="mobile-navigation">
        <button id="nav-toggle" class="collapsed" data-toggle="collapse" data-target="#page-sidebar"><span></span></button>
        <a href="${path}" class="logo-content-small" title="MonarchUI"></a>
    </div>
    <div id="header-logo" class="logo-bg">
        <a href="${path}" class="logo-content-big" title="MonarchUI">
            Monarch <i>UI</i>
            <span>The perfect solution for user interfaces</span>
        </a>
        <a href="index.html" class="logo-content-small" title="MonarchUI">
            Monarch <i>UI</i>
            <span>The perfect solution for user interfaces</span>
        </a>
        <a id="close-sidebar" href="#" title="Close sidebar">
            <i class="glyph-icon icon-angle-left"></i>
        </a>
    </div>
    <div id="header-nav-left">
        <div class="user-account-btn dropdown">
            <a href="#" title="My Account" class="user-profile clearfix" data-toggle="dropdown">
                <img width="28" src="../resources/assets/image-resources/gravatar.jpg" alt="Profile image">
                <c:choose>
                	<c:when test="${sessionScope.userid != null}">
                		<span>${sessionScope.userid}</span>
                	</c:when>
                	<c:otherwise>
               			<span>비로그인 상태</span>
                	</c:otherwise>
                </c:choose>
                <i class="glyph-icon icon-angle-down"></i>

            </a>
            <div class="dropdown-menu float-left">
                <div class="box-sm">
                    <div class="login-box clearfix">
                        <div class="user-img">
                            <a href="#" title="" class="change-img">Change photo</a>
                            <img src="../resources/assets/image-resources/gravatar.jpg" alt="">
                        </div>
                        <c:choose>
                        <c:when test="${sessionScope.userid != null }">
                        <div class="user-info">
                            <span>
                                ${sessionScope.userid}
                                <i>${sessionScope.name} 님</i>
                            </span>
                            <a href="#" title="Edit profile">Edit profile</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                        <div class="user-info">
                        <span>
                              	로그인 해주세요
                              	<i>로그인 해주세요</i>
                            </span>
                            <a href="${path}/member/joinForm.do" title="">Join us</a>
                            </div>
                        </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <c:choose>
                    <c:when test="${sessionScope.userid != null }">
                            <div class="pad5A button-pane button-pane-alt text-center">
                        <a href="${path}/member/logout.do" class="btn display-block font-normal btn-danger">
                            <i class="glyph-icon icon-power-off"></i>
                            Logout
                        </a>
                    </div>
                       </c:when>
                       <c:otherwise>	
                    
                            <div class="pad5A button-pane button-pane-alt text-center">
                        <a href="${path}/member/loginForm" class="btn display-block font-normal btn-success">
                            <i class="glyph-icon icon-power-off"></i>
                            Login
                        </a>
                    </div>
                    </c:otherwise>
                  </c:choose>      
                    
                    
                    
                </div>
            </div>
        </div>
    </div><!-- #header-nav-left -->

    <div id="header-nav-right">
    <!-- 회원가입 버튼과 가입하기 버튼은 로그인 상태에서는 노출시키지 않는다. -->
    <c:if test="${sessionScope.userid == null}">
        <!-- 회원가입 버튼 -->
        <div class="dropdown" id="notifications-btn">
            <a href="${path}/member/joinForm.do" title="회원가입">
                <i class="glyph-icon icon-linecons-heart"></i>
            </a>
        </div>
        <!-- 로그인 버튼 -->    
        <div class="dropdown" id="progress-btn">
            <a href="${path}/member/loginForm" title="로그인">
                <i class="glyph-icon icon-linecons-user"></i>
            </a>
        </div>
    </c:if>
        <!-- 게시판 버튼 -->    
        <div class="dropdown" id="cloud-btn">
            <a href="${path}/board/list.do" title="게시판">
                <i class="glyph-icon icon-linecons-megaphone"></i>
            </a>
        </div>
        
        

    </div><!-- #header-nav-right -->

</div>



  
    <!-- WIDGETS -->
    
<script type="text/javascript" src="../resources/assets/tether/js/tether.js"></script>
<script type="text/javascript" src="../resources/assets/bootstrap/js/bootstrap.js"></script>

<!-- Bootstrap Dropdown -->

<!-- <script type="text/javascript" src="../resources/assets/widgets/dropdown/dropdown.js"></script> -->

<!-- Bootstrap Tooltip -->

<!-- <script type="text/javascript" src="../resources/assets/widgets/tooltip/tooltip.js"></script> -->

<!-- Bootstrap Popover -->

<!-- <script type="text/javascript" src="../resources/assets/widgets/popover/popover.js"></script> -->

<!-- Bootstrap Progress Bar -->

<script type="text/javascript" src="../resources/assets/widgets/progressbar/progressbar.js"></script>

<!-- Bootstrap Buttons -->

<!-- <script type="text/javascript" src="../resources/assets/widgets/button/button.js"></script> -->

<!-- Bootstrap Collapse -->

<!-- <script type="text/javascript" src="../resources/assets/widgets/collapse/collapse.js"></script> -->

<!-- Superclick -->

<script type="text/javascript" src="../resources/assets/widgets/superclick/superclick.js"></script>

<!-- Input switch alternate -->

<script type="text/javascript" src="../resources/assets/widgets/input-switch/inputswitch-alt.js"></script>

<!-- Slim scroll -->

<script type="text/javascript" src="../resources/assets/widgets/slimscroll/slimscroll.js"></script>

<!-- Slidebars -->

<script type="text/javascript" src="../resources/assets/widgets/slidebars/slidebars.js"></script>
<script type="text/javascript" src="../resources/assets/widgets/slidebars/slidebars-demo.js"></script>

<!-- PieGage -->

<script type="text/javascript" src="../resources/assets/widgets/charts/piegage/piegage.js"></script>
<script type="text/javascript" src="../resources/assets/widgets/charts/piegage/piegage-demo.js"></script>

<!-- Screenfull -->

<script type="text/javascript" src="../resources/assets/widgets/screenfull/screenfull.js"></script>

<!-- Content box -->

<script type="text/javascript" src="../resources/assets/widgets/content-box/contentbox.js"></script>

<!-- Overlay -->

<script type="text/javascript" src="../resources/assets/widgets/overlay/overlay.js"></script>

<!-- Widgets init for demo -->

<script type="text/javascript" src="../resources/assets/js-init/widgets-init.js"></script>

<!-- Theme layout -->

<script type="text/javascript" src="../resources/assets/themes/admin/layout.js"></script>

<!-- Theme switcher -->

<script type="text/javascript" src="../resources/assets/widgets/theme-switcher/themeswitcher.js"></script>
