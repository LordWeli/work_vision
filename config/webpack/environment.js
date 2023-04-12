const { environment } = require('@rails/webpacker');
const babelLoader = environment.loaders.get('babel');

// Limpa todas as configurações dos presets
babelLoader.use.splice(0, 1);

// Adiciona apenas o preset de JS
babelLoader.use.push({
  loader: 'babel-loader',
  options: {
    presets: ['@babel/preset-env'],
  },
});

environment.loaders.append('babel', babelLoader);

module.exports = environment;
