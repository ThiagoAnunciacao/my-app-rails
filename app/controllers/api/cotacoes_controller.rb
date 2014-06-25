class Api::CotacoesController < ApplicationController
	def index
		require 'open-uri'
		url = "http://www.bmfbovespa.com.br/Pregao-OnLine/ExecutaAcaoCarregarDados.asp?CodDado=Ticker"
		doc = Nokogiri::HTML(open(url))
		cotacoes = doc.at_css("p").text.gsub("v=", "").split("|")

		arrCotacoes = []
		cotacoes.each do |acao|
			papel = acao.split("@").first
			valor = acao.split("@").last

			status = valor[0]
			valor = valor[/([0-9.#-]*)/].gsub("&", "").gsub("#", "").gsub("-", "")

			arrCotacoes << {
				"papel" => papel,
				"valor" => valor,
				"status" => status
			}

			# binding.pry
			cotacao = CotacaoDia.create!(papel: papel, valor: valor, status: status)
			cotacao.save!
		end

		render json: arrCotacoes, status: 200
	end

	def show
	end
end
