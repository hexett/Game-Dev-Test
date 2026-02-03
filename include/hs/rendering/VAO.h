#pragma once

#include <glad/glad.h>

class VAO {
  private:
    unsigned int m_VAO;

  public:
    VAO() {
        glGenVertexArrays(1, &m_VAO);
        glBindVertexArray(m_VAO);
    }

    ~VAO() {
        glDeleteVertexArrays(1, &m_VAO);
    }

    void bind() {
        glBindVertexArray(m_VAO);
    }

    void unbind() {
        glBindVertexArray(0);
    }

    void addAttrib(
        unsigned int index,
        int size,
        GLenum type,
        GLboolean normalized,
        size_t stride,
        const void *offset) {

        glVertexAttribPointer(index, size, type, normalized, stride, offset);
        glEnableVertexAttribArray(0);
    }
};