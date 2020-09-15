Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84926A8A0
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 17:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgIOPUA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 11:20:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgIOPTj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 15 Sep 2020 11:19:39 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E82B2074B;
        Tue, 15 Sep 2020 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600183159;
        bh=+SQGJDtXngzEixASBW9Ix71E6mn0ETBIHvgUP43qm7g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nTuMjKWR5/yWZF5DdQbq9r6UpctkMQGPzogngUsiIXikU1KbJ+N8/MkBiNk6yuT8/
         vcRxeJcLCX7RusrzHai/ZgX0Orh1/oBhRMMA37VWMT60eHKayT+nQB7ML9nso+dqJu
         /cBA8hGkLvXcH83Jt0zAUdH56Q4IX2Ni5jM/uCrE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kICjl-00C2sC-Hx; Tue, 15 Sep 2020 16:19:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Sep 2020 16:19:17 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, praneeth@ti.com,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v6 2/5] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
In-Reply-To: <1600167651-20851-3-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1600167651-20851-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1600167651-20851-3-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <ab6858f56cf47e48f167d6893bcd3043@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, praneeth@ti.com, rogerq@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

[ Dropping afd@ti.com from the Cc list, as this address bounces]

On 2020-09-15 12:00, Grzegorz Jaszczyk wrote:
> The Programmable Real-Time Unit Subsystem (PRUSS) contains a local
> interrupt controller (INTC) that can handle various system input events
> and post interrupts back to the device-level initiators. The INTC can
> support upto 64 input events with individual control configuration and
> hardware prioritization. These events are mapped onto 10 output 
> interrupt
> lines through two levels of many-to-one mapping support. Different
> interrupt lines are routed to the individual PRU cores or to the host
> CPU, or to other devices on the SoC. Some of these events are sourced
> from peripherals or other sub-modules within that PRUSS, while a few
> others are sourced from SoC-level peripherals/devices.
> 
> The PRUSS INTC platform driver manages this PRUSS interrupt controller
> and implements an irqchip driver to provide a Linux standard way for
> the PRU client users to enable/disable/ack/re-trigger a PRUSS system
> event. The system events to interrupt channels and output interrupts
> relies on the mapping configuration provided either through the PRU
> firmware blob (for interrupts routed to PRU cores) or via the PRU
> application's device tree node (for interrupt routed to the main CPU).
> In the first case the mappings will be programmed on PRU remoteproc
> driver demand (via irq_create_fwspec_mapping) during the boot of a PRU
> core and cleaned up after the PRU core is stopped.
> 
> Reference counting is used to allow multiple system events to share a
> single channel and to allow multiple channels to share a single host
> event.
> 
> The PRUSS INTC module is reference counted during the interrupt
> setup phase through the irqchip's irq_request_resources() and
> irq_release_resources() ops. This restricts the module from being
> removed as long as there are active interrupt users.
> 
> The driver currently supports and can be built for OMAP architecture
> based AM335x, AM437x and AM57xx SoCs; Keystone2 architecture based
> 66AK2G SoCs and Davinci architecture based OMAP-L13x/AM18x/DA850 SoCs.
> All of these SoCs support 64 system events, 10 interrupt channels and
> 10 output interrupt lines per PRUSS INTC with a few SoC integration
> differences.
> 
> NOTE:
> Each PRU-ICSS's INTC on AM57xx SoCs is preceded by a Crossbar that
> enables multiple external events to be routed to a specific number
> of input interrupt events. Any non-default external interrupt event
> directed towards PRUSS needs this crossbar to be setup properly.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: David Lechner <david@lechnology.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>

Please see the use of the Co-developed-by: tag.

> ---
> v5->v6:
> 1) Address Marc Zyngier comments:
> - Use unsigned types for variables used to compute masks/shifts (ch,
>   evt, host).
> - Move part responsible for enabling global interrupt from
>   pruss_intc_map to pruss_intc_init.
> - Improve coding style in pruss_intc_init with regards to variable
>   assignments.
> - Align the '=' signs vertically in pruss_irqchip structure.
> - Change the irq type in xlate handler from IRQ_TYPE_NONE to
>   IRQ_TYPE_LEVEL_MASK

Gruik? (yes, that's approximately the noise I made reading this)

[...]

> +static void pruss_intc_init(struct pruss_intc *intc)
> +{
> +	const struct pruss_intc_match_data *soc_config = intc->soc_config;
> +	int num_chnl_map_regs, num_host_intr_regs, num_event_type_regs, i;
> +
> +	num_chnl_map_regs = DIV_ROUND_UP(soc_config->num_system_events,
> +					 CMR_EVT_PER_REG);
> +	num_host_intr_regs = DIV_ROUND_UP(soc_config->num_host_events,
> +					  HMR_CH_PER_REG);
> +	num_event_type_regs = DIV_ROUND_UP(soc_config->num_system_events, 
> 32);
> +
> +	/*
> +	 * configure polarity (SIPR register) to active high and
> +	 * type (SITR register) to level interrupt for all system events
> +	 */

So I read this...

[...]

> +static int
> +pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node 
> *node,
> +			    const u32 *intspec, unsigned int intsize,
> +			    unsigned long *out_hwirq, unsigned int *out_type)
> +{
> +	struct pruss_intc *intc = d->host_data;
> +	struct device *dev = intc->dev;
> +	int ret, sys_event, channel, host;
> +
> +	if (intsize < 3)
> +		return -EINVAL;
> +
> +	sys_event = intspec[0];
> +	if (sys_event < 0 || sys_event >= 
> intc->soc_config->num_system_events) {
> +		dev_err(dev, "%d is not valid event number\n", sys_event);
> +		return -EINVAL;
> +	}
> +
> +	channel = intspec[1];
> +	if (channel < 0 || channel >= intc->soc_config->num_host_events) {
> +		dev_err(dev, "%d is not valid channel number", channel);
> +		return -EINVAL;
> +	}
> +
> +	host = intspec[2];
> +	if (host < 0 || host >= intc->soc_config->num_host_events) {
> +		dev_err(dev, "%d is not valid host irq number\n", host);
> +		return -EINVAL;
> +	}
> +
> +	/* check if requested sys_event was already mapped, if so validate it 
> */
> +	ret = pruss_intc_validate_mapping(intc, sys_event, channel, host);
> +	if (ret)
> +		return ret;
> +
> +	*out_hwirq = sys_event;
> +	*out_type = IRQ_TYPE_LEVEL_MASK;

... and then I see that.

What does IRQ_TYPE_LEVEL_MASK even mean? Can the interrupt be triggered 
as
level high and low *at the same time*? (this is a rhetorical question).

         M.
-- 
Jazz is not dead. It just smells funny...
