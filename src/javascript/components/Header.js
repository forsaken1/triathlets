import React, { Component } from "react"
import { Navbar, Nav } from 'react-bootstrap'
import { NavLink } from 'react-router-dom'

const Header = () => (
  <Navbar bg="light" expand="lg">
    <Navbar.Brand href="/">Triathlets</Navbar.Brand>
    <Navbar.Toggle aria-controls="basic-navbar-nav" />
    <Navbar.Collapse id="basic-navbar-nav">
      <Nav className="mr-auto">
        <NavLink exact to="/admin" className="nav-link">Триатлоны</NavLink>
        <NavLink to="/admin/users" className="nav-link">Спортсмены</NavLink>
        <NavLink to="/admin/teams" className="nav-link">Команды</NavLink>
        <NavLink to="/admin/cities" className="nav-link">Города</NavLink>
      </Nav>
    </Navbar.Collapse>  
  </Navbar>
)

export default Header
