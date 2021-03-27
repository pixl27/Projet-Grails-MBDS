<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:javascript src="application.js"/>

    <asset:javascript src="plugins/bootstrap/js/bootstrap.bundle.min.js"/>
    <!-- DataTables  & Plugins -->
    <asset:javascript src="plugins/datatables/jquery.dataTables.min.js"/>
    <asset:javascript src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"/>
    <asset:javascript src="plugins/datatables-responsive/js/dataTables.responsive.min.js"/>
    <asset:javascript src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"/>
    <asset:javascript src="plugins/datatables-buttons/js/dataTables.buttons.min.js"/>
    <asset:javascript src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"/>

    <!-- AdminLTE Ap -->
    <asset:javascript src="js/adminlte.min.js"/>

    <asset:stylesheet src="plugins/fontawesome-free/css/all.min.css"/>
    <asset:stylesheet src="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>
    <asset:stylesheet src="plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>
    <asset:stylesheet src="plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>
    <asset:stylesheet src="css/adminlte.min.css"/>
    <g:layoutHead/>



</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Preloader -->
    <div class="preloader flex-column justify-content-center align-items-center">
        <asset:image src="AdminLTELogo.png" alt="AdminLTELogo" class="animation__shake" height="60" width="60"/>
    </div>

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <g:link url="/projet/" class="nav-link">
                    Home
                </g:link>

            </li>

        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>



            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="index3.html" class="brand-link">

            <asset:image src="AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"/>
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">

                    <asset:image src="user2-160x160.jpg" alt="User Image" class="img-circle elevation-2"/>
                </div>
                <div class="info">
                    <a href="#" class="d-block"><sec:loggedInUserInfo field='username'/></a>
                </div>
            </div>



            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->










                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-book"></i>
                            <p>Liste
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <g:link controller="annonce" class="create nav-link">
                                    <i class="fas fa-angle-double-right nav-icon"></i>
                                    <p>Annonce</p>
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link controller="user" class="create nav-link">
                                    <i class="fas fa-angle-double-right nav-icon"></i>
                                    <p>Utilisateur</p>
                                </g:link>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Ajouter
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">


                            <li class="nav-item">
                                <g:link controller="annonce" class="create nav-link" action="create">
                                    <i class="fas fa-angle-double-right nav-icon"></i>
                                    <p>Annonce</p>
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link controller="user" class="create nav-link" action="create">
                                    <i class="fas fa-angle-double-right nav-icon"></i>
                                    <p>Utilisateur</p>
                                </g:link>
                            </li>

                        </ul>
                    </li>
                </ul>
                <sec:ifLoggedIn>
                    <g:form controller="logout">
                        <g:submitButton class="nav-link" name="logout" value="Logout" />
                    </g:form>
                </sec:ifLoggedIn>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">

    <g:layoutBody/>

</section>
    <!-- /.content -->
</div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 3.1.0
        </div>
    </footer>

    <!-- Control Sidebar -->

    <!-- /.control-sidebar -->
</div>


</body>

</html>
