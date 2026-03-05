fetch('/search.json')
  .then(res => res.json())
  .then(pages => {

    const idx = lunr(function () {
      this.ref('url')
      this.field('title')
      this.field('content')

      pages.forEach(page => this.add(page))
    })

    const searchBox = document.getElementById("searchBox")

    searchBox.addEventListener("input", () => {

      const results = idx.search(searchBox.value)

      const list = document.getElementById("results")
      list.innerHTML = ""

      results.forEach(result => {

        const page = pages.find(p => p.url === result.ref)

        const li = document.createElement("li")
        const link = document.createElement("a")

        link.href = page.url
        link.textContent = page.title

        li.appendChild(link)
        list.appendChild(li)
      })
    })
  })