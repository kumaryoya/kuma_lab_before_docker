const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        title: ['Stick', "sans-serif"],
        devil: ['Yuji Mai', "serif"],
        zoo: ['Kosugi Maru', "sans-serif"],
      },
      colors: {
        "gray": "#C0C0C0",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('daisyui'),
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#BD0900",
          "info": "#BD0900",
          "secondary": "#3597DE",
          "success": "#3597DE",
          "accent": "#49b041",
          "warning": "#49b041",
          "neutral": "#ffd400",
          "error": "#ffd400",
        },
      },
    ],
  },
}
