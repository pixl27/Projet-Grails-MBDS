<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:form controller="user" action="update" id="${user.id}" method="PUT">
        <g:hiddenField name="version" value="${this.user?.version}"/>
        <div class="card-body">
            <div class="form-group">
                <label for="exampleInputEmail1">Username</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="username" value="${user.username}" placeholder="Enter email">
            </div>
            <div class="form-group">
                <div class="form-check">
                    <g:if test="${user.enabled}">
                        <input class="form-check-input" name="enabled" type="checkbox" v id="flexCheckDefault1" checked>
                    </g:if>
                    <g:else>
                        <input class="form-check-input" name="enabled" type="checkbox"  id="flexCheckDefault1" >
                    </g:else>
                    <label class="form-check-label" for="flexCheckDefault1">
                        Compte Activé
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-check">
                    <g:if test="${user.accountExpired}">
                        <input class="form-check-input" name="accountExpired"   type="checkbox"  id="flexCheckDefault2" checked>
                    </g:if>
                    <g:else>
                        <input class="form-check-input" name="accountExpired" type="checkbox"  id="flexCheckDefault2" >
                    </g:else>                    <label class="form-check-label" for="flexCheckDefault2">
                        Compte Expiré
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-check">
                    <g:if test="${user.accountLocked}">
                        <input class="form-check-input" name="accountLocked" type="checkbox"  id="flexCheckDefault3" checked>
                    </g:if>
                    <g:else>
                        <input class="form-check-input" name="accountLocked" type="checkbox" id="flexCheckDefault3" >
                    </g:else>                    <label class="form-check-label" for="flexCheckDefault3">
                        Compte Bloqué
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-check">
                    <g:if test="${user.passwordExpired}">
                        <input class="form-check-input" name="passwordExpired" type="checkbox"  id="flexCheckDefault4" checked>
                    </g:if>
                    <g:else>
                        <input class="form-check-input" name="passwordExpired" type="checkbox"  id="flexCheckDefault4" >
                    </g:else>                    <label class="form-check-label" for="flexCheckDefault4">
                        Mot de passe expiré
                    </label>
                </div>
            </div>
            <div class="form-group">
                <select class="form-select" name="role" aria-label="Default select example">
                    <option value="${user.getAuthorities().first().id}" selected>${user.getAuthorities().first().authority}</option>
                    <g:each in="${roleList}" var="role">
                        <g:if test="${role!=user.getAuthorities().first()}">
                            <option value="${role.id}">${role.authority}</option>
                        </g:if>

                        </g:each>
                        </select>
                    </div>
                </div>
                <!-- /.card-body -->

        <div class="card-footer">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </g:form>
        </div>


    </body>
</html>
