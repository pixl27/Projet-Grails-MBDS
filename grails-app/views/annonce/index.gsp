<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>

    <body>


    <div class="card">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Liste des Annonces</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" role="grid" aria-describedby="example1_info">
                    <thead>
                    <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Id</th><th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Titre</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Prix</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Description(s)</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Modifier</th><th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Supprimer</th></tr>
                    </thead>
                    <tbody>
<g:each in="${annonceList}" var="annonce">
                    <tr class="">
                        <td class="dtr-control sorting_1" tabindex="0">${annonce.id}</td>
                        <td class="" tabindex="0"><g:link id="${annonce.id}" action="show">${annonce.title}</g:link></td>
                        <td>${annonce.price}</td>
                        <td>${annonce.description}</td>
                        <td>
                            <g:link id="${annonce.id}" action="edit">modifier</g:link>

                        </td>
                        <td>
    <g:form resource="${annonce}" method="DELETE">
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
<!-- jQuery -->

<!-- Page specific script -->

</html>