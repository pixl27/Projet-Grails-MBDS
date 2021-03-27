package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class AnnonceController {

    AnnonceService annonceService
    SpringSecurityService springSecurityService
    IllustrationService illustrationService
    def illustrationAsupprimer = []

    def index(Integer max) {
        respond annonceService.list(params)
    }

    def addIllustration(Long id){
        println "id"+id
        illustrationAsupprimer.add(id)
        render(status: 200)
    }

    def show(Long id) {
        respond annonceService.get(id) , model: [annonceList: Annonce.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    def create() {
        println "mandalo create"+params
        respond new Annonce(params)
    }

    def save(Annonce annonce) {
        println "mandalo save"+annonce
        if (annonce == null) {
            notFound()
            return
        }
        try {
            def document = request.getFiles("file")
            document.each { file ->
                if(!file.isEmpty()){
                    File fileDest = new File(grailsApplication.config.annonces.illustrations.path+file.originalFilename)
                    file.transferTo(fileDest)
                    annonce.addToIllustrations(new Illustration(filename: file.originalFilename))
                }
            }
            def user = User.get(springSecurityService.currentUser.id)
            user.addToAnnonces(annonce)
            user.save(flush: true, failOnError: true)
            println "vita chocolat"

        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {

        respond annonceService.get(id), model: [userList: User.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    def update() {
        def annonce = Annonce.get(params.id)

        if (annonce == null) {
            notFound()
            return
        }
        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Double.parseDouble(params.price)

        def document = request.getFiles("file")
        document.each { file ->
            if(!file.isEmpty()){
                File fileDest = new File(grailsApplication.config.annonces.illustrations.path+file.originalFilename)
                file.transferTo(fileDest)
                annonce.addToIllustrations(new Illustration(filename: file.originalFilename))
            }
        }
        println "test submit"+illustrationAsupprimer.size()

        try {

            annonceService.save(annonce)
            if(!illustrationAsupprimer.isEmpty()){
                for (Long id : illustrationAsupprimer) {
                    println "illustrationId"+id
                    def illustration = annonce.illustrations.find {it.id==id}
                    println "illustration"+illustration.filename+"id"+id
                    annonce.removeFromIllustrations(illustration).save()
                    illustrationService.delete(id)
                    annonce.save(flush:true)
                }
                println "illustration isa"+annonce.illustrations.size()
                illustrationAsupprimer.clear()
            }


        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
