Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6D7162534
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 12:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgBRLFN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 06:05:13 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:36042 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgBRLFM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 06:05:12 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200218110509epoutp0346ff74e971f1186c85a3865bb15c0c19~0el0O7mRS2922029220epoutp03r
        for <linux-omap@vger.kernel.org>; Tue, 18 Feb 2020 11:05:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200218110509epoutp0346ff74e971f1186c85a3865bb15c0c19~0el0O7mRS2922029220epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582023909;
        bh=FIhv7dPv7X+XM6EqLJXa1yaR2OmjNvkfCM5WkZs2Cj0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fc6Rk+k0IKohJTDPFLFzIHuV2cz0ZgOL6+FIdLfVr4FrZugLpTEz5OSIVzUhhGLMa
         Gr6LtY8kQ76Wzgq48g+auKTDinzalVbnSbOxa1sGMhaKgftZYQzl+SItgL8CtGD6K1
         kdBfc2dvy7ClSJ3beQw+6HjGDX+jINR+1ARMGrOE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200218110508epcas1p3cbed91084d9cf9a4605dafbb08940fb6~0el0AC-590789107891epcas1p3e;
        Tue, 18 Feb 2020 11:05:08 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 48MJ0f5bqwzMqYlt; Tue, 18 Feb
        2020 11:05:06 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        96.1E.51241.2E4CB4E5; Tue, 18 Feb 2020 20:05:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200218110506epcas1p39b01c063cedc7b38255b170c0f89b57b~0elxYKCE01052210522epcas1p3x;
        Tue, 18 Feb 2020 11:05:06 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200218110506epsmtrp1033e20339671ffdc15c31b0e0012ccbd~0elxXg0z02280322803epsmtrp14;
        Tue, 18 Feb 2020 11:05:06 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-79-5e4bc4e2c87a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3D.D0.06569.1E4CB4E5; Tue, 18 Feb 2020 20:05:06 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200218110505epsmtip175697413a8f014eef1b10a4c9fcf94f9~0elxLh7Hk0371103711epsmtip1q;
        Tue, 18 Feb 2020 11:05:05 +0000 (GMT)
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <4b147484-42f2-1e21-9e19-36cc696cef5e@samsung.com>
Date:   Tue, 18 Feb 2020 20:13:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmru6jI95xBsc7dC1+bPvKZHHpa43F
        1j+X2Cwu75rDZjF7ST+Lxe3GFWwObB5r3p9i9miZtIvd40tLM7NH35ZVjB6fN8kFsEZl22Sk
        JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAHaCkUJaYUwoU
        CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM44sV+/
        YC5vRe/u2+wNjC+4uhg5OSQETCSO3D/E1sXIxSEksINRoqP1FyuE84lRYueeBewQzjdGiUd3
        JzDBtKz80scMkdjLKLFqWg8jhPOeUeLTjIuMIFXCAtESPyaB2BwcIgKREke/GIGEmQXKJL5e
        28QMYrMJaEnsf3GDDcTmF1CUuPrjMVgrr4CdxKL981hBbBYBVYmuy8fZQWxRgTCJk9taoGoE
        JU7OfMICYnMKOEos27+LDWK+uMStJ/OZIGx5ie1v54AdKiHwmE1i4p6HLBAfuEjM3nGCDcIW
        lnh1fAs7hC0l8bK/Dcqullh58ggbRHMHo8SW/RdYIRLGEvuXTmYCeYxZQFNi/S59iLCixM7f
        cxkhFvNJvPvawwpSIiHAK9HRJgRRoixx+cFdaCBKSixu72SbwKg0C8k7s5C8MAvJC7MQli1g
        ZFnFKJZaUJybnlpsWGCKHNmbGMFpU8tyB+Oxcz6HGAU4GJV4eAP6vOKEWBPLiitzDzFKcDAr
        ifB6iwOFeFMSK6tSi/Lji0pzUosPMZoCQ3sis5Rocj4wpeeVxBuaGhkbG1uYGJqZGhoqifM+
        jNSMExJITyxJzU5NLUgtgulj4uCUamBkDdpyQjXN7Fqx0EzlU6n/g2+t/xinKeNdss06cc5C
        /qciH1OaWdyDOoXP3LD9+/O9u+eKqLdK5oz/qlna1n5eFnVP9zrvdR1fMVlGDwWBSbvk1s/7
        8PTFnLLglXerwud8nJMWdPPzkq583XcP9wrIz5F+09TtFmFRxLVRO9VZOqy+yz3zWYMSS3FG
        oqEWc1FxIgBSfYjJsQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJTvfREe84g62HmSx+bPvKZHHpa43F
        1j+X2Cwu75rDZjF7ST+Lxe3GFWwObB5r3p9i9miZtIvd40tLM7NH35ZVjB6fN8kFsEZx2aSk
        5mSWpRbp2yVwZZzYr18wl7eid/dt9gbGF1xdjJwcEgImEiu/9DF3MXJxCAnsZpQ4eXo7G0RC
        UmLaxaNACQ4gW1ji8OFiiJq3jBK3ntxjBKkRFoiW+DHpIpgtIhApcWnhS3YQm1mgTOJcx3lG
        iIZHjBKb1s5nBkmwCWhJ7H9xA2wBv4CixNUfj8GaeQXsJBbtn8cKYrMIqEp0XT4ONkhUIExi
        55LHTBA1ghInZz5hAbE5BRwllu3fxQaxTF3iz7xLzBC2ONBx85kgbHmJ7W/nME9gFJ6FpH0W
        kpZZSFpmIWlZwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOIK0tHYwnjgRf4hR
        gINRiYd3xQSvOCHWxLLiytxDjBIczEoivN7iQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK88vnH
        IoUE0hNLUrNTUwtSi2CyTBycUg2Mne9ml1wR/NsYvl5iA9fPkuRKvpkNR9cYigY2rBJiajw+
        tZxZdf58pso98hKn571RZDp+aI+9/nezppeOVwRUX4fvNOyrkn326LDu7a1nGfW3r37E2/PZ
        qHLS2+JrvPs6hd0SAu+W5vvM+MnYZz3nwGunykC+tT8bbp2WNnnsM2XV4p07jvDeUmIpzkg0
        1GIuKk4EAPUaypScAgAA
X-CMS-MailID: 20200218110506epcas1p39b01c063cedc7b38255b170c0f89b57b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200217135826epcas1p1bd80a3e497ec65c5e715c9f352c4d660
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
        <CGME20200217135826epcas1p1bd80a3e497ec65c5e715c9f352c4d660@epcas1p1.samsung.com>
        <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/17/20 10:58 PM, H. Nikolaus Schaller wrote:
> 
>> Am 17.02.2020 um 14:38 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>
>> If the gpios are probed after this driver (e.g. if they
>> come from an i2c expander) there is no need to print an
>> error message.
>>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/extcon/extcon-palmas.c | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
>> index edc5016f46f1..cea58d0cb457 100644
>> --- a/drivers/extcon/extcon-palmas.c
>> +++ b/drivers/extcon/extcon-palmas.c
>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
>>
>> 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>> 							GPIOD_IN);
>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
>> +		return -EPROBE_DEFER;
>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
> 
> Hm.
> 
> While looking again at that: why do we need the "{" and "} else "?
> 
> It should be sufficient to have
> 
>> 	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>> 							GPIOD_IN);
>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
> 
> What do you think is better coding style here?

I think that my suggestion is better because 'if' and 'else if'
check the error state of same 'palmas_usb->id_gpiod' variable.

If 'if' and 'else if' checks the different variable,
your suggestion is better.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
