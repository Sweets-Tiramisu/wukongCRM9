<template>
  <create-view :body-style="{height: '100%'}">
    <div class="details-box">
      <div slot="header"
           class="header">
        <span class="text">公告详情</span>
        <span class="el-icon-close rt"
              @click="close"></span>
      </div>
      <div class="content">
        <div class="title">{{titleList.title}}</div>
        <div class="time">{{titleList.createTime}}</div>
        <div class="text">{{titleList.content}}</div>
      </div>
      <div class="btn-box"
           v-if="btnShow">
        <el-button type="primary"
                   v-if="titleList.isUpdate == 1"
                   @click="onEdit">编辑</el-button>
        <el-button type="danger"
                   v-if="titleList.isDelete == 1"
                   @click="deleteFun">删除</el-button>
      </div>
    </div>
    <v-edit :formData="formData"
            v-if="showEdit"
            :loading="loading"
            @editSubmit="editSubmit"
            @editClose="editClose">
    </v-edit>
  </create-view>
</template>

<script>
import CreateView from '@/components/CreateView'
import VEdit from './edit'
// API
import { noticeDelete, noticeAdd } from '@/api/oamanagement/notice'
export default {
  components: {
    CreateView,
    VEdit
  },
  data() {
    return {
      showEdit: false,
      formData: {},
      loading: false
    }
  },
  props: {
    titleList: Object,
    btnShow: {
      type: Boolean,
      default: true
    }
  },
  methods: {
    onEdit() {
      this.formData = Object.assign({}, this.titleList)
      this.showEdit = true
    },
    close() {
      this.$emit('close')
    },
    deleteFun() {
      this.$confirm('确定删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          noticeDelete({
            id: this.titleList.announcementId
          }).then(res => {
            this.$emit('deleteFun')
            this.$message({
              type: 'success',
              message: '删除成功!'
            })
          })
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
    },
    // 编辑 -- 取消
    editClose() {
      this.showEdit = false
    },
    // 编辑 -- 确定
    editSubmit() {
      this.loading = true
      noticeAdd({
        announcementId: this.formData.announcementId,
        title: this.formData.title,
        content: this.formData.content,
        startTime: this.formData.startTime,
        endTime: this.formData.endTime
      })
        .then(res => {
          this.$emit('editSubmit', this.formData)
          this.editClose()
          this.$message.success('公告编辑成功')
          this.loading = false
        })
        .catch(err => {
          this.loading = false
          this.$message.error('公告编辑失败')
        })
    }
  }
}
</script>

<style scoped lang="scss">
$size16: 16px;
.details-box {
  display: flex;
  flex-direction: column;
  height: 100%;
  .header {
    .text {
      font-size: $size16;
    }
    .el-icon-close {
      font-size: 20px;
      color: #ccc;
      margin-right: 0;
      cursor: pointer;
    }
  }
  .content {
    margin-top: 10px;
    flex: 1;
    overflow: auto;
    .title {
      font-size: $size16;
      text-align: center;
    }
    .time {
      color: #999;
      text-align: center;
      font-size: 12px;
      margin-top: 8px;
    }
    .text {
      margin-top: 20px;
      line-height: 24px;
      color: #333;
      padding: 0 20px;
      white-space: pre-wrap;
      word-wrap: break-word;
    }
  }
  .btn-box {
    text-align: right;
    padding-right: 20px;
  }
}
</style>