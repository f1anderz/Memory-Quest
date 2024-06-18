<template>
  <div class="mq__footer">
    <div class="mq__footer-origin">Made in Ukraine <img src="@/assets/img/ukraine.webp" alt="UA"></div>
    <div class="mq__footer-developer">by <a href="https://linktr.ee/f1anderz">f1anderz</a></div>
    <div class="mq__footer-year"> &#169; 2024</div>
  </div>
</template>

<script setup lang="ts">

</script>

<style lang="scss" scoped>
@use '@/assets/scss/style';
@use '@/assets/scss/mixins';

.mq__footer {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  font: 1.2rem style.$font-header;
  color: style.$text-color;
  background: style.$secondary-background-color;
  box-shadow: 0 -.8rem .8rem rgba($color: #000000, $alpha: .1);


  @include mixins.breakpoint(xs) {
    padding: .75rem 5%;
    font-size: 1rem;
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

  &-origin {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center;
    gap: .5rem;

    & img {
      width: 1.2rem;
      height: 1.2rem;
    }
  }

  &-developer {
    & a {
      @include mixins.breakpoint(xxl) {
        &:hover {
          cursor: pointer;
          color: style.$accent-color;
        }
      }
    }
  }
}
</style>