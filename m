Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5896161F82
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 04:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgBRDUd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 22:20:33 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:14711 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgBRDUd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 22:20:33 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200218032029epoutp0407d4ea6ed3c306d6e914c2c30e4237ba~0YQHgmihg1813118131epoutp04L
        for <linux-omap@vger.kernel.org>; Tue, 18 Feb 2020 03:20:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200218032029epoutp0407d4ea6ed3c306d6e914c2c30e4237ba~0YQHgmihg1813118131epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1581996029;
        bh=StMZNHKXbBJ69Oh8z+WNA9q5sXxgPWX09GGF+xje3tw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=AonWIDoUofWw2IR1QozA+wdIHDAk5FkKFELFO2DX2xJiqr593yLjeRl4UHiaONYyD
         742dznehJ016rmA59GbG76AWUG6ggV8W2dHMpsPAwikGSe8kPibKjsJ/i0d+Wtpvbl
         H0Q7XzUErylOYMHtaXYffvMPqcesMlXMZNi4jwq4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200218032029epcas1p4ddada4e22f314b802c39120acf648584~0YQHDhCgi0030300303epcas1p4y;
        Tue, 18 Feb 2020 03:20:29 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.158]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 48M5hV68K0zMqYlt; Tue, 18 Feb
        2020 03:20:26 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        B3.19.51241.3F75B4E5; Tue, 18 Feb 2020 12:20:19 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200218032018epcas1p176974bd788f674e27e774eb67387a417~0YP9M60PT1144111441epcas1p1i;
        Tue, 18 Feb 2020 03:20:18 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200218032018epsmtrp20e4bfdb21e0dc749b63d95ae61e1887d~0YP9MPOKm3142831428epsmtrp2E;
        Tue, 18 Feb 2020 03:20:18 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-f7-5e4b57f345cc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.3B.06569.2F75B4E5; Tue, 18 Feb 2020 12:20:18 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200218032018epsmtip2148ba399e6caf0a15ec2fff29035d76d~0YP9Aje7i0560105601epsmtip2O;
        Tue, 18 Feb 2020 03:20:18 +0000 (GMT)
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <b2655a58-6541-a2c9-c44d-536e5cef1ee3@samsung.com>
Date:   Tue, 18 Feb 2020 12:28:25 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURTN67TDgFQfReRKouIQohBZhlIcjCUYjaniR4NRRBNwpJOW0M1O
        QRY/QIkU3ECiiVWiEY2CBGPFio2KwQ1wwSUS3DX4oUYkCFXcEtsORv7OPffc5bx3KULRREZR
        hWY7bzNzRpoMkbpvxCUljOVk5SVfd4WzE26vhH3s3c5e/P2YZJ94jpLskZP7peyLqjNkJqlp
        G+kjNNUHPEGa8eqdhGZfRyvSjLnmamUbi5YaeE7H26J5c4FFV2jWq+mstfnL81VpyUwCk84u
        pqPNnIlX0yvWaBNWFhp9C9DRJZyx2EdpOUGgkzKW2izFdj7aYBHsapq36ozWdGuiwJmEYrM+
        scBiWsIkJ6eofMLNRYbBoVaZ9WNoad+z7qBK5AmpQ8EU4FRwt5+W1aEQSoE7EbQ0jhFi8BVB
        w/CJycw3BH92u9G/EkfL+UnVVQRXXg9OBiMI3Bd3SPyqcLwJJg488lVQ1EycC7fGU/w0gUvA
        O+Ai/JjE8dD1YZD04xl4PjydGArI5TgDPrUv9tNSHAtNjxxSP47A66HXXR3YQY7DoPfw+wAf
        jDdA1XA/IbaPhOfvj0lEPA8uDR8NrAZ4iITals5Af8Ar4OVxreglHD7d6QgScRSMfblKirgC
        WnpvkmKtA0FH10OZmFBC16lGib8PgePgnCdJpOfD5V9NSJw7Hb5498jEUXJw7FKIkhh48vaV
        RMSzobmmlqxHtHOKG+cUB84pDpz/hx1H0lY0i7cKJj0vMFbV1L92ocBpxqd3otsP1nQjTCE6
        VK7dtzpPIeNKhDJTNwKKoGfKsyJ9lFzHlZXzNku+rdjIC91I5XvsBiIqosDiO3SzPZ9RpSiV
        SjaVSVMxDB0pf5cbl6fAes7OF/G8lbf9q5NQwVGViE07nDGabbi9rf/ngl/KramDZ7aUP5/1
        +VpPRJNia/MAaj7ryBv3DGQs8fSn3h1dvTc3SbLM0zin+kLYHs+hvTm7NKP1d6mF92LqdzMR
        Xkdt9kDbKleMHv3I7FGPfuypqIj9nt5Qo1M39M87aOYnaqZ1jZR+cBa+ub/RtS77euzBRbRU
        MHBMPGETuL+QzzdZsAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXvdTuHecwdsnqhY/tn1lsrj0tcZi
        659LbBaXd81hs5i9pJ/F4nbjCjYHNo81708xe7RM2sXu8aWlmdmjb8sqRo/Pm+QCWKO4bFJS
        czLLUov07RK4Mm48XsVa8JKn4tTNQ+wNjLu4uhg5OSQETCQ6Vm5k7mLk4hAS2M0ocXneWnaI
        hKTEtItHgRIcQLawxOHDxRA1bxkltu06C1YjLBAt8WPSRUYQW0QgUuLSwpdgcWaBMolzHecZ
        IRpWM0rsXbqcCSTBJqAlsf/FDTYQm19AUeLqj8eMIAt4BewkXq0zBwmzCKhKzL3YwQJiiwqE
        Sexc8hislVdAUOLkzCdgcU6BCInGt+eZIXapS/yZdwnKFpe49WQ+E4QtL7H97RzmCYzCs5C0
        z0LSMgtJyywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgRHkJbWDsYTJ+IP
        MQpwMCrx8K6Y4BUnxJpYVlyZe4hRgoNZSYTXWxwoxJuSWFmVWpQfX1Sak1p8iFGag0VJnFc+
        /1ikkEB6YklqdmpqQWoRTJaJg1OqgTF0/7ml4urd15g4bW7pphlxx5x18OpJtvR2MttTHFf7
        v2PSt/jHvfYx/m4bX2e9n2ydVMD8XiVSfZLjmakqExXSqpsW+/Td5+lzqeuYYB02dcvN1dbe
        W5fPlYwXfGX8ccaHL5mrDd9fs5198CBfgKrpev654Qc2MPR3Z2lcPX5J4fl+K7XVD5RYijMS
        DbWYi4oTAXqy/WGcAgAA
X-CMS-MailID: 20200218032018epcas1p176974bd788f674e27e774eb67387a417
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200217133832epcas1p329af393e88fa76189ca141d2534f9ad2
References: <CGME20200217133832epcas1p329af393e88fa76189ca141d2534f9ad2@epcas1p3.samsung.com>
        <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/17/20 10:38 PM, H. Nikolaus Schaller wrote:
> If the gpios are probed after this driver (e.g. if they
> come from an i2c expander) there is no need to print an
> error message.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/extcon/extcon-palmas.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> index edc5016f46f1..cea58d0cb457 100644
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
>  
>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>  							GPIOD_IN);
> -	if (IS_ERR(palmas_usb->id_gpiod)) {
> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
>  		dev_err(&pdev->dev, "failed to get id gpio\n");
>  		return PTR_ERR(palmas_usb->id_gpiod);
>  	}
>  
>  	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
>  							GPIOD_IN);
> -	if (IS_ERR(palmas_usb->vbus_gpiod)) {
> +	if (PTR_ERR(palmas_usb->vbus_gpiod) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
>  		dev_err(&pdev->dev, "failed to get vbus gpio\n");
>  		return PTR_ERR(palmas_usb->vbus_gpiod);
>  	}
> 

I think that it is enough to handle the -EPROBE_DEFER.
Also, I prefer to use single if/else statement 
instead of the nested if/else statement.

Applied it.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
