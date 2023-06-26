import { FC } from "react";
import styles from './Button.module.css'

const Button:FC = () => {
  return (
    <div>
      <button style={{background : "linear-gradient(90deg, rgba(193,233,207,1) 20%, rgba(215,225,200,1) 50%, rgba(247,218,193,1) 80%)"}} className={styles.button}>App</button>
    </div>
  )
}

export default Button
