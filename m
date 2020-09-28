Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7B927A59A
	for <lists+linux-omap@lfdr.de>; Mon, 28 Sep 2020 05:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgI1DDA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 27 Sep 2020 23:03:00 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:35545 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgI1DDA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 27 Sep 2020 23:03:00 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200928030257epoutp03475141aec6c04eac263de23f7290723b~403dedheL0939209392epoutp03d
        for <linux-omap@vger.kernel.org>; Mon, 28 Sep 2020 03:02:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200928030257epoutp03475141aec6c04eac263de23f7290723b~403dedheL0939209392epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601262177;
        bh=KjfQfqxrWjbZa16tlxMnm9PxTiQnV7ZQFDFLyBeBEUk=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=uZuFaXVFcnQiWlKXIcXzmI1wv1u0RsV9UFsobuXIVznGBeLxS0zm4YdmGjg77EPyr
         4kS+UN8XjilvRLl0UfvxVzZgr2icdAaV1w7obN7oTM03MU5UeUA5qxjRCJ9HIDXF2t
         KtmlJYG8d69P/G9y6Lw5hz6figg+2g0Y6mmDJPIU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200928030256epcas1p22905fc893f42305df4fa6cd8a74cd019~403c85lyV1001210012epcas1p2_;
        Mon, 28 Sep 2020 03:02:56 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.157]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4C06lL0l2XzMqYkh; Mon, 28 Sep
        2020 03:02:54 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.38.09918.D52517F5; Mon, 28 Sep 2020 12:02:54 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200928030253epcas1p23153177a2718d2327f00a0fad5623e8d~403Z2Zc4i0496204962epcas1p2j;
        Mon, 28 Sep 2020 03:02:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200928030253epsmtrp195ea1947ce8b595d017a5a79f91d1504~403Z1WYU21249412494epsmtrp16;
        Mon, 28 Sep 2020 03:02:53 +0000 (GMT)
X-AuditID: b6c32a36-729ff700000026be-80-5f71525dd61a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        37.3D.08604.D52517F5; Mon, 28 Sep 2020 12:02:53 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200928030252epsmtip206a13e667cb164c763172c775d8ced4e~403ZeBbvd3127831278epsmtip2f;
        Mon, 28 Sep 2020 03:02:52 +0000 (GMT)
Subject: Re: [PATCH 15/42] mfd: max14577: use PLATFORM_DEVID_NONE
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
Message-ID: <daa7c239-fba2-c0da-ee3c-037070636390@samsung.com>
Date:   Mon, 28 Sep 2020 12:15:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200921205016.20461-15-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xbZRj2Oz09bUnQQ+nkGzGzVBcH41ZY2YEAzjCXs4sGHdGFGGtDj4D0
        Rk+Z06o0C5fBmNymQGWTAeN+EwoMtlLFAoPFMQK7yEWGQ0U2GOE2Lqta2i7y73mf533yfs/7
        5WUzuIUsd3a8QkOpFRKZAHNC23729PP58N1Esb/lCyJ9voJFnDtdgBA/FDYyifpzPSixMW9m
        EYODTSxicqUHEM0P7jCJ4c5ijPiuPBslcsesQuFgF0LM1N9lEpUbDSjR3nKJQbTpKzFi6bGJ
        SfxR1IIRQ1XLCDFfOw0IY+oQgzCNHCHWuweRA27k6koeSl6s05L6yV8wsun3WiZZtehHdugn
        WGRzTQZGjt+5hpEX+98hW8qTyfG1y4AsKP4XkF8bagDZckNL9t1rR8il5l2ReHRCaBwlkVJq
        PqWIUUrjFbFhgqPHxRFiUZC/0EcYTOwX8BUSORUmOHgs0udQvMy6BgH/pESWZKUiJTQt8AsP
        VSuTNBQ/TklrwgSUSipTBat8aYmcTlLE+sYo5SFCf/8AkbXxo4S4p5VzqMrMOjX6tA3owFks
        E7DZEN8HJ9JVmcCJzcWvAGiZvIrZi0UA11IsTHuxCuDm4iPwzFE+QNt5I4Df9hodjscAjl7P
        sjZx2K74G3D5VpdN4OGVLFjRnolsCRjuBU0z97At/ALuAW+vPbAZnPFwmGvMtPEovhuul3ah
        W3gH/h7sb0tx9LjA/qJpG8/Bg+Cg5U8bz8Dd4Oj094gdvwzb54oZW4MhPsCB2Rk65pYA8YNw
        oM/swK5wts/AsmN3+Hd2mgNrYXW/GbObzwBoMN1yGAKh6XI+spWfgXvCxk4/O+0BOzYvOB7x
        PJxfyWLaV+QMz6Rx7S2vwOH7E4gd74Rl6RmYHZNwZmoaywEe+m3R9Nvi6LfF0f8/uASgNeBF
        SkXLYylaqArY/tvNwHYiXkFXQN7cgm83QNigG0A2Q8BzfkumEnOdpZLPPqfUSrE6SUbR3UBk
        XXYuw31HjNJ6YwqNWCgKCAwMJPYJg0RCocDNeWqUL+bisRINlUBRKkr9zIewOe46JPG4BS81
        JCk4DXNjRmmhbhRT++SXaAf21+/mXfd4qJGMV5V+Gtx46Un0J7pWw56e17Gm3mzvPJF6pUuH
        Hn24aqyoyvIyvPbjXNzmkT7+qXY4kZM8f+H87H3vrybkqadrqJGzCL3zsHdWw83q83XVb46E
        eNXt1UbLA449d/X9cO82zW15JLqRvLFUEpD4Qfa1kJeWOdqFEweKWj9e5KpOeqY8GkntJ7+M
        IslduuqIG3t/fbvzcMRU35BLrtPw2D8m882Fg988OeE0mx+14fpbQaS+JX5oPTq0zJy3avEr
        l6fW5qS82uHyE9qa1ps5vZm3J/UvKW82oXqgTH4XePCiEnlcAUrHSYReDDUt+Q+fG3Y5qwQA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7bCSvG5sUGG8QcMfNov2d8vYLXqbpjNZ
        bJyxntVibe9RFotf746wW5w/v4Hd4v7Xo4wWmx5fY7W4vGsOm8XsJf0sFhNvAyVmnN/HZPFi
        7XVWi+W/1rFYbN+8kNli26zlbBaf3+9ntXg6czObxcUVX5gs3q1+wmixt/Uis8X+K14WPw+d
        Z3IQ9/j2dRKLx7w11R6z7p9l89jwaDWrx4pP+h47Z91l99i0qpPN4861PWwe804GemxeUu9x
        58dSRo/pc/4zevRtWcXosfl0tcfxG9uZPD5vkgsQiOKySUnNySxLLdK3S+DK+LP8LUvBEfaK
        W3+2MTYwdrN1MXJwSAiYSCw5VdzFyMUhJLCbUWL/qo0sXYycQHFJiWkXjzJD1AhLHD4MVfOW
        UeJByz1GkBphAUeJLxf2sYEkRARWs0u0/fjMAlG1hVHiW/N/NpAqNgEtif0vboDZ/AKKEld/
        PAbr5hWwk5i4twssziKgKvFz0T6wzaICYRI7lzxmgqgRlDg58wlYnFPATOL832dgvcwC6hJ/
        5l1ihrDFJW49mc8EYctLbH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYySqQXFuem5xYYFhnmp
        5XrFibnFpXnpesn5uZsYwYlDS3MH4/ZVH/QOMTJxMB5ilOBgVhLh9c0piBfiTUmsrEotyo8v
        Ks1JLT7EKM3BoiTOe6NwYZyQQHpiSWp2ampBahFMlomDU6qBqTpAe82mxeFXuWv3zHfrK5jp
        HX9om/zycxXzTt575FPdOsl/iWPJrnsvHP26rygGSulz3//Xe2P7nzffU5IO1RizOU9Rdbxj
        1+SY0rbc53fcFDF+Z1PXJdVmtX/Lcn59f9uqyV8/x0vNVH/SRNb9k3r0Wtc+vLFAo6GlZabg
        Zc2XDMWaD5d+PaX/4qJ1ztrYrICKk3M/LWq0Xd2Z2z093YHD+tC8/xG7Xrtfnjlt82T2qQ3s
        C8I+MR3ZnWQdsSVQ6Mnzw+Fs35+dFs77cDej1tgm9FK9bquk6lzbNTsdYlXKnPRWzl42c6nj
        GUlbi10PvY2DMvVqA7hNFqxkvW7UP6H25moB02JzlpnCMwsdlFiKMxINtZiLihMB3CBNkIsD
        AAA=
X-CMS-MailID: 20200928030253epcas1p23153177a2718d2327f00a0fad5623e8d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200921205201epcas1p44578cd3f5e7859a88834e7ac6f9631d3
References: <20200921205016.20461-1-krzk@kernel.org>
        <CGME20200921205201epcas1p44578cd3f5e7859a88834e7ac6f9631d3@epcas1p4.samsung.com>
        <20200921205016.20461-15-krzk@kernel.org>
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
>  drivers/mfd/max14577.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index be185e9d5f16..93df79748a45 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -445,7 +445,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c,
>  			goto err_max77836;
>  	}
>  
> -	ret = mfd_add_devices(max14577->dev, -1, mfd_devs,
> +	ret = mfd_add_devices(max14577->dev, PLATFORM_DEVID_NONE, mfd_devs,
>  			mfd_devs_size, NULL, 0, NULL);
>  	if (ret < 0)
>  		goto err_mfd;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
