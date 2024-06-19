<template>
  <header>
    <MQHeader />
  </header>
  <main>
    <MQField />
  </main>
  <footer>
    <MQFooter />
  </footer>
</template>

<script setup lang="ts">
import MQHeader from './components/MQHeader.vue';
import MQFooter from './components/MQFooter.vue';
import MQField from './components/MQField.vue';
</script>

<style lang="scss">
@import '@/assets/scss/style';

main {
  min-height: 90vh;
  display: flex;
  flex-direction: row;
  align-items: center
}
</style>
