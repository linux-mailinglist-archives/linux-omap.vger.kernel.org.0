Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D8C16252A
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 12:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRLBR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 06:01:17 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:57480 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgBRLBQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 06:01:16 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200218110113epoutp01028b5bb0fd82353010e9afdb346b032e~0eiY0T7mq3168431684epoutp01O
        for <linux-omap@vger.kernel.org>; Tue, 18 Feb 2020 11:01:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200218110113epoutp01028b5bb0fd82353010e9afdb346b032e~0eiY0T7mq3168431684epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582023673;
        bh=C6dCAQnEDcW0676qRiZ4sb3/DZNCer6oaAzZ+fq/Yl4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=VQibAqz3BG3SewqHl0+LS1zbta0z51UWEX2PbPnxnXresm21Zy7fi1jWeJG3joxVL
         Xn3K9zX08A8JxRNuEmjTOORqVuQPuuFDoVCaomamMOmMTUHwCT7xvg3XS0Ry3fG8jF
         MGK61mW/W20leAdkolRvwnPip7rtVCZ8IvOH9jRQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200218110113epcas1p2cb62f189c469662795272e8f12734d96~0eiYQVgWP1700017000epcas1p2K;
        Tue, 18 Feb 2020 11:01:13 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 48MHw65YXMzMqYlx; Tue, 18 Feb
        2020 11:01:10 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        F0.AD.51241.6F3CB4E5; Tue, 18 Feb 2020 20:01:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20200218110110epcas1p49fcb41cb04e4b6b4011c0cf15ecca02b~0eiVvJ6Cw0803508035epcas1p4Q;
        Tue, 18 Feb 2020 11:01:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200218110110epsmtrp17e0e89a0c4502abd70980dbe3e6ccae0~0eiVt0DB72068620686epsmtrp12;
        Tue, 18 Feb 2020 11:01:10 +0000 (GMT)
X-AuditID: b6c32a39-163ff7000001c829-06-5e4bc3f62bd0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        FA.0E.10238.6F3CB4E5; Tue, 18 Feb 2020 20:01:10 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200218110110epsmtip2b7a6d99c68f7bd020cfa35d60df4b84a~0eiVigtl42361823618epsmtip2e;
        Tue, 18 Feb 2020 11:01:10 +0000 (GMT)
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <34f3cd11-321b-9aab-31a7-a3fb03691980@samsung.com>
Date:   Tue, 18 Feb 2020 20:09:16 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200218104810.GA194120@lenoch>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfm8Vgt35bLpxGlJ4q0dDvq6lgZRREj+yBFQQXayZ2muBs7
        U7p9yJqVZlrahaZlZUbaPeYqYwleitldEaI0k0yyi6ZpWQq17Rj57ff+n//D8/7f96EI+WVS
        SaWbbLzVxBlocoLUVR8RHfWjPjFZXVC+gB12DUnY5qE9bEllsYStHm0m2ZaaUpItuVgoZd9k
        XyaXB2qv9jUR2sbKaxKtvagmUDto309oC5xVSPv99swkcnPG0jSe0/HWMN6Uatalm/QJdOL6
        lJUpmoVqJoqJZxfRYSbOyCfQq9YmRa1ON3ivQodlcYZMr5TECQKtWrbUas608WFpZsGWQPMW
        ncESb4kWOKOQadJHp5qNixm1OkbjNW7NSMvt/S219Ct3uOv1e9FjRR4KogDHwZ/+HiIPTaDk
        +C6C1sNPCV9BjgcQ7P+8TSz8QHDrREvAv47zg0MBYsGNoL21jRQPfQiaijqkPtdUvAWGi16i
        PERRITgC2kZVPg+BnyNovHYy0OchcSTUfnxF+jgYh0Pr8HvkYxleBtlVdr8uxXPAvS/Hzwq8
        ETwu+5hnCnhOd/lnBeEo8HQ/8HsIHAqvu8okIs+CO19L/dkA/ySh8skbUoywCjoarhIiT4VP
        j5yBIiuhp/DAGO+GSk8DKTYfQuCsfTGWPxZqK4olvmSEN9mNGpUoh8O9kTNIHDwZeofyA3wW
        wDI4dEAuWmZDy7t2icjTofxgLnkU0Y5xcRzjIjjGRXD8H3YOSavQNN4iGPW8wFg04z/7NvJv
        aWT8XfTw2do6hClET5IlFaxJlgdwWcJOYx0CiqBDZImhXkmm43bu4q3mFGumgRfqkMb72scI
        pSLV7N15ky2F0cTExsayccxCDcPQobLOTRHJcqznbHwGz1t4678+CRWk3Iu2H3M7i3cPfAse
        af4QnmBShE9aUnEq6G3itomuC64jivlWs9J+vXrLpeCcRakjqkLV9/wNBQNXss5mV+VWd39x
        nqwYbfu1QvjFf+6xxZd9fZVfPtq5fPi+e96Gm5zuiGVw7rqXx/uZDMkt+yZpb7Gnr2vGXPVq
        x6minIFe6sZNpm0HLRXSOCaSsArcX32U5T+7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO63w95xBj0P+C1+bPvKZHHpa43F
        7JWTmSy2/rnEZnF51xw2i9lL+lksbjeuYHNg91jz/hSzx9GVa5k8WibtYvf40tLM7NG3ZRWj
        x+dNcgFsUVw2Kak5mWWpRfp2CVwZne9+sRR8lKrYezi9gfG0aBcjJ4eEgInEwi9fWbsYuTiE
        BHYzSpxfuYYNIiEpMe3iUeYuRg4gW1ji8OFiiJq3jBILLlxnBqkRFoiW+DHpIiNIjYiApsSd
        P/ogNcwC5xklDtx4zwjRcJtJ4vqhN2ANbAJaEvtf3ABbwC+gKHH1x2NGEJtXwE6icVULWJxF
        QFVib1MrmC0qECaxc8ljJogaQYmTM5+wgNicAroSJ5/tA6thFlCX+DPvEjOELS5x68l8Jghb
        XmL72znMExiFZyFpn4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/d
        xAiOKi3NHYyXl8QfYhTgYFTi4V0xwStOiDWxrLgy9xCjBAezkgivtzhQiDclsbIqtSg/vqg0
        J7X4EKM0B4uSOO/TvGORQgLpiSWp2ampBalFMFkmDk6pBkaj+Jl1zS22dgZdr+dMm7rQnWGx
        7Ze1s57tu/SR4cG584Jv1118nltz4G9tnxrXM1aGv+4xswoPqJqaJ+ebz/xRNK3n1eWu5D39
        S90ebTr72eTSfW9mERkT9i0y7soF7q83czHEsD65dEXwyLfDr/lv31rt8dPS6fHkjTU1Lbt/
        miyYJnVvuc5OJZbijERDLeai4kQAGyslV6YCAAA=
X-CMS-MailID: 20200218110110epcas1p49fcb41cb04e4b6b4011c0cf15ecca02b
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
        <cbee6f0b-f268-2e77-f7b7-f19114fdf178@samsung.com>
        <20200218104810.GA194120@lenoch>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/18/20 7:48 PM, Ladislav Michl wrote:
> On Tue, Feb 18, 2020 at 07:35:47PM +0900, Chanwoo Choi wrote:
>> On 2/18/20 7:21 PM, Ladislav Michl wrote:
>>> On Tue, Feb 18, 2020 at 12:28:25PM +0900, Chanwoo Choi wrote:
>>>> On 2/17/20 10:38 PM, H. Nikolaus Schaller wrote:
>>>>> If the gpios are probed after this driver (e.g. if they
>>>>> come from an i2c expander) there is no need to print an
>>>>> error message.
>>>>>
>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>> ---
>>>>>  drivers/extcon/extcon-palmas.c | 8 ++++++--
>>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
>>>>> index edc5016f46f1..cea58d0cb457 100644
>>>>> --- a/drivers/extcon/extcon-palmas.c
>>>>> +++ b/drivers/extcon/extcon-palmas.c
>>>>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
>>>>>  
>>>>>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>>>>>  							GPIOD_IN);
>>>>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
>>>>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
>>>>> +		return -EPROBE_DEFER;
> 
> Here we returned...

hmm. you better to suggest the result of cocci script
to understand why it is matter.

> 
>>>>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
> 
> How could this else get triggered?

I don't understand your intention. 
If devm_gpiod_get_optional return the error except of -EPROBE_DEFER,
it is triggered. Is it wrong?

> 
>>>>>  		dev_err(&pdev->dev, "failed to get id gpio\n");
>>>>>  		return PTR_ERR(palmas_usb->id_gpiod);
>>>>>  	}
>>>>>  
>>>>>  	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
>>>>>  							GPIOD_IN);
>>>>> -	if (IS_ERR(palmas_usb->vbus_gpiod)) {
>>>>> +	if (PTR_ERR(palmas_usb->vbus_gpiod) == -EPROBE_DEFER) {
>>>>> +		return -EPROBE_DEFER;
>>>>> +	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
>>>>>  		dev_err(&pdev->dev, "failed to get vbus gpio\n");
>>>>>  		return PTR_ERR(palmas_usb->vbus_gpiod);
>>>>>  	}
>>>>>
>>>>
>>>> I think that it is enough to handle the -EPROBE_DEFER.
>>>> Also, I prefer to use single if/else statement 
>>>> instead of the nested if/else statement.
>>>>
>>>> Applied it.
>>>
>>> Uh... As it is? Then it is matter of time it triggers someones cocci
>>> script pointing to else after return. Could you at least fix this?
>>
>> Sorry. I don't understand. Do you mean that this patch has the
>> some issue of cocci script?
> 
> Yes.

As I said, you better to suggest the result of cocci script.

> 
>> I think that it fixes the probe sequence issue
>> between extcon-palmas and gpio driver. It is not related to
>> any result from cocci script. If the extcon-palmas.c has
>> the issue by cocci or checkpatch, anyone can send the other patch
>> for fixup.
> 
> Do you mean to send fixup to what you just applied? What happened
> to review process? Nikolaus himself told you patch could be better
> and we were just waiting which solution you choose to send final patch.

I has not thought that Nikolaus will send next patch
when I read this thread.

> 
>> I think that it is enough to fix the issue which is only
>> related to the probe sequence between gpio and extcon-palmas.c
> 
> Agree, but look again at the patch.
> 
> 	ladis
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
