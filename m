Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B10C56C049
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jul 2019 19:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbfGQRVr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jul 2019 13:21:47 -0400
Received: from vern.gendns.com ([98.142.107.122]:41884 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfGQRVr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Jul 2019 13:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0e5KXANYBSya6HFY+w50szT78V3hXoXrtYknRgw92PY=; b=gIlQDHNo+7ek+vYWfHdVTFxW6d
        kMOJGCGKxDfLFXrwfXRbsKuHiUd4R8kXgAAcOU21r5PYa7/8bwhtTxieHeeyqReWP7Ems3tIbeXgR
        XshlZ5r1AJDGwycXPa2SmDxjpa9B8vFOLM8PSnlnKgGa0reGv31ItWue3x42potZohs8AfGU6bY+D
        vnNSt7UUdRH2ykv951H1d11lef/uaRiORrSFn4tL2puuHguaP1nu7dfreXkmqzlI1pWHwbhE3MTOJ
        qHAGPh4VQcY32IMBta8JLWKUqv6fdG7eI79D8uom5XRz3YpLG/UU9aFgYKUWOGXtc5lguNmb41Ohq
        tXtzIj+A==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:47560 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hnncd-007Yqa-Ka; Wed, 17 Jul 2019 13:21:43 -0400
Subject: Re: [PATCH 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-3-s-anna@ti.com>
 <3d91800b-e858-8c73-5ea8-e99e5ea30e8e@lechnology.com>
 <54e871a8-dfa4-f65b-5869-d1661144cbf0@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <5241ecb9-4ab2-b01c-367c-38c554c056c4@lechnology.com>
Date:   Wed, 17 Jul 2019 12:21:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <54e871a8-dfa4-f65b-5869-d1661144cbf0@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/16/19 12:21 PM, Suman Anna wrote:
>>> +static int pruss_intc_probe(struct platform_device *pdev)
>>> +{
>>> +    static const char * const irq_names[] = {
>>> +                "host0", "host1", "host2", "host3",
>>> +                "host4", "host5", "host6", "host7", };
>>> +    struct device *dev = &pdev->dev;
>>> +    struct pruss_intc *intc;
>>> +    struct resource *res;
>>> +    struct irq_chip *irqchip;
>>> +    int i, irq;
>>> +
>>> +    intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
>>> +    if (!intc)
>>> +        return -ENOMEM;
>>> +    platform_set_drvdata(pdev, intc);
>>> +
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    intc->base = devm_ioremap_resource(dev, res);
>>> +    if (IS_ERR(intc->base)) {
>>> +        dev_err(dev, "failed to parse and map intc memory resource\n");
>>> +        return PTR_ERR(intc->base);
>>> +    }
>>> +
>>> +    dev_dbg(dev, "intc memory: pa %pa size 0x%zx va %pK\n", &res->start,
>>> +        (size_t)resource_size(res), intc->base);
>>> +
>>> +    mutex_init(&intc->lock);
>>> +
>>> +    pruss_intc_init(intc);
>>> +
>>> +    irqchip = devm_kzalloc(dev, sizeof(*irqchip), GFP_KERNEL);
>>> +    if (!irqchip)
>>> +        return -ENOMEM;
>>> +
>>> +    irqchip->irq_ack = pruss_intc_irq_ack;
>>> +    irqchip->irq_mask = pruss_intc_irq_mask;
>>> +    irqchip->irq_unmask = pruss_intc_irq_unmask;
>>> +    irqchip->irq_retrigger = pruss_intc_irq_retrigger;
>>> +    irqchip->irq_request_resources = pruss_intc_irq_reqres;
>>> +    irqchip->irq_release_resources = pruss_intc_irq_relres;
>>> +    irqchip->name = dev_name(dev);
>>
>> Should we also set `irqchip->parent_device = dev;` here?
>>
>> I tried it and had to add pm runtime stuff as well, otherwise
>> requesting irqs would fail.
> 
> I haven't seen any during my local testing. What sort of failure are you
> seeing?
> 
> The clocking for the overall PRUSS module will be handled in either the
> ti-sysc driver for OMAP SoCs or in the pruss platform driver.
> 
I was getting -EACCESS bubbling up from rpm_resume() in drivers/base/
power/runtime.c. It was probably a mix of how I set up the device tree
and the dummy PRUSS bus driver I made.

I'm sure it will be fine with a proper PRUSS platform driver.
