<template>
    <v-card>
      <v-toolbar
        color="cyan darken-1"
        dark
        flat
      >
        <v-toolbar-title>
          <v-icon class="mr-3">
            mdi-menu
          </v-icon>
          Menu
        </v-toolbar-title>
      </v-toolbar>
      <v-list>
        <v-list-item-group
          color="orange"
          mandatory
        >
          <v-list-item
            v-for="item in menuItems"
            :key="item.id"
            @click="menuClick(item.name)"
          >
            <v-list-item-content>
              <v-list-item-title>
                <v-icon class="mr-3">
                  {{ item.icon }}
                </v-icon>
                {{ item.title }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-card>
</template>
<script>
export default {
  data () {
    return {
      menuItems: [
        {
          title: 'つぶやき',
          name: 'tweetList',
          icon: 'mdi-post-outline'
        },
        {
          title: 'イベント検索',
          name: 'eventsearch',
          icon: 'mdi-magnify'
        },
        {
          title: 'イベント予定',
          name: 'eventschedule',
          icon: 'mdi-calendar-month'
        }
      ]
    }
  },
  methods: {
    menuClick (name) {
      this.$emit(`open${name}`)
    }
  }
}
</script>