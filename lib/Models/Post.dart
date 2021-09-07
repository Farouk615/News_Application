class Post{
  late String id,title,content,featured_image,date_written,vote_up,vote_down,user_id,category_id;

  Post(this.id,this.title, this.content, this.featured_image,this.date_written ,this.vote_up,
      this.vote_down, this.user_id, this.category_id);

  @override
  String toString() {
    return 'Post{id: $id, title: $title, content: $content, featured_image: $featured_image, date_written: $date_written, vote_up: $vote_up, vote_down: $vote_down, user_id: $user_id, category_id: $category_id}';
  }
}