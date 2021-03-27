<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0"><g:message code="default.show.label" args="[entityName]" /></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active"><g:message code="default.show.label" args="[entityName]" /></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>


        <!-- Default box -->
        <div class="card card-solid">
            <div class="card-body">
                <g:if test='${flash.message}'>
                    <div class="alert alert-success" role="alert">${flash.message}</div>
                </g:if>
                <div class="row">
                    <div class="col-12 col-sm-6">
                        <h3 class="d-inline-block d-sm-none"></h3>
                        <div class="col-12">
                            <img src="${baseUrl + annonce.illustrations.first().filename}" class="product-image" alt="Product Image">
                        </div>
                        <div class="col-12 product-image-thumbs">
                            <g:each in="${annonce.illustrations}" var="illustration">
                                <div class="product-image-thumb active"><img src="${baseUrl + illustration.filename}" alt="Product Image"></div>
                            </g:each>

                        </div>
                    </div>
                    <div class="col-12 col-sm-6">
                        <h3 class="my-3">${annonce.title}</h3>


                        <hr>








                        <div class="mt-4">
                            <h4 class="my-3">Auteur de L'annonce:</h4>
                            <h5 class="my-3">${annonce.author.username}</h5>
                            <h4 class="my-3">Prix de L'annonce:</h4>
                            <h5 class="my-3">${annonce.price}</h5>

                        </div>



                    </div>
                </div>
                <div class="row mt-4">
                    <nav class="w-100">
                        <div class="nav nav-tabs" id="product-tab" role="tablist">
                            <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>


                        </div>
                    </nav>
                    <div class="tab-content p-3" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> ${annonce.description}</div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->


    </body>
</html>
