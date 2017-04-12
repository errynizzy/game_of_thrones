view: character_death_detail {
  sql_table_name: GameOfThrones.character_death_detail ;;

  dimension: death_episode {
    type: number
    sql: ${TABLE}.death_episode ;;
  }

  dimension: death_season {
    type: number
    sql: ${TABLE}.death_season ;;
  }

  dimension: execution {
    type: string
    sql: ${TABLE}.execution ;;
  }

  dimension: likelihood_of_return {
    type: number
    sql: ${TABLE}.likelihoodOfReturn ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    primary_key: yes
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
