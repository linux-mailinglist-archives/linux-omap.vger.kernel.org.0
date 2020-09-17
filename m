Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B613226D969
	for <lists+linux-omap@lfdr.de>; Thu, 17 Sep 2020 12:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIQKpO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Sep 2020 06:45:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:55282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgIQKpL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Sep 2020 06:45:11 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B6802074B;
        Thu, 17 Sep 2020 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600339510;
        bh=Y3pNyjgpqIuPmidpfw5syd0Vtwjq4sR1GRHDIvultYU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uZM3YnUfcF23+TJ0a0nblZ4x9bUao61YD2kRnz0gDu5l74v5xplkAWK4CZzWKZTwY
         JhxlawsmeVyf3smotvrKUrWA3Ge+WYhZwgcAZshKunNVU/4e3ZJjPVmwkqiLbfnUkX
         4KTFGgpTlgOwTjVh+x74i3YRJ8kcpToc480koSdY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIrPY-00Cbmd-Co; Thu, 17 Sep 2020 11:45:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 11:45:08 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, praneeth@ti.com
Subject: Re: [PATCH v7 0/5] Add TI PRUSS Local Interrupt Controller IRQChip
 driver
In-Reply-To: <1600274110-30384-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1600274110-30384-1-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <9797030dd2c11b24ae0f7ef760f12ffa@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, praneeth@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-09-16 17:35, Grzegorz Jaszczyk wrote:
> Hi All,
> 
> The following is a v7 version of the series [1-6] that adds an IRQChip
> driver for the local interrupt controller present within a Programmable
> Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS) 
> present on a
> number of TI SoCs including OMAP architecture based AM335x, AM437x, 
> AM57xx SoCs,
> Keystone 2 architecture based 66AK2G SoCs, Davinci architecture based
> OMAP-L138/DA850 SoCs and the latest K3 architecture based AM65x and 
> J721E SoCs.
> Please see the v1 cover-letter [1] for details about the features of 
> this
> interrupt controller.  More details can be found in any of the 
> supported SoC
> TRMs.  Eg: Chapter 30.1.6 of AM5728 TRM [7]
> 
> Please see the individual patches for exact changes in each patch, 
> following are
> the main changes from v5:
>  - Add Co-developed-by tags.
>  - Change the irq type to IRQ_TYPE_LEVEL_HIGH in patch #2.

Applied to irq/irqchip-next.

         M.
-- 
Jazz is not dead. It just smells funny...
