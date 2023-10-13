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
        dog: ['Hachi Maru Pop', "cursive"],
        cat: ['Zen Maru Gothic', "sans-serif"],
        qiita: ['Yuji Syuku', "serif"],
        manga: ['Kaisei Opti', "serif"],
        shogun: ['Zen Antique', "serif"],
        movie: ['Train One', "serif"],
      },
      colors: {
        "gray": "#C0C0C0",
        "qiita": "#F5F6F6",
        "shogun": "#E4D197",
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
          "primary": "#E29956",
          "info": "#E29956",
          "secondary": "#3597DE",
          "success": "#3597DE",
          "accent": "#55C500",
          "warning": "#55C500",
          "neutral": "#B20200",
          "error": "#B20200",
        },
      },
    ],
  },
}
