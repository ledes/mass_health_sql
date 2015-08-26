require "pg"
require "pry"
require "csv"

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
  ensure
    connection.close
  end
end

data = CSV.readlines('mass-chip-data.csv', headers: true)
data.each do |row|
  db_connection do |conn|
    town = row[0]
    total_pop = row[1].to_i
    pop_0_to_19 = row[2].to_i
    pop_over_65 = row[3].to_i
    income = row[4] ##################DOLLARS
    persons_below_poverty = row[5].to_i
    all_persons_below_poverty = row[6].to_i
    prenatal_care = row[7].to_i
    c_sections_deliveries = row[8].to_i
    numb_infants_death = row[9].to_i
    infant_mortality_rate = row[10].to_i
    low_birthweight = row[11].to_i
    multiple_births = row[12].to_i
    publicly_prenatal_care = row[13].to_i
    teen_births = row[14].to_i


    repetition_check= conn.exec_params("SELECT * FROM town_health_records WHERE town =$1",[town])
    if repetition_check.count < 1
    conn.exec_params("INSERT INTO town_health_records(
     town,
     total_pop,
     pop_0_to_19,
     pop_over_65,
     income,
     persons_below_poverty,
     all_persons_below_poverty,
     prenatal_care,
     c_sections_deliveries,
     numb_infants_death,
     infant_mortality_rate,
     low_birthweight,
     multiple_births,
     publicly_prenatal_care,
     teen_births
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)",
    [
      town,
      total_pop,
      pop_0_to_19,
      pop_over_65,
      income,
      persons_below_poverty,
      all_persons_below_poverty,
      prenatal_care,
      c_sections_deliveries,
      numb_infants_death,
      infant_mortality_rate,
      low_birthweight,
      multiple_births,
      publicly_prenatal_care,
      teen_births
    ]
    )
    end
  end

end
