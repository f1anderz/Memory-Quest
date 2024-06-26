<template>
  <div class="mq__field" v-if="cards.length > 0">
    <MQAlert :hidden="!alertVisible" @click="handleAlertClick">You Win !!!<br />Total Guesses: {{
      guesses }}</MQAlert>
    <transition-group>
      <MQTile v-for="card in mixedCards" :key="card._id" :card="card" @click="handleCardClick" :reset="reseter"
        :guessed="guessed" />
    </transition-group>
  </div>
  <div class="mq__start-game" v-else>
    <MQButton @click="handleNewGameClick">Start game</MQButton>
  </div>
</template>

<script setup lang="ts">
import MQTile from './MQTile.vue';
import MQAlert from './MQAlert.vue';
import MQButton from './MQButton.vue';
import { ref, Ref, computed } from 'vue';
import { MQCard } from '../common/types';

const cards: Ref<MQCard[]> = ref([]);

const guessed: Ref<MQCard[]> = ref([]);
const guesses = ref(0);
const reseter = ref(false);
const blocker = ref(false);
const alertVisible = ref(false);
let currentGuess: MQCard = { _id: '0', value: '', flipped: false, guessed: false, img: { src: ' ', alt: ' ' } };

const playSound = (path: string) => {
  let sound = new Audio(path);
  sound.volume = .15;
  sound.play();
}

const generateID = (): string => {
  return Math.random().toString(36).substr(2, 9);
}

const shuffle = (array: MQCard[]): MQCard[] => {
  if (array.length > 0) {
    playSound('src/assets/audio/shuffle-sound.mp3');
    const firstPart: MQCard[] = array.map(item => ({ ...item, _id: generateID() }));;
    const secondPart: MQCard[] = array.map(item => ({ ...item, _id: generateID() }));;
    array = [...firstPart, ...secondPart];
    let currentIndex = array.length;
    while (currentIndex != 0) {
      let randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex--;
      [array[currentIndex], array[randomIndex]] = [
        array[randomIndex], array[currentIndex]];
    }
    return [...array]
  } else {
    return []
  }
}

const mixedCards = computed(() => {
  return shuffle([...cards.value]);
});

const handleCardClick = (guess: MQCard) => {
  playSound('src/assets/audio/flip-sound.mp3');
  if (currentGuess._id === guess._id || blocker.value) {
    return;
  } else if (currentGuess.value.length === 0) {
    currentGuess = { ...guess };
  } else {
    guesses.value++;
    if (currentGuess.value === guess.value) {
      setTimeout(() => {
        playSound('src/assets/audio/success-sound.mp3');
      }, 500);
      guessed.value.push({ ...currentGuess });
      guessed.value.push({ ...guess });
    } else {
      blocker.value = true;
      setTimeout(() => {
        playSound('src/assets/audio/flip-sound.mp3');
        reseter.value = !reseter.value;
        blocker.value = false;
      }, 500);
    }
    currentGuess.value = '';

    if (guessed.value.length === mixedCards.value.length) {
      alertVisible.value = true;
      setTimeout(() => {
        playSound('src/assets/audio/win-sound.mp3');
      }, 1000);
    }
  }
}

const handleAlertClick = () => {
  alertVisible.value = false;
  cards.value = [...cards.value];
  setTimeout(() => {
    guesses.value = 0;
    guessed.value = [];
  }, 500);
}

const handleNewGameClick = () => {
  cards.value = [
    { _id: '1', value: 'apple', flipped: false, guessed: false, img: { src: 'apple', alt: 'Apple' } },
    { _id: '2', value: 'banana', flipped: false, guessed: false, img: { src: 'banana', alt: 'Banana' } },
    { _id: '3', value: 'cherries', flipped: false, guessed: false, img: { src: 'cherries', alt: 'Cherries' } },
    { _id: '4', value: 'grapes', flipped: false, guessed: false, img: { src: 'grapes', alt: 'Grapes' } },
    { _id: '5', value: 'orange', flipped: false, guessed: false, img: { src: 'orange', alt: 'Orange' } },
    { _id: '6', value: 'pineapple', flipped: false, guessed: false, img: { src: 'pineapple', alt: 'Pineapple' } },
    { _id: '7', value: 'strawberry', flipped: false, guessed: false, img: { src: 'strawberry', alt: 'Strawberry' } },
    { _id: '8', value: 'watermelon', flipped: false, guessed: false, img: { src: 'watermelon', alt: 'Watermelon' } }];
}
</script>

<style lang="scss" scoped>
@use '@/assets/scss/style';
@use '@/assets/scss/mixins';

.mq__start-game {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}

.mq__field {
  width: 100%;
  padding: 1rem 0;
  display: grid;
  justify-content: center;
  align-content: center;
  gap: 1rem;
  justify-items: center;
  align-items: center;

  @include mixins.breakpoint(xs) {
    grid-template-columns: repeat(4, 5rem);
    grid-template-rows: repeat(4, 5rem);
  }

  @include mixins.breakpoint(s) {
    grid-template-columns: repeat(4, 5rem);
    grid-template-rows: repeat(4, 5rem);
  }

  @include mixins.breakpoint(m) {
    grid-template-columns: repeat(4, 9rem);
    grid-template-rows: repeat(4, 9rem);
  }

  @include mixins.breakpoint(l) {
    grid-template-columns: repeat(4, 10rem);
    grid-template-rows: repeat(4, 10rem);
  }

  @include mixins.breakpoint(xl) {
    grid-template-columns: repeat(4, 12rem);
    grid-template-rows: repeat(4, 12rem);
  }

  @include mixins.breakpoint(xxl) {
    grid-template-columns: repeat(4, 12rem);
    grid-template-rows: repeat(4, 12rem);
  }
}
</style>