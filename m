Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA03C16247D
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 11:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgBRK1t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 05:27:49 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:58801 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgBRK1r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 05:27:47 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200218102743epoutp028b027dbcfac7681d98945ac9d5b5e73d~0eFJK43v62123421234epoutp024
        for <linux-omap@vger.kernel.org>; Tue, 18 Feb 2020 10:27:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200218102743epoutp028b027dbcfac7681d98945ac9d5b5e73d~0eFJK43v62123421234epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582021663;
        bh=vKSMlfIkqirRTQYXX9qnJW4/hzJAeYLc6csS5YeRX2A=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=FAR85Sx/Z7fD67K00arVYNY1MQN9XemQQKgyQ9fsMQpOlbrrEVBScD0cBqD1nq/ox
         cCcXqNBKvEjz1q7EG482CX3Q1HPEuBpdQW59O1zrXherDB8uQ8zn1g8BMk8LXFHE13
         cGYy+wsPjLQf+Pe/6Ad7cwCBT2R1GQjkBrTljs1I=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200218102743epcas1p251c7b769d756f1c5052bdb58ee99c96b~0eFIpSwYb0296402964epcas1p2J;
        Tue, 18 Feb 2020 10:27:43 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.152]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 48MH9S6sQvzMqYkV; Tue, 18 Feb
        2020 10:27:40 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        E5.97.57028.C1CBB4E5; Tue, 18 Feb 2020 19:27:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20200218102740epcas1p4717d159cb0fd53fd9feac7c382af43dd~0eFF87-xX0978109781epcas1p4W;
        Tue, 18 Feb 2020 10:27:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200218102740epsmtrp1a2167198b7f4d63c2451ea224e73066b~0eFF8QI890549005490epsmtrp1C;
        Tue, 18 Feb 2020 10:27:40 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-94-5e4bbc1c5910
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CF.2C.10238.C1CBB4E5; Tue, 18 Feb 2020 19:27:40 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200218102740epsmtip293ff206bcaf707bfb3fc8cff3b56981d~0eFFsUUlW0922309223epsmtip2v;
        Tue, 18 Feb 2020 10:27:40 +0000 (GMT)
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <cbee6f0b-f268-2e77-f7b7-f19114fdf178@samsung.com>
Date:   Tue, 18 Feb 2020 19:35:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200218102140.GA193069@lenoch>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmrq7MHu84g3//TSx+bPvKZHHpa43F
        7JWTmSy2/rnEZnF51xw2i9lL+lksbjeuYHNg91jz/hSzx9GVa5k8WibtYvf40tLM7NG3ZRWj
        x+dNcgFsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6Z
        OUCnKCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0ihNzi0vz0vWS83OtDA0M
        jEyBChOyM2ZeeMpUsFW44vfPqawNjLf4uxg5OSQETCS+Nc1i7GLk4hAS2MEoMe3CdijnE6PE
        8ymX2SGcb4wS73tBMhAtV+6vharayyhx9cErqKr3jBIn1r9kBqkSFoiW+DHpIlAVB4eIgKbE
        nT/6IDXMAucZJY6uncYOUsMmoCWx/8UNNhCbX0BR4uqPx2AbeAXsJI5+bQWrYRFQlXhwrQes
        RlQgTOLkthaoGkGJkzOfsIDYnAK6EhvOfAaLMwuIS9x6Mp8JwpaX2P52DjPE1d/ZJOZsLIOw
        XSSa+y6zQ9jCEq+Ob4GypSRe9rdB2dUSK08eYQM5WkKgg1Fiy/4LrBAJY4n9SyczgTzGDPTY
        +l36EGFFiZ2/50LdwCfx7msPK0iJhACvREebEESJssTlB3eZIGxJicXtnWwTGJVmIflmFpIP
        ZiH5YBbCsgWMLKsYxVILinPTU4sNCwyRY3sTIziZapnuYJxyzucQowAHoxIPb0CfV5wQa2JZ
        cWXuIUYJDmYlEV5vcaAQb0piZVVqUX58UWlOavEhRlNgYE9klhJNzgcm+rySeENTI2NjYwsT
        QzNTQ0Mlcd6HkZpxQgLpiSWp2ampBalFMH1MHJxSDYxH5kXw37nxO7NL5OROloZSU/lFitbZ
        L26LFRifXrbXv6LRiHnRu09sB2Z6Vl23CsncV1glJMlw52X4uU/ePRevVLdu5J+9hr3dY+n0
        RJ0tVpMalLYWT5++Yn4315w+jSZnzjdNkZKf94RcXtXh9iqzXizx2ntZdscM8e+8UiJWdfd2
        zwr6baLEUpyRaKjFXFScCABT8JHovAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSvK7MHu84g79vRSx+bPvKZHHpa43F
        7JWTmSy2/rnEZnF51xw2i9lL+lksbjeuYHNg91jz/hSzx9GVa5k8WibtYvf40tLM7NG3ZRWj
        x+dNcgFsUVw2Kak5mWWpRfp2CVwZMy88ZSrYKlzx++dU1gbGW/xdjJwcEgImElfur2XsYuTi
        EBLYzShx7eIidoiEpMS0i0eZuxg5gGxhicOHiyFq3jJKzPvbxAZSIywQLfFj0kVGkBoRAU2J
        O3/0QWqYBc4zShy48R5qaDOTxMGlV1lBGtgEtCT2v7gB1swvoChx9cdjRhCbV8BO4ujXVrDF
        LAKqEg+u9YDViAqESexc8pgJokZQ4uTMJywgNqeArsSGM5/BepkF1CX+zLvEDGGLS9x6Mp8J
        wpaX2P52DvMERuFZSNpnIWmZhaRlFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLz
        czcxguNKS3MH4+Ul8YcYBTgYlXh4V0zwihNiTSwrrsw9xCjBwawkwustDhTiTUmsrEotyo8v
        Ks1JLT7EKM3BoiTO+zTvWKSQQHpiSWp2ampBahFMlomDU6qBMbcrx8CXs/ol/4s9xr87r3R3
        PjwZwiEuXZEYnxZ3ovJLM8+leqbnp2fabl/9cNGZK502aXtObWG/MHXTv473HkvjFx5++opL
        ZuL7De+P2FWdDbVcOX/2xjnTdy71Ev/H4dLC4Gxu/YNVUrsn2jL0Ar/egqN3Av6qGPUv4z9x
        l+/KC9Yl9eWPE5RYijMSDbWYi4oTAQyz9JqnAgAA
X-CMS-MailID: 20200218102740epcas1p4717d159cb0fd53fd9feac7c382af43dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200217133832epcas1p329af393e88fa76189ca141d2534f9ad2
References: <CGME20200217133832epcas1p329af393e88fa76189ca141d2534f9ad2@epcas1p3.samsung.com>
        <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
        <b2655a58-6541-a2c9-c44d-536e5cef1ee3@samsung.com>
        <20200218102140.GA193069@lenoch>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/18/20 7:21 PM, Ladislav Michl wrote:
> On Tue, Feb 18, 2020 at 12:28:25PM +0900, Chanwoo Choi wrote:
>> On 2/17/20 10:38 PM, H. Nikolaus Schaller wrote:
>>> If the gpios are probed after this driver (e.g. if they
>>> come from an i2c expander) there is no need to print an
>>> error message.
>>>
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>>  drivers/extcon/extcon-palmas.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
>>> index edc5016f46f1..cea58d0cb457 100644
>>> --- a/drivers/extcon/extcon-palmas.c
>>> +++ b/drivers/extcon/extcon-palmas.c
>>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
>>>  
>>>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>>>  							GPIOD_IN);
>>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
>>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
>>> +		return -EPROBE_DEFER;
>>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
>>>  		dev_err(&pdev->dev, "failed to get id gpio\n");
>>>  		return PTR_ERR(palmas_usb->id_gpiod);
>>>  	}
>>>  
>>>  	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
>>>  							GPIOD_IN);
>>> -	if (IS_ERR(palmas_usb->vbus_gpiod)) {
>>> +	if (PTR_ERR(palmas_usb->vbus_gpiod) == -EPROBE_DEFER) {
>>> +		return -EPROBE_DEFER;
>>> +	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
>>>  		dev_err(&pdev->dev, "failed to get vbus gpio\n");
>>>  		return PTR_ERR(palmas_usb->vbus_gpiod);
>>>  	}
>>>
>>
>> I think that it is enough to handle the -EPROBE_DEFER.
>> Also, I prefer to use single if/else statement 
>> instead of the nested if/else statement.
>>
>> Applied it.
> 
> Uh... As it is? Then it is matter of time it triggers someones cocci
> script pointing to else after return. Could you at least fix this?

Sorry. I don't understand. Do you mean that this patch has the
some issue of cocci script?

I think that it fixes the probe sequence issue
between extcon-palmas and gpio driver. It is not related to
any result from cocci script. If the extcon-palmas.c has
the issue by cocci or checkpatch, anyone can send the other patch
for fixup.

I think that it is enough to fix the issue which is only
related to the probe sequence between gpio and extcon-palmas.c

> 
> Thanks,
> 	ladis
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
