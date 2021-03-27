<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
<body>


<a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
                    <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Id</th><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Nom d'utilisateur</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Compte Expiré</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Annonces</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Modifier</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Supprimer</th></tr>
                    </thead>
                    <tbody>
                    <g:each in="${userList}" var="user">
                        <tr class="">
                            <td class="dtr-control sorting_1" tabindex="0">${user.id}</td>
                            <td class="" tabindex="0">${user.username}</td>
                            <td>${user.accountExpired}</td>
                            <td>
                                <ul class="list-group">
                        <g:each in="${user.annonces}" var="userannonce">
                                    <li class="list-group-item"><g:link id="${userannonce.id}" controller="annonce" action="show">${userannonce.title}</g:link></li>
                        </g:each>
                                </ul>
                            </td>
                            <td>
                                <g:link id="${user.id}" action="edit">modifier</g:link>

                            </td>
                            <td>
                                <g:form resource="${user}" method="DELETE">
                                    <input type="submit" class="btn btn-danger" value="Supprimer" />
                                </g:form>
                            </td>
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
</body>
</html>