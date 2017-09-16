create database locacao
	/*kaio R.A:1701612
	  joão filismino R.A:1701626
	  suelaine R.A:1701618
	  raphael R.A:1701619
	  cristopher R.A:1701604
	  vinicius costa R.A:1701607 */;
go
	use locacao;
go

create table veiculo (
	placa varchar (9),
	numChassi varchar (50) unique,
	ano int,
	km int,
	DataAquisicao date,
	constraint pk_placa primary key (placa),
);
create table cliente (
	codigo_cliente int identity (1,1),
	carro_alugado varchar (9) , /*para relacionar o cliente com o carro(placa)*/
	cpf int not null unique ,
	rg int not null ,
	uf char (2) not null,
	nome varchar (255) not null,
	dataNascimento date,
	email varchar (100),
	cnh int not null unique,
	data_locacao date,
	teste varchar(10),
	constraint uq_rguf unique (rg,uf),
	constraint pk_codigo_cliente primary key (codigo_cliente),
	constraint fk_carro_alugado foreign key (carro_alugado) references veiculo (placa)
	
	);
	
create table tipo_veiculo (
	codTipoVeiculo int identity (0,5),
	descricao varchar (50),
	data_locacao date,
	id_veiculo varchar (9),
	constraint pk_codTipoVeiculo primary key (codTipoVeiculo),
	constraint fk_id_veiculo foreign key (id_veiculo) references veiculo (placa)/* para relacionar com o veiculo*/

);
create table aluga (
	codigo_cliente int,
	placa varchar (9),
	dataInicio date,
	dataFim date,
	kmInicio int,
	kmFim int,
	constraint pk_aluga primary key (codigo_cliente,placa),
	constraint fk_cliente_aluga foreign key (codigo_cliente) references cliente (codigo_cliente),
	constraint fk_aluga_veiculo foreign key (placa) references veiculo (placa)
);


/*alter table veiculo add constraint fk_chassi foreign key (numChassi) references tipo_veiculo (descricao)*/