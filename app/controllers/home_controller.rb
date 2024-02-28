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
    @size = params[:size].to_i

    qr = RQRCode::QRCode.new(@url)
    @svg = qr.as_svg(module_size: @size)

    flash[:notice_qr_code] = "Link: #{@url}"
  end

  def sobre
    render layout: 'no-back'

  end
end
