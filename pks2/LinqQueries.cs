

using System.Security.Cryptography;
using NodaTime;

namespace pks2
{
    class LinqQueries
    {
        string average_to_text(double? a) {
            double? percent = ((a / 5) * 100);
            if (percent >= 90)
            {
                return "Превосходно";
            }
            else if (percent >= 80)
            {
                return "Очень хорошо";
            }
            else if (percent >= 70) {
                return "Хорошо";
            }
            else if (percent >= 60) {
                return "Удовлетворительно";
            }
            else {
                return "Неудовлетворительно";
            }
            
        }
        string percent_difference(double a, double b) {
            if (a == 0 && b == 0) return "Недостаточно данных";
            try {
                return (((b - a) / ((a + b) / 2)) * 100).ToString() + '%';
            }
            catch(DivideByZeroException)
            {
                return "Недостаточно данных";
            }
        }

        // Вывести объекты недвижимости, расположенные в указанном районе стоимостью «ОТ» и «ДО»
        public void print_choosed_and_sorted(int price_from, int price_to, string district)
        {
            using (Pks2Context db = new Pks2Context())
            { 
                var properties = from obj in db.Properties
                                 from districts in db.Districts
                                 where obj.Price >= price_from && obj.Price <= price_to && district == districts.DistrictName && obj.District == districts.DistrictCode
                                 orderby obj.Price descending
                                 select new
                                 {
                                     adress = obj.Adress,
                                     square = obj.PropertySquare,
                                     floor = obj.Floorr
                                 };
                int i = 1;
                foreach (var property in properties)
                { 
                    Console.WriteLine($"{i}. Адрес: {property.adress}, площадь: {property.square}, этаж: {property.floor}");
                    i++;
                }
            }
        }
            
        
        // Вывести фамилии риэлтор, которые продали двухкомнатные объекты недвижимости
        public void print_solded_by_quantity_of_rooms(int quantity_of_rooms) { 
            using (Pks2Context db = new Pks2Context())
            {
                var rieltors = from rieltor in db.Rieltors
                               from sell in db.Sellings
                               from property in db.Properties
                               where property.QuantityOfRooms == quantity_of_rooms && property.PropertyCode == sell.PropertyCode && rieltor.RieltorCode == sell.RieltorCode
                               select new
                               {
                                   full_name = rieltor.RieltorName + " " + rieltor.RieltorLastname + " " + rieltor.RieltorSurname,
                               };
                int i = 1;
                foreach (var rieltor in rieltors) {
                    Console.WriteLine($"{i}. ФИО: {rieltor.full_name}");
                    i++;
                }
            }
            
        }

        // Определить общую стоимость всех двухкомнатных объектов недвижимости, расположенных в указанном районе
        public void print_total_price_by_quantity_of_rooms_and_district(int quantity_of_rooms, string district) {
            using (Pks2Context db = new Pks2Context()) {
                var array = from property in db.Properties
                                  from district1 in db.Districts
                                  where property.District == district1.DistrictCode && district1.DistrictName == district && property.QuantityOfRooms == quantity_of_rooms
                                  select new
                                  {
                                      price = property.Price
                                  };
                float? total_sum = array.Sum(p => p.price);
                Console.WriteLine($"Общая цена недвижимости: {total_sum}");
            }

        }

        // Определить максимальную и минимальную стоимости объекта недвижимости, проданного указанным риэлтором
        public void print_rieltor_by_min_and_max(string rieltor_name) {
            using (Pks2Context db = new Pks2Context()) {
                var rieltor_sells = from property in db.Properties
                                    from rieltor in db.Rieltors
                                    from sell in db.Sellings
                                    where rieltor.RieltorName == rieltor_name && rieltor.RieltorCode == sell.RieltorCode && sell.PropertyCode == property.PropertyCode
                                    select new
                                    {
                                        price = property.Price

                                    };
                var min = rieltor_sells.Min(p => p.price);
                var max = rieltor_sells.Max(p => p.price);
                Console.WriteLine($"Минимальная цена: {min}, максимальная цена: {max}");
            }

        }

        //Определить среднюю оценку апартаментов по критерию «Безопасность», проданных указанным риэлтором
        public void print_mark_by_rieltor_and_criteria(int property_type, string criteria_name, string rieltor_name) {
            using (Pks2Context db = new Pks2Context()) {
                var marks = from criteria in db.MarksCriterias
                            from property in db.Properties
                            from rieltor in db.Rieltors
                            from mark in db.Marks
                            where rieltor.RieltorName == rieltor_name && property.Typess == property_type && criteria_name == criteria.CriteriaName && property.PropertyCode == mark.PropertyCode && mark.CriteriaCode == criteria.CriteriaCode
                            select new
                            {
                                markk = mark.Mark1
                            };
                double? average_mark = marks.Average(p => p.markk);
                Console.WriteLine($"Средняя оценка: {average_mark}");
            }
        }

        // Вывести информацию о количестве объектов недвижимости, расположенных на 2 этаже по каждому району
        public void print_by_floor(int floor) {
            using (Pks2Context db = new Pks2Context()) {
                var props = from property in db.Properties
                            from district in db.Districts
                            where property.Floorr == floor
                            where district.DistrictCode == property.District
                            group property by property.DistrictNavigation.DistrictName into distr_cnt
                            select new
                            {
                                name = distr_cnt.Key,
                                count = distr_cnt.Count()
                            };

                foreach (var propert in props) {
                    Console.WriteLine($"{propert.name} - {propert.count}");
                }
                
            }

        }

        // Вывести информацию о количестве квартир, проданных каждым риэлтором
        public void print_quantity_by_type(int type) {
            using (Pks2Context db = new Pks2Context()) {
                var quantity = from rieltor in db.Rieltors
                               from sell in db.Sellings
                               from property in db.Properties
                               where property.Typess == type && rieltor.RieltorCode == sell.RieltorCode && property.PropertyCode == sell.PropertyCode
                               group rieltor by rieltor.RieltorName into rieltor_cnt
                               select new
                               {
                                rieltor_cnt.Key,
                                count = rieltor_cnt.Count()
                               };
                foreach (var rieltor in quantity) {
                    Console.WriteLine($"{rieltor.Key} - {rieltor.count}");
                }
            }
        }

        // Вывести информацию о трех самых дорогих объектах недвижимости, расположенных в каждом районе.
        public void print_top_three() {
            using (Pks2Context db = new Pks2Context())
            {
                var list = from property in db.Properties
                            from district in db.Districts
                            where property.District == district.DistrictCode
                            group property by district.DistrictName into objects
                            select new
                            {
                                district_name = objects.Key,
                                props = (from props in objects
                                         orderby props.Price descending, props.Floorr
                                         select new
                                         {
                                             adress = props.Adress,
                                             price = props.Price,
                                             floor = props.Floorr
                                         })
                            };


                foreach (var obj in list) {
                    foreach (var property in (obj.props).Take(3)) { 
                        Console.WriteLine($"{obj.district_name} - {property.adress}, {property.price}, {property.floor}");
                    }
                }
            }

        }
        //  Вывести для указанного риэлтора (ФИО) года, в которых он продал больше 2 объектов недвижимости.
        public void print_lucky_years(string rieltor_name, string rieltor_lastname, string rieltor_surname) {
            using (Pks2Context db = new Pks2Context()) {
                var rielt = from selling in db.Sellings
                            from rieltor in db.Rieltors
                            where rieltor.RieltorName == rieltor_name && rieltor.RieltorLastname == rieltor_lastname && rieltor.RieltorSurname == rieltor_surname && selling.RieltorCode == rieltor.RieltorCode
                            group selling by selling.SellingDate.Year;
                foreach (var sell in rielt)
                {
                    if (sell.Count() > 2)
                    {
                        Console.WriteLine(sell.Key);
                    }
                }          
            }
        }
        // Определить годы, в которых было размещено от 2 до 3 объектов недвижимости.
        public void print_years_when_published(int quantity_min, int quantity_max) {
            using (Pks2Context db = new Pks2Context()) {
                var published = from property in db.Properties
                                group property by property.AdDate.Year;
                foreach (var obj in published) { 
                    if (obj.Count() >= quantity_min && obj.Count() <= quantity_max)
                    {
                        Console.WriteLine(obj.Key);
                    }
                }
            }
            
        }

        // Вывести информацию об объектах недвижимости, у которых разница между заявленной и продажной стоимостью составляет не более 20 %.
        public void lower_then_20_price_difference() {
            using (Pks2Context db = new Pks2Context()) {
                var props = from property in db.Properties
                            from selling in db.Sellings
                            where property.PropertyCode == selling.PropertyCode && ((selling.Price - property.Price) / (((selling.Price + property.Price) / 2)) * 100) < 20
                            select new
                            {
                                property.Adress,
                                property.DistrictNavigation.DistrictName
                            };
                foreach (var obj in props)
                {
                    Console.WriteLine($"Адрес: {obj.Adress} Название района: {obj.DistrictName}");
                }
            }
        }

        // Определить адреса квартир, стоимость 1м2  которых меньше средней по району.
        public void lower_then_mid_for_m() {
            using (Pks2Context db = new Pks2Context()) {
                var list = from property in db.Properties
                           group property by property.DistrictNavigation.DistrictName into obj
                           select new
                           {
                               obj.Key,
                               list = from property in obj
                                      let mid = obj.Average(x => (x.Price / x.PropertySquare))
                                      where (property.Price / property.PropertySquare) < mid
                                      select new {
                                          property.Adress,
                                          ppm = (property.Price / property.PropertySquare)
                                      }
                               
                           };
                foreach (var obj in list) { 
                    Console.WriteLine(obj.Key);
                    foreach (var item in obj.list) {
                        Console.WriteLine(item.Adress);
                    }
                }
            }
        }

        // Определить ФИО риэлторов, которые ничего не продали в текущем году.
        public void bad_rieltors(int year) {
            using (Pks2Context db = new Pks2Context()) {
                var list = from sellings in db.Sellings
                           group sellings by sellings.RieltorCodeNavigation.RieltorName into obj
                           select new
                           {
                               obj.Key,
                               list_of_sells = from sellings in obj
                                               where sellings.SellingDate.Year == year
                                               select new { 
                                                   sellings.PropertyCodeNavigation.Adress
                                               }
                           };
                foreach (var sellings in list)
                {
                    if (sellings.list_of_sells.Count() == 0) { 
                        Console.WriteLine(sellings.Key);
                    }
                }
             
                
            }
        
        }
        // Вывести информацию о количество продаж в предыдущем и текущем годах по каждому району, а также процент изменения
        public void districts_sell_stats(int year) {
            using (Pks2Context db = new Pks2Context()) {
                var list_districts = from sellings in db.Sellings
                                     group sellings by sellings.PropertyCodeNavigation.DistrictNavigation.DistrictName into obj
                                     select new
                                     {
                                         obj.Key,
                                         this_year = (from sellings in obj
                                                      where sellings.SellingDate.Year == year
                                                      select new
                                                      {
                                                          sellings.PropertyCodeNavigation.Adress
                                                      }).Count(),
                                        past_year = (from sellings in obj
                                                     where sellings.SellingDate.Year == (year - 1)
                                                     select new { 
                                                        sellings.PropertyCodeNavigation.Adress
                                                     }).Count()
                                     };

                Console.WriteLine($"Название района, {year} {year - 1} разница");
                foreach (var obj in list_districts) {
                    var diff = percent_difference(obj.this_year, obj.past_year);
                    Console.WriteLine($"{obj.Key} {obj.this_year} {obj.past_year} {diff}");
                }
            }
        }

        // Определить среднюю оценку по каждому критерию для указанного объекта недвижимости.Вывести среднюю оценку и эквивалентный текст согласно таблице: 
        public void print_marks_stats(string adress) {
            using (Pks2Context db = new Pks2Context()) {
                var marks_list = from marks in db.Marks
                                 where marks.PropertyCodeNavigation.Adress == adress
                                 group marks by marks.CriteriaCodeNavigation.CriteriaName into obj
                                 select new
                                 {
                                     obj.Key,
                                     average_mark = (from marks in obj
                                             select marks).Average(x => x.Mark1)
                                 };
                Console.WriteLine("Критерий Средняя оценка Текст");
                foreach (var mark in marks_list)
                {
                    Console.WriteLine($"{mark.Key} {mark.average_mark} из 5 {average_to_text(mark.average_mark)}");
                }

            }
        }

    }
}
