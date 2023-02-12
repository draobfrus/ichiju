module.exports = {
  theme: {
    extend: {
      colors: {
        'sumire': '#d1d0ee',
        'botan': '#ef5241',
        'azuki': '#6a3f4c',
        'tamago': '#fff5ac',
        'sakura': '#ffa67e',
        'ohagi': '#ece3e6',
        'vegetable': '#006e54',
        'meat': '#ce5242',
        'fish': '#1c305c',
        'seasoning': '#f8b500',
        'other': '#281a14',
      },
    },
  },
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
