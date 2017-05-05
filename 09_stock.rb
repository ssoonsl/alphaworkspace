# WIP

def max_profit(prices)
  # dips = array of days that predict a drop on the next day
  # each day in dips[] = sell day
  # if (dip[i] + 1) != dip[i + 1], it's buy day
  # => (in case there are 2 dip days in a row)

  dips = []

  (0..prices.length-2).each do |i|
    if prices[i + 1].to_i < prices[i].to_i
      dips.push(i)
    end
  end
  p dips.inspect

  buy = []

  # determine buy days
  (0..dips.length-2).each do |i|
    if dips[i] + 1 != dips[i + 1]
      buy.push(dips[i])
    end

    # debug
    print dips[i] + 1
    print ","
    print dips[i + 1]
    print "\n"
  end

  buy.push(dips.last)
  # TODO add last element of dips

  p buy.inspect

end

max_profit([4, 1, 3, 5, 4, 1, 2, 1, 4])
