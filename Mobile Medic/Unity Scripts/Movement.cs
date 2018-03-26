using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movement : MonoBehaviour
{

    public float rotSpeed = 50f;
    public float scaleDown = 0.5f;
    public float scaleUp = 2f;

    // Use this for initialization
    void Start()
    {
        transform.localScale = new Vector3(scaleDown, scaleDown, scaleDown);
    }
    // Update is called once per frame
    void Update()
    {

        if (Input.GetAxis("Horizontal") != 0)
        {
            transform.Rotate(Vector3.right * Time.deltaTime * rotSpeed * Input.GetAxis("Horizontal"));
        }
        if (Input.GetAxis("Vertical") != 0)
        {
            transform.Rotate(Vector3.up * Time.deltaTime * rotSpeed * Input.GetAxis("Vertical"));
        }
         if (Input.GetAxis("Vertical") != 0)
        {
            transform.Rotate(Vector3.up * Time.deltaTime * rotSpeed * Input.GetAxis("Vertical"));
        }
        if (Input.GetAxis("DPad-H") > 0)
        {
            transform.localScale = new Vector3(transform.localScale.x, transform.localScale.y, transform.localScale.z) * 1.01f;
        }
        if (Input.GetAxis("DPad-H") < 0)
        {
            transform.localScale = new Vector3(transform.localScale.x, transform.localScale.y, transform.localScale.z) * 0.99f;
        }
        if (Input.GetAxis("DPad-V") > 0)
        {
            transform.localScale = new Vector3(transform.localScale.x, transform.localScale.y * 1.01f, transform.localScale.z);
        }
        if (Input.GetAxis("DPad-V") < 0)
        {
            transform.localScale = new Vector3(transform.localScale.x, transform.localScale.y * 0.99f, transform.localScale.z);
        }
    }

}