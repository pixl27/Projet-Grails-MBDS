<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>


    <div class="card">
        <div class="card-header">
            <h3 class="card-title">DataTable with minimal features &amp; hover style</h3>
        </div>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" role="grid" aria-describedby="example1_info">
                        <thead>
                        <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Id</th><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Username</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Password Expired</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Account Locked</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Account Expired</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Enabled</th></tr>
                        </thead>
                        <tbody>

                        /*
                        String username
                        String password
                        boolean enabled = true
                        boolean accountExpired
                        boolean accountLocked
                        boolean passwordExpired

                        */
                        <g:each in="${userList}" var="utilisateur">
                            <tr class="">
                                <td class="dtr-control sorting_1" tabindex="0">${utilisateur.id}</td>
                                <td class="" tabindex="0">${utilisateur.username}</td>
                                <td>${utilisateur.passwordExpired}</td>
                                <td>${utilisateur.accountLocked}</td>
                                <td>${utilisateur.accountExpired}</td>
                                <td>${utilisateur.enabled}</td>
                                <td><input type="submit" class="btn btn-danger" value="Supprimer" /></td>
                            </tr>
                        </g:each>
                        </tbody>

                    </table></div></div><div class="row"></div></div>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
    <g:javascript>
        $(document).ready( function () {
            $('#example1').DataTable();
        } );
    </g:javascript>


    <!-- /.tableau listes utilisateur
        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${userList}" />

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
 -->

    </body>
</html>