Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1113652F8
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 09:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhDTHNU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 03:13:20 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31330 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhDTHNT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 03:13:19 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210420071246euoutp01ae3800719c5399babaa2d26064529e6c~3f30_BzuI2656526565euoutp01-
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 07:12:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210420071246euoutp01ae3800719c5399babaa2d26064529e6c~3f30_BzuI2656526565euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1618902766;
        bh=6/ode3L3/A42+gj9Tr6+Vj0CwCQnr2m2tOHTvgfwuqs=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=jSYb1LuhFkSHYVMLwK3kZ5SxALe8r3AlwvM8PylIO1dGobSqIafl2r7p+2ZgA23yD
         YZX31NylxSp29vhM6bccm42P4MvAjWzptwiayRn0B0kIyp8re4MFlzk2O1rGvNOLpL
         KJMCilCpU6Ge1ucl6vjOvSk8przifteVAM3B1+EI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210420071246eucas1p18393ce6ead01059b3f7b33be0c132f27~3f30qnw1V2161121611eucas1p1T;
        Tue, 20 Apr 2021 07:12:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C9.51.09452.EEE7E706; Tue, 20
        Apr 2021 08:12:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210420071246eucas1p1b54469b5d5b0940d46908563156195e3~3f30LWN200622906229eucas1p14;
        Tue, 20 Apr 2021 07:12:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210420071246eusmtrp295d215ffb16b7745fdbe34c8cc189a2b~3f30Kniee2977129771eusmtrp2F;
        Tue, 20 Apr 2021 07:12:46 +0000 (GMT)
X-AuditID: cbfec7f2-ab7ff700000024ec-3b-607e7eeef8c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 42.2A.08705.DEE7E706; Tue, 20
        Apr 2021 08:12:45 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210420071245eusmtip1cc9e8770bc060ad3f8bd860925a954d9~3f3zm4ppi1973019730eusmtip1H;
        Tue, 20 Apr 2021 07:12:45 +0000 (GMT)
Subject: Re: [PATCH 5/7] mfd: sec: Simplify getting of_device_id match data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <a65318f6-1465-a35c-a987-8b833311ef3a@samsung.com>
Date:   Tue, 20 Apr 2021 09:12:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <4a5e80c0-653e-a4d6-630e-0d75e3779f6d@canonical.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djP87rv6uoSDHa9kbXYOGM9q8XGtz+Y
        LO5/PcpocXnXHDaL2Uv6WSxmnN/HZPH5/X5Wi72tF5kt9l/xcuD0+PZ1EovHrIZeNo8Vn/Q9
        7lzbw+Yxfc5/Ro++LasYPT5vkgtgj+KySUnNySxLLdK3S+DKmDfNt+CoYMXZSSYNjCv4uhg5
        OSQETCTaTr5n7GLk4hASWMEo8WbrXRaQhJDAF0aJ//u5IBKfGSX6301mg+k4sHMZC0RiOVCi
        u4sdwvnIKPGj+wxQFQeHsIC3xItedZC4iMAHJoklZ+azg3SzCRhKdL3tAqvhFbCTeL3XBiTM
        IqAqsXbXPlYQW1QgSeLmpf/MIDavgKDEyZlPwC7iFHCUaLz3BOwIZgF5ie1v5zBD2OISt57M
        ZwLZJSHwhkOie8ISFohLXSQ+rtjICGELS7w6voUdwpaR+L8TpqGZUeLhubXsEE4Po8TlphlQ
        HdYSd879AruUWUBTYv0ufYiwo8TO/RAPSAjwSdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSs46v
        g1t78MIlZgjbQ2L248lsExgVZyF5cxaS12YheW0Wwg0LGFlWMYqnlhbnpqcWG+allusVJ+YW
        l+al6yXn525iBKao0/+Of9rBOPfVR71DjEwcjIcYJTiYlUR479fWJAjxpiRWVqUW5ccXleak
        Fh9ilOZgURLnXTV7TbyQQHpiSWp2ampBahFMlomDU6qBibtwrd36dxX7jGv/JDlu2yP169IO
        wSsJHlMVPxRcnfNFRSZ1f9ePgBWX7/LsWuhxtWQTa5ur2/wTtr+P7Z3fyJv0f29OxONjr4Kf
        XP+gs//QY6Y1tfseLzy2JLbY7cuvd50/sldv+X6ufkda3d3ZTtnvS5uOH1r4+f6ZKpNtrG+e
        uT1o/JeplZkTHdjZ9apyRVzw3JshQdv+LDuy0nHT9fUOB+YuPpfi/rrcevka63aHEysrvm14
        K23QGP3b9EVM7rXp0y8bbDjYnlURceDd1mTH1hlp0dzhSuoaswX2J0kf2SPM7afNf41p2aLq
        NdIde0NP8pk0b7GRvOjKdGwB1x2D+A2Vto9yPucHLuB1PVqlxFKckWioxVxUnAgAe8c82MAD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xu7rv6uoSDPYLW2ycsZ7VYuPbH0wW
        978eZbS4vGsOm8XsJf0sFjPO72Oy+Px+P6vF3taLzBb7r3g5cHp8+zqJxWNWQy+bx4pP+h53
        ru1h85g+5z+jR9+WVYwenzfJBbBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
        mSrp29mkpOZklqUW6dsl6GXMm+ZbcFSw4uwkkwbGFXxdjJwcEgImEgd2LmPpYuTiEBJYyihx
        9OgjZoiEjMTJaQ2sELawxJ9rXWwQRe8ZJXZO2s3excjBISzgLfGiVx2kRkTgE5PE5o4ciJrD
        TBIHOy6wgyTYBAwlut6CNHNw8ArYSbzeawMSZhFQlVi7ax/YfFGBJIl7l1eC7eUVEJQ4OfMJ
        C4jNKeAo0XjvCRuIzSxgJjFv80NmCFteYvvbOVC2uMStJ/OZJjAKzkLSPgtJyywkLbOQtCxg
        ZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGHnbjv3cvINx3quPeocYmTgYDzFKcDArifDe
        r61JEOJNSaysSi3Kjy8qzUktPsRoCvTPRGYp0eR8YOznlcQbmhmYGpqYWRqYWpoZK4nzbp27
        Jl5IID2xJDU7NbUgtQimj4mDU6qBaaZtgKjoa9YzKZuyLxnumiZ1MvX2yy9Lzj5Ij1qz+6TV
        UcsJl59P2Hn8eH3rvT/MhvUPRKfkTHFc9f3pkk2SHpO+cM9+ov2qTPj2vCYt25sVx+zutl3S
        qvHaafNzImd553u+wBdXtsq+uKmjIzzvyc1m83+3DnHMUXjaH5s2R9oo/fDJI+d9Hkf35h5g
        y4zgeHN6rsGhD5q5i+Yv2FL0IM2/qkijKXf25x8tHx/6qzacPnDFYI5Zqp2JUu6hU51/j0iv
        fS+epjnh5VumiwXxWwsNC5lP/VwZ3xSvXdz7vZ6d88TVN06/4jaYVk5ffV7gZfND/k0+td9k
        ePm2uqTcXcDGmCWi2hxlxGcgkmX2cLoSS3FGoqEWc1FxIgCrZA2mRQMAAA==
X-CMS-MailID: 20210420071246eucas1p1b54469b5d5b0940d46908563156195e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
        <CGME20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d@eucas1p2.samsung.com>
        <20210419081726.67867-5-krzysztof.kozlowski@canonical.com>
        <64fb91ae-c754-fb25-0ef7-17b2f1b8a1e4@samsung.com>
        <4a5e80c0-653e-a4d6-630e-0d75e3779f6d@canonical.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20.04.2021 09:03, Krzysztof Kozlowski wrote:
> On 20/04/2021 07:25, Marek Szyprowski wrote:
>> On 19.04.2021 10:17, Krzysztof Kozlowski wrote:
>>> Use of_device_get_match_data() to make the code slightly smaller.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>    drivers/mfd/sec-core.c | 9 +++------
>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
>>> index 8d55992da19e..3126c39f3203 100644
>>> --- a/drivers/mfd/sec-core.c
>>> +++ b/drivers/mfd/sec-core.c
>>> @@ -10,6 +10,7 @@
>>>    #include <linux/slab.h>
>>>    #include <linux/i2c.h>
>>>    #include <linux/of.h>
>>> +#include <linux/of_device.h>
>>>    #include <linux/of_irq.h>
>>>    #include <linux/interrupt.h>
>>>    #include <linux/pm_runtime.h>
>>> @@ -324,12 +325,8 @@ static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
>>>    						const struct i2c_device_id *id)
>>>    {
>>>    #ifdef CONFIG_OF
>>> -	if (i2c->dev.of_node) {
>>> -		const struct of_device_id *match;
>>> -
>>> -		match = of_match_node(sec_dt_match, i2c->dev.of_node);
>>> -		return (unsigned long)match->data;
>>> -	}
>>> +	if (i2c->dev.of_node)
>>> +		return (unsigned long)of_device_get_match_data(&i2c->dev);
>>>    #endif
>> Does it make any sense to keep the #ifdef CONFIG_OF after this change?
> Good point, it was only to hide usage of of_device_id table.
>
>> I would also skip (i2c->dev.of_node) check, because
>> of_device_get_match_data() already does that (although indirectly).
> First, the enum sec_device_type would need to be changed so it starts
> from 1, not 0. It's because the value returned by this function is later
> assigned to that enum and there is no way currently to differentiate
> between NULL and S5M8767X.
>
> Second, it wouldn't make the code smaller;
>
> unsigned long data;
> data = of_device_get_match_data(&i2c->dev);
> if (data)
> 	return data;

Then maybe one should go further and remove legacy, non-of based 
initialization, because it is not used at all. This will simplify it 
even more.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

