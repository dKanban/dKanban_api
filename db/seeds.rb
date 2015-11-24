# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Demand.create([{
  developer_owner_id: 1,
  title: 'Correção -> Desenvolvedor Vincular Demanda',
  description: 'Ao mover a demanda o desenvolvedor não está sendo vinculado a demanda, após ser vinculado, apenas ele pode mover essa demanda.',
  priority: 0,
  status: 0
},{
  developer_owner_id: 1,
    title: 'Correção -> Admin Cadastrar Demanda',
    description: 'Apenas o admin deve poder cadastrar demanda, todos estão com a permiçã ode cadastro no dKanban.',
    priority: 0,
    status: 1},{
      developer_owner_id: 1,
      title: 'Melhoria -> Cadastro de usuários',
      description: 'No cadastro o usuário deve poder informar o nome',
      priority: 1,
      status: 1},{
        developer_owner_id: 1,
        title: 'Acesso ao sistema ',
        description: 'Usuário deve poder acessar o sistema com senha e email.',
        priority: 0,
        status: 2},{
          developer_owner_id: 1,
          title: 'Descrição da demanda ',
          description: 'Quero visualizar a descrição da demanda com todos os seus campos e bonitim.',
          priority: 1,
          status: 3},{
            developer_owner_id: 1,
            title: 'Projeto Requisitos 2015/2',
            description: 'Apresentar projeto aos colegas e ver se eles gostaram.',
            priority: 0,
            status: 3}])
