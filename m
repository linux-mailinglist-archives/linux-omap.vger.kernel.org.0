Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E488268F95
	for <lists+linux-omap@lfdr.de>; Mon, 14 Sep 2020 17:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgINPVS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Sep 2020 11:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgINPUw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Sep 2020 11:20:52 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBE7820639;
        Mon, 14 Sep 2020 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600096852;
        bh=SxgwuzST+JSvYJRya+PVcp2/F0AEFrRW37h2Gsc+7V0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yXjmEl6lYb+CMo9qlJJ1g4ZfKswQatENxl/z8bFZseaoC6wuWzREtpR7VZX8HHY5W
         ko72GcE7VHXAL9yPyvBjSmxAj0DOLKxnEFWna/wanDwU/RCJm/wQ2VaGfnKqPO5lTi
         ahwagrDpRpMCXfZqNLBXFqk5CaGYnXOa98S7oumU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kHqHh-00Bj4r-Sy; Mon, 14 Sep 2020 16:20:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 14 Sep 2020 16:20:49 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        David Lechner <david@lechnology.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: Re: [RESEND PATCH v5 2/5] irqchip/irq-pruss-intc: Add a PRUSS irqchip
 driver for PRUSS interrupts
In-Reply-To: <CAMxfBF6Qj=_uVA5t2mEkncRQ3jb+ZZZtc0=qvw7YsZzxCw-UfQ@mail.gmail.com>
References: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1598886558-16546-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <87mu1vl46q.wl-maz@kernel.org>
 <CAMxfBF6Qj=_uVA5t2mEkncRQ3jb+ZZZtc0=qvw7YsZzxCw-UfQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <98edb75abcd08e93b46c7b6dcf26ad23@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, praneeth@ti.com, afd@ti.com, rogerq@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-09-14 15:57, Grzegorz Jaszczyk wrote:
> On Sat, 12 Sep 2020 at 11:44, Marc Zyngier <maz@kernel.org> wrote:

[...]

>> > +static void pruss_intc_update_cmr(struct pruss_intc *intc, int evt, s8 ch)
>> > +{
>> > +     u32 idx, offset, val;
>> > +
>> > +     idx = evt / CMR_EVT_PER_REG;
>> > +     offset = (evt % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS;
>> > +
>> > +     val = pruss_intc_read_reg(intc, PRU_INTC_CMR(idx));
>> > +     val &= ~(CMR_EVT_MAP_MASK << offset);
>> > +     val |= ch << offset;
>> 
>> Why is 'ch' a signed value? Shifting a signed value, specially when
>> casing it to a larger, unsigned type definitely is in UB territory.
>> Similar funnies can be said about evt.
>> 
>> And given that the caller does use unsigned types, you really are
>> asking for trouble. Please fix this.
> 
> Sure, thank you for pointing this out - I will change to u8.

Please change evt too. Anything that is used to compute masks/shifts
should be unsigned.

[...]

>> > +static void pruss_intc_init(struct pruss_intc *intc)
>> > +{
>> > +     const struct pruss_intc_match_data *soc_config = intc->soc_config;
>> > +     int i;
>> > +     int num_chnl_map_regs = DIV_ROUND_UP(soc_config->num_system_events,
>> > +                                          CMR_EVT_PER_REG);
>> > +     int num_host_intr_regs = DIV_ROUND_UP(soc_config->num_host_events,
>> > +                                           HMR_CH_PER_REG);
>> > +     int num_event_type_regs =
>> > +                     DIV_ROUND_UP(soc_config->num_system_events, 32);
>> 
>> Please keep assignments on a single line.
> 
> Keeping entire assignment in single line will break the 80 columns
> rule, what about changing it into:

There is no such thing as a "80 column rule". As I often say, I no
longer own a vt100.

> 
> -       int i;
> -       int num_chnl_map_regs = 
> DIV_ROUND_UP(soc_config->num_system_events,
> -                                            CMR_EVT_PER_REG);
> -       int num_host_intr_regs = 
> DIV_ROUND_UP(soc_config->num_host_events,
> -                                             HMR_CH_PER_REG);
> -       int num_event_type_regs =
> -                       DIV_ROUND_UP(soc_config->num_system_events, 
> 32);
> +       int num_chnl_map_regs, num_host_intr_regs, num_event_type_regs, 
> i;
> +
> +       num_chnl_map_regs = DIV_ROUND_UP(soc_config->num_system_events,
> +                                        CMR_EVT_PER_REG);
> +       num_host_intr_regs = DIV_ROUND_UP(soc_config->num_host_events,
> +                                         HMR_CH_PER_REG);
> +       num_event_type_regs = 
> DIV_ROUND_UP(soc_config->num_system_events, 32);
> 
> Will it be ok?

Sure.

         M.
-- 
Jazz is not dead. It just smells funny...
