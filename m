Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DF222D8AC
	for <lists+linux-omap@lfdr.de>; Sat, 25 Jul 2020 18:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgGYQ17 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Jul 2020 12:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:43210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgGYQ17 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 25 Jul 2020 12:27:59 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E271B20674;
        Sat, 25 Jul 2020 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595694479;
        bh=ZGJ9wovlL834zONXF71oiA5DPaPlldIbIJTnUFfLbWA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=j+FD0H/s0WZrA68Cw9sGGZr0JfKFpXkdH4Yo6gQxeOovekdRKCdH3DIvI6/eYQwjF
         psSPh7Wf3FpfpBwBiXLrDYzhvnDkW+YiMKgNamA5fxSSg9VLcFjcsWYiVEsmt1v2Au
         TMJMspVjcBGPdnPthbXM/8Pb7L+R9DAaj8jUn+F8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jzN1h-00Es3k-9y; Sat, 25 Jul 2020 17:27:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sat, 25 Jul 2020 17:27:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com
Subject: Re: [PATCHv3 3/6] irqchip/irq-pruss-intc: Add support for shared and
 invalid interrupts
In-Reply-To: <14a0978a-f38f-8cd7-3fee-b0e438513396@ti.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-4-git-send-email-grzegorz.jaszczyk@linaro.org>
 <2a6b0391f1395eb0aa15ffee6769184e@kernel.org>
 <3a73bb14-9f7b-970d-fbae-f9c7bb7bdf1e@ti.com> <87imemxv3l.wl-maz@kernel.org>
 <14a0978a-f38f-8cd7-3fee-b0e438513396@ti.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <1cd0b6c9bfe2dc42e9c6b69baacf4635@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: s-anna@ti.com, grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, wmills@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-07-25 16:57, Suman Anna wrote:

Suman,

> Hi Marc,

[...]

>>>>> @@ -244,8 +295,14 @@ static int pruss_intc_probe(struct
>>>>> platform_device *pdev)
>>>>>           return -ENOMEM;
>>>>> 
>>>>>       for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>>>>> +        if (intc->invalid_intr & BIT(i))
>>>>> +            continue;
>>>>> +
>>>>>           irq = platform_get_irq_byname(pdev, irq_names[i]);
>>>>>           if (irq <= 0) {
>>>>> +            if (intc->shared_intr & BIT(i))
>>>>> +                continue;
>>>> 
>>>> I don't really understand why you are treating these "shared" 
>>>> interrupts
>>>> differently from the invalid ones. In all cases, they shouldn't be 
>>>> used.
>>> 
>>> The behavior is the same in how we handle it, but the difference is
>>> that an "invalid" one is never even connected to the ARM interrupt
>>> controller, while the "shared" one is a choice. So, unless this
>>> interrupt is being used/handled by a different processor/entity, you
>>> would not see this skipped from the dts node.
>> 
>> And I'm saying that all that matters is that you are discarding these
>> interrupts. Whether they are flagged invalid or shared, they are not
>> available to Linux. So the difference in handling is pointless and
>> only makes it harder to understand what you are doing.
> 
> The primary reason for using two properties and this logic was to
> accurately describe the h/w and usage of these in the DT bindings to
> distinguish the "never connected" vs the "optionally can be skipped"
> interrupts rather than go by how these are handled in the driver. I
> feel we will loose this description and make it confusing for SoC
> product integration developers.

This logic makes zero difference to Linux, and I do not see what
you gain by having two code paths with separate list of unusable
interrupts. And why on Earth would a "Soc product integration
developer" have any business to mess with this driver code?
They should very much stay away from it and deal with their
precious value add.

If you want two properties or even twenty, go for it, and have fun.
Just don't make this driver even more unreadable than it already is.
Merge all these interrupts in *one* list of unusable interrupts,
and be done with it.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
