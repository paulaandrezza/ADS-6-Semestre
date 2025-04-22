// Helpers
const RenderCard = (content) => {
  return `
  <div class="card blue lighten-5">
    <div class="card-content">
      <p>${content}</p>
    </div>
  </div>
  `
}

const RenderPost = (post) => {
  return `
          <div class="card blue lighten-5">
            <div class="card-content">
              <h3 class="card-title">${post.title}</h3>
              <p>
                ${post.body}
              </p>
            </div>
            <div class="divider"></div>
            <div class="card-content">
              <span href="#" style="margin-right: 10px">User Id <b>${post.userId}</b></span>
              <span href="#">Post Id <b>${post.id}</b></span>
            </div>
          </div>
        `
}

const renderForm = (isCreate = true) => {
  const title = isCreate ? "Criar Post" : "Atualizar Post"
  const buttonText = isCreate ? "Criar" : "Atualizar"
  const idFieldDisabled = isCreate ? "disabled" : ""

  return `
    <div id="form-container" class="form-container">
      <h4 id="form-title" class="center-align">${title}</h4>

      <div class="row">
        <form id="post-form">
          <div class="input-field col s12">
            <input id="userId" type="number" class="validate">
            <label for="userId">User ID</label>
          </div>
          <div class="input-field col s12">
            <input id="id" type="number" class="validate" ${idFieldDisabled}>
            <label for="id">Post ID</label>
          </div>
          <div class="input-field col s12">
            <input id="title" type="text" class="validate">
            <label for="title">Título</label>
          </div>
          <div class="input-field col s12">
            <textarea id="body" class="materialize-textarea"></textarea>
            <label for="body">Corpo do Post</label>
          </div>
          <div class="input-field col s12 center-align">
            <button id="submit-button" class="waves-effect waves-light btn ${
              isCreate ? "green" : "orange"
            }">${buttonText}</button>
          </div>
        </form>
      </div>
    </div>
  `
}

// Requests
const getAllPosts = async () => {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/posts")

    if (!response.ok) {
      throw new Error(`Erro HTTP: ${response.status}`)
    }

    const posts = await response.json()

    const formContainer = document.getElementById("form-container")
    if (formContainer) formContainer.innerHTML = ""

    const container = document.getElementById("result")

    if (container) {
      container.innerHTML = ""
      posts.forEach((post) => {
        const card = RenderPost(post)
        container.innerHTML += card
      })
    }
  } catch (erro) {
    console.error("Erro ao buscar posts:", erro)
  }
}

const getPostById = async () => {
  const postId = document.getElementById("post-id").value

  if (!postId || postId <= 0) {
    alert("Por favor, insira um ID de post válido!")
    return
  }

  try {
    const response = await fetch(
      `https://jsonplaceholder.typicode.com/posts/${postId}`
    )

    if (!response.ok) {
      throw new Error(`Erro HTTP: ${response.status}`)
    }
    console.log("here")
    const post = await response.json()

    const formContainer = document.getElementById("form-container")
    if (formContainer) formContainer.innerHTML = ""

    const container = document.getElementById("result")
    if (container) container.innerHTML = RenderPost(post)
  } catch (erro) {
    console.error("Erro ao buscar posts:", erro)
  }
}

const createPost = () => {
  const container = document.getElementById("result")
  if (container) container.innerHTML = ""

  const formContainer = document.getElementById("form-container")
  if (formContainer) formContainer.innerHTML = renderForm()

  const form = document.getElementById("post-form")
  form.addEventListener("submit", async (e) => {
    e.preventDefault()

    const post = {
      userId: document.getElementById("userId").value,
      title: document.getElementById("title").value,
      body: document.getElementById("body").value,
    }

    try {
      const response = await fetch(
        "https://jsonplaceholder.typicode.com/posts",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(post),
        }
      )

      if (!response.ok) {
        throw new Error(`Erro HTTP: ${response.status}`)
      }

      const result = await response.json()

      formContainer.innerHTML = ""
      container.innerHTML = RenderPost(result)

      M.toast({
        html: `Post criado com sucesso! ID: ${result.id}`,
        classes: "green",
      })
    } catch (err) {
      console.error("Erro ao criar post:", err)
    }
  })
}

const updatePost = () => {
  const container = document.getElementById("result")
  if (container) container.innerHTML = ""

  const formContainer = document.getElementById("form-container")
  if (formContainer) formContainer.innerHTML = renderForm(false)

  const form = document.getElementById("post-form")
  form.addEventListener("submit", async (e) => {
    e.preventDefault()

    const post = {
      userId: document.getElementById("userId").value,
      id: document.getElementById("id").value,
      title: document.getElementById("title").value,
      body: document.getElementById("body").value,
    }

    try {
      const response = await fetch(
        `https://jsonplaceholder.typicode.com/posts/${post.id}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(post),
        }
      )

      if (!response.ok) {
        throw new Error(`Erro HTTP: ${response.status}`)
      }

      const result = await response.json()

      formContainer.innerHTML = ""
      container.innerHTML = RenderPost(result)

      M.toast({
        html: `Post atualizado com sucesso! ID: ${result.id}`,
        classes: "green",
      })
    } catch (err) {
      console.error("Erro ao atualizar post:", err)
    }
  })
}

const deletePost = async () => {
  const postId = document.getElementById("post-id").value

  if (!postId || postId <= 0) {
    alert("Por favor, insira um ID de post válido!")
    return
  }

  try {
    const response = await fetch(
      `https://jsonplaceholder.typicode.com/posts/${postId}`,
      {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
      }
    )

    if (!response.ok) {
      throw new Error(`Erro HTTP: ${response.status}`)
    }

    M.toast({
      html: `Post com ID ${postId} deletado com sucesso!`,
      classes: "red",
    })
  } catch (erro) {
    console.error("Erro ao buscar posts:", erro)
  }
}
