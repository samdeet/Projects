using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveGraph : MonoBehaviour {//rename


    public GameObject graphOBJ;
    private GameObject obj;

	// Use this for initialization
	void Start ()
    {

        transform.position = new Vector3(0, 0, 0);
        
    }
	
	// Update is called once per frame
	void Update () {
	

        if (Input.GetKeyDown(KeyCode.Space))
        {
            graphOBJ = Resources.Load("graph") as GameObject;
            obj = Instantiate(graphOBJ, Vector3.zero, Quaternion.identity) as GameObject;
            obj.AddComponent<Movement>();

        }

        if(Input.GetKeyDown(KeyCode.C))
        {
            Destroy(obj);
        }

	}
}
