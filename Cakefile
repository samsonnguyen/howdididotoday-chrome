{spawn, exec} = require 'child_process'

task 'build', 'continually build with --watch', ->
    coffee = spawn 'coffee', ['-cw', '-o', 'js', 'src']
    coffee.stdout.on 'data', (data) -> console.log data.toString().trim()