module.exports = {
  plugins: [
    require('daisyui'),
  ],
  daisyui: {
    themes: [
      "autumn"
    ],
  },
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
