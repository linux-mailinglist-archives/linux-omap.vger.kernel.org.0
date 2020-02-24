Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45760169C1D
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 03:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgBXCEC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 23 Feb 2020 21:04:02 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:55664 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbgBXCEB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 23 Feb 2020 21:04:01 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200224020358epoutp035b28ce782136df4e4c0eced2c94b1b96~2NFBasmtK0432904329epoutp03D
        for <linux-omap@vger.kernel.org>; Mon, 24 Feb 2020 02:03:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200224020358epoutp035b28ce782136df4e4c0eced2c94b1b96~2NFBasmtK0432904329epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582509838;
        bh=vl6Ojc+zco5UtPwYSOOb2Qzu8IEALnZuby32ONvRoiw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kLkv19DxiyRllK29o8R0BJUAGhC073zaAE+Y2NrN0XFFVWdDvOYhy36d1q9wdPlhv
         ZqBgL3s+56YYd3zn2DQg+Q/kL5+/qnrm7YHcxoop3KD0ILa1gW3aviOxupYmW+Nqgv
         oBmlTDfdmzMYyiYLADFkNuyBZKOQ9xyMpgdVNQm4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200224020358epcas1p421d702e325eb222b6a1d8f3030073e68~2NFA0y63j1136311363epcas1p4C;
        Mon, 24 Feb 2020 02:03:58 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48QljR0wQnzMqYkp; Mon, 24 Feb
        2020 02:03:55 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.F7.51241.60F235E5; Mon, 24 Feb 2020 11:03:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200224020350epcas1p35854e9285c6cf55fe7df24ae2d205b07~2NE5nlxRC0559005590epcas1p3K;
        Mon, 24 Feb 2020 02:03:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200224020350epsmtrp1aa2b5044e3cda186d5cec6f70d5b3766~2NE5m4t7E3122931229epsmtrp1G;
        Mon, 24 Feb 2020 02:03:50 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-38-5e532f060a0b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F5.79.10238.60F235E5; Mon, 24 Feb 2020 11:03:50 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200224020350epsmtip1da1adba78b87a751e294f2dead23a052~2NE5b2-GH2332523325epsmtip1S;
        Mon, 24 Feb 2020 02:03:50 +0000 (GMT)
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <1cf484d9-572c-ea19-49d6-cd4cf61c9965@samsung.com>
Date:   Mon, 24 Feb 2020 11:12:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200221074740.GA44103@lenoch>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmni6bfnCcwb/ZRhY/tn1lsrj0tcZi
        9srJTBZb/1xis7i8aw6bxewl/SwWtxtXsDmwe6x5f4rZ4+jKtUweLZN2sXt8aWlm9ujbsorR
        4/MmuQC2qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfM
        HKBTlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFlgV6xYm5xaV56XrJ+blWhgYG
        RqZAhQnZGW3ntzAW/OavWPzzOWMD40LeLkZODgkBE4nrnR+Yuxi5OIQEdjBKnNvdBeV8YpRY
        fm0nE4TzjVHi5qHDTDAt815PharayyjxZN0bKOc9o8SL2/NYQaqEBaIlfky6yNjFyMEhIqAp
        ceePPkgNs8B5Romja6exg9SwCWhJ7H9xgw3E5hdQlLj64zEjiM0rYCfx93wb2BwWAVWJ/hX3
        wOKiAmESJ7e1QNUISpyc+YQFxOYU0JH4sP8AWJxZQFzi1pP5TBC2vMT2t3PAjpMQ+M4mce30
        PhaIF1wknj/7yAxhC0u8Or6FHcKWknjZ3wZlV0usPHmEDaK5g1Fiy/4LrBAJY4n9SyczgXzG
        DPTZ+l36EGFFiZ2/50IdwSfx7msPK0iJhACvREebEESJssTlB3ehoSgpsbi9k20Co9IsJO/M
        QvLCLCQvzEJYtoCRZRWjWGpBcW56arFhgSlydG9iBKdTLcsdjMfO+RxiFOBgVOLhXXEkKE6I
        NbGsuDL3EKMEB7OSCK83I1CINyWxsiq1KD++qDQntfgQoykwtCcyS4km5wNTfV5JvKGpkbGx
        sYWJoZmpoaGSOO/DSM04IYH0xJLU7NTUgtQimD4mDk6pBsbmwN2ne6fp//lddnx26v7lcaKn
        jJa27Ag7JLw1LkHm2/N/j04xunaJbtZf4hB3fWqAS8k5a5blc+fO/2znoatjmHRvSknW3PKl
        zFN/fuljM03Qea2580Tv1Z5dXf+Oz0vrMU/eorIvhq+Pe99J4ZKLoQ/fPZVxnjXVqzRiWhXD
        SgEBaYeAfiYlluKMREMt5qLiRAA9p0D0vQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnC6bfnCcQfMHUYsf274yWVz6WmMx
        e+VkJoutfy6xWVzeNYfNYvaSfhaL240r2BzYPda8P8XscXTlWiaPlkm72D2+tDQze/RtWcXo
        8XmTXABbFJdNSmpOZllqkb5dAldG2/ktjAW/+SsW/3zO2MC4kLeLkZNDQsBEYt7rqcwgtpDA
        bkaJv585IOKSEtMuHgWKcwDZwhKHDxd3MXIBlbxllLjycDcbSI2wQLTEj0kXGUFqRAQ0Je78
        0QepYRY4zyhx4MZ7RoiGTcwSf/c9ZwdpYBPQktj/4gZYM7+AosTVH48ZQWxeATuJv+fbWEFs
        FgFVif4V98DiogJhEjuXPGaCqBGUODnzCQuIzSmgI/Fh/wGwGmYBdYk/8y4xQ9jiEreezGeC
        sOUltr+dwzyBUXgWkvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT8
        3E2M4KjS0tzBeHlJ/CFGAQ5GJR7egENBcUKsiWXFlbmHGCU4mJVEeL0ZgUK8KYmVValF+fFF
        pTmpxYcYpTlYlMR5n+YdixQSSE8sSc1OTS1ILYLJMnFwSjUwRn9/EfXh84wSOX6z0C7tL4zr
        eHl8GfZn6f0UemfqPeeRs++pXfbLPn41YbwYYh4RU/n7bK16wJ6bkjHuHU5Xbhd3f7TVvvvb
        jV9gKmtioZ5z1NfCeW8SbSO7Tzvxrzu/zO/x5PR8D/Mf9+5tqvwpKvk17khP/lmrS93fzG7u
        z7EovcZa9ChZiaU4I9FQi7moOBEAUQoQaaYCAAA=
X-CMS-MailID: 20200224020350epcas1p35854e9285c6cf55fe7df24ae2d205b07
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
        <34f3cd11-321b-9aab-31a7-a3fb03691980@samsung.com>
        <20200221074740.GA44103@lenoch>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/21/20 4:47 PM, Ladislav Michl wrote:
> On Tue, Feb 18, 2020 at 08:09:16PM +0900, Chanwoo Choi wrote:
>> On 2/18/20 7:48 PM, Ladislav Michl wrote:
>>> On Tue, Feb 18, 2020 at 07:35:47PM +0900, Chanwoo Choi wrote:
>>>> On 2/18/20 7:21 PM, Ladislav Michl wrote:
>>>>> On Tue, Feb 18, 2020 at 12:28:25PM +0900, Chanwoo Choi wrote:
>>>>>> On 2/17/20 10:38 PM, H. Nikolaus Schaller wrote:
>>>>>>> If the gpios are probed after this driver (e.g. if they
>>>>>>> come from an i2c expander) there is no need to print an
>>>>>>> error message.
>>>>>>>
>>>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>>>> ---
>>>>>>>  drivers/extcon/extcon-palmas.c | 8 ++++++--
>>>>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
>>>>>>> index edc5016f46f1..cea58d0cb457 100644
>>>>>>> --- a/drivers/extcon/extcon-palmas.c
>>>>>>> +++ b/drivers/extcon/extcon-palmas.c
>>>>>>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct platform_device *pdev)
>>>>>>>  
>>>>>>>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>>>>>>>  							GPIOD_IN);
>>>>>>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
>>>>>>> +	if (PTR_ERR(palmas_usb->id_gpiod) == -EPROBE_DEFER) {
>>>>>>> +		return -EPROBE_DEFER;
>>>
>>> Here we returned...
>>
>> hmm. you better to suggest the result of cocci script
>> to understand why it is matter.
> 
> You can browse similar fixes online :)
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=else+after+return
> 

As you commented, please share the result
of cocci or checkpatch warning. It is simple to finish
this discussion. 

As I commented on other reply,
"I think that my suggestion is better because 'if' and 'else if'
check the error state of same 'palmas_usb->id_gpiod' variable.

If 'if' and 'else if' checks the different variable,
your suggestion is better."


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
