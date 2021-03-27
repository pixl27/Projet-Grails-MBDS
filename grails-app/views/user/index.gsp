<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
<body>
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0"><g:message code="default.list.label" args="[entityName]" /></h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active"><g:message code="default.list.label" args="[entityName]" /></li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>


<div class="card">

    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Liste utilisateurs</h3>
        </div>
        <div class="card">

            <!-- /.card-header -->
            <div class="card-body">
                <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" role="grid" aria-describedby="example1_info">
                        <thead>
                        <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Id</th><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Username</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Password Expired</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Account Locked</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Account Expired</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Enabled</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Action</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Action</th></tr>
                        </thead>
                        <tbody>

                        <g:each in="${userList}" var="utilisateur">
                            <tr class="">
                                <td class="dtr-control sorting_1" tabindex="0">${utilisateur.id}</td>
                                <td class="" tabindex="0">${utilisateur.username}</td>
                                <td>${utilisateur.passwordExpired}</td>
                                <td>${utilisateur.accountLocked}</td>
                                <td>${utilisateur.accountExpired}</td>
                                <td>${utilisateur.enabled}</td>
                                <td>                            <g:link id="${utilisateur.id}" action="edit">Modifier</g:link>
                                </td>
                                <td><input id="deleteButton" data-id="${utilisateur.id}" class="btn btn-danger" value="Supprimer" /></td>
                            </tr>
                        </g:each>
                        </tbody>

                    </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>



<g:javascript>
    $(document).ready( function () {
        $('#example1').DataTable();
    } );
</g:javascript>
</body>
</html>