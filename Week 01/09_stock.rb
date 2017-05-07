# Exercise 9: Best time to Buy and Sell Stock II
# Calculates the max obtainable profit based on historical data

# assemption: only 1 stock tradeable at a time

def max_profit(prices)
  # initialize return variable
  max_profit = 0

  for i in (0..prices.length-1)
    # prevents out of bounds error
    if i == prices.length-1
      break
    end

    # as long as there is profit increase the next day, buy the stock
    if prices[i] - prices[i + 1] > 0
      max_profit += prices[i] - prices[i + 1]
    end
  end

  # return max obtainable profit
  max_profit

end

p max_profit([3, 1, 3, 5, 4, 7, 3, 2])
