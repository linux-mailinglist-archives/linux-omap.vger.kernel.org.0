Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B016B5E9290
	for <lists+linux-omap@lfdr.de>; Sun, 25 Sep 2022 13:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiIYLKq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Sep 2022 07:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbiIYLKZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 25 Sep 2022 07:10:25 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB59232079;
        Sun, 25 Sep 2022 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664104081;
        bh=/h1VWUI5lPgUE+GfkyBS5LZYv4yRyRPA5vc2bBXw9eI=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=VrcLIlP774YyqXHS1EPEbh03IJU2QnHV3DieFFHbOFEtdL6D3654/3G1DWBUCxz4C
         xDqKcR20Qj7ga/jO81+iL0omW/GeOxhfBDIeVadh/zyQgsd9aCqkJGLZXrkN9Y3f88
         q9ZZC7OSWoKBY9wTtAL2m+9mZ3XpjcMfy4eHTZk8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1otF1A2Mjl-00PhCx; Sun, 25
 Sep 2022 13:08:01 +0200
Message-ID: <eb6664de-75e7-bc02-4570-7d08b45098b5@gmx.de>
Date:   Sun, 25 Sep 2022 13:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next] omapfb: dss: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Content-Language: en-US
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220923133844.69659-1-zhangqilong3@huawei.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220923133844.69659-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mJNqf1H6txcAY1xRjT1ZZQM1+I0urNjlwvLeaDRwxh0gjIHcrcS
 txu7Wadte7Z58VVH/0Te9P0g6/X69k6LP/T9+g2S+eyV5g+XFZE0z30Wd7j435j5CB+3zz+
 3qsI9lj/yvwxElh8aXJ0oFpfvtd5nDGQtpr0MAZr97zjTNAOvYHAfaMgQ2C0jNCVL0F6zF0
 AOe5WgUeZRyYfi3Z3/wLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RqfUncIcaCE=:r98fbyY4XigdcxbJVww2XO
 dVSdhRjg5plVu2D3VsXSDuHRT8x9/k4iRNlxUMT2kRRLxAc3pp35f0kKDkSXiM6NjfKNk8dx5
 uP0mgAKo5XPbQXtplVtlieClLmdRKs9p3J8iiZLnVSVezGmo0OdaHQnXz60c4N7RN7hBL09Iq
 E3JRNC7CkhS1YQuDU1kJ9CJwM4A5cpRNSA2RKkIXs40jHRQcgO6jUVjfJ5JoqjyqBSk/MSPbL
 IrmJ5ZUkZoW+2uSYwryKqJQSOMTOdD89ahtxyWn7WL3hfZou8XHdfRVy9RTcpyn/yXJ318Dnk
 EmTs1VfUX8aE8s6sndNediUSI1WTpD83FhAd9QNepwYvo3VLcUwGiVVultXaivUP8xDp1L4Dk
 0P284TBZ4eTCHgKpVK4LPuzuMyBKoAjv9hnQXp3wxQ9GQJVSIy4lsej7KQ0t8Tk4hwYjZghmV
 g0CzjSWnMVKHog7WoHWQWCNFR2WVqgYOPyzULws/hQLtsQqTPiiNgX+qSAGeU7/EWtEY1dhy2
 3jaYGu1vqYAOMsCTYNjzQ9tj1lqr6U2T1ckvtn4Adnky6zyDPmWKD6gtQSJKRxu3wAj5oBOmT
 VjwNtVH7SO+tR9kZCapB+dTs7M50vzLcUBFg/MR83ioxy2mf5+Q5j0Z3rPNLjHuktRURSiRC6
 1x5NWkjDscYam9dgXbn+X0PsJ/pScmw72a3cbxsYtizhR3apSNITLDE4DP65Bzl3VWuSryDnC
 TL8FyFvbHNijqz1ctPfd7gCgP3+cLYoq5eMHlnGrpdnPObg32DB0z1VbnmVwynkzw461rSxAG
 7UeT5/IDQp55I11eTztC3ydYVP3VXyp/VcY1T4oCdnA6APkD6GosLWJNpIehVEeu5OnLjcMdh
 aOyQwd/siLItwOYdivzgmn7/IgvSDmSeJJayQzPsX3BY1o/C6fr47FbDUBdyX9iFqUtS9f1lF
 /1Ur1iu4ZDqhc6gVa6hEUj4OlwPTg9FHBe8cARtNJrAGp7Xfp3K+eeULmEWMAnrJy7EIlD2qu
 p4VJLFGBZuAMQ1B8Tk0r+D/jGllTq1N13gJKAAoLgylpEvJigzxxGxFgArXGQaN+ypCTM2jej
 b7hgsTO9Nfk/z3PcGaU1u3ELr+WmPvIZkcGEDGlDEngoOS6GXa4dsLMWfgKzCy/d7gFcZT+fd
 12pNgY2rjnFaK9At2spHcBiJ4r
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/23/22 15:38, Zhang Qilong wrote:
> Using the newest pm_runtime_resume_and_get is more appropriate
> for simplifing code here.
>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

applied.

Thanks!
Helge


> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c   | 6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/dss.c   | 6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c | 6 ++----
>   drivers/video/fbdev/omap2/omapfb/dss/venc.c  | 6 ++----
>   6 files changed, 12 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/vide=
o/fbdev/omap2/omapfb/dss/dispc.c
> index b2d6e6df2161..92fb6b7e1f68 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -519,11 +519,9 @@ int dispc_runtime_get(void)
>
>   	DSSDBG("dispc_runtime_get\n");
>
> -	r =3D pm_runtime_get_sync(&dispc.pdev->dev);
> -	if (WARN_ON(r < 0)) {
> -		pm_runtime_put_sync(&dispc.pdev->dev);
> +	r =3D pm_runtime_resume_and_get(&dispc.pdev->dev);
> +	if (WARN_ON(r < 0))
>   		return r;
> -	}
>   	return 0;
>   }
>   EXPORT_SYMBOL(dispc_runtime_get);
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dsi.c
> index d43b081d592f..54b0f034c2ed 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1136,11 +1136,9 @@ static int dsi_runtime_get(struct platform_device=
 *dsidev)
>
>   	DSSDBG("dsi_runtime_get\n");
>
> -	r =3D pm_runtime_get_sync(&dsi->pdev->dev);
> -	if (WARN_ON(r < 0)) {
> -		pm_runtime_put_sync(&dsi->pdev->dev);
> +	r =3D pm_runtime_resume_and_get(&dsi->pdev->dev);
> +	if (WARN_ON(r < 0))
>   		return r;
> -	}
>   	return 0;
>   }
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dss.c
> index 45b9d3cf3860..335e0af4eec1 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -767,11 +767,9 @@ int dss_runtime_get(void)
>
>   	DSSDBG("dss_runtime_get\n");
>
> -	r =3D pm_runtime_get_sync(&dss.pdev->dev);
> -	if (WARN_ON(r < 0)) {
> -		pm_runtime_put_sync(&dss.pdev->dev);
> +	r =3D pm_runtime_resume_and_get(&dss.pdev->dev);
> +	if (WARN_ON(r < 0))
>   		return r;
> -	}
>   	return 0;
>   }
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/vide=
o/fbdev/omap2/omapfb/dss/hdmi4.c
> index 800bd108e834..0f39612e002e 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> @@ -38,11 +38,9 @@ static int hdmi_runtime_get(void)
>
>   	DSSDBG("hdmi_runtime_get\n");
>
> -	r =3D pm_runtime_get_sync(&hdmi.pdev->dev);
> -	if (WARN_ON(r < 0)) {
> -		pm_runtime_put_sync(&hdmi.pdev->dev);
> +	r =3D pm_runtime_resume_and_get(&hdmi.pdev->dev);
> +	if (WARN_ON(r < 0))
>   		return r;
> -	}
>
>   	return 0;
>   }
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/vide=
o/fbdev/omap2/omapfb/dss/hdmi5.c
> index 2c03608addcd..bfccc2cb917a 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> @@ -42,11 +42,9 @@ static int hdmi_runtime_get(void)
>
>   	DSSDBG("hdmi_runtime_get\n");
>
> -	r =3D pm_runtime_get_sync(&hdmi.pdev->dev);
> -	if (WARN_ON(r < 0)) {
> -		pm_runtime_put_sync(&hdmi.pdev->dev);
> +	r =3D pm_runtime_resume_and_get(&hdmi.pdev->dev);
> +	if (WARN_ON(r < 0))
>   		return r;
> -	}
>
>   	return 0;
>   }
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video=
/fbdev/omap2/omapfb/dss/venc.c
> index 905d642ff9ed..78a7309d25dd 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -347,11 +347,9 @@ static int venc_runtime_get(void)
>
>   	DSSDBG("venc_runtime_get\n");
>
> -	r =3D pm_runtime_get_sync(&venc.pdev->dev);
> -	if (WARN_ON(r < 0)) {
> -		pm_runtime_put_sync(&venc.pdev->dev);
> +	r =3D pm_runtime_resume_and_get(&venc.pdev->dev);
> +	if (WARN_ON(r < 0))
>   		return r;
> -	}
>   	return 0;
>   }
>

