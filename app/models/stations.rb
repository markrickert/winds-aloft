class Stations

  def self.unknown
    unk = []
    Winds.airport_codes.each do |code|
      unk.push(code) unless Stations.all.map { |station| station[:code] }.include?(code)
    end
    unk
  end

  # Data from: http://airports.pidgets.com/v1/
  # http://airports.pidgets.com/v1/airports/abi,abq,abr,ack,acy,agc,alb,als,ama,ast,atl,avp,axn,bam,bce,bdl,bff,bgr,bhm,bih,bil,blh,bml,bna,boi,bos,brl,bro,buf,cae,car,cgi,chs,cle,cll,cmh,cou,crp,crw,csg,cvg,czi,dal,dbq,den,dik,dlh,dln,drt,dsm,eck,ekn,elp,ely,emi,evv,eyw,fat,gpi,flo,fmn,fot,fsd,fsm,fwa,gag,gck,geg,gfk,ggw,gjt,gld,grb,gri,gsp,gtf,h51,h52,h61,hat,hou,hsv,ict,ilm,imb,ind,ink,inl,jan,jax,jfk,jot,las,lbb,lch,lit,lkv,lnd,lou,lrd,lse,lws,mbw,mcw,mem,mgm,mia,mkc,mkg,mlb,mls,mob,mot,mqt,mrf,msp,msy,okc,oma,onl,ont,orf,oth,pdx,pfn,phx,pie,pih,pir,plb,prc,psb,psx,pub,pwm,rap,rbl,rdm,rdu,ric,rks,rno,roa,row,sac,san,sat,sav,sba,sea,sfo,sgf,shv,siy,slc,sln,spi,sps,ssm,stl,syr,t01,t06,t07,tcc,tlh,tri,tul,tus,tvc,tys,wjf,ykm,zun,2xg,4j3?format=json
  # Find/Replace: \"(.*)\": => $1:
  # Find/Replace: \"([-.\d]+)\" => $1
  # Find/Replace: "" => nil
  # Find/Replace: null => nil
  def self.all
    [
      {
        code: "ABI",
        lat: 32.4164,
        lon: -99.6803,
        name: "Abilene Regional Airport",
        city: "Abilene",
        state: "Texas",
        elev: 1790,
      },
      {
        code: "ABQ",
        lat: 35.0494,
        lon: -106.625,
        name: "Albuquerque International Airport",
        city: "Albuquerque",
        state: "New Mexico",
        elev: 5352,
      },
      {
        code: "ABR",
        lat: 45.4536,
        lon: -98.4189,
        name: "Aberdeen Regional Airport",
        city: "Aberdeen",
        state: "South Dakota",
        elev: 1301,
      },
      {
        code: "ACK",
        lat: 41.2568,
        lon: -70.0649,
        name: "Nantucket Memorial Airport",
        city: "Nantucket",
        state: "Massachusetts",
        elev: 48,
      },
      {
        code: "ACY",
        lat: 39.4512,
        lon: -74.5716,
        name: "Atlantic City International Airport",
        city: "Egg Harbor City",
        state: "New Jersey",
        elev: 76,
      },
      {
        code: "ALB",
        lat: 42.7426,
        lon: -73.809,
        name: "Albany International Airport",
        city: "Latham",
        state: "New York",
        elev: 285,
      },
      {
        code: "ALS",
        lat: 37.4444,
        lon: -105.865,
        name: "San Luis Valley Regional Airport",
        city: "Alamosa",
        state: "Colorado",
        elev: 7535,
      },
      {
        code: "AMA",
        lat: 35.2177,
        lon: -101.706,
        name: "Amarillo International Airport",
        city: "Amarillo",
        state: "Texas",
        elev: 3606,
      },
      {
        code: "ATL",
        lat: 33.6558,
        lon: -84.4333,
        name: "Hartsfield-Jackson Atlanta International Airport",
        city: "Atlanta",
        state: "Georgia",
        elev: 1026,
      },
      {
        code: "AVP",
        lat: 41.3354,
        lon: -75.7294,
        name: "Wilkes Barre Scranton International Airport",
        city: "Pittston",
        state: "Pennsylvania",
        elev: 957,
      },
      {
        code: "BDL",
        lat: 41.9271,
        lon: -72.6816,
        name: "Bradley International Airport",
        city: "Windsor Locks",
        state: "Connecticut",
        elev: 174,
      },
      {
        code: "BFF",
        lat: 41.8683,
        lon: -103.597,
        name: "William B Heilig Field Airport",
        city: "Scottsbluff",
        state: "Nebraska",
        elev: 3965,
      },
      {
        code: "BGR",
        lat: 44.8086,
        lon: -68.8167,
        name: "Bangor International Airport",
        city: "Bangor",
        state: "Maine",
        elev: 192,
      },
      {
        code: "BHM",
        lat: 33.5604,
        lon: -86.7492,
        name: "Birmingham International Airport",
        city: "Birmingham",
        state: "Alabama",
        elev: 644,
      },
      {
        code: "BIL",
        lat: 45.8034,
        lon: -108.537,
        name: "Logan International Airport",
        city: "Billings",
        state: "Montana",
        elev: 3649,
      },
      {
        code: "BNA",
        lat: 36.1342,
        lon: -86.6682,
        name: "Nashville International Airport",
        city: "Nashville",
        state: "Tennessee",
        elev: 599,
      },
      {
        code: "BOI",
        lat: 43.5709,
        lon: -116.222,
        name: "Boise Air Terminal",
        city: "Boise",
        state: "Idaho",
        elev: 2858,
      },
      {
        code: "BOS",
        lat: 42.3717,
        lon: -71.0281,
        name: "Gen E L Logan International Airport",
        city: "Boston",
        state: "Massachusetts",
        elev: 20,
      },
      {
        code: "BRL",
        lat: 40.7816,
        lon: -91.1197,
        name: "Burlington Municipal Airport",
        city: "Burlington",
        state: "Iowa",
        elev: 698,
      },
      {
        code: "BRO",
        lat: 25.9064,
        lon: -97.4321,
        name: "Brownsville-South Padre Island International Air",
        city: "Brownsville",
        state: "Texas",
        elev: 22,
      },
      {
        code: "BUF",
        lat: 42.9309,
        lon: -78.738,
        name: "Greater Buffalo International Airport",
        city: "Buffalo",
        state: "New York",
        elev: 724,
      },
      {
        code: "CAE",
        lat: 33.9468,
        lon: -81.1241,
        name: "Columbia Metropolitan Airport",
        city: "West Columbia",
        state: "South Carolina",
        elev: 236,
      },
      {
        code: "CGI",
        lat: 37.2272,
        lon: -89.5637,
        name: "Cape Girardeau Municipal Airport",
        city: "Scott City",
        state: "Missouri",
        elev: 342,
      },
      {
        code: "CHS",
        lat: 32.8838,
        lon: -80.0356,
        name: "Charleston International Airport",
        city: "North Charleston",
        state: "South Carolina",
        elev: 46,
      },
      {
        code: "CLE",
        lat: 41.4115,
        lon: -81.8339,
        name: "Hopkins International Airport",
        city: "Cleveland",
        state: "Ohio",
        elev: 792,
      },
      {
        code: "CLL",
        lat: 30.5938,
        lon: -96.3685,
        name: "Easterwood Field Airport",
        city: "College Station",
        state: "Texas",
        elev: 319,
      },
      {
        code: "CMH",
        lat: 39.9974,
        lon: -82.8877,
        name: "Port Columbus International Airport",
        city: "Columbus",
        state: "Ohio",
        elev: 816,
      },
      {
        code: "COU",
        lat: 38.8174,
        lon: -92.2218,
        name: "Columbia Regional Airport",
        city: "Columbia",
        state: "Missouri",
        elev: 889,
      },
      {
        code: "CRP",
        lat: 27.7747,
        lon: -97.5019,
        name: "Corpus Christi International Airport",
        city: "Corpus Christi",
        state: "Texas",
        elev: 44,
      },
      {
        code: "CRW",
        lat: 38.3697,
        lon: -81.5951,
        name: "Yeager Airport",
        city: "Charleston",
        state: "West Virginia",
        elev: 982,
      },
      {
        code: "CSG",
        lat: 32.5184,
        lon: -84.9401,
        name: "Columbus Metropolitan Airport",
        city: "Columbus",
        state: "Georgia",
        elev: 389,
      },
      {
        code: "CVG",
        lat: 39.0571,
        lon: -84.6625,
        name: "Greater Cincinnati International Airport",
        city: "Hebron",
        state: "Ohio",
        elev: 891,
      },
      {
        code: "DAL",
        lat: 32.8439,
        lon: -96.8496,
        name: "Dallas Love Field Airport",
        city: "Dallas",
        state: "Texas",
        elev: 487,
      },
      {
        code: "DBQ",
        lat: 42.4047,
        lon: -90.7037,
        name: "Dubuque Regional Airport",
        city: "Dubuque",
        state: "Iowa",
        elev: 1076,
      },
      {
        code: "DEN",
        lat: 39.8396,
        lon: -104.672,
        name: "Denver International Airport",
        city: "Denver",
        state: "Colorado",
        elev: 5333,
      },
      {
        code: "DIK",
        lat: 46.8035,
        lon: -102.802,
        name: "Dickinson Municipal Airport",
        city: "Dickinson",
        state: "North Dakota",
        elev: 2589,
      },
      {
        code: "DLH",
        lat: 46.838,
        lon: -92.1781,
        name: "Duluth International Airport",
        city: "Duluth",
        state: "Minnesota",
        elev: 1430,
      },
      {
        code: "DRT",
        lat: 29.3702,
        lon: -100.918,
        name: "Del Rio International Airport",
        city: "Del Rio",
        state: "Texas",
        elev: 999,
      },
      {
        code: "DSM",
        lat: 41.5328,
        lon: -93.6481,
        name: "Des Moines International Airport",
        city: "Des Moines",
        state: "Iowa",
        elev: 957,
      },
      {
        code: "ELP",
        lat: 31.7982,
        lon: -106.393,
        name: "El Paso International Airport",
        city: "El Paso",
        state: "Texas",
        elev: 3956,
      },
      {
        code: "ELY",
        lat: 39.3043,
        lon: -114.853,
        name: "Yelland Field Airport",
        city: "Ely",
        state: "Nevada",
        elev: 6255,
      },
      {
        code: "EVV",
        lat: 38.0464,
        lon: -87.5308,
        name: "Evansville Regional Airport",
        city: "Evansville",
        state: "Indiana",
        elev: 418,
      },
      {
        code: "EYW",
        lat: 24.5536,
        lon: -81.7551,
        name: "Key West International Airport",
        city: "Key West",
        state: "Florida",
        elev: 4,
      },
      {
        code: "FAT",
        lat: 36.7675,
        lon: -119.717,
        name: "Fresno Yosemite International Airport",
        city: "Fresno",
        state: "California",
        elev: 332,
      },
      {
        code: "FLO",
        lat: 34.1936,
        lon: -79.7289,
        name: "Florence Regional Airport",
        city: "Florence",
        state: "South Carolina",
        elev: 147,
      },
      {
        code: "FMN",
        lat: 36.7387,
        lon: -108.227,
        name: "Four Corners Regional Airport",
        city: "Farmington",
        state: "New Mexico",
        elev: 5503,
      },
      {
        code: "FSD",
        lat: 43.5813,
        lon: -96.7317,
        name: "Sioux Falls Regional Airport",
        city: "Sioux Falls",
        state: "South Dakota",
        elev: 1429,
      },
      {
        code: "FSM",
        lat: 36.1881,
        lon: -94.4944,
        name: "Smith Field Airport",
        city: "Fort Smith",
        state: "Arkansas",
        elev: 469,
      },
      {
        code: "FWA",
        lat: 40.9883,
        lon: -85.1899,
        name: "Fort Wayne Municipal Airport-Baer Field",
        city: "Fort Wayne",
        state: "Indiana",
        elev: 802,
      },
      {
        code: "GCK",
        lat: 37.9267,
        lon: -100.719,
        name: "Garden City Regional Airport",
        city: "Pierceville",
        state: "Kansas",
        elev: 2888,
      },
      {
        code: "GEG",
        lat: 47.625,
        lon: -117.538,
        name: "Spokane International Airport",
        city: "Spokane",
        state: "Washington",
        elev: 2372,
      },
      {
        code: "GFK",
        lat: 47.9494,
        lon: -97.1762,
        name: "Grand Forks Mark Andrews International Airport",
        city: "Grand Forks",
        state: "North Dakota",
        elev: 844,
      },
      {
        code: "GJT",
        lat: 39.1217,
        lon: -108.529,
        name: "Walker Field Airport",
        city: "Grand Junction",
        state: "Colorado",
        elev: 4858,
      },
      {
        code: "GPI",
        lat: 2.5806,
        lon: -77.9083,
        name: "Guapi Airport",
        city: "Guapí",
        state: "Cauca",
        elev: 164,
      },
      {
        code: "GRB",
        lat: 44.4923,
        lon: -88.1274,
        name: "Austin Straubel International Airport",
        city: "Green Bay",
        state: "Wisconsin",
        elev: 695,
      },
      {
        code: "GSP",
        lat: 34.8907,
        lon: -82.2167,
        name: "Greenville Spartanburg International Airport",
        city: "Greer",
        state: "South Carolina",
        elev: 972,
      },
      {
        code: "GTF",
        lat: 47.482,
        lon: -111.356,
        name: "Great Falls International Airport",
        city: "Great Falls",
        state: "Montana",
        elev: 3674,
      },
      {
        code: "HOU",
        lat: 29.6572,
        lon: -95.2795,
        name: "William P Hobby Airport",
        city: "Houston",
        state: "Texas",
        elev: 47,
      },
      {
        code: "HSV",
        lat: 34.6492,
        lon: -86.7767,
        name: "Huntsville International Airport",
        city: "Huntsville",
        state: "Alabama",
        elev: 363,
      },
      {
        code: "ICT",
        lat: 37.6531,
        lon: -97.43,
        name: "Wichita Mid-Continent Airport",
        city: "Wichita",
        state: "Kansas",
        elev: 1332,
      },
      {
        code: "ILM",
        lat: 34.2668,
        lon: -77.912,
        name: "Wilmington International Airport",
        city: "Wilmington",
        state: "North Carolina",
        elev: 32,
      },
      {
        code: "IND",
        lat: 39.7322,
        lon: -86.2707,
        name: "Indianapolis International Airport",
        city: "Indianapolis",
        state: "Indiana",
        elev: 797,
      },
      {
        code: "INL",
        lat: 48.5661,
        lon: -93.3978,
        name: "Falls International Airport",
        city: "International Falls",
        state: "Minnesota",
        elev: 1185,
      },
      {
        code: "JAN",
        lat: 32.3089,
        lon: -90.0733,
        name: "Jackson International Airport",
        city: "Pearl",
        state: "Mississippi",
        elev: 346,
      },
      {
        code: "JAX",
        lat: 30.4914,
        lon: -81.676,
        name: "Jacksonville International Airport",
        city: "Jacksonville",
        state: "Florida",
        elev: 30,
      },
      {
        code: "JFK",
        lat: 40.6437,
        lon: -73.79,
        name: "John F Kennedy International Airport",
        city: "Jamaica",
        state: "New York",
        elev: 13,
      },
      {
        code: "LAS",
        lat: 36.0806,
        lon: -115.143,
        name: "Mccarran International Airport",
        city: "Las Vegas",
        state: "Nevada",
        elev: 2174,
      },
      {
        code: "LBB",
        lat: 33.6566,
        lon: -101.821,
        name: "Lubbock International Airport",
        city: "Lubbock",
        state: "Texas",
        elev: 3281,
      },
      {
        code: "LCH",
        lat: 30.1235,
        lon: -93.2198,
        name: "Lake Charles Regional Airport",
        city: "Lake Charles",
        state: "Louisiana",
        elev: 15,
      },
      {
        code: "LIT",
        lat: 34.7278,
        lon: -92.219,
        name: "Adams Field Airport",
        city: "Little Rock",
        state: "Arkansas",
        elev: 258,
      },
      {
        code: "LOU",
        lat: 38.2228,
        lon: -85.6669,
        name: "Bowman Field Airport",
        city: "Louisville",
        state: "Kentucky",
        elev: 535,
      },
      {
        code: "LRD",
        lat: 27.5431,
        lon: -99.4555,
        name: "Laredo International Airport",
        city: "Laredo",
        state: "Texas",
        elev: 508,
      },
      {
        code: "LSE",
        lat: 43.8751,
        lon: -91.2638,
        name: "La Crosse Municipal Airport",
        city: "La Crosse",
        state: "Wisconsin",
        elev: 654,
      },
      {
        code: "LWS",
        lat: 46.3776,
        lon: -117.011,
        name: "Lewiston Nez Perce County Airport",
        city: "Lewiston",
        state: "Idaho",
        elev: 1438,
      },
      {
        code: "MCW",
        lat: 43.153,
        lon: -93.3361,
        name: "Mason City Municipal Airport",
        city: "Clear Lake",
        state: "Iowa",
        elev: 1213,
      },
      {
        code: "MEM",
        lat: 35.047,
        lon: -89.9823,
        name: "Memphis International Airport",
        city: "Memphis",
        state: "Tennessee",
        elev: 332,
      },
      {
        code: "MGM",
        lat: 32.3049,
        lon: -86.3909,
        name: "Montgomery Regional Airport",
        city: "Montgomery",
        state: "Alabama",
        elev: 221,
      },
      {
        code: "MIA",
        lat: 25.7953,
        lon: -80.2727,
        name: "Miami International Airport",
        city: "Miami",
        state: "Florida",
        elev: 11,
      },
      {
        code: "MKC",
        lat: 39.1197,
        lon: -94.5906,
        name: "Kansas City Downtown Airport",
        city: "Kansas City",
        state: "Missouri",
        elev: 758,
      },
      {
        code: "MKG",
        lat: 43.1646,
        lon: -86.2367,
        name: "Muskegon County Airport",
        city: "Muskegon",
        state: "Michigan",
        elev: 628,
      },
      {
        code: "MLB",
        lat: 28.0957,
        lon: -80.6282,
        name: "Melbourne International Airport",
        city: "Melbourne",
        state: "Florida",
        elev: 35,
      },
      {
        code: "MOB",
        lat: 30.6775,
        lon: -88.243,
        name: "Mobile Regional Airport",
        city: "Mobile",
        state: "Alabama",
        elev: 218,
      },
      {
        code: "MOT",
        lat: 48.2554,
        lon: -101.291,
        name: "Minot International Airport",
        city: "Minot",
        state: "North Dakota",
        elev: 1715,
      },
      {
        code: "MQT",
        lat: 46.3501,
        lon: -87.3871,
        name: "Sawyer International Airport",
        city: "Marquette",
        state: "Michigan",
        elev: 1419,
      },
      {
        code: "MSP",
        lat: 44.8793,
        lon: -93.1987,
        name: "Minneapolis St Paul International Airport",
        city: "St. Paul",
        state: "Minnesota",
        elev: 841,
      },
      {
        code: "MSY",
        lat: 29.983,
        lon: -90.2569,
        name: "New Orleans International Airport",
        city: "Kenner",
        state: "Louisiana",
        elev: 4,
      },
      {
        code: "OKC",
        lat: 35.3981,
        lon: -97.5974,
        name: "Will Rogers World Airport",
        city: "Oklahoma City",
        state: "Oklahoma",
        elev: 1295,
      },
      {
        code: "OMA",
        lat: 41.3,
        lon: -95.8998,
        name: "Eppley Airfield",
        city: "Omaha",
        state: "Nebraska",
        elev: 983,
      },
      {
        code: "ONL",
        lat: 42.4655,
        lon: -98.6866,
        name: "The Oneill Municipal Airport",
        city: "O'neill",
        state: "Nebraska",
        elev: 2030,
      },
      {
        code: "ONT",
        lat: 34.062,
        lon: -117.594,
        name: "Ontario International Airport",
        city: "Ontario",
        state: "California",
        elev: 944,
      },
      {
        code: "ORF",
        lat: 36.8977,
        lon: -76.2154,
        name: "Norfolk International Airport",
        city: "Norfolk",
        state: "Virginia",
        elev: 27,
      },
      {
        code: "OTH",
        lat: 43.4141,
        lon: -124.244,
        name: "North Bend Municipal Airport",
        city: "North Bend",
        state: "Oregon",
        elev: 14,
      },
      {
        code: "PDX",
        lat: 45.5867,
        lon: -122.587,
        name: "Portland International Airport",
        city: "Portland",
        state: "Oregon",
        elev: 22,
      },
      {
        code: "PFN",
        lat: 30.2071,
        lon: -85.6829,
        name: "Panama City Bay County Airport",
        city: "Panama City",
        state: "Florida",
        elev: 21,
      },
      {
        code: "PHX",
        lat: 33.4376,
        lon: -112.03,
        name: "Sky Harbor International Airport",
        city: "Phoenix",
        state: "Arizona",
        elev: 1132,
      },
      {
        code: "PIE",
        lat: 27.9065,
        lon: -82.6924,
        name: "St. Petersburg-Clearwater International Airport",
        city: "Clearwater",
        state: "Florida",
        elev: 10,
      },
      {
        code: "PIH",
        lat: 42.9056,
        lon: -112.588,
        name: "Pocatello Municipal Airport",
        city: "Pocatello",
        state: "Idaho",
        elev: 4449,
      },
      {
        code: "PIR",
        lat: 44.3801,
        lon: -100.293,
        name: "Pierre Municipal Airport",
        city: "Pierre",
        state: "South Dakota",
        elev: 1742,
      },
      {
        code: "PRC",
        lat: 34.6492,
        lon: -112.428,
        name: "Ernest A Love Field Airport",
        city: "Prescott",
        state: "Arizona",
        elev: 5042,
      },
      {
        code: "PUB",
        lat: 38.2836,
        lon: -104.496,
        name: "Pueblo Memorial Airport",
        city: "Pueblo",
        state: "Colorado",
        elev: 4726,
      },
      {
        code: "PWM",
        lat: 43.6475,
        lon: -70.3103,
        name: "Jetport International Airport",
        city: "Portland",
        state: "Maine",
        elev: 74,
      },
      {
        code: "RAP",
        lat: 44.037,
        lon: -103.06,
        name: "Rapid City Regional Airport",
        city: "Rapid City",
        state: "South Dakota",
        elev: 3202,
      },
      {
        code: "RDM",
        lat: 44.2533,
        lon: -121.162,
        name: "Roberts Field Airport",
        city: "Redmond",
        state: "Oregon",
        elev: 3077,
      },
      {
        code: "RDU",
        lat: 35.8729,
        lon: -78.7923,
        name: "Durham International Airport",
        city: "Raleigh/Durham",
        state: "North Carolina",
        elev: 437,
      },
      {
        code: "RIC",
        lat: 37.5108,
        lon: -77.3332,
        name: "Richmond International Airport",
        city: "Richmond",
        state: "Virginia",
        elev: 168,
      },
      {
        code: "RKS",
        lat: 41.5988,
        lon: -109.072,
        name: "Rock Springs-Sweetwater County Airport",
        city: "Rock Springs",
        state: "Wyoming",
        elev: 6760,
      },
      {
        code: "RNO",
        lat: 39.5064,
        lon: -119.776,
        name: "Reno-Tahoe International Airport",
        city: "Reno",
        state: "Nevada",
        elev: 4413,
      },
      {
        code: "ROA",
        lat: 37.3203,
        lon: -79.9688,
        name: "Roanoke Regional Airport-Woodrum Field",
        city: "Roanoke",
        state: "Virginia",
        elev: 1175,
      },
      {
        code: "ROW",
        lat: 33.3071,
        lon: -104.519,
        name: "Roswell Industrial Air Center",
        city: "Roswell",
        state: "New Mexico",
        elev: 3669,
      },
      {
        code: "SAN",
        lat: 32.7299,
        lon: -117.195,
        name: "San Diego International Airport",
        city: "San Diego",
        state: "California",
        elev: 15,
      },
      {
        code: "SAT",
        lat: 29.5252,
        lon: -98.4729,
        name: "San Antonio International Airport",
        city: "San Antonio",
        state: "Texas",
        elev: 809,
      },
      {
        code: "SAV",
        lat: 32.1338,
        lon: -81.2133,
        name: "Savannah International Airport",
        city: "Savannah",
        state: "Georgia",
        elev: 51,
      },
      {
        code: "SBA",
        lat: 34.4255,
        lon: -119.835,
        name: "Santa Barbara Municipal Airport",
        city: "Goleta",
        state: "California",
        elev: 10,
      },
      {
        code: "SEA",
        lat: 47.4405,
        lon: -122.296,
        name: "Tacoma International Airport",
        city: "Seattle",
        state: "Washington",
        elev: 429,
      },
      {
        code: "SFO",
        lat: 37.6148,
        lon: -122.392,
        name: "San Francisco International Airport",
        city: "San Francisco",
        state: "California",
        elev: 12,
      },
      {
        code: "SGF",
        lat: 37.243,
        lon: -93.3817,
        name: "Springfield Regional Airport",
        city: "Springfield",
        state: "Missouri",
        elev: 1267,
      },
      {
        code: "SHV",
        lat: 32.4549,
        lon: -93.8285,
        name: "Shreveport Regional Airport",
        city: "Shreveport",
        state: "Louisiana",
        elev: 258,
      },
      {
        code: "SLC",
        lat: 40.7862,
        lon: -111.982,
        name: "Salt Lake City International Airport",
        city: "Salt Lake City",
        state: "Utah",
        elev: 4226,
      },
      {
        code: "SLN",
        lat: 38.7786,
        lon: -97.6397,
        name: "Salina Municipal Airport",
        city: "Salina",
        state: "Kansas",
        elev: 1272,
      },
      {
        code: "SPI",
        lat: 39.8445,
        lon: -89.672,
        name: "Capital Airport",
        city: "Springfield",
        state: "Illinois",
        elev: 597,
      },
      {
        code: "SPS",
        lat: 33.9862,
        lon: -98.4984,
        name: "Sheppard Air Force Base",
        city: "Wichita Falls",
        state: "Texas",
        elev: 1015,
      },
      {
        code: "STL",
        lat: 38.7414,
        lon: -90.3647,
        name: "Lambert St Louis International Airport",
        city: "St. Louis",
        state: "Missouri",
        elev: 605,
      },
      {
        code: "SYR",
        lat: 43.1141,
        lon: -76.1121,
        name: "Hancock International Airport",
        city: "Syracuse",
        state: "New York",
        elev: 421,
      },
      {
        code: "TLH",
        lat: 30.3964,
        lon: -84.3503,
        name: "Tallahassee Regional Airport",
        city: "Tallahassee",
        state: "Florida",
        elev: 81,
      },
      {
        code: "TRI",
        lat: 36.4805,
        lon: -82.4087,
        name: "Tri-Cities Regional Airport",
        city: "Blountville",
        state: "Tennessee",
        elev: 1550,
      },
      {
        code: "TUL",
        lat: 36.1877,
        lon: -95.8892,
        name: "Tulsa International Airport",
        city: "Tulsa",
        state: "Oklahoma",
        elev: 650,
      },
      {
        code: "TUS",
        lat: 32.1204,
        lon: -110.936,
        name: "Tucson International Airport",
        city: "Tucson",
        state: "Arizona",
        elev: 2643,
      },
      {
        code: "TVC",
        lat: 44.7365,
        lon: -85.5796,
        name: "Cherry Capital Airport",
        city: "Traverse City",
        state: "Michigan",
        elev: 624,
      },
      {
        code: "TYS",
        lat: 35.8064,
        lon: -83.9889,
        name: "Mcghee Tyson Airport",
        city: "Knoxville",
        state: "Tennessee",
        elev: 981,
      },
      {
        code: "YKM",
        lat: 46.5703,
        lon: -120.54,
        name: "Yakima Air Terminal",
        city: "Yakima",
        state: "Washington",
        elev: 1095,
      },
      {
        code: "ZUN",
        lat: 35.0843,
        lon: -108.789,
        name: "Black Rock Airport",
        city: "Zuni",
        state: "New Mexico",
        elev: 6447,
      },
      # Airports unknown to pidgets.com
      # http://www.flightstats.com/go/Airport/airportDetails.do?airportCode=
      # http://veloroutes.org/elevation/?location=33.620834%2C+-114.71889&units=e
      # https://github.com/apps4av/avare/blob/master/src/com/ds/avare/weather/Stations.java
      # Buoy list: http://www.stormsurf.com/buoy/mht/gom.html
      {
        code: "AGC",
        lat: 40.3544,
        lon: -79.930167,
        name: "Allegheny County Airport",
        city: "West Mifflin",
        state: "Pennsylvania",
        elev: 1252,
      },
      {
        code: "AST",
        lat: 46.158056,
        lon: -123.878611,
        name: "Astoria Regional Airport",
        city: "Warrenton",
        state: "Oregon",
        elev: 15,
      },
      {
        code: "AXN",
        lat: 45.866389,
        lon: -95.394722,
        name: "Alexandria Municipal Airport",
        city: "Alexandria",
        state: "Minnesota",
        elev: 1425,
      },
      {
        code: "BAM",
        lat: 40.6006,
        lon:  -116.8758,
        name: "Lander County Airport",
        city: "Battle Mountain",
        state: "Nevada",
        elev: 4533,
      },
      {
        code: "BCE",
        lat: 37.70111,
        lon: -112.13528,
        name: "Bryce Airport",
        city: "Bryce",
        state: "Utah",
        elev: 7579,
      },
      {
        code: "BIH",
        lat: 37.373333,
        lon: -118.365,
        name: "Bishop Airport",
        city: "Bishop",
        state: "California",
        elev: 4117,
      },
      {
        code: "BLH",
        lat: 33.620834,
        lon: -114.71889,
        name: "Blythe Airport",
        city: "Blythe",
        state: "California",
        elev: 396,
      },
      {
        code: "BML",
        lat: 44.574722,
        lon: -71.17639,
        name: "Berlin Airport",
        city: "Berlin",
        state: "New Hampshire",
        elev: 1118,
      },
      {
        code: "CAR",
        lat: 46.86667,
        lon: -68.01667,
        name: "Caribou Municipal Airport",
        city: "Caribou",
        state: "Maine",
        elev: 583,
      },
      {
        code: "CZI",
        lat: 43.999699,
        lon: -59.981918,
        name: "Crazy Woman VOR",
        city: "Buffalo",
        state: "Wyoming",
        elev: 4803,
      },
      {
        code: "DLN",
        lat: 45.216667,
        lon: -112.63333,
        name: "Dillon Airport",
        city: "Dillon",
        state: "Montana",
        elev: 5094,
      },
      {
        code: "ECK",
        lat: 36.2745,
        lon: -119.051025,
        name: "Eckert",
        city: "Strathmore",
        state: "California",
        elev: 544,
      },
      {
        code: "EKN",
        lat: 38.889442,
        lon: -79.85778,
        name: "Elkins Airport",
        city: "Elkins",
        state: "West Virginia",
        elev: 1971,
      },
      {
        code: "EMI",
        lat: -1.65,
        lon: 149.98334,
        name: "Emirau Airport",
        city: "Emirau",
        state: "Papua New Guinea",
        elev: 2,
      },
      {
        code: "FOT",
        lat: -32.183334,
        lon: 151.51666,
        name: "Forster Airport",
        city: "Forster",
        state: "NSW, AU",
        elev: 2,
      },
      {
        code: "GAG",
        lat: 36.35,
        lon: -99.88333,
        name: "Gage Airport",
        city: "Gage",
        state: "Oklahoma",
        elev: 2442,
      },
      {
        code: "GGW",
        lat: 48.212776,
        lon: -106.615555,
        name: "Glasgow International Airport",
        city: "Glasgow",
        state: "Montana",
        elev: 2232,
      },
      {
        code: "GLD",
        lat: 39.370277,
        lon: -101.69945,
        name: "Renner Field",
        city: "Goodland",
        state: "Kansas",
        elev: 3651,
      },
      {
        code: "GRI",
        lat: 40.96722,
        lon: -98.30666,
        name: "Grand Island Airport",
        city: "Grand Island",
        state: "Nebraska",
        elev: 1836,
      },
      {
        code: "H51",
        lat: 25.17,
        lon: -94.42,
        name: "Buoy 42002",
        city: "Western Gulf of Mexico",
        state: nil,
        elev: 0,
      },
      {
        code: "H52",
        lat: 25.92,
        lon: -89.68,
        name: "Buoy 42001",
        city: "Middle Gulf of Mexico",
        state: nil,
        elev: 0,
      },
      {
        code: "H61",
        lat: 25.88,
        lon: -85.95,
        name: "Buoy 42003",
        city: "Eastern Gulf of Mexico",
        state: nil,
        elev: 0,
      },
      {
        code: "HAT",
        lat: -19.720833,
        lon: 140.58333,
        name: "Heathlands Airport",
        city: "Heathlands",
        state: "QLD, AU",
        elev: 2,
      },
      {
        code: "IMB",
        lat: 5.716667,
        lon: -60.283333,
        name: "Imbaimadai Airport",
        city: "Imbaimadai",
        state: "Guyana",
        elev: 2,
      },
      {
        code: "INK",
        lat: 31.75,
        lon: -103.15,
        name: "Wink Airport",
        city: "Wink",
        state: "Texas",
        elev: 2775,
      },
      {
        code: "JOT",
        lat: 41.533333,
        lon: -88.083336,
        name: "Joliet Municipal Airport",
        city: "Joliet",
        state: "Illinois",
        elev: 534,
      },
      {
        code: "LKV",
        lat: 42.166668,
        lon: -120.4,
        name: "Lake County Airport",
        city: "Lakeview",
        state: "Oregon",
        elev: 4727,
      },
      {
        code: "LND",
        lat: 42.833332,
        lon: -108.73333,
        name: "Hunt Field",
        city: "Lander",
        state: "Wyoming",
        elev: 5360,
      },
      {
        code: "MBW",
        lat: -37.975834,
        lon: 145.10222,
        name: "Moorabbin Airport",
        city: "Moorabbin",
        state: "VIC, AU",
        elev: 2,
      },
      {
        code: "MLS",
        lat: 46.430557,
        lon: -105.880554,
        name: "Miles City Municipal Airport",
        city: "Miles City",
        state: "Montana",
        elev: 2626,
      },
      {
        code: "MRF",
        lat: 30.3,
        lon: -104.01667,
        name: "Marfa Municipal Airport",
        city: "Marfa",
        state: "Texas",
        elev: 4675,
      },
      {
        code: "PLB",
        lat: 44.68833,
        lon: -73.52111,
        name: "Clinton County Airport",
        city: "Plattsburgh",
        state: "New York",
        elev: 350,
      },
      {
        code: "PSB",
        lat: 40.88333,
        lon: -78.08583,
        name: "Mid-State Airport",
        city: "Philipsburg",
        state: "Pennsylvania",
        elev: 1905,
      },
      {
        code: "PSX",
        lat: 28.7,
        lon: -96.25,
        name: "Palacios Airport",
        city: "Palacios",
        state: "Texas",
        elev: 9,
      },
      {
        code: "RBL",
        lat: 40.156555,
        lon: -122.27292,
        name: "Red Bluff FSS",
        city: "Red Bluff",
        state: "California",
        elev: 373,
      },
      {
        code: "SAC",
        lat: 38.514122,
        lon: -121.49273,
        name: "Sacramento Executive Airport",
        city: "Sacramento",
        state: "California",
        elev: 19,
      },
      {
        code: "SIY",
        lat: 41.733334,
        lon: -122.53333,
        name: "Siskiyou County Airport",
        city: "Montague",
        state: "California",
        elev: 2516,
      },
      {
        code: "SSM",
        lat: 46.4,
        lon: -84.3,
        name: "Rosedale Airport",
        city: "Sault Ste. Marie",
        state: "Michigan",
        elev: 637,
      },
      {
        code: "T01",
        lat: 28.5,
        lon: -93.5,
        name: "Buoy 42035",
        city: "Galveston",
        state: "Texas",
        elev: 0,
      },
      {
        code: "TCC",
        lat: 35.166668,
        lon: -103.73333,
        name: "Tucumcari Airport",
        city: "Tucumcari",
        state: "New Mexico",
        elev: 4117,
      },
      {
        code: "WJF",
        lat: 34.7,
        lon: -118.13333,
        name: "William J Fox Airport",
        city: "Lancaster",
        state: "California",
        elev: 2356,
      },
      {
        code: "2XG",
        lat: 30.333334,
        lon: -78.5,
        name: "Buoy 41012",
        city: "St. Augustine",
        state: "Florida",
        elev: 0,
      },
      {
        code: "4J3",
        lat: 28.5,
        lon: -85.0,
        name: "Buoy 42036",
        city: "West Tampa",
        state: "Florida",
        elev: 0,
      }
    ].map { |station| station.merge(state_abbrev: State.abbrev(station[:state])) }
  end
end
