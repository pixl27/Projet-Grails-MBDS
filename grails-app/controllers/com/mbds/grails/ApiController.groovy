package com.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse

@Secured(['ROLE_ADMIN','ROLE_MODO'])
class ApiController {
    AnnonceService annonceService
    UserService userService
    SpringSecurityService springSecurityService

//    GET / PUT / PATCH / DELETE
//    url : localhost:8081/projet/api/annonce(s)/{id}
    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                response.withFormat {
                  xml { render annonceInstance as XML }
                   json { render annonceInstance as JSON }
                }
                serializeData(annonceInstance, request.getHeader("Accept"))
                break
            case "PUT":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST

                def req = request.JSON

                def annonce = Annonce.get(params.id)
                annonce.title = req.title
                println "params" + annonce.title

                annonce.description = req.description
                annonce.price = Double.parseDouble(req.price)
                //annonce.author = User.get(params.author.id)

                if (annonce == null) {
                    notFound()
                    return
                }
                annonceService.save(annonce)
                return response.status = HttpServletResponse.SC_OK
                break
            case "PATCH":
                break
            case "DELETE":
                if (!params.id)
                return response.status = HttpServletResponse.SC_BAD_REQUEST
                annonceService.delete(params.id)
                return response.status = HttpServletResponse.SC_OK
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST
    def annonces() {
        switch (request.getMethod()) {
            case "GET":
                def annonceInstance = annonceService.list();
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                serializeData(annonceInstance, request.getHeader("Accept"))
                break
            case "POST":
                def req = request.JSON

                def user = User.get(springSecurityService.currentUser.id)
                def annonce =new Annonce(
                        title: req.title,
                        description: req.description,
                        price: Double.parseDouble(req.price)
                )
                user.addToAnnonces(annonce)
                user.save(flush: true, failOnError: true)
                return response.status = HttpServletResponse.SC_OK
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / PUT / PATCH / DELETE
    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                serializeData(userInstance, request.getHeader("Accept"))
                break
            case "PUT":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def req = request.JSON

                def user = User.get(params.id)
                if (user == null) {
                    notFound()
                    return
                }
                user.username = req.username
                user.enabled = req.enabled
                user.accountExpired = req.accountExpired
                user.accountLocked = req.accountLocked
                user.passwordExpired = req.passwordExpired
                def role = Role.get(req.idrole)
                UserRole.create(user,role,true)
                userService.save(user)
                return response.status = HttpServletResponse.SC_OK
                break
            case "PATCH":
                break
            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                UserRole.removeAll(userService.get(params.id))
                userService.delete(params.id)
                return response.status = HttpServletResponse.SC_OK
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST
    def users() {
        switch (request.getMethod()) {
            case "GET":
                def user = userService.list();
                response.withFormat {
                    xml { render user as XML }
                    json { render user as JSON }
                }
                serializeData(user, request.getHeader("Accept"))
                break
            case "POST":
                def req = request.JSON
                def userUser = new User(username: req.username, password: req.password).save()
                def userRole = Role.findByAuthority(req.role)
                UserRole.create(userUser, userRole, true)


                return response.status = HttpServletResponse.SC_OK
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

    def serializeData(object, format)
    {
        switch (format)
        {
            case 'json':
            case 'application/json':
            case 'text/json':
                render object as JSON
                break
            case 'xml':
            case 'application/xml':
            case 'text/xml':
                render object as XML
                break
        }
    }
}
