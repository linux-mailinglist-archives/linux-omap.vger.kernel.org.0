Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C1F7D7F8
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 10:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfHAIps (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Aug 2019 04:45:48 -0400
Received: from foss.arm.com ([217.140.110.172]:60866 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfHAIps (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Aug 2019 04:45:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1B3337;
        Thu,  1 Aug 2019 01:45:47 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9012E3F694;
        Thu,  1 Aug 2019 01:45:45 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] irqchip/irq-pruss-intc: Add helper functions to
 configure internal mapping
To:     Suman Anna <s-anna@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190731224149.11153-1-s-anna@ti.com>
 <20190731224149.11153-5-s-anna@ti.com>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <1a63eb50-7c5c-eb3d-3cbe-bd1cc59ce3fe@kernel.org>
Date:   Thu, 1 Aug 2019 09:45:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731224149.11153-5-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 31/07/2019 23:41, Suman Anna wrote:
> The PRUSS INTC receives a number of system input interrupt source events
> and supports individual control configuration and hardware prioritization.
> These input events can be mapped to some output interrupt lines through 2
> levels of many-to-one mapping i.e. events to channel mapping and channels
> to output interrupts.
> 
> This mapping information is provided through the PRU firmware that is
> loaded onto a PRU core/s or through the device tree node of the PRU
> application. The mapping is configured by the PRU remoteproc driver, and
> is setup before the PRU core is started and cleaned up after the PRU core
> is stopped. This event mapping configuration logic programs the Channel
> Map Registers (CMRx) and Host-Interrupt Map Registers (HMRx) only when a
> new program is being loaded/started and the same events and interrupt
> channels are reset to zero when stopping a PRU.
> 
> Add two helper functions: pruss_intc_configure() & pruss_intc_unconfigure()
> that the PRU remoteproc driver can use to configure the PRUSS INTC.

So let me see if I correctly understand this: this adds yet another
firmware description parser, with a private interface to another
(undisclosed?) driver, bypassing the standard irqchip configuration
mechanism. It sounds great, doesn't it?

What I cannot really infer from this message (-ETOOMUCHJARGON) is what
interrupts this affects:

- Interrupts from random devices to the PRUSS?
- Interrupts from the PRUSS to the host?
- Something else?

When does this happen? Under control of what? It isn't even clear why
this is part of this irqchip driver.

Depending what this does, there may be ways to fit it into the standard
interrupt configuration framework. After all, we already have standard
interfaces to route interrupts to virtual CPUs, effectively passing full
control of an interrupt to another entity. If you squint hard enough,
your PRUSS can fit that description.

If that doesn't work, then we need to make the IRQ framework grok that
kind of requirement (hence my request for clarification). But I'm
strongly opposed to inventing a SoC-private way of configuring
interrupts behind the kernel's back.

Thanks,

	M.
-- 
Jazz is not dead, it just smells funny...
