Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA323651CF
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 07:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhDTF0E (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 01:26:04 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20327 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhDTF0D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 01:26:03 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210420052530euoutp0109ee3906fa8f459055a61e959bf6618e~3eaKxr0w_1026610266euoutp01o
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 05:25:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210420052530euoutp0109ee3906fa8f459055a61e959bf6618e~3eaKxr0w_1026610266euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1618896330;
        bh=UfpEbtndIqnK+BTtgcqFamqwVazXAKYd9pZ8/utwLmM=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=BFhHDzqaMEBJPsx3xTcHeVBkH3uRuLBaEZLu9OUwA640YJPD0+VomnBvAU2vwx4XL
         ZFK7RLs2Lk30QHXZ0aMM4Ym7Zut5V4nz/cPz0SSmou500QIdEEtfLeab60X30HY+JR
         3yqHSkHki6KuZYtNcQLVwxpNDmaMftssqtIG5KJY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210420052529eucas1p24b9a0ad7cd84b9873fd8d4e40be11fa5~3eaKAyLOQ2232422324eucas1p2l;
        Tue, 20 Apr 2021 05:25:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E4.82.09439.9C56E706; Tue, 20
        Apr 2021 06:25:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210420052529eucas1p19219c49d2568e79976927c8ebc3978ae~3eaJkCk1-0361303613eucas1p1j;
        Tue, 20 Apr 2021 05:25:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210420052529eusmtrp2a93094881e384f31c662594343399dfb~3eaJiy8Bo0528005280eusmtrp20;
        Tue, 20 Apr 2021 05:25:29 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-b5-607e65c9941b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.B9.08696.9C56E706; Tue, 20
        Apr 2021 06:25:29 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210420052528eusmtip19fe36ef724185ceff481a996e1219ded~3eaI_al6E1953419534eusmtip1U;
        Tue, 20 Apr 2021 05:25:28 +0000 (GMT)
Subject: Re: [PATCH 5/7] mfd: sec: Simplify getting of_device_id match data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <64fb91ae-c754-fb25-0ef7-17b2f1b8a1e4@samsung.com>
Date:   Tue, 20 Apr 2021 07:25:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419081726.67867-5-krzysztof.kozlowski@canonical.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djP87onU+sSDFqe61lsnLGe1WLj2x9M
        Fve/HmW0uLxrDpvF7CX9LBYzzu9jsvj8fj+rxd7Wi8wW+694OXB6fPs6icVjVkMvm8eKT/oe
        d67tYfOYPuc/o0ffllWMHp83yQWwR3HZpKTmZJalFunbJXBlHL30m6XgJHdF89XbjA2Muzi7
        GDk4JARMJDZdtOpi5OIQEljBKPHmfC8jhPOFUeLu1mPsEM5nRomGH4uZYTqu74rvYuQEii9n
        lFh8mRPC/sgo0b09D6REWMBb4kWvOkiriMAHJoklZ+azg9SwCRhKdL3tYgOxeQXsJLo/PGUE
        sVkEVCXe/OoGqxEVSJK4eek/M0SNoMTJmU9YQGxOAXeJwycfg/UyC8hLbH87hxnCFpe49WQ+
        E8gyCYEPHBL/fiwFa5AQcJH4v209K4QtLPHq+BZ2CFtG4v9OmIZmRomH59ayQzg9jBKXm2Yw
        QlRZS9w594sN5B1mAU2J9bv0IcKOEjv3d7FBAoJP4sZbQYgj+CQmbZsODR9eiY42IYhqNYlZ
        x9fBrT144RIzhO0hMfvxZLYJjIqzkLw5C8lrs5C8NgvhhgWMLKsYxVNLi3PTU4uN81LL9YoT
        c4tL89L1kvNzNzECU9Tpf8e/7mBc8eqj3iFGJg7GQ4wSHMxKIrz3a2sShHhTEiurUovy44tK
        c1KLDzFKc7AoifPu2romXkggPbEkNTs1tSC1CCbLxMEp1cAUFnHguHb+AQd+/rNH19lt/5kZ
        adRyr5a9YdOlhs0bv3nvvOATuPbGa/0/u0S8kuR1F3brdVyqs3g2f6fS98Df9rdur5DZcWFe
        G7NhfOQJOZEHf9fNmzvn9E6z2hj2nR9UMzgd0iomNCxkN761a3at8a3L/3hydYJ2bxCckHBe
        XPdO7fyuno/tzta6V6fYaj1XzIgQXfAy89a1PzoTXvJKVi2/31j+LWRGiHp1Vd+uwIPLTk9V
        XLeFoWCt0yb1uMcnAg1Mde8smPkqZI9Gk9CPY9uCpyvMPOlT92KaulH6ivyE+F277qs8Wu27
        JpkzaP1NwxUz1Crux/Ba2jVtc9xyWDX6l+WqZ9I/8uWzl/74qsRSnJFoqMVcVJwIAPFHZr3A
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xu7onU+sSDG7OE7bYOGM9q8XGtz+Y
        LO5/PcpocXnXHDaL2Uv6WSxmnN/HZPH5/X5Wi72tF5kt9l/xcuD0+PZ1EovHrIZeNo8Vn/Q9
        7lzbw+Yxfc5/Ro++LasYPT5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1
        MjJV0rezSUnNySxLLdK3S9DLOHrpN0vBSe6K5qu3GRsYd3F2MXJwSAiYSFzfFd/FyMkhJLCU
        UaL5Ay+ILSEgI3FyWgMrhC0s8edaF1sXIxdQzXtGiXn9L9hBeoUFvCVe9KqD1IgIfGKS2NyR
        A1FznVFi0ZzpzCAJNgFDia63IM2cHLwCdhLdH54ygtgsAqoSb351s4PYogJJEvcur2SGqBGU
        ODnzCQuIzSngLnH45GOwXmYBM4l5mx8yQ9jyEtvfzoGyxSVuPZnPNIFRcBaS9llIWmYhaZmF
        pGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwOjbduznlh2MK1991DvEyMTBeIhRgoNZ
        SYT3fm1NghBvSmJlVWpRfnxRaU5q8SFGU6B/JjJLiSbnA+M/ryTe0MzA1NDEzNLA1NLMWEmc
        1+TImnghgfTEktTs1NSC1CKYPiYOTqkGJvZpjR90JA0Tr2zRmhf65llKxjbla7Ou7uC6JmCe
        u7opg3l/24TVKX1bZA4nzOprmpmbEnXi3Z4IoZwFekH39HsWvTmy7+mb11+vpllu3/R45bQd
        0w+ZTpmgqRAyuZBD8f+Phe+833MbXK2fMGOrFMOlXptjfpI/JknvyGIz79wXwWW/omKVxR2V
        Ld3zLdtMX3NM/aJ6LPjK6TP/+/M4v1i0NPy0vcG05hzTnKwsftELundelgo9OhvDft3u8/xO
        kfDti9wv9ea/C1u7zkJPcZGs8oWtmX4ya7X3Jzz9UCq5rUR6qZl0m05E2X65zecOO265LWVy
        vuQ6V+YPVxXnn/8Nbx+XndG2eIIpp7r8hnQlluKMREMt5qLiRACkHu8iRwMAAA==
X-CMS-MailID: 20210420052529eucas1p19219c49d2568e79976927c8ebc3978ae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
        <CGME20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d@eucas1p2.samsung.com>
        <20210419081726.67867-5-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 19.04.2021 10:17, Krzysztof Kozlowski wrote:
> Use of_device_get_match_data() to make the code slightly smaller.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/mfd/sec-core.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 8d55992da19e..3126c39f3203 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -10,6 +10,7 @@
>   #include <linux/slab.h>
>   #include <linux/i2c.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/interrupt.h>
>   #include <linux/pm_runtime.h>
> @@ -324,12 +325,8 @@ static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
>   						const struct i2c_device_id *id)
>   {
>   #ifdef CONFIG_OF
> -	if (i2c->dev.of_node) {
> -		const struct of_device_id *match;
> -
> -		match = of_match_node(sec_dt_match, i2c->dev.of_node);
> -		return (unsigned long)match->data;
> -	}
> +	if (i2c->dev.of_node)
> +		return (unsigned long)of_device_get_match_data(&i2c->dev);
>   #endif

Does it make any sense to keep the #ifdef CONFIG_OF after this change? I 
would also skip (i2c->dev.of_node) check, because 
of_device_get_match_data() already does that (although indirectly).

>   	return id->driver_data;
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

