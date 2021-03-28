<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<script>
    jQuery(document).ready(function($) {

        if (window.history && window.history.pushState) {

            window.history.pushState('forward', null, '');

            $(window).on('popstate', function() {
                var URL="${createLink(controller:'annonce',action:'annuler')}";

                $.ajax({
                    url:URL,
                    success: function(resp){
                        window.history.back();
                    }
                });
            });

        }
    });</script>
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0"><g:message code="default.edit.label" args="[entityName]" /></h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active"><g:message code="default.edit.label" args="[entityName]" /></li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>

<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Modifier Annonce</h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
<g:uploadForm controller="annonce" action="update" id="${annonce.id}">
    <g:hiddenField name="version" value="${this.annonce?.version}" />
        <div class="card-body">
            <div class="form-group">
                <label for="exampleInputEmail1">Title</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="title" value="${annonce.title}" placeholder="Enter email">
            </div>
            <div class="form-group">
                <label for="s">Description</label>
                <input type="text" class="form-control" id="s"  name="description" value="${annonce.description}" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="e">Prix</label>
                <input type="text" class="form-control" id="e"  name="price" value="${annonce.price}" placeholder="Prix">
            </div>
            <div class="fieldcontain">
                <label for="illustrations">Illustrations</label>
                <g:each in="${annonce.illustrations}" var="illustration">
                    <img src="${baseUrl + illustration.filename}" id="img_${illustration.id}"/>
                    <button type="button" id="button_${illustration.id}" class="btn btn-danger" data-toggle="modal" data-target="#delete_${illustration.id}" data-whatever="@mdo">Delete</button>
                    <div class="modal fade" id="delete_${illustration.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 id="exampleModalLabel1">Vous voulez vraiment suprimer ${illustration.filename} de cette annonce? </h4>
                                </div>

                                <div class="modal-body">

                                    <script>
                                        function callAjax2(idData){
                                            console.log("voclick");


                                                    var URL="${createLink(controller:'annonce',action:'addIllustration')}";

                                                    $.ajax({
                                                        url:URL,
                                                        data: {id:idData},
                                                        success: function(resp){
                                                            document.getElementById("img_"+idData).remove();
                                                            document.getElementById("button_"+idData).remove();
                                                        }
                                                    });

                                        }

                                    </script>
                                <button type = "button" data-dismiss="modal" onclick="callAjax2(${illustration.id})" id="buttonOui" class="btn btn-success">Oui</button>

                                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">non</button>


                                </div>

                            </div>


                        </div>
                    </div>
                </g:each>
            </div>
            <div class="form-group">
                <label for="files">Ajoutez des illustrations:</label>
                <div class="input-group">
                    <div class="custom-file">
                    <input name="file" type="file" id="files" multiple><br><br>
                    </div>
                </div>
            </div>
            </div>

        </div>
        <!-- /.card-body -->

        <div class="card-footer">
            <button type="submit" class="btn btn-primary">Modifier</button>
        </div>
</g:uploadForm>
</div>


</body>
</html>
