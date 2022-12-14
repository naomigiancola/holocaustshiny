# Loading Packages
library(shiny)
library(tidyverse)
library(readr)
library(janitor)

options(scipen = 100)

#Loading Data sets

world_jewish_population<- data.frame(year = c(1880,1900,1914,1922,1925,1931,1939,1945,1948,1950,1955,1960,1970,1980,1990,2000,2005,2010,2015,2018,2019,2020,2021),

                           jewish_population_of_the_world = c(7800000,10600000,13500000,14400000,14800000,15700000,16728000,11000000,11500000,11297000,11800000,12079000,12585000,12819000,12868000,13250000,13620000,14049000,14551600,14606000,14707400,15077100,15166200))
    #Source: https://www.jewishvirtuallibrary.org/jewish-population-of-the-world#A

jewish_deaths <- data.frame(country = c("Poland",
                                        "Soviet Union/Russia",
                                        "Romania",
                                        "Germany",
                                        "Hungary",
                                        "Czechoslovakia/Czech Republic",
                                        "France",
                                        "Austria",
                                        "Lithuania",
                                        "Netherlands",
                                        "Latvia",
                                        "Belgium",
                                        "Greece",
                                        "Yugoslavia",
                                        "Bulgaria",
                                        "Italy",
                                        "Denmark",
                                        "Estonia",
                                        "Luxembourg",
                                        "Finland",
                                        "Norway",
                                        "Albania"),
                            year_counted = c("1939",
                                             "1939",
                                             "1930",
                                             "1933",
                                             "1930",
                                             "1930",
                                             "1940",
                                             "1938",
                                             "1939",
                                             "1941",
                                             "1939",
                                             "1940",
                                             "1940",
                                             "1930",
                                             "1934",
                                             "1938",
                                             "1940",
                                             "1934",
                                             "1940",
                                             "1942",
                                             "1940",
                                             "1930"),
                            pre_war_pop = c(3400000,
                                            3000000,
                                            757000,
                                            500000,
                                            445000,
                                            357000,
                                            300000,
                                            206000,
                                            150000,
                                            140000,
                                            93500,
                                            90000,
                                            70000,
                                            68500,
                                            48400,
                                            46000,
                                            7800,
                                            4300,
                                            3600,
                                            2200,
                                            1800,
                                            200),
                            murdered_jews = c(3000000,
                                          1000000,
                                          287000,
                                          165000,
                                          270000,
                                          260000,
                                          76000,
                                          65000,
                                          145000,
                                          102000,
                                          70000,
                                          25000,
                                          58800,
                                          60000,
                                          142,
                                          7500,
                                          116,
                                          1000,
                                          1200,
                                          7,
                                          758,
                                          100))
# Source: https://encyclopedia.ushmm.org/content/en/article/jewish-losses-during-the-holocaust-by-country, https://www.statista.com/statistics/1070564/jewish-populations-deaths-by-country/
jewish_deaths <- jewish_deaths %>%
    mutate(percent_killed = murdered_jews/pre_war_pop) %>%
    mutate(percent_killed = round(percent_killed,4 )*100)

jewish_deaths_tidy <- data.frame(country = c("Poland",
                                             "Soviet Union/Russia",
                                             "Romania",
                                             "Germany",
                                             "Hungary",
                                             "Czechoslovakia/Czech Republic",
                                             "France",
                                             "Austria",
                                             "Lithuania",
                                             "Netherlands",
                                             "Latvia",
                                             "Belgium",
                                             "Greece",
                                             "Yugoslavia",
                                             "Bulgaria",
                                             "Italy",
                                             "Denmark",
                                             "Estonia",
                                             "Luxembourg",
                                             "Finland",
                                             "Norway",
                                             "Albania",
                                             "Poland",
                                             "Soviet Union/Russia",
                                             "Romania",
                                             "Germany",
                                             "Hungary",
                                             "Czechoslovakia/Czech Republic",
                                             "France",
                                             "Austria",
                                             "Lithuania",
                                             "Netherlands",
                                             "Latvia",
                                             "Belgium",
                                             "Greece",
                                             "Yugoslavia",
                                             "Bulgaria",
                                             "Italy",
                                             "Denmark",
                                             "Estonia",
                                             "Luxembourg",
                                             "Finland",
                                             "Norway",
                                             "Albania"),
                                 number = c(3400000,
                                            3000000,
                                            757000,
                                            500000,
                                            445000,
                                            357000,
                                            300000,
                                            206000,
                                            150000,
                                            140000,
                                            93500,
                                            90000,
                                            70000,
                                            68500,
                                            48400,
                                            46000,
                                            7800,
                                            4300,
                                            3600,
                                            2200,
                                            1800,
                                            200,
                                            3000000,
                                            1000000,
                                            287000,
                                            165000,
                                            270000,
                                            260000,
                                            76000,
                                            65000,
                                            145000,
                                            102000,
                                            70000,
                                            25000,
                                            58800,
                                            60000,
                                            142,
                                            7500,
                                            116,
                                            1000,
                                            1200,
                                            7,
                                            758,
                                            100),
                                 type = c("pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "pre_war_pop",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews",
                                          "murdered_jews")
                                 )

    # Source: https://www.statista.com/statistics/1070564/jewish-populations-deaths-by-country/


current_jewish_populations <- data.frame(country = c("Bermuda",
                                                     "Canada",
                                                     "United States",
                                                     "Bahamas",
                                                     "Costa Rica",
                                                     "Cuba",
                                                     "Dominican Republic",
                                                     "El Salvador",
                                                     "Guatemala",
                                                     "Jamaica",
                                                     "Mexico",
                                                     "Netherlands Antilles",
                                                     "Panama",
                                                     "Puerto Rico",
                                                     "Virgin Islands",
                                                     "Argentina",
                                                     "Bolivia",
                                                     "Brazil",
                                                     "Chile",
                                                     "Colombia",
                                                     "Ecuador",
                                                     "Paraguay",
                                                     "Peru",
                                                     "Suriname",
                                                     "Uruguay",
                                                     "Venezuela",
                                                     "Other",
                                                     "Israel",
                                                     "West Bank",
                                                     "Armenia",
                                                     "Azerbaijan",
                                                     "Georgia",
                                                     "Kazakhstan",
                                                     "Kyrgyzstan",
                                                     "Turkmenistan",
                                                     "Uzbekistan",
                                                     "China",
                                                     "India",
                                                     "Indonesia",
                                                     "Iran",
                                                     "Japan",
                                                     "South Korea",
                                                     "Philippines",
                                                     "Singapore",
                                                     "Syria and Lebanon",
                                                     "Taiwan",
                                                     "Thailand",
                                                     "United Arab Emirates",
                                                     "Other",
                                                     "Australia",
                                                     "New Zealand",
                                                     "Other",
                                                     "Egypt",
                                                     "Ethiopia",
                                                     "Morocco",
                                                     "Tunisia",
                                                     "Botswana",
                                                     "Congo D.R.",
                                                     "Kenya",
                                                     "Madagascar",
                                                     "Namibia",
                                                     "Nigeria",
                                                     "South Africa",
                                                     "Zimbabwe",
                                                     "Other",
                                                     "Austria",
                                                     "Belgium",
                                                     "Bulgaria",
                                                     "Czechoslovakia/Czech Republic",
                                                     "Croatia",
                                                     "Cyprus",
                                                     "Czechoslovakia/Czech Republic",
                                                     "Denmark",
                                                     "Finland",
                                                     "France",
                                                     "Germany",
                                                     "Greece",
                                                     "Hungary",
                                                     "Ireland",
                                                     "Italy",
                                                     "Latvia",
                                                     "Lithuania",
                                                     "Luxembourg",
                                                     "Malta",
                                                     "Netherlands",
                                                     "Poland",
                                                     "Portugal",
                                                     "Romania",
                                                     "Slovakia",
                                                     "Slovenia",
                                                     "Spain",
                                                     "Sweden",
                                                     "Bosnia-Herzegovina",
                                                     "Channel Islands",
                                                     "Gibraltar",
                                                     "Monaco",
                                                     "North Macedonia",
                                                     "Norway",
                                                     "Serbia",
                                                     "Switzerland",
                                                     "Turkey",
                                                     "U.K.",
                                                     "Other",
                                                     "Belarus",
                                                     "Moldova",
                                                     "Soviet Union/Russia",
                                                     "Ukraine"),
                                         region = c("Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Americas",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Asia",
                                                    "Oceania",
                                                    "Oceania",
                                                    "Oceania",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Africa",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe",
                                                    "Europe"),
                                         total_population = c(65000,
                                                              38200000,
                                                              329900000,
                                                              400000,
                                                              5100000,
                                                              11300000,
                                                              10500000,
                                                              6500000,
                                                              18100000,
                                                              2800000,
                                                              127800000,
                                                              321000,
                                                              4300000,
                                                              3200000,
                                                              105000,
                                                              45400000,
                                                              11600000,
                                                              211800000,
                                                              19500000,
                                                              49400000,
                                                              17500000,
                                                              7300000,
                                                              32800000,
                                                              602000,
                                                              3519000,
                                                              28600000,
                                                              31874000,
                                                              9327000,
                                                              3144600,
                                                              3000000,
                                                              9900000,
                                                              3700000,
                                                              18700000,
                                                              6600000,
                                                              10100000,
                                                              34200000,
                                                              1410600000,
                                                              1400100000,
                                                              271700000,
                                                              84200000,
                                                              126000000,
                                                              51800000,
                                                              109600000,
                                                              5800000,
                                                              26200000,
                                                              23600000,
                                                              66500000,
                                                              9800000,
                                                              849537800,
                                                              25800000,
                                                              5000000,
                                                              12300000,
                                                              100800000,
                                                              114900000,
                                                              36000000,
                                                              11900000,
                                                              2200000,
                                                              89600000,
                                                              53500000,
                                                              27700000,
                                                              2500000,
                                                              206100000,
                                                              59600000,
                                                              14900000,
                                                              522500000,
                                                              8900000,
                                                              11500000,
                                                              6900000,
                                                              10700000,
                                                              4000000,
                                                              1200000,
                                                              10700000,
                                                              5800000,
                                                              5500000,
                                                              64900000,
                                                              83300000,
                                                              10700000,
                                                              9800000,
                                                              5000000,
                                                              60300000,
                                                              1900000,
                                                              2800000,
                                                              600000,
                                                              500000,
                                                              17500000,
                                                              38400000,
                                                              10300000,
                                                              19200000,
                                                              5500000,
                                                              2100000,
                                                              47600000,
                                                              10400000,
                                                              3300000,
                                                              200000,
                                                              35000,
                                                              40000,
                                                              2100000,
                                                              5400000,
                                                              7000000,
                                                              8600000,
                                                              83700000,
                                                              67200000,
                                                              5800000,
                                                              9400000,
                                                              3500000,
                                                              146700000,
                                                              41800000),
                                         jewish_population =c(100,
                                                              393500,
                                                              6000000,
                                                              200,
                                                              2600,
                                                              500,
                                                              100,
                                                              100,
                                                              900,
                                                              500,
                                                              40000,
                                                              400,
                                                              10000,
                                                              1500,
                                                              400,
                                                              175000,
                                                              500,
                                                              91500,
                                                              15900,
                                                              2100,
                                                              600,
                                                              1100,
                                                              1900,
                                                              200,
                                                              16400,
                                                              5000,
                                                              200,
                                                              6894000,
                                                              445800,
                                                              100,
                                                              7000,
                                                              1400,
                                                              2400,
                                                              300,
                                                              200,
                                                              2800,
                                                              3000,
                                                              4800,
                                                              100,
                                                              9400,
                                                              1000,
                                                              100,
                                                              100,
                                                              900,
                                                              100,
                                                              100,
                                                              200,
                                                              300,
                                                              100,
                                                              118000,
                                                              7500,
                                                              100,
                                                              100,
                                                              100,
                                                              2100,
                                                              1000,
                                                              100,
                                                              100,
                                                              300,
                                                              100,
                                                              100,
                                                              100,
                                                              52000,
                                                              200,
                                                              200,
                                                              10300,
                                                              28900,
                                                              2000,
                                                              3900,
                                                              1700,
                                                              300,
                                                              3900,
                                                              6400,
                                                              1300,
                                                              446000,
                                                              118000,
                                                              4100,
                                                              46800,
                                                              2700,
                                                              27200,
                                                              4300,
                                                              2300,
                                                              700,
                                                              100,
                                                              29700,
                                                              4500,
                                                              3300,
                                                              8800,
                                                              2600,
                                                              100,
                                                              12900,
                                                              14900,
                                                              500,
                                                              200,
                                                              800,
                                                              700,
                                                              100,
                                                              1300,
                                                              1400,
                                                              18400,
                                                              14500,
                                                              292000,
                                                              100,
                                                              7200,
                                                              1700,
                                                              150000,
                                                              43000))

#Create graph

population_graph <- ggplot(data = world_jewish_population, aes(x = year, y = jewish_population_of_the_world))+
    geom_line()+
    labs(x="Year", y="Jewish Population", title="Jewish Population by Year (1880 - 2021)")

# Functions:

current_jewish_population <- function(country_name){
    jewish_population_2021_user <- current_jewish_populations %>%
        filter(country == country_name) %>%
        select(country, jewish_population)
    jewish_population_2021_user <- jewish_population_2021_user %>%
        mutate(jewish_population = as.character(jewish_population))

    return(jewish_population_2021_user)
}

current_jewish_population_text <- function(country_name){
    jewish_population_2021_user <- current_jewish_populations %>%
        filter(country == country_name) %>%
        select(country, jewish_population)
    jewish_population_2021_user <- jewish_population_2021_user %>%
        mutate(jewish_population = as.character(jewish_population))

    print(paste("The Jewish population of", country_name, "is", jewish_population_2021_user$jewish_population, "."))
}

percent_jewish_killed <- function(country_name) {
    jewish_deaths <- jewish_deaths %>%
        filter(country == country_name)
    pre_war <- jewish_deaths$pre_war_pop
    year <- jewish_deaths$year_counted
    jews_killed <- jewish_deaths$murdered_jews
    percent_killed <- jewish_deaths$percent_killed
    print(paste("In", year, "there were", pre_war, "Jewish people living in", country_name,". During the war,", jews_killed, "Jewish people were killed,", percent_killed, "% of the pre-war population."))
}

graph_jewish_killed <- function(country_name){

    jewish_deaths_tidy <- jewish_deaths_tidy %>%
        filter(country == country_name)
    graph <- ggplot(data = jewish_deaths_tidy, aes(x = type, y= number))+
        geom_bar(stat = "identity")+
        labs(y = "Jewish People", x = "", title = "Jews murdered during the war compared to Jews alive before the war")
    return(graph)
}


percent_jewish_alive <- function(country_name) {
    if(country_name == "Estonia"){
        current_pop = 2500
        pre_war = 4300
        percent <- current_pop/pre_war*100
        percent <- round(percent, 2)
        print(paste("The current Jewish population of", country_name, "is", current_pop, ",", percent, "% of the pre-war population (", pre_war, ")."))

    } else if (country_name == "Albania") {
        current_pop = 50
        pre_war = 200
        percent <- current_pop/pre_war*100
        percent <- round(percent, 2)
        print(paste("The current Jewish population (2019) of", country_name, "is", current_pop, ",", percent, "% of the pre-war population (", pre_war, ")."))

    }else if (country_name == "Yugoslavia") {
        current_pop = 4350
        pre_war = 68500
        percent <- current_pop/pre_war*100
        percent <- round(percent, 2)
        print(paste("The current Jewish population of", country_name, "is", current_pop, ",", percent, "% of the pre-war population (", pre_war, ").", "*Yugoslovia dissolved in 1992, so the current Jewish population of Yugoslavia is made up of populations from Seriba, Croatia, Bosnia and Herzegovina, Macedonia, Montenegro, Slovenia, and Kosovo "))

    }else if (country_name == "Czechoslovakia/Czech Republic") {
        current_pop = 3900
        pre_war = 357000
        percent <- current_pop/pre_war*100
        percent <- round(percent, 2)
        print(paste("The current Jewish population (2021) of", country_name, "is", current_pop, ",", percent, "% of the pre-war population (", pre_war, ")."))

    }else{
        jewish_deaths <- jewish_deaths %>%
            filter(country == country_name)
        pre_war <- jewish_deaths$pre_war_pop
        year <- jewish_deaths$year_counted
        current_pop <- current_jewish_population(country_name)
    current_pop <-current_pop$jewish_population
    current_pop <- as.numeric(current_pop)
    percent <- (current_pop/pre_war) *100
    percent <- round(percent, 2)
    print(paste("The current Jewish population (2021) of", country_name, "is", current_pop, ",", percent, "% of the pre-war population (", pre_war, ")"))
    }



    }




#Calculating what population trend for jews would have looked like if no war:

1939 - 1880

59

16728000 - 7800000

8928000/59

151322

#slope = 151322

151322 * 10

1513220

# 10 year increase = 1513220

#make up new data

# 1949:
#     16728000 + 1513220 = 18241220
# 1959:
#     18241220 + 1513220 = 19754440
# 1969:
#     1513220 + 19754440 = 21267660
# 1979:
#     1513220 + 21267660 = 22780880
# 1989:
#     1513220 + 22780880 = 24294100
# 1999:
#     1513220 + 24294100 = 25807320
# 2009:
#     1513220 + 25807320 = 27320540
# 2019:
#     1513220 + 27320540 = 28833760


jewish_no_war <- data.frame(year = c(1880,1900,1914,1922,1925,1931,1939,1949,1959,1969,1979,1989,1999,2009,2019,2021),
                            population = c(7800000,10600000,13500000,14400000,14800000,15700000,16728000,18241220,19754440,21267660,22780880,24294100,25807320,27320540,28833760, 29136404)
                            )

world_jewish_population_2021 <- world_jewish_population %>%
    filter(year == 2021)

population_graph_no_war <- ggplot()+
    geom_line(data = jewish_no_war, aes(x= year, y = population) )+
    #geom_line(data = world_jewish_population_2021, aes(x= year, y = population, color = "red"))+
    labs(x="Year", y="Jewish Population", title="Calculated Jewish Population (1880-2021)")

ui <- fluidPage(
    titlePanel(h1("The Past is The Present and The Future: Visualizing Holocaust Data")),
    #h4("What was the Holocaust?"),
    #h5("The Holocaust was the systematic and deliberate extermination of European Jewery by the Nazi party. Between 1939 and 1945, 6 million Jewish people were murdered."),
    br(),
    sidebarLayout(
        sidebarPanel(plotOutput("population_graph"),
                     br(),
                     h4("If the Holocaust hadn't happened and population trends had continued at they were from 1880-1939, the Jewish world population could have been 29,136,404 in 2021."),
                     h4("Instead, it is 15,166,200 in 2021."),
                     h4("A difference of 13,970,204."),
                     plotOutput("population_graph_no_war"),
                     br()
                     ),
        mainPanel(
            h4("See Detailed information about European Countries:"),

            selectInput("country_name_killed", "", c("Poland",
                                                            "Soviet Union/Russia",
                                                            "Romania",
                                                            "Germany",
                                                            "Hungary",
                                                            "Czechoslovakia/Czech Republic",
                                                            "France",
                                                            "Austria",
                                                            "Lithuania",
                                                            "Netherlands",
                                                            "Latvia",
                                                            "Belgium",
                                                            "Greece",
                                                            "Yugoslavia",
                                                            "Bulgaria",
                                                            "Italy",
                                                            "Denmark",
                                                            "Estonia",
                                                            "Luxembourg",
                                                            "Finland",
                                                            "Norway",
                                                            "Albania" ) ),
            actionButton("go_jews_killed", "Go"),
            br(),
            h4(strong(textOutput("jews_killed_text"))),
            plotOutput("jews_killed_graph"),
            h4(strong(strong(textOutput("percent_jewish_alive_text")))),
            br(),
            br(),
            h4("Find the Jewish population for (almost) any country as of 2021:"),
            selectInput("country_name", "", c("Bermuda",
                                                      "Canada",
                                                      "United States",
                                                      "Bahamas",
                                                      "Costa Rica",
                                                      "Cuba",
                                                      "Dominican Republic",
                                                      "El Salvador",
                                                      "Guatemala",
                                                      "Jamaica",
                                                      "Mexico",
                                                      "Netherlands Antilles",
                                                      "Panama",
                                                      "Puerto Rico",
                                                      "Virgin Islands",
                                                      "Argentina",
                                                      "Bolivia",
                                                      "Brazil",
                                                      "Chile",
                                                      "Colombia",
                                                      "Ecuador",
                                                      "Paraguay",
                                                      "Peru",
                                                      "Suriname",
                                                      "Uruguay",
                                                      "Venezuela",
                                                      "Other",
                                                      "Israel",
                                                      "West Bank",
                                                      "Armenia",
                                                      "Azerbaijan",
                                                      "Georgia",
                                                      "Kazakhstan",
                                                      "Kyrgyzstan",
                                                      "Turkmenistan",
                                                      "Uzbekistan",
                                                      "China",
                                                      "India",
                                                      "Indonesia",
                                                      "Iran",
                                                      "Japan",
                                                      "South Korea",
                                                      "Philippines",
                                                      "Singapore",
                                                      "Syria and Lebanon",
                                                      "Taiwan",
                                                      "Thailand",
                                                      "United Arab Emirates",
                                                      "Other",
                                                      "Australia",
                                                      "New Zealand",
                                                      "Other",
                                                      "Egypt",
                                                      "Ethiopia",
                                                      "Morocco",
                                                      "Tunisia",
                                                      "Botswana",
                                                      "Congo D.R.",
                                                      "Kenya",
                                                      "Madagascar",
                                                      "Namibia",
                                                      "Nigeria",
                                                      "South Africa",
                                                      "Zimbabwe",
                                                      "Other",
                                                      "Austria",
                                                      "Belgium",
                                                      "Bulgaria",
                                                      "Czechoslovakia/Czech Republic",
                                                      "Croatia",
                                                      "Cyprus",
                                                      "Czechoslovakia/Czech Republic",
                                                      "Denmark",
                                                      "Finland",
                                                      "France",
                                                      "Germany",
                                                      "Greece",
                                                      "Hungary",
                                                      "Ireland",
                                                      "Italy",
                                                      "Latvia",
                                                      "Lithuania",
                                                      "Luxembourg",
                                                      "Malta",
                                                      "Netherlands",
                                                      "Poland",
                                                      "Portugal",
                                                      "Romania",
                                                      "Slovakia",
                                                      "Slovenia",
                                                      "Spain",
                                                      "Sweden",
                                                      "Bosnia-Herzegovina",
                                                      "Channel Islands",
                                                      "Gibraltar",
                                                      "Monaco",
                                                      "North Macedonia",
                                                      "Norway",
                                                      "Serbia",
                                                      "Switzerland",
                                                      "Turkey",
                                                      "U.K.",
                                                      "Other",
                                                      "Belarus",
                                                      "Moldova",
                                                      "Soviet Union/Russia",
                                                      "Ukraine")),
            actionButton("go_country_pop", "Go"),
            h4(strong(textOutput("pop_sentence"))),
            #tableOutput("pop_table")


        )
    )


)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$population_graph <- renderPlot(population_graph)
    output$population_graph_no_war <- renderPlot(population_graph_no_war)
    observeEvent(input$go_country_pop, {
        name_of_country <- reactive({input$country_name})
        output$pop_table = renderTable({current_jewish_population(name_of_country())}
        )
        output$pop_sentence = renderText(current_jewish_population_text(name_of_country()))}
                 )
    observeEvent(input$go_jews_killed, {
        county_name_killed <- reactive({input$country_name_killed})
        output$jews_killed_text = renderText({percent_jewish_killed(county_name_killed())})
        output$jews_killed_graph = renderPlot({graph_jewish_killed(county_name_killed())})
        output$percent_jewish_alive_text = renderText({percent_jewish_alive(county_name_killed())})

    })
}



# Run the application
shinyApp(ui = ui, server = server)
