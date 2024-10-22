
def create_users
  famous_users = [
    {
      first_name: "David Heinemeier",
      last_name: "Hansson",
      email: "david@hey.com"
    },
    {
      first_name: "Chris",
      last_name: "Oliver",
      email: "chris@gorails.com"
    },
    {
      first_name: "Jason",
      last_name: "Charnes",
      email: "jason@jasoncharnes.com"
    },
    {
      first_name: "Jason",
      last_name: "Swett",
      email: "jason@benfranklinlabs.com"
    },
    {
      first_name: 'Yukihiro "Matz"',
      last_name: "Matsumoto",
      email: "matz@ruby.or.jp"
    },
    {
      first_name: "Joe",
      last_name: "Masilotti",
      email: "joe@masilotti.com"
    },
    {
      first_name: "Lucian",
      last_name: "Ghinda",
      email: "lucian@ghinda.com"
    },
    {
      first_name: "Mike",
      last_name: "Perham",
      email: "mperham@gmail.com"
    },
    {
      first_name: "Taylor",
      last_name: "Otwell",
      email: "taylor@laravel.com"
    },
    {
      first_name: "Adam",
      last_name: "Watham",
      email: "adam@adamwathan.me"
    },
    {
      first_name: "Jeffery",
      last_name: "Way",
      email: "jeffrey@laracasts.com"
    },
    {
      first_name: "Adrian",
      last_name: "Marin",
      email: "adrian@adrianthedev.com"
    }
  ]
  famous_users.reverse_each do |user|
    FactoryBot.create(:user, **user)
  end
end

def create_admin
  if !User.exists?(email: "avo@avohq.io")
    User.create(
      first_name: "Avo",
      last_name: "Cado",
      email: "avo@avohq.io",
      password: (ENV["AVO_ADMIN_PASSWORD"] || :secret),
      roles: {
        admin: true,
        manager: false,
        writer: false
      }
    )
  end

  if !User.exists?(email: "avo@cado.com")
    User.create(
      first_name: "Avo",
      last_name: "Cado",
      email: "avo@cado.com",
      password: (ENV["AVO_ADMIN_PASSWORD"] || :secret),
      roles: {
        admin: true,
        manager: false,
        writer: false
      }
    )
  end
end

def create_projects
  30.times do
    FactoryBot.create(:project)
  end
end
