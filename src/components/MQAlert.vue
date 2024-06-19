<template>
  <div class="mq__alert" :class="{ 'hidden': props.hidden }">
    <slot></slot>
    <MQButton @click="emit('click')">New Game</MQButton>
  </div>
</template>

<script setup lang="ts">
import MQButton from './MQButton.vue';
const emit = defineEmits(['click']);
const props = defineProps(['hidden']);
</script>

<style lang="scss" scoped>
@use '@/assets/scss/style';
@use '@/assets/scss/mixins';

.mq__alert {
  position: absolute;
  top: 3vh;
  z-index: 2;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 1rem;
  border-radius: 1rem;
  background: style.$secondary-background-color;
  box-shadow: 0 0 .75rem rgba($color: style.$accent-color, $alpha: .2);
  text-align: center;
  color: style.$text-color;
  font: 1.2rem style.$font-header;
  opacity: 1;
  transition: opacity .5s ease-in;

  @include mixins.breakpoint(xs) {
    left: 20%;
    width: 60%
  }

  @include mixins.breakpoint(s) {
    left: 30%;
    width: 40%
  }

  @include mixins.breakpoint(m) {
    left: 30%;
    width: 40%;
  }

  @include mixins.breakpoint(l) {
    left: 37%;
    width: 26%;
  }

  @include mixins.breakpoint(xl) {
    left: 40%;
    width: 20%;
  }

  @include mixins.breakpoint(xxl) {
    left: 40%;
    width: 20%;
  }
}

.hidden {
  opacity: 0;
}
</style>