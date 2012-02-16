# -*- encoding : utf-8 -*-
HOLIDAY_DATE = {
  2009 =>  [
    [1,1],[1,2],
    [1,25],[1,26],[1,27],[1,28],[1,29],[1,30],[1,31],
    [4,4],[4,5],[4,6],
    [5,1],
    [5,28],[5,29],
    [10,1],[10,8]
  ],
  2010 =>  [
    [1,1],[1,2],[1,3],
    [2,13],[2,14],[2,15],[2,16],[2,17],[2,18],[2,19],
    [4,3],[4,4],[4,5],
    [5,1],[5,2],[5,3],
    [6,12],[6,13],[6,14],[6,15],[6,16],
    [9,22],[9,23],[9,24],[9,25],[9,26],
    [10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7]
  ],
  2011 =>  [
    [1,1],[1,2],[1,3],
    [2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],
    [4,3],[4,4],[4,5],
    [4,30],[5,1],[5,2],
    [6,4],[6,5],[6,6],
    [9,10],[9,11],[9,12],
    [10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7]
  ],
  2012 =>  [
    [1,1],[1,2],[1,3],
    [2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],
    [4,3],[4,4],[4,5],
    [4,30],[5,1],[5,2],
    [6,4],[6,5],[6,6],
    [9,10],[9,11],[9,12],
    [10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7]
  ]
}

ALL_WORK_DATE = HOLIDAY_DATE.map do |year, h_days|
  #算出一年的工作日, 再减去一年的假期
  begin_of_year = Date.today.beginning_of_year
  end_of_year = begin_of_year.end_of_year
  the_work_day = (begin_of_year..end_of_year).to_a.reject {|day| [0,6].include?(day.wday)}
  the_holiday_days = h_days.map { |day| Date.new(year, day.first,day.last) }

  the_work_day - the_holiday_days
end.flatten

if defined? ActiveSupport

  module ActiveSupport
    class TimeWithZone
      def is_stock_transaction_time?
        return false if !ALL_WORK_DATE.include?(self.to_date) #非工作日直接跳过
        return false if ((self > Time.zone.local(self.year,self.month,self.day,11, 35)) && (self < Time.zone.local(self.year,self.month,self.day,13, 0)))
        return false if ((self < Time.zone.local(self.year,self.month,self.day,9, 30)) || (self > Time.zone.local(self.year,self.month,self.day,15, 5)))
        return true
      end
    end
  end

end

class Date
  def is_stock_transaction_day?
    ALL_WORK_DATE.include?(self)
  end
end
