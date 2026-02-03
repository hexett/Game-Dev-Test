#pragma once

#include <glad/glad.h>

class EBO {
  private:
    unsigned int m_EBO;

  public:
    EBO(unsigned int count, const unsigned int *data) {
        glGenBuffers(1, &m_EBO);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_EBO);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, count * sizeof(unsigned int), data, GL_STATIC_DRAW);
    }

    ~EBO() {
        glDeleteBuffers(1, &m_EBO);
    }

    void bind() const {
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_EBO);
    }

    void unbind() const {
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    }
};