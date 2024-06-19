<template>
  <div class="mq__tile" :class="{ 'is-switched': flipper }" @click="handleCardClick">
    <div class="mq__tile-wrapper">
      <img class="mq__tile-wrapper-cover" :class="{ 'is-active': !flipper }" src="@/assets/img/favicon.webp"
        alt="MemoryQuest">
      <img class="mq__tile-wrapper-image" :class="{ 'is-active': flipper, 'loaded': !loaded }"
        :src="images[props.card.img.src]" alt="Apple">
    </div>
  </div>
</template>

<script setup lang="ts">
import { filename } from 'pathe/utils';
import { ref, watch, toRefs } from 'vue';
import { MQCard } from '../common/types';
const props = defineProps(['card', 'reset', 'guessed']);
const { reset } = toRefs(props);
const emit = defineEmits(['click']);

const flipper = ref(false);
const loaded = ref(false);

setTimeout(() => loaded.value = true, 275);

const glob: object = import.meta.glob('@/assets/img/fruits/*.webp', { eager: true })
const images = Object.fromEntries(
  Object.entries(glob).map(([key, value]) => [filename(key), value.default])
);

const flip = () => {
  flipper.value = true;
}

const revert = () => {
  let flag = false;
  props.guessed.forEach((card: MQCard) => {
    if (card._id === props.card._id) {
      flag = true;
    }
  });
  if (!flag) {
    flipper.value = false;
  }
}

const handleCardClick = () => {
  emit('click', props.card);
  flip();
}

watch(reset!, () => {
  revert();
})
</script>

<style lang="scss" scoped>
@use '@/assets/scss/style';
@use '@/assets/scss/mixins';

.mq__tile {
  z-index: 1;
  display: flex;
  perspective: 20rem;
  position: relative;
  background: style.$secondary-background-color;
  border-radius: 1rem;
  box-shadow: .2rem .2rem .2rem rgba($color: #000000, $alpha: .1);

  @include mixins.breakpoint(xs) {
    padding: 1rem;
  }

  @include mixins.breakpoint(s) {
    padding: 1rem;
  }

  @include mixins.breakpoint(m) {
    padding: 1.5rem;
  }

  @include mixins.breakpoint(l) {
    padding: 1.5rem;
  }

  @include mixins.breakpoint(xl) {
    padding: 2rem;
  }

  @include mixins.breakpoint(xxl) {
    padding: 2rem;
  }

  &.is-switched {
    .mq__tile-wrapper {
      animation: rotate .5s linear both;
    }
  }

  &-wrapper {
    transform-style: preserve-3d;
    animation: rotate-back .5s linear both;

    & img {
      position: absolute;
      top: 0;
      left: 0;
      backface-visibility: hidden;
      -webkit-user-drag: none;
      user-select: none;
      -moz-user-select: none;
      -webkit-user-select: none;
      -ms-user-select: none;

      @include mixins.breakpoint(xs) {
        width: 3rem;
        height: 3rem;
      }

      @include mixins.breakpoint(s) {
        width: 3rem;
        height: 3rem;
      }

      @include mixins.breakpoint(m) {
        width: 6rem;
        height: 6rem;
      }

      @include mixins.breakpoint(l) {
        width: 7rem;
        height: 7rem;
      }

      @include mixins.breakpoint(xl) {
        width: 8rem;
        height: 8rem;
      }

      @include mixins.breakpoint(xxl) {
        width: 8rem;
        height: 8rem;
      }

      &.is-active {
        position: static;
      }
    }

    &-cover {
      filter: grayscale(1);
    }

    &-image {
      transform: rotateY(180deg);
    }
  }
}

@keyframes rotate {
  0% {
    transform: rotateY(0);
  }

  100% {
    transform: rotateY(180deg);
  }
}

@keyframes rotate-back {
  0% {
    transform: rotateY(180deg);
  }

  100% {
    transform: rotateY(0);
  }
}

.loaded {
  display: none;
}
</style>