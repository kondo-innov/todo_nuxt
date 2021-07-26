export const state = () => ({
  imagedate: null,
  loading: false
})

export const getters = {
  imagedate(state) {
    return state.imagedate;
  },
  loading(state) {
    return state.loading;
  }
};

export const actions = {
  async doSearch({ commit, axios}, keyword) {
    commit("setLoading", true);
    const imagedate = await this.$axios.get("http://localhost:3000/api/v1/current_user");
    commit("setLoading", false);
    const { data } = imagedate;
    commit("setImagedate", data.url);
  }
};

export const mutations = {
  setImagedate(state, imagedate) {
    state.imagedate = imagedate;
  },
  setLoading(state, bool) {
    state.loading = bool;
  }
};
