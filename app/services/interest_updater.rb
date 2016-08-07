class InterestUpdater
  def initialize user, params
    @user = user
    @params = params
  end

  def create
    @params.keys.each do |interest|
      @user.interests.create!(
        name: master_key[interest],
        preset?: true
      )
    end
  end

  private

  def master_key
    { 'arts'      =>  'Arts & Entertainment',
      'autos'     =>  'Autos & Vehicles',
      'beauty'    =>  'Beauty',
      'health'    =>  'Health & Fitness',
      'books'     =>  'Books & Literature',
      'computers' =>  'Computers & Electronics',
      'design'    =>  'Design',
      'food'      =>  'Food & Drink',
      'games'     =>  'Games',
      'hobbies'   =>  'Hobbies & Leisure',
      'home'      =>  'Home & Garden',
      'internet'  =>  'Internet & Technology',
      'magic'     =>  'Magic & Illusions',
      'movies'    =>  'Movies & Film',
      'music'     =>  'Music',
      'pets'      =>  'Pets & Animals',
      'programming' => 'Programming & Web Development',
      'science'   =>  'Science',
      'sports'    =>  'Sports',
      'travel'    =>  'Travel' }
  end
end
