class HomeController < ApplicationController
  def index
    @numero_whatsapp = "+554999482859"
    @meu_nome = params[:nome]

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

  def sobre
    render layout: 'no-back'

  end

  def palavras
    @palavra = params[:work]
    @quantidade = params[:qnt].to_i

    @resultado = ''

    @quantidade.times do |i|
    @resultado += @palavra

    @resultado += ', ' unless i == @quantidade - 1

    end

    render layout: 'no-back'
    #render :palavras
  end

  def advinhar
    @nm1_rand = rand(0..10)
    @nm2_rand = rand(0..10)

    flash[:notice] = "#{@nm1_rand}"
  end
end
