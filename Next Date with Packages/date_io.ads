package date_IO is
    type month_names is (Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, Dec);
    subtype days_per_month is integer range 1..31;
    subtype years_range is integer range 1900..2100;

    type date is record
        month:month_names := Jan;
        day:days_per_month := 1;
        comma:character := ',';
        year:years_range := 1900;
    end record;

    function getDate return date;
    function nextDay(today:in date) return date;
    procedure put(some_date:in date);
end date_IO;
