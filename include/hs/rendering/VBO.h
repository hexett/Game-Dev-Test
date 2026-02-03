#pragma once

#include <glad/glad.h>

class VBO {
  private:
    unsigned int m_VBO;

  public:
    VBO(const void *data, size_t size) {
        glGenBuffers(1, &m_VBO);
        glBindBuffer(GL_ARRAY_BUFFER, m_VBO);
        glBufferData(GL_ARRAY_BUFFER, size, data, GL_STATIC_DRAW);
    }
    ~VBO() {
        glDeleteBuffers(1, &m_VBO);
    }

    void bind() const {
        glBindBuffer(GL_ARRAY_BUFFER, m_VBO);
    }
    void unbind() const {
        glBindBuffer(GL_ARRAY_BUFFER, 0);
    }
};