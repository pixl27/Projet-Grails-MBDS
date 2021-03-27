<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

            <div class="card card-success">
                <div class="card-header">
                    <h3 class="card-title">Ajouter Utilisateur</h3>
                </div>
            <!-- /.card-header -->
            <!-- form start -->

                <g:uploadForm controller="annonce" action="save" method="POST">
                    <div class="card-body">
                      <div class="form-group">
                        <label for="titre">Titre *</label>
                        <input name="title" type="text" class="form-control" id="titre" placeholder="titre">
                      </div>
                      <div class="form-group">
                        <label for="desc">Description *</label>
                        <input name="description" type="text" class="form-control" id="desc" placeholder="description">
                      </div>
                      <div class="form-group">
                        <label for="price">Price *</label>
                        <input name="price" type="text" class="form-control" id="price" placeholder="price">
                      </div>
                       <div class="form-group">
                         <label for="files">Ajoutez des illustrations:</label>
                        <div class="input-group">
                            <div class="custom-file">
                            <input name="file" type="file" id="files" multiple><br><br>
                        </div>
                    </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                    <g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />

                    </div>
                </g:uploadForm>
            </div>
        </div>
    </body>
</html>
