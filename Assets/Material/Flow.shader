Shader "Custom/Flow(流动效果)"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _XSpeed("X轴流动速率",float) = 0
        _YSpeed("Y轴流动速率",float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
            

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _XSpeed;
            float _YSpeed;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                // o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                 /*
                _Time.x = time / 20
                _Time.y = time
                _Time.z = time * 2
                _Time.w = time * 3
                */
                float2 tempUV=i.uv;
                tempUV.x+=_Time.y * _XSpeed;
                tempUV.y+=_Time.y * _YSpeed;

                //_MainTex表示一张图片
                //uv表示uv比例,二维坐标
                fixed4 col = tex2D(_MainTex, tempUV);
                return col;
            }
            ENDCG
        }
    }
}
