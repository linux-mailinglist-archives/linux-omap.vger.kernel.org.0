Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D1197F4A
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 17:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfHUPqE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 11:46:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51942 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbfHUPqE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 11:46:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LFjkSg127833;
        Wed, 21 Aug 2019 10:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566402346;
        bh=2DR/S3/gXqfngiEMqhp2FUVa9vNxRMq/4so3u+ndEWA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i+/X14L3C6FkibOoBStBp8a1mjMHmHWJoZaF1iBzf5HKLqTsLkdS8P1oUeaM9RYVO
         B6zMxh9d3Ef4S/l2JFXSRZ59HDJmtkiOdUN0bq6oPTMz6l1BZC0n/IfXB/fueVoF1/
         VzdJhX1PPsHwmbluu5s0y7zm5qJuHPQiLT9CkQ6s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LFjkNJ104657
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 21 Aug 2019 10:45:46 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 21
 Aug 2019 10:45:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 21 Aug 2019 10:45:45 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LFjjm2058635;
        Wed, 21 Aug 2019 10:45:45 -0500
Subject: Re: [PATCH 2/8] soc: ti: add initial PRM driver with reset control
 support
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-3-git-send-email-t-kristo@ti.com>
 <3b76f0e0-7530-e7b5-09df-2de9956f30ee@ti.com>
 <59709a2d-f13a-bd55-8aba-864c1cf2f19e@ti.com>
 <9372957c-9ab9-b0dd-fe07-815eb2cb2f16@ti.com>
 <0f335aec-bfdf-345a-8dfb-dad70aef1af6@ti.com>
 <a4196b73-63a0-f9d8-1c43-e6c4d1c1d6a4@ti.com>
 <1566400237.4193.15.camel@pengutronix.de>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <5e82199f-2f75-ee05-ba65-1595d0526572@ti.com>
Date:   Wed, 21 Aug 2019 10:45:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1566400237.4193.15.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/21/19 10:10 AM, Philipp Zabel wrote:
> On Tue, 2019-08-20 at 11:47 -0500, Suman Anna wrote:
>> On 8/20/19 2:37 AM, Tero Kristo wrote:
>>> On 20.8.2019 2.01, Suman Anna wrote:
>>>> Hi Tero,
>>>>
>>>> On 8/19/19 4:32 AM, Tero Kristo wrote:
> [...]
>>>>>>> +{
>>>>>>> +    struct omap_reset_data *reset;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Check if we have resets. If either rstctl or rstst is
>>>>>>> +     * non-zero, we have reset registers in place. Additionally
>>>>>>> +     * the flag OMAP_PRM_NO_RSTST implies that we have resets.
>>>>>>> +     */
>>>>>>> +    if (!prm->data->rstctl && !prm->data->rstst &&
>>>>>>> +        !(prm->data->flags & OMAP_PRM_NO_RSTST))
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
>>>>>>> +    if (!reset)
>>>>>>> +        return -ENOMEM;
>>>>>>> +
>>>>>>> +    reset->rcdev.owner = THIS_MODULE;
>>>>>>> +    reset->rcdev.ops = &omap_reset_ops;
>>>>>>> +    reset->rcdev.of_node = pdev->dev.of_node;
>>>>>>> +    reset->rcdev.nr_resets = OMAP_MAX_RESETS;
>>>>
>>>> Suggest adding a number of resets to prm->data, and using it so that we
>>>> don't even entertain any resets beyond the actual number of resets.
>>>
>>> Hmm why bother? Accessing a stale reset bit will just cause access to a
>>> reserved bit in the reset register, doing basically nothing. Also, this
>>> would not work for am3/am4 wkup, as there is a single reset bit at an
>>> arbitrary position.
>>
>> The generic convention seems to be defining a reset id value defined
>> from include/dt-bindings/reset/ that can be used to match between the
>> dt-nodes and the reset-controller driver.
>>
>> Philipp,
>> Any comments?
> 
> Are there only reset bits and reserved bits in the range accessible by
> [0..OMAP_MAX_RESETS] or are ther bits with another function as well?

Thanks Philipp, these are just reset bits and reserved bits.

> If the latter is the case, I would prefer enumerating the resets in a
> dt-bindings header, with the driver containing an enum -> reg/bit
> position lookup table.
> 
> In general, assuming the device tree contains no errors, this should not
> matter much, but I think it is nice if the reset driver, even with a
> misconfigured device tree, can't write into arbitrary bit fields.

Tero,
Can you add a check for this if possible?

regards
Suman
