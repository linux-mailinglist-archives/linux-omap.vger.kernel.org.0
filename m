Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352AF27A59C
	for <lists+linux-omap@lfdr.de>; Mon, 28 Sep 2020 05:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgI1DDQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 27 Sep 2020 23:03:16 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:26939 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgI1DDP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 27 Sep 2020 23:03:15 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200928030313epoutp025ed43405415e71b3903a3ca9e02fff4c~403shoBT20971809718epoutp02i
        for <linux-omap@vger.kernel.org>; Mon, 28 Sep 2020 03:03:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200928030313epoutp025ed43405415e71b3903a3ca9e02fff4c~403shoBT20971809718epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601262193;
        bh=iXv1uU3u1/DUfBbWju+xtjBa5WWiwFzs1IT/1We0Opo=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=tXYTmsttCWlgi1nhf/Usw+g6DjPNZ67G0Woj5YqA/WlRkAGfVgcT9THD700H2umDR
         1QzNo8k5IRhcbn+AZzzquQ22lx4BiWVHYgnxhFXpTpqXO+zGDn41gS9iWVXTf58hqw
         NaXDH+Bvd/2Q9TBR1op3RsGYWuF6QeLldRIW4v3o=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200928030312epcas1p153fa80ff5dad26e3a88b0891d2c023ca~403r4DNeI0946609466epcas1p13;
        Mon, 28 Sep 2020 03:03:12 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.153]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4C06lf1wNMzMqYlp; Mon, 28 Sep
        2020 03:03:10 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        17.A6.10463.E62517F5; Mon, 28 Sep 2020 12:03:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200928030309epcas1p191e0175570c88058b3bc120e327b0354~403ossUA82461924619epcas1p1B;
        Mon, 28 Sep 2020 03:03:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200928030309epsmtrp17ca7cb27406644153356cad86659e772~403oqvvgT1249412494epsmtrp1L;
        Mon, 28 Sep 2020 03:03:09 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-5f-5f71526e94b0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.20.08745.C62517F5; Mon, 28 Sep 2020 12:03:09 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200928030308epsmtip16e50c36fa1578d9c08a26ca379e62c8c~403oQ3urE2700827008epsmtip1h;
        Mon, 28 Sep 2020 03:03:08 +0000 (GMT)
Subject: Re: [PATCH 16/42] mfd: max77686: use PLATFORM_DEVID_NONE
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
Message-ID: <0ba9ee10-b30a-0e6a-beac-0c5614e27a87@samsung.com>
Date:   Mon, 28 Sep 2020 12:16:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200921205016.20461-16-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0yTVxzd7Rtc52cVuLIHUGcWSQq0ULwwID6I+9wjom5mY2SloZ/A+rQF
        FHEDlJcFRTY3sCuwhUcdyMBCeFRnN4SxynjJitCBOB5BWCxGxDFHZH2Z8d+595yTc8/v5scg
        szR0b0ayLIVQyoQSNs2d0npzB4cjO3RMEFReuAHlW2vp6NzpUhK6WtZIRQ3nuinoqbWLjgYG
        muhocrkbIP30CBUNG7Q09E11MQWV/GEjygZukND9hjtUpHv6AwW1NX9HRq0aHQ0tLRqpaPZS
        Mw0NXX5MQtb6GYB+zB0iI+Pvb6N/OgdIu7zwJ8tfUPCKKxm4ZrKPhjdN1VPxy48C8Q7NBB3X
        152l4eMj12l4hekg3lydiY+v1AC8VLsG8PMtdQBv7s3Ae0bbSPiS/rUYLFYckUQIRYTSl5Al
        yEXJssRI9juHBXsF/NAgLocbhnayfWVCKRHJjn43hrMvWWKbA9s3TShJtV3FCFUqdmBUhFKe
        mkL4JslVKZFsQiGSKMIUASqhVJUqSwxIkEvDuUFBPL5NGC9OWhjrpypqGScKsnrJWWCQpgZu
        DIiFwF+flZHVwJ3BwtoBNPecptsJFvYIwNYKnpNYAnDxtzzSc0f5bA7dSRgAvGpaojgPiwBa
        Bkcd9s3Ybth/9wmwE1swHR3WtqkddhrmD433Rx3hGzE/aF6ZBnbMxKJghaGeascUbDucXOh3
        6D2wI9DUmuPSbIKmSzMUO3bDQuFa34AjjIx5QctMJcmJfWDbA62jEMRuu0FNo87VNBreWnlI
        deLNcKGnhe7E3nC+OM+FM+D3pi6a01wAYItx0GUIhsaaL20JDFvCDthoCHRe+8GOf8uBM/gl
        aF0uotolEGPCgjyWU7INDt+bcI1uK6zKP+t6Dg6ni1pIF4CfZl01zbo6mnV1NP8HfwsodcCT
        UKikiYSKqwhZ/9164FgSf9QOyh88DOgEJAboBJBBZm9hvidRCFhMkTD9JKGUC5SpEkLVCfi2
        YZeQvT0S5LYtk6UIuHxecHAwCuGG8rlcthfzT4uvgIUlClMIMUEoCOVzH4nh5p1FCjx8dP+e
        kZIDe0XLcrX2ViE7/szUSZ8PxWZRxZFr2uzC65sMOYeWi9Si3S+/7/bVW5252bHxcRH5fzXJ
        PtM95nEkllkLTx973LPR87ZFNBG9YTBOkF4Vxe2WHjM/+9x88ZWxCz47rclhIec5f9ct1aov
        etw7lX3n6ythB6zDG9/sHuJRcw3GPQWSuZ9jdx3lh/cpZZGZ5LG1ouI3qix3TezShE/oN+ZX
        3SvdOz4IqSxdHde/uPrpKTBJtH+0vSdt4bjIPH1zqyEq/US4l1QXVLcvOvsFYet+FCju/biL
        1cCaO/PTfFrs3mlV9etD5IM1WpPn3NRYhld5aOYvRa/GMbeJhdfYFFWSkOtPVqqE/wFVzMYx
        rQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsWy7bCSnG5uUGG8wdN+Rov2d8vYLXqbpjNZ
        bJyxntVibe9RFotf746wW5w/v4Hd4v7Xo4wWmx5fY7W4vGsOm8XsJf0sFhNvAyVmnN/HZPFi
        7XVWi+W/1rFYbN+8kNli26zlbBaf3+9ntXg6czObxcUVX5gs3q1+wmixt/Uis8X+K14WPw+d
        Z3IQ9/j2dRKLx7w11R6z7p9l89jwaDWrx4pP+h47Z91l99i0qpPN4861PWwe804GemxeUu9x
        58dSRo/pc/4zevRtWcXosfl0tcfxG9uZPD5vkgsQiOKySUnNySxLLdK3S+DKeHXzHGvBMo6K
        jobTzA2MF9i6GDk5JARMJOY+bWHvYuTiEBLYwSix/fcCdoiEpMS0i0eZuxg5gGxhicOHiyFq
        3jJKfD72FqxGWMBR4ty9b4wgCRGB1ewSbT8+s0BUbWGUWPPwB1gVm4CWxP4XN8DW8QsoSlz9
        8ZgRxOYVsJOYt2s1K4jNIqAqcf/VOSYQW1QgTGLnksdMEDWCEidnPmEBsTkFzCT+nz0PNpNZ
        QF3iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRMrWgODc9t9iw
        wCgvtVyvODG3uDQvXS85P3cTIzh1aGntYNyz6oPeIUYmDsZDjBIczEoivL45BfFCvCmJlVWp
        RfnxRaU5qcWHGKU5WJTEeb/OWhgnJJCeWJKanZpakFoEk2Xi4JRqYKrKYF7oZPtN8ttMh5qE
        uW7nvB4eZv3UlyW3adHLh0LKU/p0vmusjU7Vt9id5VGauLsstO2bZDfPOu6N1q2N+lomQWpb
        V3/vd6+q51DnWx72+ZbWo4k6goc7D+q+vuS+7sjLwxftF54TEK2rWBpwPD52+43bwdkdd5e9
        m5iZmZOmt2Hazu5vElW1MXKMKRy3RGYIZz/Yn+c8T52b/6NR55vLyW+C1y2duO9Yvl7Bq23F
        nNnd2Tc2m2s8vi7/I/hY1sbT0x6/L7vnO2tnQ+BEqfhJgtOO3Vr3LUiZU//L8a//PoUJX2C2
        jw0I2t9WVDFpRhPfbr6kkn/FDTKbdx1Mnlkk5xduODtkZtL8SycVbiuxFGckGmoxFxUnAgCi
        2IBFjAMAAA==
X-CMS-MailID: 20200928030309epcas1p191e0175570c88058b3bc120e327b0354
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200921205213epcas1p197f76195dd72fdbcc0fd32454418842f
References: <20200921205016.20461-1-krzk@kernel.org>
        <CGME20200921205213epcas1p197f76195dd72fdbcc0fd32454418842f@epcas1p1.samsung.com>
        <20200921205016.20461-16-krzk@kernel.org>
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
>  drivers/mfd/max77686.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index 71faf503844b..1f26d00fdd37 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -217,8 +217,8 @@ static int max77686_i2c_probe(struct i2c_client *i2c)
>  		return ret;
>  	}
>  
> -	ret = devm_mfd_add_devices(max77686->dev, -1, cells, n_devs, NULL,
> -				   0, NULL);
> +	ret = devm_mfd_add_devices(max77686->dev, PLATFORM_DEVID_NONE, cells,
> +				   n_devs, NULL, 0, NULL);
>  	if (ret < 0) {
>  		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
>  		return ret;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
