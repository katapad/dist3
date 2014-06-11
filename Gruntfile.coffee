module.exports = (grunt)->

  dist = 'dist/'
  src = 'psd/'
  require('load-grunt-config')(grunt)

  grunt.initConfig
    imagemin:
      all:
        files: [{
          expand: true
          cwd: src
          src: ['**/*.{png,jpg,gif}']
          dest: dist
        }]

    imageoptim:
      options:
        imageAlpha: true
        quitAfter: true
      all:
        src: [src]

  grunt.registerTask 'default', ->
    console.log 'nothing...'


  grunt.registerTask 'min', ['imagemin']

