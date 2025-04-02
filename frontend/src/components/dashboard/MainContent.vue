<template>
  <v-main>
    <v-sheet class="mx-auto pa-2 pt-6" color="grey-lighten-4">
      <v-sheet
        color="grey-lighten-2"
        height="24"
        rounded="pill"
        width="88"
      ></v-sheet>

      <v-slide-group show-arrows>
        <v-slide-group-item v-for="n in 5" :key="n">
          <v-sheet
            class="ma-3"
            color="grey-lighten-1"
            height="200"
            width="250"
            rounded
          ></v-sheet>
        </v-slide-group-item>
      </v-slide-group>
    </v-sheet>

    <v-sheet class="mx-auto pa-2 pt-6" color="grey-lighten-2">
      <v-sheet color="grey" height="24" rounded="pill" width="88"></v-sheet>

      <v-slide-group show-arrows>
        <v-slide-group-item v-for="n in 15" :key="n">
          <v-sheet
            :width="n === 1 ? 300 : 150"
            class="ma-3"
            color="grey-lighten-1"
            height="200"
            rounded
          ></v-sheet>
        </v-slide-group-item>
      </v-slide-group>

      <v-container fluid>
        <v-row>
          <v-col v-for="n in 24" :key="n" cols="2">
            <v-sheet color="grey-lighten-1" height="200" rounded></v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </v-sheet>
  </v-main>
</template>
