view: character_prediction {
  sql_table_name: GameOfThrones.character_prediction ;;

  dimension: actual {
    type: number
    sql: ${TABLE}.actual ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: alive {
    type: number
    sql: ${TABLE}.alive ;;
  }

  dimension: book1 {
    type: number
    sql: ${TABLE}.book1 ;;
  }

  dimension: book2 {
    type: number
    sql: ${TABLE}.book2 ;;
  }

  dimension: book3 {
    type: number
    sql: ${TABLE}.book3 ;;
  }

  dimension: book4 {
    type: number
    sql: ${TABLE}.book4 ;;
  }

  dimension: book5 {
    type: number
    sql: ${TABLE}.book5 ;;
  }

  dimension: bool_dead_relations {
    type: number
    sql: ${TABLE}.boolDeadRelations ;;
  }

  dimension: culture {
    type: string
    sql: ${TABLE}.culture ;;
  }

  dimension: date_of_birth {
    type: number
    sql: ${TABLE}.dateOfBirth ;;
  }

  dimension: dateo_fdeath {
    type: number
    sql: ${TABLE}.DateoFdeath ;;
  }

  dimension: father {
    type: string
    sql: ${TABLE}.father ;;
  }

  dimension: heir {
    type: string
    sql: ${TABLE}.heir ;;
  }

  dimension: house {
    type: string
    sql: REGEXP_REPLACE(${TABLE}.house, 'House ', '') ;;
  }

  dimension: is_alive {
    type: number
    sql: ${TABLE}.isAlive ;;
  }

  dimension: is_alive_father {
    type: number
    sql: ${TABLE}.isAliveFather ;;
  }

  dimension: is_alive_heir {
    type: number
    sql: ${TABLE}.isAliveHeir ;;
  }

  dimension: is_alive_mother {
    type: number
    sql: ${TABLE}.isAliveMother ;;
  }

  dimension: is_alive_spouse {
    type: number
    sql: ${TABLE}.isAliveSpouse ;;
  }

  dimension: is_married {
    type: number
    sql: ${TABLE}.isMarried ;;
  }

  dimension: is_noble {
    type: number
    sql: ${TABLE}.isNoble ;;
  }

  dimension: is_popular {
    type: number
    sql: ${TABLE}.isPopular ;;
  }

  dimension: male {
    type: number
    sql: ${TABLE}.male ;;
  }

  dimension: mother {
    type: string
    sql: ${TABLE}.mother ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    primary_key: yes
    suggestions: ["Tyrion Lannister", "Jon Snow", "Daenerys Targaryen", "Cersei Lannister", "Sansa Stark",  "Arya Stark", "Jaime Lannister",  "Theon Greyjoy",  "Bran Stark", "Catelyn Tully",  "Tywin Lannister",  "Margaery Tyrell",  "Robb Stark", "Joffrey Baratheon",  "Ramsay Snow",  "Olenna Tyrell",  "Loras Tyrell", "Robert Baratheon", "Yara Greyjoy"]
  }

  dimension: num_dead_relations {
    type: number
    sql: ${TABLE}.numDeadRelations ;;
  }

  dimension: plod {
    type: number
    sql: ${TABLE}.plod ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

  dimension: pred {
    type: number
    sql: ${TABLE}.pred ;;
  }

  dimension: s_no {
    type: number
    sql: ${TABLE}.S_No ;;
  }

  dimension: spouse {
    type: string
    sql: ${TABLE}.spouse ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: character_count {
    type: count
    drill_fields: [name]
  }
}
