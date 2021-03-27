package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_MODO'])
class UserController {

    UserService userService
    SpringSecurityService springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond userService.list(params)
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {

        respond new User(params), model: [roleList:  Role.list()]
    }

    def save(User user) {

        if (user == null) {
            notFound()
            return
        }

        try {

            def userUser = new User(username: params.username, password: params.password ).save()
            def userRole = Role.findByAuthority(params.role)
            UserRole.create(userUser, userRole, true)

        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'Utilisateyr')])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def edit(Long id) {

        respond userService.get(id) , model: [roleList:  Role.list()]

    }

    def update() {
        def enabled
        def accountExpired
        def accountLocked
        def passwordExpired
        if(params.enabled == "on"){
             enabled = true
        }
        else {
              enabled = false
        }
        if(params.accountExpired == "on"){
             accountExpired = true
        }
        else {
              accountExpired = false
        }
        if(params.accountLocked == "on"){
             accountLocked = true
        }
        else {
               accountLocked = false
        }
        if(params.passwordExpired == "on"){
             passwordExpired = true
        }
        else {
             passwordExpired = false
        }

        def user = User.get(params.id)
        user.username = params.username
        user.enabled = enabled
        user.accountExpired = accountExpired
        user.accountLocked = accountLocked
        user.passwordExpired = passwordExpired
        def role = Role.get(params.role)
        UserRole.create(user,role,true)

//        user.author = User.get(params.author.id)
        if (user == null) {
            notFound()
            return
        }
        try {
            userService.save(user)

        }
        catch(Exception e){

        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'Utilisateur'), ""])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        try {


            UserRole.removeAll(userService.get(id))
            userService.delete(id)


        } catch (Exception e) {

        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
