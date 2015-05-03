#!/usr/bin/env bats

@test 'should automaticaly restart hello world app' {
    run pkill node
    sleep 5
    command curl localhost:3000
}
