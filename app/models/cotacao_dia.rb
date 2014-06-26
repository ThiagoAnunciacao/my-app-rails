class CotacaoDia
  include Mongoid::Document

	field :papel
	field :valor
  field :status

  def as_json(*args)
    res = super

    # convert BSON::ObjectId to string
    res["_id"] = res["_id"].to_s

    # or you also can change attribute name from _id to id
    res.delete("_id")
    res
  end
end
