Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF3327A59E
	for <lists+linux-omap@lfdr.de>; Mon, 28 Sep 2020 05:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgI1DDX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 27 Sep 2020 23:03:23 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:35720 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgI1DDW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 27 Sep 2020 23:03:22 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200928030320epoutp03ffdd9130fc19db10ff2a2085c28e3030~403zqSGbV0948009480epoutp03v
        for <linux-omap@vger.kernel.org>; Mon, 28 Sep 2020 03:03:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200928030320epoutp03ffdd9130fc19db10ff2a2085c28e3030~403zqSGbV0948009480epoutp03v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601262201;
        bh=+0hmY3a/XbyCzc+4wFl+/LAyCci8wsV3RJjUOrQ4q/4=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=pveUFeWD5NYPyiHBBz2Py3pme813sUnJcPVe6Z2HtwwpYeTCeLTQ4REl7YJ8TwTKK
         4TFc/153Rs1zEqsZGSz5xz9R2I9YcAabLHL5pOC+9+ohr75UATQ0oSJxOy6TGGGDXl
         ui/u9n/+u1zLGArmbtHTUr9d4XUhcpcGMRBuE6jQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200928030320epcas1p45c4f4f7081368a3e8f88f9093f4c868d~403zCeryR1182011820epcas1p4e;
        Mon, 28 Sep 2020 03:03:20 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4C06lp0BBczMqYkk; Mon, 28 Sep
        2020 03:03:18 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        FE.A6.10463.572517F5; Mon, 28 Sep 2020 12:03:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200928030316epcas1p2d44f922bde351e5d52d327b3a368abd2~403vzldTs0751407514epcas1p2_;
        Mon, 28 Sep 2020 03:03:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200928030316epsmtrp101998be14eada6aa9c86ebc4bbcdddc5~403vywgsG1249412494epsmtrp1R;
        Mon, 28 Sep 2020 03:03:16 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-76-5f715275dc03
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        21.4D.08604.472517F5; Mon, 28 Sep 2020 12:03:16 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200928030316epsmtip1ce41ae93c7738b3b7e96bc2032626ea9~403vevuI92131221312epsmtip1M;
        Mon, 28 Sep 2020 03:03:16 +0000 (GMT)
Subject: Re: [PATCH 17/42] mfd: max77693: use PLATFORM_DEVID_NONE
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <4a9d8a2f-defb-9f88-9211-fcf2cf985f28@samsung.com>
Date:   Mon, 28 Sep 2020 12:16:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200921205016.20461-17-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0zTVxjd7btkHT9bHnfEOejiNjE8CpRdmbARCPsF3GQaTMAstba/AFLa
        0sLcxEwkysOBiHsgBQHlUQbIo5DyCFBWJAWZ60BljlnZJmOCUhALKoSxPjDjv5PvnHPP9303
        H4PMLqF7MJKl6YRCKpRwaU4U7eAuH5+MA2kCf5MlGOWa6+ioMLuEhNoutVDRtcIhClo1X6cj
        o7GVjqaWhwDSPJigols95TRUVlNEQcW/W4lLxn4SenjtVypSrzZTUGf7FTLSqtQ09HRBR0V/
        l7bT0Fi9hYTMjdMA9Z0dIyPd7Wj0Qm8kfeiOryxfpOAVTZm4auomDW/9q5GK1y/54d0qEx3X
        NOTT8HsTvTS8YuRTvL3mFH7veS3AS8o3AH6+owHg7aOZuOFuJwl/qtkRiyWk7E0ihGJC4UlI
        RTJxsjQxlBtzUBAh4Af783x4e9B7XE+pMJUI5Ubui/WJSpZY98D1/FwoybCWYoVKJdcvbK9C
        lpFOeCbJlOmhXEIulsj3yH2VwlRlhjTRVyRLDeH5+wfwrcIjKUlLhmPyBfoXZ1tvULNAB+0c
        YDIgFgTzW9et2InBxroAHCxco9gINrYEoEq3zUGsADj/bxHlpePMUtmmow/ARfU4cDgWAGzU
        vWvDHCwctpvVdpELpqbDus5zJBtBw7yh7uFde7Yz5gXvPH9gN7OwMJizaCDbMAXbCbvGp+3Y
        FTsER7RnNjXb4EjptL0LJhYMTV9X2N8hY+5wcrqS5MBvws75crItGGI3mHD5Jx1wtB0Juwsv
        bo7AgXOGDroDe8DZopxNnAl/GLlOc5jzAOzQ/UJ1EIFQV/uNNYFhTdgFW3r8HGUv2L12GTiC
        X4Pm5QKqTQIxFszLYTskb8Fbf5hIDvw6rM7NpzkkOGz+R3gBeKm2TKbaMo1qyzSq/3OrAKUB
        uBFyZWoioeTJg7b+tQbYL8QbdYHL84u+ekBiAD2ADDLXhfWxRC5gs8TCL08QCplAkSEhlHrA
        t+66mOzhKpJZT0yaLuDxAwIDA1EQL5jP43HdWX9OegrYWKIwnUghCDmheOkjMZgeWaTwnet9
        h0VPHmcV5zXXmip3bFyN0mZvb6p23c79rfqJ/tHKwO6TwzOY+Hif33ACEsW1sEpriiOz15ZP
        3zeFjRYe8+PHrVa8P/hOZXinmwBlT/YMWgaOfmYcKy15xjygle8vfsWdc0iT1Tbx1Xenzccj
        osvmpyyWwMMnwgPy+E7BVx7NRLRZnKPGZ5bWQ04aqnoEzdpnR10WjPF18YbvNQNv34zpqw/b
        P/fioJ4Vpfauul+xMdE4HML5KEo121ukiOufngufjU7rfaNflLq7IOaxRtCQcvXUbRqn2lmc
        ++PPLV09bNGdqtF9519tGutyi+cc8Uz8hDsy5MpM0zoX8KM/+DaBS1EmCXneZIVS+B+1SIvT
        qgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsWy7bCSnG5JUGG8wamTuhbt75axW/Q2TWey
        2DhjPavF2t6jLBa/3h1htzh/fgO7xf2vRxktNj2+xmpxedccNovZS/pZLCbeBkrMOL+PyeLF
        2uusFst/rWOx2L55IbPFtlnL2Sw+v9/PavF05mY2i4srvjBZvFv9hNFib+tFZov9V7wsfh46
        z+Qg7vHt6yQWj3lrqj1m3T/L5rHh0WpWjxWf9D12zrrL7rFpVSebx51re9g85p0M9Ni8pN7j
        zo+ljB7T5/xn9OjbsorRY/Ppao/jN7YzeXzeJBcgEMVlk5Kak1mWWqRvl8CV8el4VsF79orW
        DadYGxi3sHUxcnJICJhItHyaDWRzcQgJ7GaU2PX/ByNEQlJi2sWjzF2MHEC2sMThw8UQNW8Z
        JQ6ducoEUiMs4Cix+d1ysGYRgdXsEm0/PrOAJIQEtjBKdFwwBbHZBLQk9r+4AbaNX0BR4uqP
        x2ALeAXsJNo+HGcGsVkEVCV2XHoCZosKhEnsXPKYCaJGUOLkzCdgMzkFzCTuds8Dm8MsoC7x
        Z94lZghbXOLWk/lMELa8xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUomVpQnJueW2xYYJiX
        Wq5XnJhbXJqXrpecn7uJEZw2tDR3MG5f9UHvECMTB+MhRgkOZiURXt+cgngh3pTEyqrUovz4
        otKc1OJDjNIcLErivDcKF8YJCaQnlqRmp6YWpBbBZJk4OKUamGan9QRxOz/w73H+pnuMky9A
        ZcKOxqetHVHyM5WLVvDyHfBYcLozt/LylrVR+294magH9/IZiQRNMS7jCJkx17zDt8+tUMUs
        K39P97/G2XNNHm/o/HNXOePs51RNzWczZ4lZr+KfLGd75kOR3I3LE9J4lz+Y1eLC4qO42eTv
        OfFOT/e5XbXn2lgK118yvqHs+elDqvbEwiST2qalua3xT6dfsnr5o8/YaNHnaeV2HMbsVicN
        y6fLaexY5X/pumHMh8zP32/L/b6SctiwRLxQVttZm0st+rn36k9731ZzXuh8dCpBbb3Y6d+/
        m8ouXEq+EXjcpW2nsYzZ1OdXP+pqSjSVl5xS6/8o8CxZjy1TiaU4I9FQi7moOBEA56/FUIoD
        AAA=
X-CMS-MailID: 20200928030316epcas1p2d44f922bde351e5d52d327b3a368abd2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200921205214epcas1p4054943190340de651402db3560944385
References: <20200921205016.20461-1-krzk@kernel.org>
        <CGME20200921205214epcas1p4054943190340de651402db3560944385@epcas1p4.samsung.com>
        <20200921205016.20461-17-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/22/20 5:49 AM, Krzysztof Kozlowski wrote:
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/max77693.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index 596ed85cab3b..02fbdf0a66c3 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -274,7 +274,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
>  
>  	pm_runtime_set_active(max77693->dev);
>  
> -	ret = mfd_add_devices(max77693->dev, -1, max77693_devs,
> +	ret = mfd_add_devices(max77693->dev, PLATFORM_DEVID_NONE, max77693_devs,
>  			      ARRAY_SIZE(max77693_devs), NULL, 0, NULL);
>  	if (ret < 0)
>  		goto err_mfd;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
