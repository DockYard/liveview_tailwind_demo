module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {
      animation: {
        'fade-in-scale': '0.3s ease-in normal forwards 1 fade-in-scale',
        'fade-out-scale': '0.3s ease-out normal forwards 1 fade-out-scale',
        'fade-in': '0.3s ease-in 0s normal forwards 1 fade-in',
        'fade-out': '0.3s ease-out 0s normal forwards 1 fade-out'
      },
      keyframes: {
        'fade-in-scale': {
          '0%': { transform: 'scale(0.95)', opacity: 0 },
          '100%': { transform: 'scale(1.0)', opacity: 1 }
        },
        'fade-out-scale': {
          '0%': { transform: 'scale(1.0)', opacity: 1 },
          '100%': { transform: 'scale(0.95)', opacity: 0 }
        },
        'fade-in': {
          '0%': { opacity: 0 },
          '100%': { opacity: 1 }
        },
        'fade-out': {
          '0%': { opacity: 1 },
          '100%': { opacity: 0 }
        }
      }
    },
  },
  plugins: [],
}
