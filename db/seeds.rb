# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



cities = City.create([
{ name: 'Distrito Nacional' }, 
{ name: 'Santo Domingo Este' }, 
{ name: 'Santo Domingo Oeste'},
{ name: 'Santo Domingo Norte' }
])

sectors = Sector.create([
{ name: 'Naco', city: City.find_by(name: 'Distrito Nacional')}, 
{ name: 'Bella Vista', city: City.find_by(name: 'Distrito Nacional')},
{ name: 'Piantini', city: City.find_by(name: 'Distrito Nacional')},
{ name: 'Arroyo Hondo', city: City.find_by(name: 'Distrito Nacional')},
{ name: 'El Millón', city: City.find_by(name: 'Distrito Nacional')},
{ name: 'Los Cacicazgos', city: City.find_by(name: 'Distrito Nacional')},
{ name: 'Renacimiento', city: City.find_by(name: 'Distrito Nacional')},
{ name: 'Gazcue', city: City.find_by(name: 'Distrito Nacional')}
])

brands = VehicleBrand.create([
{ name: 'Audi'}, 
{ name: 'Toyota'},
{ name: 'Nissan'},
{ name: 'Volkswagen'},
{ name: 'Hyundai'},
{ name: 'BMW'},
{ name: 'Mercedes Benz'} 
])

models = VehicleModel.create([
{ name: 'A4', vehicle_brand: VehicleBrand.find_by(name: 'Audi')}, 
{ name: 'A6', vehicle_brand: VehicleBrand.find_by(name: 'Audi')},
{ name: 'Corolla', vehicle_brand: VehicleBrand.find_by(name: 'Toyota')},  
{ name: 'Land Cruiser', vehicle_brand: VehicleBrand.find_by(name: 'Toyota')}, 
{ name: 'Altima', vehicle_brand: VehicleBrand.find_by(name: 'Nissan')}, 
{ name: 'Murano', vehicle_brand: VehicleBrand.find_by(name: 'Nissan')},
{ name: 'Beetle', vehicle_brand: VehicleBrand.find_by(name: 'Volkswagen')}, 
{ name: 'Jetta', vehicle_brand: VehicleBrand.find_by(name: 'Volkswagen')},  
{ name: 'Tucson', vehicle_brand: VehicleBrand.find_by(name: 'Hyundai')}, 
{ name: 'Optima', vehicle_brand: VehicleBrand.find_by(name: 'Hyundai')}, 
{ name: 'X5', vehicle_brand: VehicleBrand.find_by(name: 'BMW')}, 
{ name: 'X6', vehicle_brand: VehicleBrand.find_by(name: 'BMW')}, 
{ name: 'ML', vehicle_brand: VehicleBrand.find_by(name: 'Mercedes Benz')}, 
{ name: 'CLA', vehicle_brand: VehicleBrand.find_by(name: 'Mercedes Benz')}
])

claim_statuses = ClaimStatus.create([
{ status: 'Aprobada' },
{ status: 'Denegada' },
{ status: 'En Proceso' }
])

claim_types = ClaimType.create([
{ name: 'Robo' },
{ name: 'Colisión' },
{ name: 'Daños' }
])

companies = Company.create([
{ name: 'Tricom', rnc: '101382001', address: 'Av. L De Vega 95', sector: Sector.find_by(name: 'Naco') },
{ name: 'Intras', rnc: '212868012', address: 'Gustavo Mejía Ricart #76, suite 904', sector: Sector.find_by(name: 'Piantini') },
{ name: 'Orange Dominicana', rnc: '168980132', address: 'Romulo Betancourt #32', sector: Sector.find_by(name: 'Bella Vista') }
])

clients = Client.create([
{ name: 'José Raúl', surname: 'Nova Rodríguez', identification: '00118530690', gender: true, birthdate: '07-09-1990', address: 'Rafael Hernandez #16', sector: Sector.find_by(name: 'Naco') },
{ name: 'Fernando Arturo', surname: 'Báez Tavárez', identification: '00117999383', gender: true, birthdate: '13-01-1988', address: 'Av. Enriquillo', sector: Sector.find_by(name: 'Renacimiento') },
{ name: 'Lucia Valeria', surname: 'Guillamón Luna', identification: '00374839360', gender: false, birthdate: '31-01-1989', address: 'Av. Duarte', sector: Sector.find_by(name: 'Gazcue') }

])

insurances = Insurance.create([
{ company: 'Seguros Constitución' },
{ company: 'Seguros Universal' },
{ company: 'Seguros BanReservas' },
{ company: 'Seguros La Colonial' }
])

user = User.create([
{ email: 'novajose@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'José Raúl', surname: 'Nova Rodriguez', insurance: Insurance.find_by(company: 'Seguros Constitución')},
{ email: 'fernan.baez@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'Fernando A.', surname: 'Báez Tavárez', insurance: Insurance.find_by(company: 'Seguros BanReservas')}
])

policies = Policy.create([
{ policy: 'AUTC-2250108030', coverage: true, start: '28-05-2012', end: '28-05-2013', insurance: Insurance.find_by(company: 'Seguros Constitución'), client: Client.find_by(identification: '00118530690')},
{ policy: '328062530988', coverage: false, start: '03-06-2010', end: '03-06-2011', insurance: Insurance.find_by(company: 'Seguros Universal'), company: Company.find_by(name: 'Tricom')},
{ policy: '417251880765', coverage: true, start: '12-08-2014', end: '12-08-2015', insurance: Insurance.find_by(company: 'Seguros BanReservas'), client: Client.find_by(identification: '00118530690')},
{ policy: '1-2-500-129304', coverage: false, start: '10-06-2014', end: '10-06-2015', insurance: Insurance.find_by(company: 'Seguros La Colonial'), client: Client.find_by(identification: '00374839360')},
{ policy: 'AUTC-7502026771', coverage: true, start: '10-06-2009', end: '10-06-2011', insurance: Insurance.find_by(company: 'Seguros Constitución'), client: Client.find_by(identification: '00374839360')}
])

vehicles = Vehicle.create([
{ vehicle_model: VehicleModel.find_by(name: 'Tucson'), year: 2010, vin: '1HGBH41JXMN109186', plate: 'M543001'},
{ vehicle_model: VehicleModel.find_by(name: 'Land Cruiser'), year: 2015, vin: '3HBFD60JXAB212016', plate: 'M231886'},
{ vehicle_model: VehicleModel.find_by(name: 'Corolla'), year: 2008, vin: '4DFGF43XBSE837483', plate: 'A001490'}
])

Vehicle.find_by(vin: '1HGBH41JXMN109186').policies << Policy.find_by(policy: '328062530988')
Vehicle.find_by(vin: '1HGBH41JXMN109186').policies << Policy.find_by(policy: 'AUTC-2250108030')
Vehicle.find_by(vin: '4DFGF43XBSE837483').policies << Policy.find_by(policy: 'AUTC-7502026771')


claims = Claim.create([
{ date:'09-10-2012', number: 'ABCD1234657', amount: 13532.01, policy: Policy.find_by(policy: 'AUTC-2250108030'), vehicle: Vehicle.find_by(vin: '1HGBH41JXMN109186'), claim_type: ClaimType.find_by(name: 'Colisión'), claim_status: ClaimStatus.find_by(status: 'Aprobada')},
{ date:'22-03-2013', number: 'WXYZ5463721', amount: 56820.00, policy: Policy.find_by(policy: 'AUTC-2250108030'), vehicle: Vehicle.find_by(vin: '1HGBH41JXMN109186'), claim_type: ClaimType.find_by(name: 'Colisión'), claim_status: ClaimStatus.find_by(status: 'Denegada')},
{ date:'02-12-2014', number: 'EFGH4352431', amount: 30230.00, policy: Policy.find_by(policy: '417251880765'), vehicle: Vehicle.find_by(vin: '3HBFD60JXAB212016'), claim_type: ClaimType.find_by(name: 'Colisión'), claim_status: ClaimStatus.find_by(status: 'En Proceso')},
{ date:'20-06-2010', number: 'TRPX3748392', amount: 7502.00, policy: Policy.find_by(policy: 'AUTC-7502026771'), vehicle: Vehicle.find_by(vin: '4DFGF43XBSE837483'), claim_type: ClaimType.find_by(name: 'Daños'), claim_status: ClaimStatus.find_by(status: 'Aprobada')}
])