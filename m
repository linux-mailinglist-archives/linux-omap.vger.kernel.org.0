Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA887230FED
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 18:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731455AbgG1QiA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 12:38:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731443AbgG1Qh7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Jul 2020 12:37:59 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ABAD2053B;
        Tue, 28 Jul 2020 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954279;
        bh=UaTT6eelrtF58zWytNG0egvpELFC0XFjYD4HTtCZOO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2I46v+1m8oKmJ9VQeo6N0nZjzcRmXs1Ru/C4qbubwOnEDs27BOFW3Kl+HdEPSSiBk
         fu7YtYgh8gzbomyi98+V8kVZYGGWkFSh6gateSBafHcHZIcZ4DjQC26w9JylQyHBzx
         y4cWhePYSIuGjTcYQT0/UjYg1ZER9QYZh1A14SgU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k0Sc1-00FiFS-5h; Tue, 28 Jul 2020 17:37:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 17:37:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, wmills@ti.com, praneeth@ti.com
Subject: Re: [PATCH v4 3/5] irqchip/irq-pruss-intc: Add logic for handling
 reserved interrupts
In-Reply-To: <1595927918-19845-4-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-4-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <1ae8b42d0e7a09caf01197b11cea2fff@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, wmills@ti.com, praneeth@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-07-28 10:18, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The PRUSS INTC has a fixed number of output interrupt lines that are
> connected to a number of processors or other PRUSS instances or other
> devices (like DMA) on the SoC. The output interrupt lines 2 through 9
> are usually connected to the main Arm host processor and are referred
> to as host interrupts 0 through 7 from ARM/MPU perspective.
> 
> All of these 8 host interrupts are not always exclusively connected
> to the Arm interrupt controller. Some SoCs have some interrupt lines
> not connected to the Arm interrupt controller at all, while a few 
> others
> have the interrupt lines connected to multiple processors in which they
> need to be partitioned as per SoC integration needs. For example, 
> AM437x
> and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 
> 5
> connected to the other PRUSS, while AM335x has host interrupt 0 shared
> between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU 
> and
> a DMA controller.
> 
> Add logic to the PRUSS INTC driver to ignore both these shared and
> invalid interrupts.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v3->v4:
> - Due to changes in DT bindings which converts irqs-reserved
>   property from uint8-array to bitmask requested by Rob introduce
>   relevant changes in the driver.
> - Merge the irqs-reserved and irqs-shared to one property since they
>   can be handled by one logic (relevant change was introduced to DT
>   binding).

This isn't what I asked for in my initial review.

I repeatedly asked for the *handling* to be common, not for the
properties to be merged. I don't mind either way, but I understood
there were two properties for a good reason. Has this reason gone?

Anyway, I'll come back to it once I start reviewing the series
again.

          M.
-- 
Jazz is not dead. It just smells funny...
