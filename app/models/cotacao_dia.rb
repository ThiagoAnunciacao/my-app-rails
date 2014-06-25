class CotacaoDia
  include Mongoid::Document

	store_in collection: "cotacao_dia"

	field :papel
	field :valor
  field :status
end
