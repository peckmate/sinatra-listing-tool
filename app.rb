require "sinatra"
#require "sinatra/reloader"
#require "uri"

def page_content(title)
  File.read("pages/words.txt")
rescue Errno::ENOENT
  return nil
end

def save_content(content)
  File.open("pages/words.txt", "w") do |file|
    file.print(content)
  end
end

get "/" do
  erb :welcome
end

get "/display" do
  @title = params[:words]
  @content = page_content(@title).gsub(/\R+/, ' ') #sets @content to return value of passing
  #@title into page_content(title) method. gsubs newlines into whitespace to avoid it executing.
  @content = @content.upcase
  @list_raw = ["women", "men", "boys", "BULGARIANS", "BUNG", "BURMESE", "BYZANTINE", "CACA", "CAMBODIAN", "CAMBODIANS", "CANADIANS", "CANADIEN", "CANADIENS", "CARDINAL", "CARDINALS", "CATHOLIC", "CATHOLICS", "CAUCASIAN", "CAUCASIANS", "CHECHEN", "CHECHENS", "CHECHNYA", "CHICANA", "CHICANAS", "CHICANO", "CHICANOS", "CHILD", "CHILDREN", "CHILEAN", "CHILEANS", "CHINAMAN", "CHINAMEN", "CHINESE", "CHINK", "CHINKS", "CHIPEWA", "CHOAD", "CHOADS", "CHODE", "CHODES", "CHRIST", "CHRISTIANITY", "CHRISTIANS", "CHUMASH", "CLERGY", "CLIT", "CLITORIS", "CLITS", "COCK", "COCKS", "COITUS", "COJONES", "COLOMBIAN", "COLOMBIANS", "COLORED", "COLOREDS", "COMANCHE", "COMMUNIST", "COMMUNISTS", "COMOROS", "CONFUCIANISM", "COONS", "COOTCH", "COOTCHES", "CORPULENCE", "CORPULENT", "COUPLES", "ONLY", "COUPLES", "COUPLESONLY", "CRAP", "CRAPS", "CREATIONIST", "CREATIONISTS", "CREE", "CRIPPLED", "CRIPPLEDS", "CROAT", "CROATIAN", "CROATIANS", "CROTCH", "CROTCHES", "CUBAN", "CUBANS", "CULT", "CULTISM", "CULTIST", "CULTISTS", "CULTS", "CUM", "CUMS", "CUNNILINGUS", "CUNT", "CUNTS", "CYBERHOMES", "CYPRUS", "CZECHOSLOVAKIAN", "CZECHOSLOVAKIANS", "DAGO", "DAGOS", "DAMM", "DAMN", "DANE", "DANES", "DANISH", "DARKIES", "DARWIN", "DARWINIAN", "DARWINIST", "DARWINISTS", "DAVIDIAN", "DEAF", "DEATH", "DEATHS", "DEITIES", "DEITY", "DEMOCRAT", "DEMOCRATIC", "DEMOCRATS", "DENOMINATION", "DENOMINATIONAL", "DENOMINATIONS", "DEUTSCH", "DEVILISH", "DIARRHEA", "DICK", "DICKS", "DIMWIT", "DIMWITS", "DINGUS", "DIOCESE", "DIPSHIT", "DIPSHITS", "DISABILITIES", "DISABLED", "DISABLEDS", "DISEASE", "DISEASED", "DISEASES", "DOLT", "DOLTS", "DOMINICAN", "DOMINICANS", "DONG", "DONGS", "DOODIE", "DOODOO", "DOODY", "DORK", "DORKS", "DRAG", "QUEEN", "DRAG", "QUEENS", "DRAG-QUEEN", "DRAG-QUEENS", "DRAGQUEEN", "DRAGQUEENS", "DRINKER", "DRINKERS", "DRUGS", "DRUIDISM", "DRUIDS", "DRUNK", "DRUNKS", "DUFF", "DUFFS", "DUNG", "DWEEB", "DWEEBS", "DYKE", "DYKES", "EAT", "ME", "EAT-ME", "EATME", "ECUADORIAN", "ECUADORIANS", "EGYPTIANS", "EMPTY", "NESTER", "EMPTY", "NESTERS", "EMPTYNESTER", "EMPTYNESTERS", "EPISCOPAL", "EPISCOPALIAN", "EPISCOPALIANS", "EQUATORIAL", "ESPANOL", "ESTONIAN", "ESTONIANS", "ETHIOPIAN", "ETHIOPIANS", "ETHNIC", "GROUP", "ETHNIC", "GROUPS", "ETHNIC", "NEIGHBORHOOD", "ETHNIC", "NEIGHBORHOODS", "ETHNICGROUP", "ETHNICGROUPS", "ETHNICNEIGHBORHOOD", "ETHNICNEIGHBORHOODS", "EVANGELICAL", "EVANGELIST", "EVANGELISTS", "EXTREMIST", "EXTREMISTS", "F##K", "F##KS", "F#CK", "F#CKS", "F--K", "F--KS", "F-CK", "F-CKS", "FAG", "FAGG", "FAGGOT", "FAGGOTS", "FAGGS", "FAGS", "FAIRIES", "FAIRY", "FAITHS", "FALUN", "GONG", "FALUNGONG", "FATSO", "FATSOS", "FATTIE", "FATTIES", "FATTY", "FATTYS", "FELLATIO", "FEMALE", "FEMALES", "FEMINISM", "FEMINIST", "FEMINISTS", "FETID", "FILIPINA", "FILIPINO", "FINNISH", "FOREIGNER", "FOREIGNERS", "FORESKIN", "FORESKINS", "FORNICATE", "FORNICATION", "FOUL", "FREAK", "FREAKS", "FU#K", "FU#KS", "FUCK", "FUCKER", "FUCKERS", "FUCKS", "FUNDAMENTALIST", "FUNDAMENTALISTS", "FURBURGER", "FURBURGERS", "G-SPOT", "G-SPOTS", "GABON", "GAMBIA", "GAMBIAN", "GAMBIANS", "GANDHI", "GANGBANG", "GANGBANGS", "GAYS", "GENDER", "GENDERS", "GERMANS", "GHASTLY", "GHETTO", "GHETTOS", "GO", "TO", "HELL", "GOMER", "GOMERS", "GOMORA", "GOMORRAH", "GOSPEL", "GOTOHELL", "GREEK", "GREEKS", "GREENLAND", "GSPOT", "GSPOTS", "GUATEMALAN", "GUATEMALANS", "GUINEAS", "HAITIAN", "HAITIANS", "HANDICAPPED", "HANDICAPPEDS", "HARD", "ON", "HARD", "ONS", "HARD-ON", "HARD-ONS", "HARDON", "HARDONS", "HARLOT", "HARLOTS", "HASIDIC", "HEALTHIES", "ONLY", "HEALTHIES-ONLY", "HEALTHIESONLY", "HEALTHY", "ONLY", "HEALTHY-ONLY", "HEALTHYONLY", "HEINIE", "HEINIES", "HEINY", "HEINYS", "HERMAPHRODITE", "HERMAPHRODITES", "HERZEGOVINA", "HETERO", "HETEROS", "HETEROSEXUAL", "HETEROSEXUALS", "HINDI", "HINDIS", "HINDU", "HINDUISM", "HINDUS", "HIPPIE", "HIPPIES", "HIPPY", "HIPPYS", "HISPANIC", "HISPANICS", "HOLINESS", "HOLY", "ROLLER", "HOLY", "ROLLERS", "HOLY", "SEE", "HOLY", "HOLYROLLER", "HOLYROLLERS", "HOLYSEE", "HOMEADVISOR", "HOMESEEKER", "HOMO", "HOMOS", "HOMOSEXUAL", "HOMOSEXUALS", "HONDURAN", "HONDURANS", "HOOKER", "HOOKERS", "HOPI", "HORNIES", "HORNY", "HUMANISM", "HUMANIST", "HUMANISTIC", "HUMANISTS", "HUMP", "HUMPS", "HUNGARIAN", "HUNGARIANS", "IBO", "ICELANDIC", "IDEAL", "FOR", "IDEALFOR", "IGLESIA", "IGLESIAS", "ILL", "IMMIGRANT", "IMMIGRANTS", "IMPAIRED", "IMPAIREDS", "IN", "YOUR", "FACE", "IN-YOUR-FACE", "INCA", "INCAN", "INCANS", "INCEST", "INCESTUOUS", "INDEPENDENT", "LIVING", "INDEPENDENTLIVING", "INDIANS", "INDIGENT", "INDIGENTS", "INDONESIAN", "INDONESIANS", "INTERRACIAL", "INUIT", "INUITS", "INYOURFACE", "IRANIAN", "IRANIANS", "IRAQI", "IRAQIS", "IRISH", "ISLAM", "ISLAMIC", "ISRAELI", "ISRAELIS", "ITALIANS", "JACK-OFF", "JACK-OFFS", "JACKOFF", "JACKOFFS", "JAMAICAN", "JAMAICANS", "JAP", "JAPANESE", "JAPS", "JEHOVAH'S", "JEHOVAH", "JEHOVAHS", "JERK", "JERKS", "JERUSALEM", "JESUS", "JEW", "JEWISH", "JEWS", "JORDANIAN", "JORDANIANS", "JUDAISM", "JUGS", "KABBALAH", "KEESTER", "KEESTERS", "KENYAN", "KENYANS", "KICKAPOO", "KIESTER", "KIESTERS", "KILLER", "KILLERS", "KIRIBATI", "KKK", "KLAN", "KLANSMAN", "KLANSMEN", "KNOCKED", "UP", "KNOCKED-UP", "KNOCKEDUP", "KORAN", "KOREAN", "KOREANS", "KU", "KLUX", "KLAN", "KUKLUXKLAN", "KUWAITI", "KUWAITIS", "LABIA", "LAOS", "LAOTIAN", "LAOTIANS", "LATIN", "LATINA", "LATINAS", "LATINO", "LATINOS", "LATTER", "DAY", "LATTER-DAY", "LATTERDAY", "LATVIAN", "LATVIANS", "LEBANESE", "LESBIAN", "LESBIANS", "LESBO", "LESBOS", "LETCH", "LETCHES", "LEZZIE", "LEZZIES", "LEZZO", "LEZZOS", "LIBERAL", "LIBERALS", "LIBERIAN", "LIBERIANS", "LIBYAN", "LIBYANS", "LISTING", "LINK", "LISTING", "LINKS", "LISTINGLINK", "LISTINGLINKS", "LISTINGS", "LINK", "LISTINGSLINK", "LITHUANIAN", "LITHUANIANS", "LOATIAN", "LOATIONS", "LUST", "LUTHERANS", "MACEDONIAN", "MACEDONIANS", "MALAY", "MALAYS", "MALAYSIAN", "MALAYSIANS", "MALE", "MALES", "MALI", "MALTESE", "MAORI", "MAORIS", "MARRIED", "MARRIEDS", "MARX", "MARXISM", "MARXIST", "MASOCHISM", "MASOCHIST", "MASOCHISTS", "MASTURBATE", "MASTURBATER", "MATURE", "COUPLE", "MATURE", "COUPLES", "MATURE", "INDIVIDUAL", "MATURE", "INDIVIDUALS", "MATURE", "PERSON", "MATURE", "PERSONS", "MATURECOUPLE", "MATURECOUPLES", "MATUREINDIVIDUAL", "MATUREINDIVIDUALS", "MATUREPERSON", "MATUREPERSONS", "MAURITANIAN", "MAURITANIANS", "MAURITIUS", "MAYAN", "MAYANS", "MEMBERSHIP", "APPROVAL", "REQUIRED", "MEMBERSHIP", "APPROVAL", "MEMBERSHIPAPPROVAL", "MEMBERSHIPAPPROVALREQUIRED", "MEN", "MENNONITE", "MENNONITES", "MENTALLY", "HANDICAPPED", "MENTALLY", "ILL", "MENTALLY-HANDICAPPED", "MENTALLY", "MENTALLYHANDICAPPED", "MENTALLYILL", "METHODISTS", "MEXICAN-AMERICAN", "MEXICAN-AMERICANS", "MEXICANS", "MICRONESIAN", "MICRONESIANS", "MIDDLE", "EAST", "MIDDLE", "EASTERN", "MIDDLE", "EASTERNER", "MIDDLEEAST", "MIDDLEEASTERN", "MIDDLEEASTERNER", "MINISTER", "MINISTERS", "MINISTRIES", "MINISTRY", "MINORITIES", "MINORITY", "MISSIONARIES", "MIXED", "COMMUNITIES", "MIXED", "COMMUNITY", "MIXEDCOMMUNITIES", "MIXEDCOMMUNITY", "MOHAWK", "MOHICAN", "MOHICANS", "MOLEST", "MOLESTATION", "MOLESTER", "MONGOL", "MONGOLIAN", "MONGOLIANS", "MONGOLS", "MONK", "MONKS", "MORMON", "TEMPLE", "MORMON", "TEMPLES", "MORMON", "MORMONS", "MORMONTEMPLE", "MORMONTEMPLES", "MOROCCAN", "MOROCCANS", "MOSLEM", "MOSLEMS", "MOSQUE", "MOSQUES", "MUFF", "MUFFS", "MURDER", "MURDERER", "MURDERERS", "MURDERS", "MUSLIM", "MUSLIMS", "MUST", "BE", "EMPLOYED", "MUSTBEEMPLOYED", "MUTHA", "MUTHAS", "MYSTICISM", "MYSTICIST", "MYSTICISTS", "NAKED", "NAMIBIAN", "NAMIBIANS", "NATIONALITIES", "NATIONALITY", "NAURU", "NAVAHO", "NAVAJO", "NAZARENE", "NAZARETH", "NAZI", "NAZIS", "NAZISM", "NEPALESE", "NEWLYWED", "NEWLYWEDS", "NEZ", "PERCE", "NEZPERCE", "NICARAGUAN", "NICARAGUANS", "NIGERIAN", "NIGERIANS", "NIGGER", "NIGGERS", "NINNIES", "NINNY", "NORDIC", "NORWEGIAN", "NORWEGIANS", "NOT", "FOR", "HANDICAPPED", "NOT", "FOR", "HANDICAPPEDS", "NOTFORHANDICAPPED", "NOTFORHANDICAPPEDS", "NUBIAN", "NUBIANS", "NUN", "NUNNERY", "NUNS", "NYMPH", "NYMPHO", "NYMPHOMANIAC", "NYMPHOMANIACS", "NYMPHOS", "NYMPHS", "OCCIDENTAL", "OJIBWA", "OKINAWA", "OKINAWAN", "OKINAWANS", "OLDER", "PERSON", "OLDER", "PERSONS", "OLDERPERSON", "OLDERPERSONS", "ONE", "CHILD", "ONE", "PERSON", "ONECHILD", "ONEPERSON", "ORGIES", "ORGY", "ORIENTAL", "ORIENTALS", "OTHODOX", "PAGAN", "PAGANIST", "PAGANISTIC", "PAKISTANI", "PAKISTANIS", "PALESTINE", "PALESTINIAN", "PALESTINIANS", "PANSIES", "PANSY", "PARAGUAYAN", "PARAGUAYANS", "PARISH", "PARISHES", "PECKER", "PECKERS", "PEDIFILE", "PEDIFILES", "PEDIPHILE", "PEDIPHILES", "PEDOFILE", "PEDOFILES", "PEDOPHILE", "PEDOPHILES", "PEE", "PEEPEE", "PEEPEES", "PEES", "PENIS", "PENISES", "PENTECOST", "PENTECOSTAL", "PEOPLE", "OF", "COLOR", "PEOPLEOFCOLOR", "PEOPLES", "OF", "COLOR", "PEOPLESOFCOLOR", "PERSIA", "PERSIAN", "PERSIANS", "PHILIPPINE", "PHYSICALLY", "FIT", "PHYSICALLYFIT", "PIMP", "PIMPS", "PISS", "PISSES", "POLAC", "POLACK", "POLACKS", "POLACS", "POLAK", "POLAKS", "POLISH", "POLKA", "POLKAS", "POONTANG", "POONTANGS", "POOP", "POOPS", "PORNO", "PORNOGRAPHIC", "PORNOGRAPHY", "PORNOS", "PORTUGESE", "PREFERS", "PRESBYTERIAN", "PRESBYTERIANS", "PRICK", "PRICKS", "PRIESTS", "PROMISE", "KEEPER", "PROMISE", "KEEPERS", "PROMISEKEEPER", "PROMISEKEEPERS", "PROTESTANT", "PROTESTANTS", "PUERTO", "RICAN", "PUERTO", "RICANS", "PUERTO", "PUERTORICAN", "PUERTORICANS", "PUERTOS", "PUKE", "PUKES", "PUSS", "PUSSES", "PUSSIES", "PUSSY", "PUTRID", "PYGMIES", "PYGMY", "QUAKER", "QUAKERS", "QUEENIE", "QUEENIES", "QUEER", "QUEERS", "RACES", "RACIST", "RACISTS", "RAG-HEAD", "RAG-HEADS", "RAGHEAD", "RAGHEADS", "RANCID", "RAPE", "RAPES", "RAPIST", "RAPISTS", "RASTAFARIAN", "RASTAFARIANS", "REDNECK", "REDNECKS", "RELIGION", "RELIGIONS", "RELIGIOUS", "REPELLANT", "REPELLENT", "REPUBLICAN", "REPUBLICANS", "REPUGNANT", "REPULSIVE", "RETARD", "RETARDED", "RETARDS", "RETIRE", "RETIRED", "RETIREDS", "RETIREE", "RETIREES", "RETIREMENT", "RICAN", "RICANS", "RITE", "RITES", "RITUAL", "RITUALISTIC", "RITUALS", "ROMANIAN", "ROMANIANS", "ROT", "IN", "HELL", "ROTINHELL", "RUSSIAN", "RUSSIANS", "RUSSKIE", "RUSSKIES", "RUSSKY", "RWANDAN", "RWANDANS", "SABBATH", "SADIST", "SADISTS", "SADO", "SADOS", "SALVADORAN", "SALVADORANS", "SAMOAN", "SAMOANS", "SAN", "SALVADOR", "SANSALVADOR", "SAO", "PAOLO", "SAOPAOLO", "SATAN", "SATANIC", "SAUDI", "SAUDIA", "ARABIAN", "SAUDIA", "ARABIANS", "SAUDIAARABIAN", "SAUDIAARABIANS", "SAUDIS", "SCIENTOLOGIST", "SCIENTOLOGISTS", "SCIENTOLOGY", "SCOT", "SCOTLAND", "SCOTS", "SCOTTIES", "SCOTTISH", "SCOTTY", "SCREW", "SCREWS", "SCUM", "SCUMBAG", "SCUMBAGS", "SEASONAL", "WORKER", "SEASONAL", "WORKERS", "SEASONALWORKER", "SEASONALWORKERS", "SEGREGATED", "SEGREGATION", "SEMINARIAN", "SEMINARIANS", "SEMINARY", "SENEGALESE", "SENILE", "SENIORS", "SERB", "SERBIA", "SERBIAN", "SERBIANS", "SEX", "SEXES", "SH#T", "SH#TS", "SH-T", "SH-TS", "SHAMAN", "SHAMANISM", "SHAMANIST", "SHAMANISTIC", "SHAMANS", "SHAT", "SHEMALE", "SHEMALES", "SHERPA", "SHERPAS", "SHIITE", "SHIITES", "SHINTO", "SHIT", "SHITS", "SHOOT", "SHOOTS", "SHRINE", "SHRINES", "SIKHISM", "SINGLE", "PERSON", "SINGLE-ONLY", "SINGLEPERSON", "SINGLES", "ONLY", "SINGLES-ONLY", "SINGLES", "SINGLESONLY", "SISSIES", "SISSY", "SLANT-EYE", "SLANT-EYED", "SLANT-EYES", "SLANTEYE", "SLANTEYED", "SLANTEYES", "SLOVAK", "SLOVAKS", "SLOVENIAN", "SLOVENIANS", "SLUM", "SLUMS", "SLUT", "SLUTS", "SMEGMA", "SMOKERS", "SMUT", "SNARF", "SOC", "SEC", "INS", "SOCSECINS", "SODOM", "SODOMIZE", "SOMALI", "SOMALIAN", "SOMALIANS", "SOMALIS", "SORDID", "SPANIARD", "SPANIARDS", "SPEAR-CHUCKER", "SPEAR-CHUCKERS", "SPEARCHUCKER", "SPEARCHUCKERS", "SPEW", "SPEWS", "SPIC", "SPICS", "SPIRITUAL", "SQUALID", "SRI", "LANKAN", "SRI", "LANKANS", "SRILANKAN", "SRILANKANS", "STALIN", "STALINISM", "STALINIST", "STALINISTS", "STALK", "STALKER", "STALKS", "STREET-WALKER", "STREET-WALKERS", "STREETWALKER", "STREETWALKERS", "SUCK", "SUCKS", "SUDANESE", "SUITABLE", "FOR", "SUITABLEFOR", "SUNNI", "SUPREMACIST", "SUPREMACISTS", "SUPREMACY", "SURINAME", "SWAHILI", "SWAZI", "SWEDE", "SWEDES", "SWEDISH", "SWISS", "SYNAGOGUE", "SYNAGOGUES", "SYRIAN", "SYRIANS", "TABAGO", "TAIWANESE", "TANZANIAN", "TANZANIANS", "TAO", "TAOISM", "TAOIST", "TAOISTS", "TASMANIAN", "TASMANIANS", "TEMPLES", "THAI", "TIBET", "TIBETAN", "TINKLE", "TINKLES", "TOGO", "TOLTEC", "TONGA", "TOWEL-HEAD", "TOWEL-HEADS", "TOWELHEAD", "TOWELHEADS", "TRAMP", "TRAMPS", "TRAMPY", "TRANSCENDENTALISM", "TRANSCENDENTALIST", "TRANSCENDENTALISTS", "TRANSGENDER", "TRIBE", "TRIBES", "TSIMSHIAN", "TUNISIAN", "TUNISIANS", "TURBAN-HEAD", "TURBAN-HEADS", "TURBAN", "TURBANHEAD", "TURBANHEADS", "TURBANS", "TURD", "TURDS", "TURK", "TURKISH", "TURKS", "TUSH", "TUSHIES", "TUSHY", "TUVALU", "TWAT", "TWATS", "UGANDAN", "UGANDANS", "UKRAINIAN", "UKRAINIANS", "UNEMPLOYED", "UNHOLY", "UNITARIAN", "UP", "CHUCK", "UP", "YOUR", "UP", "YOURS", "UPCHUCK", "UPYOUR", "UPYOURS", "UZBEKISTAN", "UZBEKISTANI", "UZBEKISTANIS", "VAGINA", "VAGINAS", "VAMPIRE", "VAMPIRES", "VEDDA", "VEDDAS", "VEDIC", "VEGAN", "VEGANS", "VEGETARIANS", "VENEZUELAN", "VENEZUELANS", "VIETNAMESE", "VIRGIN", "VIRGINS", "VOMIT", "VOMITS", "WANG", "WANGS", "WANK", "WANKS", "WEANER", "WEANERS", "WEANIE", "WEANIES", "WEANY", "WEANYS", "WEE-WEE", "WEE-WEES", "WEEWEE", "WEEWEES", "WEINERS", "WEINIE", "WEINIES", "WEINY", "WEINYS", "WHACK-OFF", "WHACK-OFFS", "WHACK", "WHACKOFF", "WHACKOFFS", "WHACKS", "WHINO", "WHINOS", "WHITE", "ONLY", "WHITE-TRASH", "WHITEONLY", "WHITES", "ONLY", "WHITES", "WHITESONLY", "WHITETRASH", "WHITEY", "WHITEYS", "WHITY", "WHITYS", "WHORE", "WHORES", "WICCA", "WICCAN", "WICCANS", "WINO", "WINOS", "WOMAN", "WOMEN", "WORSHIPPER", "WORSHIPPERS", "YAHWEH", "YANKOFF", "YANKOFFS", "YEMENI", "YEMENIS", "YO", "MAMA", "YO", "MAMAS", "YOMAMA", "YOMAMAS", "YOUR-MAMA", "YOURMAMA", "YOUTHFUL", "YUGOSLAVIAN", "YUGOSLAVIANS", "ZAMBIAN", "ZAMBIANS", "ZIONIST", "ZIONISTS", "ZOROASTRIAN", "ZOROASTRIANS", "ZULU", "ZULUS", "ZUNI", "ZUNIS"]

  @content = @content.split(/ |, |,/)
  @match = @list_raw & @content
  @match = @match.join(" ")
  erb :display
end

post "/words" do
  save_content(params["content"])
  redirect URI.escape("/display")
end
