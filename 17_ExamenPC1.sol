// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Biblioteca234413 {

    struct Libro {
        uint id;
        string titulo;
        string autor;
        bool estado;
    }

    Libro[] public libros;

    address public dirContrato = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    uint256 public cantidad;

    mapping(uint => Libro) public mapaLibros;

    modifier soloAutorizado() {
        console.log("Ejecutado por: 234413 - Giancarlos Jefferson Anton Jacinto");
        _;
    }

    constructor() soloAutorizado {
    }

    function agregarElemento(uint _id, string memory _titulo, string memory _autor) public soloAutorizado {
        require(bytes(_titulo).length > 0, "El titulo no puede estar vacio");

        for (uint i = 0; i < cantidad; i++) {
            require(mapaLibros[i].id != _id, "Ya existe un libro con ese id");
        }

        Libro memory nuevoLibro = Libro(_id, _titulo, _autor, true);
        mapaLibros[cantidad] = nuevoLibro;
        cantidad++;
    }

    function contarElementos() public soloAutorizado returns (uint) {
        console.log("Total de libros:", cantidad);
        return cantidad;
    }

    function inactivarElemento(uint _id) public soloAutorizado {
        bool encontrado = false;
        for (uint i = 0; i < cantidad; i++) {
            if (mapaLibros[i].id == _id) {
                mapaLibros[i].estado = false;
                encontrado = true;
                break;
            }
        }
        require(encontrado, "No se encontro un libro con ese id");
    }

    function mostrarActivos() public soloAutorizado {
        for (uint i = 0; i < cantidad; i++) {
            if (mapaLibros[i].estado == true) {
                console.log("Libro activo", mapaLibros[i].id, mapaLibros[i].titulo);
            }
        }
    }
}
