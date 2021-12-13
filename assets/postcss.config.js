module.exports = {
  plugins: {
    'postcss-import': {},
    tailwindcss: {},
    autoprefixer: {},
    // Use cssnano to minify code in production
    ...(process.env.NODE_ENV === 'production' ? { cssnano: {} } : {})
  }
}
