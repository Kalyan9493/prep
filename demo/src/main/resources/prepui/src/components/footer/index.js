import React from 'react'
import './footer.css'
import LinkedInIcon from '../../assets/linkedin_icon.png'
import GithubIcon from '../../assets/github_icon.png'
const Footer = () => {
  const handleLinkedInClick = () => {
    window.open('https://www.linkedin.com/in/kalyankumarreddy-kavalakuntla-6554a3164/','_blank')
  }
  const handleGithubClick = () => {
    window.open('https://github.com/Kalyan9493', '_blank')
  }
  return (
    <div className='footer'>
        <div className='linkedin'>
          <img src={LinkedInIcon} onClick={handleLinkedInClick} className='linkedin_icon'></img>
          <img src={GithubIcon} onClick={handleGithubClick} className='linkedin_icon'></img>
        </div>
    </div>
  )
}

export default Footer