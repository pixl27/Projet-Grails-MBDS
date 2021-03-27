package projet_itu_2020_2021

import com.mbds.grails.Annonce
import com.mbds.grails.Illustration
import com.mbds.grails.Role
import com.mbds.grails.User
import com.mbds.grails.UserRole


class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def modRole = new Role(authority: "ROLE_MODO").save()
        def userRole = new Role(authority: "ROLE_USER").save()

        def adminUser = new User(username: "admin", password: "password").save()
        def modUser = new User(username: "moderateur", password: "password").save()
        def userUser = new User(username: "client", password: "password").save()

        grails.project.fork = [
// Configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
//  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
// Configure settings for the test-app JVM, uses the daemon by default
test: [maxMemory: 768, minMemory: 768, debug: false, maxPerm: 768, daemon:true],
// Configure settings for the run-app JVM
run: [maxMemory: 4560, minMemory: 1024, debug: false, maxPerm: 2560, forkReserve:false],
// Configure settings for the run-war JVM
war: [maxMemory: 4560, minMemory: 2560, debug: false, maxPerm: 2560, forkReserve:false],
// Configure settings for the Console UI JVM
console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]
        UserRole.create (adminUser, adminRole, true)
        UserRole.create(modUser, modRole, true)
        UserRole.create(userUser, userRole, true)


    }
    def destroy = {
    }
}
