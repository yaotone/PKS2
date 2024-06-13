using pks2;

LinqQueries lq = new LinqQueries();

lq.print_choosed_and_sorted(34000000, 55000000, "Арбат");
lq.print_solded_by_quantity_of_rooms(1);
lq.print_total_price_by_quantity_of_rooms_and_district(1, "Замоскворечье");
lq.print_rieltor_by_min_and_max("Медведев");
lq.print_by_floor(2);
lq.print_quantity_by_type(2);
lq.print_top_three();
lq.print_lucky_years("Калинин", "Аполлон", "Макарович");
lq.print_years_when_published(2, 3);
lq.lower_then_20_price_difference();
lq.lower_then_mid_for_m();
lq.bad_rieltors(2022);
lq.districts_sell_stats(2020);
lq.print_marks_stats("улица Арбат, 24");



