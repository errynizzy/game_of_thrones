view: character_list {
  sql_table_name: GameOfThrones.character_death ;;

  dimension: member_of_house {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) END ;;
  }

  dimension: allegiances {
    type: string
    sql: ${TABLE}.Allegiances ;;
    description: "character house"
  }

  dimension: allegiance_house_name {
    type: string
    sql: REPLACE(${TABLE}.Allegiances, 'House ', '') ;;
    description: "character house"
  }

  dimension: total_house_allegiance {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) ELSE LTRIM(${TABLE}.Allegiances) END ;;
  }

  dimension: book_intro_chapter {
    type: number
    sql: ${TABLE}.Book_Intro_Chapter ;;
    description: "chapter character was introduced in"
  }

  dimension: book_of_death {
    type: number
    sql: ${TABLE}.Book_of_Death ;;
    description: "book character died in"
  }

dimension: is_alive {
  type: yesno
  sql: ${book_of_death} is null ;;
}

measure: count_alive {
  type: count
  filters: {
    field: is_alive
    value: "yes"
  }
}

  measure: count_dead {
    type: count
    filters: {
      field: is_alive
      value: "no"
    }
  }

  dimension: second_book {
    label: "2. A Clash of Kings"
    type: yesno
    sql: ${TABLE}.CoK  = 1;;
    group_label: "Book Appearances"
  }

  dimension: death_chapter {
    type: number
    sql: ${TABLE}.Death_Chapter ;;
    description: "chapter character died in"
  }

  dimension: death_year {
    type: number
    sql: ${TABLE}.Death_Year ;;
    description: "year character died"
  }


  dimension: fifth_book {
    label: "5. A Dance With Dragons"
    type: yesno
    sql: ${TABLE}.DwD = 1;;
    group_label: "Book Appearances"

  }

  dimension: fourth_book {
    label: "4. A Feast of Crows"
    type: yesno
    sql: ${TABLE}.FfC = 1;;
    group_label: "Book Appearances"
  }

  dimension: gender {
    type: string
    case: {
      when: {
        sql: ${TABLE}.Gender = 1 ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.Gender = 0 ;;
        label: "Female"
      }
      else: "Not Specified"

    }
  }

  dimension: first_book_of_appearance {
    type: string
    sql:
      CASE
        WHEN ${first_book} is true THEN '1. A Game of Thrones'
        WHEN ${second_book} is true THEN '2. A Clash of Kings'
        WHEN ${third_book} is true THEN '3. A Storm of Swords'
        WHEN ${fourth_book} is true THEN '4. A Feast of Crows'
        WHEN ${fifth_book} is true THEN '5. A Dance With Dragons'
        ELSE NULL
      END ;;
  }

  dimension: first_book {
    label: "1. A Game Of Thrones"
    type: yesno
    sql: ${TABLE}.GoT = 1 ;;
    group_label: "Book Appearances"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    primary_key: yes
    description: "character name"
  }

  dimension: nobility {
    type: yesno
    sql: ${TABLE}.Nobility = 1 ;;
    description: "Is the character a nobel?"
  }

  dimension: third_book {
    label: "3. A Storm of Swords"
    type: yesno
    sql: ${TABLE}.SoS = 1 ;;
    group_label: "Book Appearances"
  }

  measure: count {
    type: count
    drill_fields: [name]
    description: "number of characters"
  }
}
