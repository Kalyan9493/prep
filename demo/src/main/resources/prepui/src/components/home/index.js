import React from 'react'
import './home.css'
import IconUrl from '../../assets/hero.png'

const Home = () => {
  return (
    <div className='home'>
        <div className='info'>
            <div>
                <h1>Hi There,</h1>
                <h2>I am  Kalyan Kumar Reddy</h2>
                <h2>Software Engineer</h2>
            </div>
            <div>
                <img className='icon' src={IconUrl}></img>
            </div>
        </div>
    </div>
  )
}

export default Home