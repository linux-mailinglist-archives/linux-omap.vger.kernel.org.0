Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D3A212BB9
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 19:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgGBR7E (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 13:59:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbgGBR7E (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 13:59:04 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52A9720737;
        Thu,  2 Jul 2020 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593712743;
        bh=LiNf/oCR5xMtevLJEVXBqNNKcCAHHJBxiwRz04agoFc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jMpwBH2mioxgNjTAwQkjJpfcUhIWXt5XWb5sP5oVkYJrQGOWeo/mDsBSAdUW8bYVt
         SHUK1h9zjeZY8/04WvNLGrfO1ARjnvt/hkXzAZBd7rTxWVFX4sds6Va2oJRR3Qinsy
         y1Z1l9rvas+7lJv5H4aNTynD1JdD9fMiINsNcW8Y=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jr3UD-008VH4-L0; Thu, 02 Jul 2020 18:59:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 02 Jul 2020 18:59:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, wmills@ti.com
Subject: Re: [PATCHv3 5/6] irqchip/irq-pruss-intc: Add support for ICSSG INTC
 on K3 SoCs
In-Reply-To: <1593699479-1445-6-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-6-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <d1b232c6f33a629117a2ecbd440622d0@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, wmills@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS 
> IP,
> commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
> more System Events (160 vs 64), more Interrupt Channels and Host 
> Interrupts
> (20 vs 10) compared to the previous generation PRUSS INTC instances. 
> The
> first 2 and the last 10 of these host interrupt lines are used by the
> PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
> host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
> connected to the other ICSSG instances within the SoC and can be
> partitioned as per system integration through the board dts files.
> 
> Enhance the PRUSS INTC driver to add support for this ICSSG INTC
> instance. This support is added using specific compatible and match
> data and updating the code to use this data instead of the current
> hard-coded macros. The INTC config structure is updated to use the
> higher events and channels on all SoCs, while limiting the actual
> processing to only the relevant number of events/channels/interrupts.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v2->v3:
> - Change patch order: use it directly after "irqchip/irq-pruss-intc:
>   Implement irq_{get,set}_irqchip_state ops" and before new
>   "irqchip/irq-pruss-intc: Add event mapping support" in order to 
> reduce
>   diff.

The diff would be even smaller if you introduced a variable number of
inputs the first place, i.e. in patch #2. Most if this patch just
retrofits it. Please squash these changes into that initial patch,
and only add the platform stuff here.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
