module.exports = (grunt)->

  dist = 'dist'
  src = 'psd'
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
        src: [dist]

    exec:
      evenizer:
        command: "evenizer -i ./#{dist}/**/*.png"

    #copyしないとwatchしてるところでずっとループしてしまう
    copy:
      psdAssets:
        files: [
          {expand: true, cwd: src,src: ['**/*', '!**/*.psd'], dest: dist, filter: 'isFile'},
        ]

    watch:
      all:
        files: "#{src}/**/*.{png,jpg,gif}"
        tasks: ['imageTask']
        options:
#          interrupt: true
          debounceDelay: 1000


    clean:
      dist: [dist]


  grunt.registerTask 'default', ->
    console.log 'nothing...'


  grunt.registerTask 'imageTask', ['copy', 'exec:evenizer', 'imageoptim']

  grunt.registerTask 'min', ['imagemin']

