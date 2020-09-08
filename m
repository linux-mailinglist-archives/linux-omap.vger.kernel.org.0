Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AF02610EC
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 13:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgIHLjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 07:39:51 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43108 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbgIHLiX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Sep 2020 07:38:23 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200908113655euoutp02032458bd2defe632252681b45363d8d7~yy_gjdV_d3145731457euoutp02k
        for <linux-omap@vger.kernel.org>; Tue,  8 Sep 2020 11:36:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200908113655euoutp02032458bd2defe632252681b45363d8d7~yy_gjdV_d3145731457euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599565015;
        bh=xBskEF8d1EaE+h1II+yeE2r2YHnzRhz5IYvNlirWK/U=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=szkwM5rwjV8Az6BO4K0lGFrRTFrg4iERQPhY1puk8WsG8VI0BVx7fAxmAAkvs6qD6
         pkSMuoyiWjww4HY2/lOz3khPUaS6F7dYZuwHkRinddEkLh4rB1ShdBbLhQOZ2g3Sco
         QR9wZzGgJmS/+jbdxWWtj4iJSPpK88GzFtnHx6XA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200908113655eucas1p1750d3149c36df0fe07f7e36a321306bc~yy_gF2e020115401154eucas1p1E;
        Tue,  8 Sep 2020 11:36:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 00.45.05997.7DC675F5; Tue,  8
        Sep 2020 12:36:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200908113654eucas1p1540e6015986866bc75c7f51ea4815490~yy_f13_Yx2000020000eucas1p1F;
        Tue,  8 Sep 2020 11:36:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200908113654eusmtrp18a1cf0970b5a56dbd144ab60be8a1ee9~yy_f1QlUZ2002820028eusmtrp1v;
        Tue,  8 Sep 2020 11:36:54 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-6a-5f576cd7a1f9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 11.C1.06314.6DC675F5; Tue,  8
        Sep 2020 12:36:54 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200908113654eusmtip21b1d13c6e0d4bbbfbc9e05aa7cee36d4~yy_ffppHa1101211012eusmtip2x;
        Tue,  8 Sep 2020 11:36:54 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] omapfb: fix spelling mistake "propert" -> "property"
To:     Colin King <colin.king@canonical.com>
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <ce1d7ff3-fd1e-e6d8-706b-665db8411675@samsung.com>
Date:   Tue, 8 Sep 2020 13:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200805102805.15353-1-colin.king@canonical.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87rXc8LjDSbdYbL4vbqXzeLK1/ds
        FltvSVuc6PvAanF51xw2i9lL+lkc2DxmNfSyedzvPs7k8XmTXABzFJdNSmpOZllqkb5dAlfG
        3zNP2QqWc1TMOLievYHxPVsXIyeHhICJxNTZi1i6GLk4hARWMEq8Wf6JEcL5wijROOkHM4Tz
        mVFi/pVtTDAtq/58YoVILGeUWHCnB6rlLaPEnNmfWUGq2ASsJCa2r2IEsYUFPCW6/l0EWsjB
        ISKgKXH+XBFIPbPAfEaJPZsXgh3CK2An8WL6fjCbRUBF4vTzmcwgtqhAhMSnB4dZIWoEJU7O
        fMICYnMC1U9p3AB2EbOAuMStJ/OhbHmJ7W/nMENcuohdYt9LqKtdJF4uWQ71tLDEq+Nb2CFs
        GYnTk3vAASAhsI5R4m/HC2YIZzujxPLJ/6A6rCXunPsF9gEz0Afrd+lDhB0l7pxYzgISlhDg
        k7jxVhDiBj6JSdumM0OEeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkHw2C8k3s5B8Mwth7wJG
        llWM4qmlxbnpqcVGeanlesWJucWleel6yfm5mxiBSeb0v+NfdjDu+pN0iFGAg1GJh/eDV1i8
        EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5Ykpqd
        mlqQWgSTZeLglGpg1Jh2/pvfnhzJ2eV90tqCX0KjOmM/RQYvEPMofNT9avlKfp6SyIT94hUd
        GS+OW0y+zq1ybymPyKuY/+u0WP/7ms1YZ7QoYDGbQL+M+EfuyihTQ9vnpto2d25pr908rWW3
        R7r7EbXiqytV7G6lSh1KKkifWGy19P+G+LY4xamin7njddqPrm5XYinOSDTUYi4qTgQAUOjl
        XS4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xe7rXcsLjDa7v1rH4vbqXzeLK1/ds
        FltvSVuc6PvAanF51xw2i9lL+lkc2DxmNfSyedzvPs7k8XmTXABzlJ5NUX5pSapCRn5xia1S
        tKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G3zNP2QqWc1TMOLievYHxPVsX
        IyeHhICJxKo/n1i7GLk4hASWMkq0dm5n6mLkAErISBxfXwZRIyzx51oXWL2QwGtGib2TmEFs
        NgEriYntqxhBbGEBT4mufxfZQFpFBDQlzp8rAhnJLDCfUeLNy7VMEPMnMkrs/HkUrJlXwE7i
        xfT9YENZBFQkTj+fCRYXFYiQOLxjFiNEjaDEyZlPWEBsTqD6KY0bmEBsZgF1iT/zLjFD2OIS
        t57Mh4rLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5
        mxiBMbXt2M/NOxgvbQw+xCjAwajEw/vBKyxeiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF
        +fFFpTmpxYcYTYGem8gsJZqcD4z3vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakF
        qUUwfUwcnFINjKoPE49cmSLze4Kv0rmHq0Inz5pZJlgfyVGsrSWYkJA78a341sMmjHtdQ3ax
        yKdMytnF0BW9ey7T2msJ96UrH/7ddVqgY9WqzLz2i59UX2o7hq+sbcyb+Ld4b4zRioKTAdH5
        /2ZnTjlcuvDw3Potb75v5He/vM4z4HNhZcK7CKv0Od8vSykoRyqxFGckGmoxFxUnAgCrzWhr
        vwIAAA==
X-CMS-MailID: 20200908113654eucas1p1540e6015986866bc75c7f51ea4815490
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200805102810eucas1p27af2db275089d0e815f59da56cf204a6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200805102810eucas1p27af2db275089d0e815f59da56cf204a6
References: <CGME20200805102810eucas1p27af2db275089d0e815f59da56cf204a6@eucas1p2.samsung.com>
        <20200805102805.15353-1-colin.king@canonical.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 8/5/20 12:28 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> index 0b0ad20afd63..f560fa4d7786 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -787,7 +787,7 @@ static int venc_probe_of(struct platform_device *pdev)
>  		venc.type = OMAP_DSS_VENC_TYPE_SVIDEO;
>  		break;
>  	default:
> -		dev_err(&pdev->dev, "bad channel propert '%d'\n", channels);
> +		dev_err(&pdev->dev, "bad channel property '%d'\n", channels);
>  		r = -EINVAL;
>  		goto err;
>  	}
> 
