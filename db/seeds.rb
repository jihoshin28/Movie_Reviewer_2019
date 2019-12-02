Movie.create(title: "Avengers: Endgame", director: "Anthony Russo, Joe Russo", trailer_url:"https://www.youtube.com/watch?v=TcMBFSGVi1c")

User.create(name: "Arya", password: "test123", age: 28, email: "arya721@gmail.com",country: "Iran", bio: "Movies forever")

MovieReview.create(rating: 5, content: "This movie was so lame", movie_id: 1, user_id: 1)