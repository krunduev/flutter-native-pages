package eu.curiousit.flutter_page_curl

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class SecondActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)

        var button = findViewById<Button>(R.id.button)

        button.setOnClickListener {
//            super.onBackPressed()

            finish()

        }



    }
}
