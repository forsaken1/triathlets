import React, { Component } from "react"
import { Navbar, Nav } from 'react-bootstrap'
import { NavLink } from 'react-router-dom'

const Header = () => (
  <Navbar bg="light" expand="lg">
    <Navbar.Brand href="/">Triathlets</Navbar.Brand>
    <Navbar.Toggle aria-controls="basic-navbar-nav" />
    <Navbar.Collapse id="basic-navbar-nav">
      <Nav className="mr-auto">
        <NavLink to="/admin" className="nav-link">Триатлоны</NavLink>
        <NavLink to="/admin/users" className="nav-link">Спортсмены</NavLink>
      </Nav>
    </Navbar.Collapse>  
  </Navbar>
)

export default Header
