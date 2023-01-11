import React from 'react'
import './footer.css'
import LinkedInIcon from '../../assets/linkedin_icon.png'
const Footer = () => {
  return (
    <div className='footer'>
        <div className='linkedin'>
          <img src={LinkedInIcon} className='linkedin_icon'></img>
        </div>
    </div>
  )
}

export default Footer