<template>
  <div class="mq__header">
    <img src="@/assets/img/favicon.webp" alt="Favicon">
    <span>Memory Quest</span>
  </div>
</template>

<script setup lang="ts">

</script>

<style lang="scss" scoped>
@use '@/assets/scss/style';
@use '@/assets/scss/mixins';

.mq__header {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: .5rem;
  font: 1.2rem style.$font-header;
  color: style.$text-color;
  background: style.$secondary-background-color;
  box-shadow: 0 .8rem .8rem rgba($color: #000000, $alpha: .1);

  @include mixins.breakpoint(xs) {
    padding: .75rem 5%;
  }

  @include mixins.breakpoint(s) {
    padding: .75rem 10%;
  }

  @include mixins.breakpoint(m) {
    padding: .75rem 10%;
  }

  @include mixins.breakpoint(l) {
    padding: .75rem 15%;
  }

  @include mixins.breakpoint(xl) {
    padding: .75rem 15%;
  }

  @include mixins.breakpoint(xxl) {
    padding: .75rem 15%;
  }

  & img {
    display: block;
    width: 2rem;
    height: 2rem;
  }
}
</style>