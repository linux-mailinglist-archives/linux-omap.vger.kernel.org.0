Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED950739C3
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 21:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390699AbfGXTnh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 15:43:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48892 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390213AbfGXTng (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jul 2019 15:43:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OJgYP0083356;
        Wed, 24 Jul 2019 14:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563997354;
        bh=AJm71xiQOBjSdWSqksSb6orWtMZCBYh0pcNBwqXoWdQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kK94ypqr0C9M7sOcw1gFudGjaHNocKLuwvjvdo3NuKOzadWnHKCH0m5/wmXuq59Qi
         SBk4QiMOx+PAaNg8HjZr/fXwwRu/6ahQMFsWaIeGrhb9aPi9n8yaPkpplOtVdVMdMZ
         JAf3XTh2E9j1Fh6PGEVYqIQuBk7Se1H0btTuyF8U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OJgYke104572
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 14:42:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 14:42:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 14:42:33 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OJgXvZ096227;
        Wed, 24 Jul 2019 14:42:33 -0500
Subject: Re: [PATCH 1/6] dt-bindings: irqchip: Add PRUSS interrupt controller
 bindings
To:     Rob Herring <robh@kernel.org>
CC:     Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-2-s-anna@ti.com> <20190724163419.GA29254@bogus>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6871c381-9fc6-f6be-6386-f183fcc5546a@ti.com>
Date:   Wed, 24 Jul 2019 14:42:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190724163419.GA29254@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/24/19 11:34 AM, Rob Herring wrote:
> On Sun, 7 Jul 2019 22:52:38 -0500, Suman Anna wrote:
>> The Programmable Real-Time Unit Subsystem (PRUSS) contains an interrupt
>> controller (INTC) that can handle various system input events and post
>> interrupts back to the device-level initiators. The INTC can support
>> upto 64 input events on most SoCs with individual control configuration
>> and hardware prioritization. These events are mapped onto 10 interrupt
>> lines through two levels of many-to-one mapping support. Different
>> interrupt lines are routed to the individual PRU cores or to the
>> host CPU or to other PRUSS instances.
>>
>> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
>> commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
>> a higher number of host interrupts (20 vs 10) and can handle an increased
>> number of input events (160 vs 64) from various SoC interrupt sources.
>>
>> Add the bindings document for these interrupt controllers on all the
>> applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
>> and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
>> architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
>> and J721E SoCs.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>> Prior version: https://patchwork.kernel.org/patch/10795771/
>>
>>  .../interrupt-controller/ti,pruss-intc.txt    | 92 +++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks Rob. I am going to submit a v2 with some minor reword changes
based on couple of comments, but no addition or removal of properties.
Should I be retaining your Reviewed-by for v2?

regards
Suman


