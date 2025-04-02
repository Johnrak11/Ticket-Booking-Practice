<template>
  <v-app id="inspire">
    <SystemBar />

    <AppBar />

    <AppFooter />

    <NavigationDrawer />

    <MainContent />
  </v-app>
</template>

<script setup>
import SystemBar from "@/components/dashboard/SystemBar.vue";
import AppBar from "@/components/dashboard/AppBar.vue";
import AppFooter from "@/components/AppFooter.vue";
import NavigationDrawer from "@/components/dashboard/NavigationDrawer.vue";
import MainContent from "@/components/dashboard/MainContent.vue";
</script>
