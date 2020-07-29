Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF14232568
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jul 2020 21:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2T2u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jul 2020 15:28:50 -0400
Received: from vern.gendns.com ([98.142.107.122]:38636 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgG2T2t (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Jul 2020 15:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5SF0hS7MkjQG4xi6yfTw/jT+y1owMkznxqXdW5rNR2k=; b=vbKl+EIC0kzrXinDsh/59cXAl4
        YimkBAX2zxmID/NFwzUOLOxnaNLnLIA9z2jcu0tZJl30l0SHZ3J2gZVK9fKFG0VHoFf7k95UCf8FF
        1gESSNMTIrDicWkGdc3CJpfc6siwX6V+hBZlbOC74qwiNoMiDrD0dj9AIBgOvQ7KCFrP6GNe35dxR
        yDGfkFW5KJwRFhKJPIO4qSy421F7quO45Wfqpxo25tU0FZxAKYZEoHa4ghbZT5KyF+WbGzhXyjjRt
        ZNKcWWEtNSP96nRv/LESXfrJ1pnuY5uX4Z6jlw/RNtmQ4hbVTT4uvH9w/HBmK6gX5h+1sCj5vaDwU
        chZQfrZA==;
Received: from [2600:1700:4830:165f::19e] (port=43762)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1k0rkq-0004vP-Os; Wed, 29 Jul 2020 15:28:44 -0400
Subject: Re: [PATCH v4 5/5] irqchip/irq-pruss-intc: Add support for ICSSG INTC
 on K3 SoCs
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wmills@ti.com, praneeth@ti.com
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-6-git-send-email-grzegorz.jaszczyk@linaro.org>
From:   David Lechner <david@lechnology.com>
Message-ID: <015909fa-794c-c938-d944-897985475d20@lechnology.com>
Date:   Wed, 29 Jul 2020 14:28:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595927918-19845-6-git-send-email-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/28/20 4:18 AM, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
> more System Events (160 vs 64), more Interrupt Channels and Host Interrupts
> (20 vs 10) compared to the previous generation PRUSS INTC instances. The
> first 2 and the last 10 of these host interrupt lines are used by the
> PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
> host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
> connected to the other ICSSG instances within the SoC and can be
> partitioned as per system integration through the board dts files.
> 
> Enhance the PRUSS INTC driver to add support for this ICSSG INTC
> instance.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---

There is not much left in this patch. Might as well squash this into
"irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS interrupts".
