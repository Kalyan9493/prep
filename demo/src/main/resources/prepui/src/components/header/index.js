import React from 'react'
import {Nav, NavLink, Bars, NavMenu, NavBtn, NavBtnLink} from './navbarElements'
import logo from '../../assets/logo.svg'

const Header = () => {
  return (
      <Nav>
        <NavLink to="/">
          {/* <img src={logo} height='100px' width='100px'></img> */}
        </NavLink>
        <Bars />
        <NavMenu>
          <NavLink to="/about" activeStyle>
           <h3>About</h3> 
          </NavLink>
          <NavLink to="/services" activeStyle>
            <h3>Services</h3>
          </NavLink>
          <NavLink to="/contact-us" activeStyle>
          <h3>Contact Us</h3> 
          </NavLink>
          <NavLink to="/sign-up" activeStyle>
          <h3>Sign Up</h3> 
          </NavLink>
          <NavBtnLink to="/sign-in" activeStyle>
            <h3>Sign In</h3>
          </NavBtnLink>
        </NavMenu>
      </Nav>
  )
}

export default Header
