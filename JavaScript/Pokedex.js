const campoNome = document.getElementById("campoNome");
const botaoBuscar = document.getElementById("botaoBuscar");
const resultado = document.getElementById("resultado");

botaoBuscar.addEventListener("click", buscarPokemon);

campoNome.addEventListener("keydown", function (evento) {
    if (evento.key === "Enter") {
        buscarPokemon();
    }
});

async function buscarPokemon() {
    const nome = campoNome.value.toLowerCase().trim();

    try {
        const resposta = await fetch(`https://pokeapi.co/api/v2/pokemon/${nome}`);

        if (!resposta.ok) {
            throw new Error("Pokémon não encontrado");
        }

        const dados = await resposta.json();
        const nomePokemon = dados.name;
        const imagem = dados.sprites.other["official-artwork"].front_default;

        const tipos = [];
        for (let i = 0; i < dados.types.length; i++) {
            tipos.push(dados.types[i].type.name);
        }

                let tiposHTML = "";
        for (let i = 0; i < dados.types.length; i++) {
            const tipo = dados.types[i].type.name;
            tiposHTML += `<span class="tipo ${tipo}">${tipo}</span>`;
        }

        resultado.innerHTML = `
            <h2>${nomePokemon}</h2>
            <div>${tiposHTML}</div>
            <img src="${imagem}" width="250">
        `;
    } catch (erro) {
        resultado.innerHTML = "<p>Pokémon não encontrado. Verifique o nome e tente novamente.</p>";
    }
}