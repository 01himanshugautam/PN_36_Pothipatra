class ImageUrl {
  generateImageUrl(String imageUrl) {
    String newUrl = 'http:${imageUrl.split(':')[1]}';
    return newUrl;
  }
}
