require "faker"
require "json"

def credit_card
  return Faker::String.random(length: 17..19) if Random.rand < 0.05

  Faker::Finance.credit_card
end

def amount
  return Faker::Commerce.price * -1 if Random.rand < 0.03

  Faker::Commerce.price
end

def payment
  {
    id: SecureRandom.hex(4),
    ean: Faker::Barcode.ean,
    amount: amount,
    product: Faker::Commerce.product_name,
    vendor: Faker::Commerce.vendor,
    currency: "USD",
    payer: {
      name: (Faker::Name.name if Random.rand < 0.95),
      email: Faker::Internet.email
    }.compact,
    credit_card: credit_card,
    card_type: Faker::Finance::CREDIT_CARD_TYPES.sample,
    country: Faker::Address.country_code,
    coupon: (Faker::Commerce.promotion_code if Random.rand < 0.1)
  }.compact
end

loop do
  puts payment.to_json
end

