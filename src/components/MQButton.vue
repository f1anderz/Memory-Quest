<template>
  <div class="mq__button" @click="emit('click')">
    <slot></slot>
  </div>
</template>

<script setup lang="ts">
const emit = defineEmits(['click']);
</script>

<style lang="scss" scoped>
@use '@/assets/scss/style';
@use '@/assets/scss/mixins';

.mq__button {
  padding: .25rem 1rem;
  background: style.$secondary-background-color;
  border: 2px solid style.$accent-color;
  border-radius: 1rem;
  color: style.$text-color;
  font: 1rem style.$font-body;

  @include mixins.breakpoint(xxl) {
    &:hover {
      cursor: pointer;
      background: style.$background-color;
    }
  }
}
</style>