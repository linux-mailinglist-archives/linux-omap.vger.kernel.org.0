Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE71402D48
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 18:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234571AbhIGQ61 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 12:58:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232621AbhIGQ61 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Sep 2021 12:58:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CC4D60EBA;
        Tue,  7 Sep 2021 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631033840;
        bh=74TQ9KGHI5rYQQjj+OtmavNXyOWbU1JhOLWQbuhnzRs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FK/p4wO8nfXUp/DQ/uXm/6JH/zPdjseHw1g4auFP9Z+yZOBleKYr4bPLNykuZOMXN
         PmMUgwyKkbSxrHcKWg1fevL3bVzsUvbh/lEOoO5YauaRRYUk9s1NXlvTfZIzA9cELB
         spTEZe7gyraT/CGEBqesZ8xbetIUc6p0WGwLCfiNVWmI8QH2thjXZb6Od7fTZG5WJg
         VCHb/7RKIalup1Zs+4bvcuUGTTk762SZi36dbmLlYQ7W/+FUGenPhw6D8Eqx9U5XGt
         oaaaR4C3GvVon9hUAQHZPorDxirNkv6F4IA00AXI80cFNO33vuX+IXkrotGrDo8iat
         aibw+zi+xzKPQ==
Subject: Re: [PATCH v3 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     tony@atomide.com, robh+dt@kernel.org, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-6-rogerq@kernel.org> <20210907160317.2ec5304a@xps13>
 <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com> <20210907183545.3e281b7d@xps13>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <2c6491c2-dae8-c8b3-9f8c-14a7583720f1@kernel.org>
Date:   Tue, 7 Sep 2021 19:57:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907183545.3e281b7d@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Miquel,

On 07/09/2021 19:35, Miquel Raynal wrote:
> Hi Grygorii,
> 
>>>   
>>>> +
>>>> +  nand-bus-width:
>>>> +    description:
>>>> +      Bus width to the NAND chip
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [8, 16]
>>>> +    default: 8  
>>>
>>> This is part of nand-controller.yaml binding and should not be there.
>>>   
>>>> +
>>>> +allOf:
>>>> +  - $ref: "../memory-controllers/ti,gpmc-child.yaml"  
>>>
>>> Maybe you need to reference the nand controller bindings as well
>>>   
>>
>> This will not work out of the box :( as nand-controller.yaml defines both
>>   nand controller and nand memory. It potentially might work if it will be possible to split
>> nand memory definition (or nand memory properties) out of and-controller.yaml, similarly to
>> ti,gpmc-child.yaml from this series.
> 
> What you think would be the issue?

The issue is that dt_binding checks will fail if I reference nand-controller.yaml
as we currently represent the controller as follows

memory-controller { /* GPMC controller */
	memory-controller-props;
	nand-chip {
		/* @chip select 0 */
		nand-controller-props;
		memory-controller-timing-props;
		chip-props;
	}
	nand-chip {
		/* @chip select 1 */
		nand-controller-props;
		memory-controller-timing-props;
		chip-props;
	}
	nor-chip {
		/* @chip select 2 */
		memory-controller-timing-props;
		chip-props;
	}
}

The NAND controller IO registers are at different addresses for different
chip select regions. Also, this is one way we can specify GPMC settings/timings
for different chip selects.

> 
> I am not opposed to split nand-controller.yaml into
> nand-controller.yaml and nand-chip.yaml if it simplifies the
> description of controllers but I don't get why it would be needed. In
> particular since we expect all drivers to support the
> 
> nand-controller {
> 	controller-props;
> 	nand-chip {
> 		chip-props;
> 	}
> }

Changing to this format will cause a lot of churn in DT files, which I'm not sure
if it gives enough benefit. 
TI platforms will never have 2 NAND chips in the same chip select region.

> 
> organization which has been enforced since at least 2018. Having a
> controller vs. chip representation is fundamentally right. But here I
> see how "legacy" are these bindings with so much unneeded specific "ti,"
> properties... On one side it would be good to verify that the driver
> supports this representation (which I believe is true) and on the other
> side maybe it's time to advertise "better" bindings as well.

Yes, I'm OK to mark ti specific properties deprecated and use standard NAND chip
bindings.

cheers,
-roger
