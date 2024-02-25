class HomeController < ApplicationController
  def index
  end

  def resultado
    @descricao = params[:desc]
    @nm1 = params[:nm1].to_f
    @nm2 = params[:nm2].to_f
    @resultado = @nm1 + @nm2
    puts "CARALHOOOOOOOOO"

    #  respond_to do |format|
    #    format.html { redirect_to resultado_path}
    #    format.json { render json: { descricao: @descricao } } # Responder ao formato JSON
    #  end
  end

  def menos
    @nm1_2 = params[:nm1_2].to_f
    @nm2_2 = params[:nm2_2].to_f
    @resultado = @nm1_2 - @nm2_2
    puts "CARALHO 2 "

  end

  def mult
    @nm1_3 = params[:nm1_3].to_f
    @nm2_3 = params[:nm2_3].to_f
    @resultado = @nm1_3 * @nm2_3
  end
end
