Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669E1214F89
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 22:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgGEUpj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 16:45:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728326AbgGEUpi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 5 Jul 2020 16:45:38 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E85012068F;
        Sun,  5 Jul 2020 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593981938;
        bh=PzWD9Q9qreaWguzKmtjZ782UP/42e9+9BUsUmRGeEjw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=wiVQ9fZXiEvK6iYxV3uu+0ZPPkTnV1ZHaQrQLHuSeweFITpQJFM/C3jpPqsviLrUv
         NpvGv268nwsmfPFOREOzuVh1XoHSDSPJyyHXH5Z41YznUTDuVSghg9v9zfPrGQVppW
         ovq36YQgJcNzfurQ3iqsL3VMyL80SUEsAFKuqxq4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jsBW4-009Fhz-Ge; Sun, 05 Jul 2020 21:45:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 05 Jul 2020 21:45:36 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
In-Reply-To: <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org>
 <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org>
 <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, wmills@ti.com, afd@ti.com, rogerq@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-07-05 14:26, Grzegorz Jaszczyk wrote:
> On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:

[...]

>> It still begs the question: if the HW can support both edge and level
>> triggered interrupts, why isn't the driver supporting this diversity?
>> I appreciate that your HW may only have level interrupts so far, but
>> what guarantees that this will forever be true? It would imply a 
>> change
>> in the DT binding, which isn't desirable.
> 
> Ok, I've got your point. I will try to come up with something later
> on. Probably extending interrupt-cells by one and passing interrupt
> type will be enough for now. Extending this driver to actually support
> it can be handled later if needed. Hope it works for you.

Writing a set_type callback to deal with this should be pretty easy.
Don't delay doing the right thing.

[...]

>> >> > +             hwirq = hipir & GENMASK(9, 0);
>> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
>> >>
>> >> And this is where I worry. You seems to have a single irqdomain
>> >> for all the muxes. Are you guaranteed that you will have no
>> >> overlap between muxes? And please use irq_find_mapping(), as
>> >> I have top-secret plans to kill irq_linear_revmap().
>> >
>> > Regarding irq_find_mapping - sure.
>> >
>> > Regarding irqdomains:
>> > It is a single irqdomain since the hwirq (system event) can be mapped
>> > to different irq_host (muxes). Patch #6
>> > https://lkml.org/lkml/2020/7/2/616 implements and describes how input
>> > events can be mapped to some output host interrupts through 2 levels
>> > of many-to-one mapping i.e. events to channel mapping and channels to
>> > host interrupts. Mentioned implementation ensures that specific system
>> > event (hwirq) can be mapped through PRUSS specific channel into a
>> > single host interrupt.
>> 
>> Patch #6 is a nightmare of its own, and I haven't fully groked it yet.
>> Also, this driver seems to totally ignore the 2-level routing. Where
>> is it set up? map/unmap in this driver do exactly *nothing*, so
>> something somewhere must set it up.
> 
> The map/unmap is updated in patch #6 and it deals with those 2-level
> routing setup. Map is responsible for programming the Channel Map
> Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
> provided configuration from the one parsed in the xlate function.
> Unmap undo whatever was done on the map. More details can be found in
> patch #6.
> 
> Maybe it would be better to squash patch #6 with this one so it would
> be less confusing. What is your advice?

So am I right in understanding that without patch #6, this driver does
exactly nothing? If so, it has been a waste of review time.

Please split patch #6 so that this driver does something useful
for Linux, without any of the PRU interrupt routing stuff. I want
to see a Linux-only driver that works and doesn't rely on any other
exotic feature.

         M.
-- 
Jazz is not dead. It just smells funny...
