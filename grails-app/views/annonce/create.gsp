<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <div class="card card-success">
                <div class="card-header">
                    <h3 class="card-title">Quick Example</h3>
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
                        <label for="files">Select files:</label>
                        <input name="file" type="file" id="files" name="files" multiple><br><br>
                      </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

                    </div>
                </g:uploadForm>
            </div>
        </div>
    </body>
</html>
