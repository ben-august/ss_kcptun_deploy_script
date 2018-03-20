#!/bin/bash
set -e

log() {
    printf "%s %s\n" "[$(date "+%Y-%m-%d %H:%M:%S")]" "$1"
}

checkRequirement() {
    
    command -v docker > /dev/null 2>&1 || { log "[ERROR] Please install docker first"; exit 1; }
    command -v docker-compose > /dev/null 2>&1 || { log "[ERROR] Please install docker first"; exit 1; }
    
    if [ ! -f .env ]; then
        log "[ERROR] Please create .env file first"
        exit 1
    fi

}

runServices() {
    
    # Pull Images
    docker-compose pull --quiet \
        && log "[LOG] Pull images success." \
        || log "[ERROR] Pull images fail."

    # Remove & Recreate Container
    docker-compose rm -f \
        && docker-compose up -d --force-recreate \
        && log "[LOG] Recreate container success." \
        || log "[ERROR] Recreate container fail."

    # Clean Unused Images
    if [ $(docker images -f "dangling=true" -q) ]; then
        docker rmi $(docker images -f "dangling=true" -q) \
        && log "[LOG] Clean unused images success." \
        || log "[ERROR] Clean unused images fail."
    fi
}


main() {
    
    checkRequirement
    runServices

    # Show Status
    docker-compose ps

}

main "$@"