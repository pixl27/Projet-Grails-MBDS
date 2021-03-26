<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Quick Example</h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
<g:uploadForm controller="annonce" action="update" id="${annonce.id}">
    <g:hiddenField name="version" value="${this.annonce?.version}"/>
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
                    <img src="${baseUrl + illustration.filename}" />
                </g:each>
            </div>
            <div class="form-group">
                <label for="exampleInputFile">Ajoutez nouvelle image</label>
                <div class="input-group">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" name="file" id="file">
                        <label class="custom-file-label" for="exampleInputFile">Choisir une nouvelle fichier</label>
                    </div>
                    <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.card-body -->

        <div class="card-footer">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
</g:uploadForm>
</div>
</body>
</html>
