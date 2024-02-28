document.addEventListener("DOMContentLoaded", function() {
    // Obtém o campo de entrada de cor
    var colorField = document.getElementById("color");
  
    // Adiciona um listener para detectar mudanças no campo de entrada de cor
    colorField.addEventListener("input", function() {
      // Obtém o valor da cor selecionada pelo usuário
      var selectedColor = colorField.value;
  
      // Seleciona o header e muda a cor de fundo
      var header = document.getElementById("meu-header");
      header.style.backgroundColor = selectedColor;
  
      // Seleciona o footer e muda a cor de fundo
      var footer = document.getElementById("meu-footer");
      footer.style.backgroundColor = selectedColor;
    });
  });