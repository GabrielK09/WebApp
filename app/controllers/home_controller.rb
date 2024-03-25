class HomeController < ApplicationController
  def index
    @numero_whatsapp = "+554999482859"
    @meu_nome = params[:nome]

    $num1 = rand(0..10)
    $num2 = rand(0..10)

    @palavra = params[:palavra]

    if @palavra.present?
      @reverse = @palavra.reverse
      flash[:notice] = "Palavra Invertida: #{@reverse}"
    else
      flash.delete(:notice)  # Certificando-se de limpar a flash se não houver palavra presente
    end

    @x = Time.new
    if @x.present?
      flash[:notice_2] = "Data Atual: #{@x}"
    end

    @original_word = params[:original_word]
    if @original_word.present?

      @word = @original_word.chars.shuffle.join
      flash[:notice_word_2] = "Palavra Embaralhada: #{@word}"

    end
  end

  def resultado
    @numero1 = params[:nm1].to_f
    @numero2 = params[:nm2].to_f
    @operador = params[:operacao]

    @resultado =
    case @operador
    when "+"
      @numero1 + @numero2

    when "-"
      @numero1 - @numero2

    when "x"
      @numero1 * @numero2

    when "÷"
      @numero1 / @numero2

    end
  end

  def palavras
    @palavra = params[:work]
    @quantidade = params[:qnt].to_i

    @resultado = ''

    @quantidade.times do |i|
    @resultado += @palavra

    @resultado += ', ' unless i == @quantidade - 1

    end
  end

  def check_answer
    @minha_resposta = params[:tentativa].to_i

    @resposta_correta = $num1 + $num2

  end

  def work_random
    @quantia_letras = params[:letras].to_i

    @word = Cicero.words(@quantia_letras)

  end

  def gerar_qr_code
    @url = params[:url]
    #@size = params[:size].to_i
  
    qr = RQRCode::QRCode.new(@url)
    @png = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 500
    )
  
    flash[:notice_qr_code] = "Link: #{@url}"
  end

  def download_qr_code
    url = params[:url]
    module_size = 10  
    
    qr = RQRCode::QRCode.new(url, size: module_size, level: :h)
    png = qr.as_png(size: 500)
    
    send_data png.to_s, type: 'image/png', disposition: 'attachment', filename: 'qr_code.png'
  end

  def edit_word
    @word = params[:word]
  end

  def sobre
    render layout: 'no-back'

  end

  def palavra_2
    texto.split('').shuffle.join('')

  end

  # def index2
  #   render layout: 'back_index'

  #   @lista = params[:lista]
  #   if @lista.present?
  #     flash[:notice] = "Sua lista: #{@lista}"

  #   else
  #     flash.delete(:notice)

  #   end

  # end

  def index2
    @lista = params[:lista].to_i
    f = @lista.to_s.split('').map(&:to_i) # dividir a string em caracteres individuais e convertê-los para inteiros

    def insertionsort(f)
      for i in (1...f.length)
        key = f[i]
        j = i - 1

        while j >= 0 and key < f[j]
          f[j + 1] = f[j]
          j -= 1
        end

        f[j + 1] = key
      end
      return f
    end

    if @lista.present?
      flash[:notice] = "Sua lista ordenada: #{insertionsort(f)}"
    else
      flash.delete(:notice)
    end

    render :index2
  end

  def calculate_index2
    @nm = params[:numero].to_s.split('').map(&:to_i)
    sum = @nm.sum

    if @nm.present?
      flash[:notice2] = "A soma de todos os números é: #{sum}"
    else
      flash.delete(:notice2)
    end

    render :index2
  end

  def love_porce
    @nome1 = params[:nome1].to_s
    @nome2 = params[:nome2].to_s
    k = rand(0..101)

    if k >= 0 && k < 10
      flash[:notice3] = "esquece abafa nem tenta"
    elsif k >= 11 && k < 20
      flash[:notice3] = "quer se incomodar compra um fusca"
    elsif k >= 21 && k < 30
      flash[:notice3] = "ta bom mas ta ruim"
    elsif k >= 31 && k < 40
      flash[:notice3] = "com jeitinho até dá"
    elsif k >= 41 && k < 50
      flash[:notice3] = "sepá que sim sepá que não"
    elsif k >= 51 && k < 60
      flash[:notice3] = "opa tem chance"
    elsif k >= 61 && k < 70
      flash[:notice3] = "Ta legal já dá pra beja"
    elsif k >= 71 && k < 80
      flash[:notice3] = "É VAPO É DENTRO"
    elsif k >= 81 && k < 90
      flash[:notice3] = "TALOCO QUE ROMÂNTICO"
    elsif k >= 91 && k < 100
      flash[:notice3] = "VAMOOOO CARALHO SE AMAM PRA PORRA"

    elsif @nome1 == "Gabriel" && @nome2 == "Laura"
      flash[:notice3] = "MEU CASAL LINDOS SE AMAM MUITO"

    else
      flash[:notice3] = "Algo deu errado. Tente novamente."
    end

    render :index2
  end

  def imc
    @p = params[:p].to_f
    @a = params[:a].to_f

    imc = @p / (@a ** 2)

    if @p > 0 && @a > 0
      if imc < 18.5
        flash[:imc] = "Magreza.<br>Seu IMC é de: #{imc.ceil(2)}".html_safe

      elsif imc >= 18.5 && imc < 24.9
        flash[:imc] = "Peso normal.<br> Seu IMC é de: #{imc.ceil(2)}.".html_safe

      elsif imc >= 25 && imc < 29.9
        flash[:imc] = "Sobrepeso - I.<br> Seu IMC é de: #{imc.ceil(2)}".html_safe

      elsif imc >= 30 && imc < 39.9
        flash[:imc] = "Obesidade - II.<br> Seu IMC é de: #{imc.ceil(2)}".html_safe

      elsif imc > 40
        flash[:imc] = "Obesidade Grav - III.<br> Seu IMC é de: #{imc.ceil(2)}".html_safe

      end
    end

    render :index2
  end

  def termo2
    @qnt_letras = params[:qnt].to_i

    letras = ('a'..'z').to_a  # Array contendo todas as letras do alfabeto
    aleatorias = Array.new(@qnt_letras) { letras.sample }  # Seleciona aleatoriamente n letras do array
    x = aleatorias.join("")
    flash[:woks] = x
  end
end
