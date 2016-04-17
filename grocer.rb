require 'pry'

def consolidate_cart(cart:[])
  new_cart = {}
  cart.uniq.each do |item|
    item.each do |name, hash|
      new_cart[name] = hash
      new_cart[name][:count] = cart.count(item)
    end
  end
  new_cart
end


def apply_coupons(cart:{}, coupons:[])
  hash_output = {}
  cart.each do |key, value|
     coupons.each do |hash_item|
       if hash_item[:item] == key && value[:count] - hash_item[:num] >= 0
         h = {}
         h[:price] = hash_item[:cost]
         h[:clearance] = true
         h[:count] = value[:count] / hash_item[:num]
         hash_output["#{key} " + "W/COUPON" ] = h
         if value[:count] - hash_item[:num] > 0
           value[:count] = value[:count] - hash_item[:num]
           hash_output[key] = value
         end
         if value[:count] - hash_item[:num] = 0
           value[:count] = 0
           hash_output[key] = value
         end
       else
         hash_output[key]= value
       end
     end
   end
  hash_output
end

#apply_coupons(cart:{"AVOCADO" => {:price => 3.0, :clearance => true, :count => 3}},
  #coupons:[{:item => "AVOCADO", :num => 2, :cost => 5.0}])

def apply_clearance(cart:[])
  # code here
end

def checkout(cart: [], coupons: [])
  # code here
end