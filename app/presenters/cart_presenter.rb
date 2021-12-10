include ActionView::Helpers::NumberHelper
class CartPresenter
  def initialize(user)
    @user = user
    @region = @user.carts.open.region
  end

  def open_cart
    {
      name: @user.name,
      email: @user.email,
      region: region_details,
      products: product_details,
      totals: totals
    }
  end

  def region_details
    {
      title: @region.title,
      country: @region.country.name,
      currency: @region.currency.name,
      currency_code: @region.currency.code
    }
  end

  def product_details
    products = []
    @user.carts.open.cart_products.each do |cart_product|
      products.push({
        title: cart_product.product.title,
        description: cart_product.product.description,
        image_url: cart_product.product.image_url,
        price: cart_product.product.price,
        sku: cart_product.product.sku,
        quantity: cart_product.quantity
      })
    end
    products
  end

  def totals
    tax_percent = @region.tax
    total = 0
    @user.carts.open.cart_products.each do |cart_product|
      total += cart_product.quantity * cart_product.product.price
    end
    tax = (total * tax_percent) / 100
    order_total = total + tax
    {
      total: number_to_currency(total, precision: 2, unit: ''),
      tax: number_to_currency(tax, precision: 2, unit: ''),
      order_total: number_to_currency(order_total, precision: 2, unit: '')
    }
  end
end
