export interface Image {
  src: string;
  alt: string;
}

export interface MQCard {
  _id: string;
  value: string;
  flipped: boolean;
  guessed: boolean;
  img: Image;
}