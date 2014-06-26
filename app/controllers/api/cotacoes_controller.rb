class Api::CotacoesController < ApplicationController
	def index
		cotacoes = []

		# require 'open-uri'
		# url = "http://www.bmfbovespa.com.br/Pregao-OnLine/ExecutaAcaoCarregarDados.asp?CodDado=Ticker"
		# doc = Nokogiri::HTML(open(url))
		# cotacoes = doc.at_css("p").text.gsub("v=", "").split("|")

		# arrCotacoes = []
		# if cotacoes.count > 0
		# 	CotacaoDia.delete_all
		# end

		# cotacoes.each do |acao|
		# 	papel = acao.split("@").first
		# 	valor = acao.split("@").last

		# 	status = valor[0]
		# 	valor = valor[/([0-9.#-]*)/].gsub("&", "").gsub("#", "").gsub("-", "")

		# 	arrCotacoes << {
		# 		"papel" => papel,
		# 		"valor" => valor,
		# 		"status" => status
		# 	}

		# 	cotacao = CotacaoDia.create!(papel: papel, valor: valor, status: status)
		# 	cotacao.save!
		# end

		arrCotacoes = CotacaoDia.all.as_json
		render json: arrCotacoes, status: 200
	end

	def show
	end
end
