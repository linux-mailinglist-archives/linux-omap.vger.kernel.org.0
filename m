Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4C51610D9
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 12:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgBQLQC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 06:16:02 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:51456 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgBQLQC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 06:16:02 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200217111600epoutp04c86056748316d6c21a457dfdcafa5364~0LGAgiBV51230012300epoutp04n
        for <linux-omap@vger.kernel.org>; Mon, 17 Feb 2020 11:16:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200217111600epoutp04c86056748316d6c21a457dfdcafa5364~0LGAgiBV51230012300epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1581938160;
        bh=XnJDbDzPQ614uQCZY17IqSJlEEbBzcSrM8J7KLowKq8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=UZHfuOlonVRgakI/myUaQxWmPnJZoX6t6jvULP5HRbFpyS31VJxl76jSW6SazNlSr
         QmpC4zdpV82dquyiCfZdImYnw2DhJpltg7lVrLaAKLDmJ2jZwd02sTubSnIaP+7mfN
         MtNH9bbhps+wtIlLbIpZek7ctxwjXF7s+qDyF0KI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200217111559epcas1p3972373bfe6095186269e3bcec9514ff4~0LF-mrIJY3070430704epcas1p3u;
        Mon, 17 Feb 2020 11:15:59 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48LhHd3sMhzMqYkb; Mon, 17 Feb
        2020 11:15:57 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        D6.48.51241.DE57A4E5; Mon, 17 Feb 2020 20:15:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200217111556epcas1p3c4da6b1938ff85960f7383200816fc6b~0LF9OD9lJ3101631016epcas1p3r;
        Mon, 17 Feb 2020 11:15:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200217111556epsmtrp2cd84d1fee1ff3ef6bb1ad193d67e0644~0LF9NbR3r2060920609epsmtrp2v;
        Mon, 17 Feb 2020 11:15:56 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-db-5e4a75ed14cb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D5.48.06569.CE57A4E5; Mon, 17 Feb 2020 20:15:56 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200217111556epsmtip1548ad1d8abc43e759fd8c0c08a911bf2~0LF9FPNxv3044830448epsmtip1y;
        Mon, 17 Feb 2020 11:15:56 +0000 (GMT)
Subject: Re: [PATCH] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <36bac0ac-f772-9f04-fb64-1c11e9d86fa5@samsung.com>
Date:   Mon, 17 Feb 2020 20:24:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <2DF972B9-EECF-44E9-93FC-74B6C3B6FFC2@goldelico.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURTHuTuz42htXTcfJyFbpwdpaI7r1lhqhRFbSmhBT9ht0kHFfTWz
        G1lBVlLuFj0pbLUXGaQERaipsVkWxUpZtGVvKDTSQoVce5Af2nGM/PY79/zPPed/7qUJ7Tkq
        ji61OQXRxlsYKoJsvp+YnDzgWm1KfRSYyf1qHlFxz0f2cE2jzyku0FZLcTV1x0ju3b6r1DLK
        eG2okzBWnmwLMwYrDxDGo40NyDh8Mz5fvbkss0TgiwRRJ9gK7UWltuIsJnedOcdsWJjKJrMZ
        3CJGZ+OtQhazIi8/eWWpJTQAo9vBW1yho3xekpgF2Zmi3eUUdCV2yZnFCI4iiyPDkSLxVsll
        K04ptFsXs6mpaYaQcGtZyXD3R+R4E7Oz836QrEDdWg8KpwGnw7cGP/KgCFqLWxB4KxrDlOA7
        ggPBKrUS/EBQ/bmH+ldy43a/WmYt9iF4/71MEQ0h+N39RSUnpuGN4P7wgpA5CqeA++coKYsI
        fAnBaPuTsQSFk6C97/XYrVNxArz81RMahKY1OBtOX1ziQWE0iedA73ZZEI3Xg7+5EsmswZHg
        P9tLyhyOl0Nla+cYEzgW3vZeUCk8E24N1BJyV8BDFFx+cJdU5l8B9bfuqBWeBl8fyY5ljoPh
        Qd+4x91Q739AKcVVCBrbn40X6KH9yimVPCaBE+F62wLlOAFa/5xDSuMpMDhyRC1LAGug6uD4
        pmdB4OMHlcLT4fIhN3UcMd4JdrwTLHgnWPD+b3YRkQ0oRnBI1mJBYh2GiW99E419zaSMFvSw
        K68DYRoxkzV9BatMWjW/Qyq3diCgCSZKkxu72qTVFPHluwTRbhZdFkHqQIbQrk8QcdGF9tBH
        tznNrCFNr9dz6exCA8sysZpPmxJNWlzMO4UyQXAI4r86FR0eV4Hq1or9hZ6s5S533+BW3bxg
        bjkt1jzNebxt0h/faO2WM7u5dfhebv8AfWVu09HzfndwJ+PbH294HNnED88KzJ/xfpm5ZdPS
        nmC1frppasJkT9okH7c0eq+QGdU1u+1OwD6PflZw/nCedUPf1bXxr/ap5sZ/yc6xv1xTzXfG
        pH/d08qQUgnPJhGixP8FBBzQKbADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTvdNqVecwalvZhY/tn1lsrj0tcZi
        659LbBaXd81hs5i9pJ/F4nbjCjYHNo81708xe7RM2sXu8aWlmdmjb8sqRo/Pm+QCWKO4bFJS
        czLLUov07RK4Mj5fe8BYcFOs4tThLywNjNeEuhg5OSQETCQ27H7J2sXIxSEksJtR4u/8l0wQ
        CUmJaRePMncxcgDZwhKHDxdD1LxllDh0cAEjSI2wQIRE590rzCC2iICeROf3PywgRcwCCxkl
        Htx8xAzRMZ1J4lTfTVaQKjYBLYn9L26wgdj8AooSV388ZgTZwCtgJzF1gXUXIzsHi4CqxJNC
        kAJRgTCJnUseg53DKyAocXLmExYQm1PAUaJl5ykwm1lAXeLPvEvMELa4xK0n85kgbHmJ7W/n
        ME9gFJ6FpH0WkpZZSFpmIWlZwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOH60
        tHYwnjgRf4hRgINRiYfXIcQzTog1say4MvcQowQHs5IIr7e4V5wQb0piZVVqUX58UWlOavEh
        RmkOFiVxXvn8Y5FCAumJJanZqakFqUUwWSYOTqkGRiPJpG0+TcVfi4LnfQy7pfl9VubdZf7r
        PnZlRvkzbd6s5Xa16NNPrVux+y+5OYnY7GD5kH9xc4qPd/ci1ZpQnWS76IK8cLNuK5uCUxrH
        Z7R7OzzaptU76/OkJKE0+a2+Op+mJV7dfbXfXcvr3ValyMLcoh8Pok3TfjK2vr12pC+9edHN
        L2u+KrEUZyQaajEXFScCAJVYVOGbAgAA
X-CMS-MailID: 20200217111556epcas1p3c4da6b1938ff85960f7383200816fc6b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200217085551epcas1p49113220d034155f8a78dc5e0767637a5
References: <CGME20200217085551epcas1p49113220d034155f8a78dc5e0767637a5@epcas1p4.samsung.com>
        <f65ad0ef2866e7d5b6743e13579c1efe8c572b4f.1581929741.git.hns@goldelico.com>
        <b9fe52e9-0340-4204-ee85-44b6c1ea7f3b@samsung.com>
        <2DF972B9-EECF-44E9-93FC-74B6C3B6FFC2@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 2/17/20 8:07 PM, H. Nikolaus Schaller wrote:
> Hi Chanwoo Choi,
> 
>> Am 17.02.2020 um 11:15 schrieb Chanwoo Choi <cw00.choi@samsung.com>:
>>
>> Hi,
>>
>> On 2/17/20 5:55 PM, H. Nikolaus Schaller wrote:
>>> If the gpios are probed after this driver (e.g. if they
>>> come from an i2c expander) there is no need to print an
>>> error message.
>>>
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> drivers/extcon/extcon-palmas.c | 6 ++++--
>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
>>> index edc5016f46f1..9c6254c0531c 100644
>>> --- a/drivers/extcon/extcon-palmas.c
>>> +++ b/drivers/extcon/extcon-palmas.c
>>> @@ -206,14 +206,16 @@ static int palmas_usb_probe(struct platform_device *pdev)
>>> 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>>> 							GPIOD_IN);
>>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
>>> -		dev_err(&pdev->dev, "failed to get id gpio\n");
>>> +		if (PTR_ERR(palmas_usb->id_gpiod) != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "failed to get id gpio\n");
>>> 		return PTR_ERR(palmas_usb->id_gpiod);
>>> 	}


How about editing it ? as following:
because following suggestion reduces the one checking behavior
when return value is -EPROBE_DEFER.

	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
		return -EPROBE_DEFER;
	} else if (IS_ERR(palmas_usb->id_gpiod)) {
		dev_err(&pdev->dev, "failed to get id gpio\n");
		return PTR_ERR(palmas_usb->id_gpiod);
	}

>>>
>>> 	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
>>> 							GPIOD_IN);
>>> 	if (IS_ERR(palmas_usb->vbus_gpiod)) {
>>> -		dev_err(&pdev->dev, "failed to get vbus gpio\n");
>>> +		if (PTR_ERR(palmas_usb->vbus_gpiod) != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "failed to get vbus gpio\n");

ditto.

>>> 		return PTR_ERR(palmas_usb->vbus_gpiod);
>>> 	}
>>>
>>>
>>
>> Usually, gpio driver like pinctrl is very early probed
>> because almost device drivers should use gpio.
>> So, I have not any experience about this situation.
>> Do you meet this situation on any h/w board?
> 
> Yes, I have experienced that sometimes on omap5+palmas based boards.
> 
> It seems to be this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/omap5-board-common.dtsi?h=v5.6-rc2#n384
> 
> The extcon_usb3 can potentially match this extcon-palmas driver at
> a moment where the palmas_gpio it is referring to has not yet been
> successfully probed. Then the palmas_gpio would return -EPROBE_DEFER.
> 
> AFAIK there is no guarantee for a specific sequence of drivers
> being probed and it is pure luck that in most cases the gpios
> are already probed.

Thanks for explaining the example.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
