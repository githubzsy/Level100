using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Platform : MonoBehaviour
{
    private Vector3 _movement;

    private float _topLineY;

    public float Speed;

    private void Awake()
    {
        _movement.y = Speed;
        _topLineY = GameObject.Find("TopLine").transform.position.y;
    }

    void Update()
    {
        MoveUp();
    }

    void MoveUp()
    {
        transform.position += _movement * Time.deltaTime;
        if (transform.position.y >= _topLineY)
        {
            Destroy(gameObject);
        }
    }
}
