<template>
  <header>
    <MQHeader />
  </header>
  <main></main>
  <footer>
    <MQFooter />
  </footer>
</template>

<script setup lang="ts">
import MQHeader from '@/components/MQHeader.vue';
import MQFooter from '@/components/MQFooter.vue';
</script>

<style lang="scss">
@import '@/assets/scss/style';

main {
  min-height: 90vh;
}
</style>
