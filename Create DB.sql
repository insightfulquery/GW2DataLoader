create table ItemType (
	type_id smallint identity(0,1) primary key clustered,
	[type] varchar(max),
	[api_name] varchar(max) unique
)
GO

insert into ItemType ([type]) values ('N/A')
GO

create table SubType (
	sub_type_id smallint identity(0,1) primary key clustered,
	sub_type varchar(max)
)
GO

insert into SubType (sub_type) values ('N/A')
GO

create table Rarity (
	rarity_id smallint identity(0,1) primary key clustered,
	rarity varchar(max) unique
)
GO

insert into Rarity (rariy) values
	('N/A'),
	('Junk'),
	('Basic'),
	('Fine'),
	('Masterwork'),
	('Rare'),
	('Exotic'),
	('Ascended'),
	('Legendary')
GO

create table [Weight] (
	weight_id smallint identity(0,1) primary key clustered,
	[weight] varchar(max) unique
)
GO

insert into [Weight] (weight) values
	('N/A'),
	('Clothing'),
	('Light'),
	('Medium'),
	('Heavy')
GO

create table UnlockType (
	unlock_type_id smallint identity(0,1) primary key clustered,
	unlock_type varchar(max)
)
GO

insert into UnlockType (unlock_type) values ('N/A')
GO

create table DamageType (
	damage_type_id smallint identity(0,1) primary key clustered,
	damage_type varchar(max)
)
GO

insert into DamageType (damage_type) values ('N/A')
GO

create table Suffix (
	suffix_id smallint identity(0,1) primary key clustered,
	suffix varchar(max)
)
GO

insert into Suffix (suffix) values ('N/A')
GO

create table BuffDescription (
	buff_description_id int,
	buff_description varchar(max)
)
GO

insert into BuffDescription values ('N/A')
GO

create table Item (
	row_id identity(1,1),
	item_id int,
	as_json varchar(max),
	chat_link varchar(max),
	icon_url varchar(max),
	description varchar(max),
	sub_type_description varchar(max),
	type_id smallint,
	sub_type_id smallint,
	rarity_id smallint,
	[level] smallint,
	vendor_value int,
	default_skin int, -- Should be ID to lookup table?
	account_binds_on_use boolean,
	account_binds_on_acquire boolean,
	soul_binds_on_acquire boolean,
	soul_binds_on_use boolean,
	does_hide_suffix boolean,
	monster_only boolean,
	is_mystic_forgeable boolean,
	is_salvageable boolean,
	is_sellable boolean,
	is_upgradeable boolean,
	is_available_underwater boolean,
	is_unique boolean,
	usable_in_activities boolean,
	usable_in_dungeons boolean,
	usable_in_pve boolean,
	usuable_in_pvp boolean,
	usable_in_pvp_lobby boolean,
	usable_in_wvw boolean,
	asura_can_use boolean,
	charr_can_use boolean,
	human_can_use boolean,
	norn_can_use boolean,
	sylvari_can_use boolean,
	elementalist_can_use boolean,
	engineer_can_use boolean,
	guardian_can_use boolean,
	mesmer_can_use boolean,
	necromancer_can_use boolean,
	ranger_can_use boolean,
	thief_can_use boolean,
	warrior_can_use boolean,
	numer_of_races_can_use smallint,
	number_of_classes_can_use smallint,
	weight_id smallint,
	defense smallint,
	infusion_slots smallint,
	is_defensive_infusion boolean,
	is_offensive_infusion boolean,
	is_utility_infusion boolean,
	is_agony_infusion boolean,
	inventory_slots smallint, -- bags
	hides_items boolean, -- whether the bag hides items from vendors
	duration int,
	unlock_type_id smallint,
	unlocks_color_id int,
	unlocks_recipe_id int,
	minipet_id int,
	charges int,
	usable_on_ax boolean,
	usable_on_dagger boolean,
	usable_on_focus boolean,
	usable_on_greatsword boolean,
	usable_on_hammer boolean,
	usable_on_harpoon boolean,
	usable_on_longbow boolean,
	usable_on_mace boolean,
	usable_on_mace boolean,
	usable_on_pistol boolean,
	usable_on_rifle boolean,
	usable_on_scepter boolean,
	usable_on_sheild boolean,
	usable_on_shortbow boolean,
	usable_on_speargun boolean,
	usable_on_staff boolean,
	usable_on_sword boolean,
	usable_on_torch boolean,
	usable_on_trident boolean,
	usable_on_warhorn boolean,
	usable_on_light_armor boolean,
	usable_on_med_armor boolean,
	usable_on_heavy_armor boolean,
	usable_on_trinket boolean,
	suffix_id smallint,
	damage_type_id smallint,
	min_attack_power smallint,
	max_attack_power smallint,
	boon_duration_bonus numeric(5,3),
	condition_damage_bonus numeric(5,3),
	condition_duration_bonus numeric(5,3),
	critical_hit_damage_bonus numeric(5,3),
	healing_bonus numeric(5,3),
	attack_power_bonus numeric(5,3),
	precision_bonus numeric(5,3),
	toughness_bonus numeric(5,3),
	vitality_bonus numeric(5,3),
	agony_resistance numeric(5,3),
	buff_skill_id int,
	buff_description_id int
)
-- WTF: suffix_item_id, secondary_suffix_item_id, stat_choices

create table Listings (
	item_id int,
	as_of datetime,
	is_sell boolean,
	unit_price int,
	quantity int
)
GO

create table Prices (
	item_id,
	as_of datetime, -- timeof pull
	buy_price int, -- price if you bid and wait
	buy_quantity int, -- number of items ordered at this price
	buy_quantity_similar_price int, -- number of orders within 5 copper
	buys_filled int, -- orders filled before the next data pull
	buy_velocity int, -- estimated average orders filled per day
	average_buy_price int, -- average top bid for the past week
	buy_stddev int, -- standard deviation of the top bid for the past week
	sell_price int,
	sell_quantity int,
	sell_quantity_similar_price int,
	sells_purchased int,
	sell_velocity int,
	average_sell_price int,
	sell_stddev int
)