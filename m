Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E61E471783
	for <lists+linux-omap@lfdr.de>; Sun, 12 Dec 2021 02:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhLLBVV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Dec 2021 20:21:21 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43830 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229622AbhLLBVV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 11 Dec 2021 20:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kfXiGbifsNlas8MXnGNwccDNGaLpk9F4wZOQCojkuv8=; b=hlfA3oVowhf6j9DAac9xEtD3ot
        EZ8rkD83QU2SN8LasXWahBhi6LPc1bVww4XWuf0BRhJCUBVA7YfRzQCUcEXlZSzmXGBhequlPXHNZ
        e63MJBZSJiStgbbJ4HkvGI69/Pd3o9LCyzcyqC6jU74+MPoTjfK4fCUhZQH5h6sGG8Ms4JbBLMNjw
        GUg7wsfYgTcd29FXGByQiKk6d5QNJPSy6jUvL/drg/OUSKRXAHS2EI3GksxGP0dxu2mmiyRw7S2O1
        hJejKp09pEr5sKKhS/MyIlgJ1a8cPivIOChiPPGmzf6uRVpfBnaR6uB4ZvaD/3oHX9w7yeFxRnxsv
        V2dMyMXQ==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mwDY2-0001Ew-Lm; Sun, 12 Dec 2021 01:21:06 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, zhangqilong3@huawei.com,
        jingxiangfeng@huawei.com, Tony Lindgren <tony@atomide.com>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
References: <4ed95c71-2066-6b4c-ad1b-53ef02d79d53@wizzup.org>
 <20211208210706.GB12125@duo.ucw.cz>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: Oops in ssi (through nokia-modem)
Message-ID: <5780923a-315d-d65e-6bcf-ef2a5a3002bc@wizzup.org>
Date:   Sun, 12 Dec 2021 02:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208210706.GB12125@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian, Pavel,

On 08/12/2021 22:07, Pavel Machek wrote:
> Hi!
> 
>> As soon as nokia-modem on my Nokia N900 gets used, I get the following
>> warning, followed by an oops [1]. I believe the nokia-modem module is
>> probed with the "pm=1" argument, but that doesn't seem particularly
>> important given the trace, I think.
> 
> Actually, it seems two warnings and an oops.
> 
>>> [  165.467529] IPv6: ADDRCONF(NETDEV_CHANGE): phonet0: link becomes ready
>>> [  165.498687] ------------[ cut here ]------------
>>> [  165.503417] WARNING: CPU: 0 PID: 662 at kernel/dma/mapping.c:188 __dma_map_sg_attrs+0xd8/0x100
> 
> This one should be easy. __dma_map_sg_attrs
> 
>         if (WARN_ON_ONCE(!dev->dma_mask))
> 		return 0;
> 
> someone forgot to set the mask. ssi_start_dma() has some dev_dbgs,
> could you make sure they end up in the logs?
> 
> Maybe it is as simple as adding dma_set_mask() somehwere?
> dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)); ?
> 
> 
>>> [  165.787841] ---[ end trace a3f2b689bab17aa5 ]---
>>> [  166.436523] irq 26: nobody cared (try booting with the "irqpoll" option)
>>> [  166.443298] CPU: 0 PID: 662 Comm: irq/83-SSI PORT Tainted: G        W         5.15.2-218696-g31e48a7f0946-dirty #1
>>> [  166.453704] Hardware name: Nokia RX-51 board
> 
> Second warning here. We don't have handler for irq 26. 
> 
>>> [  166.593566] 8<--- cut here ---
>>> [  166.600799] Unable to handle kernel NULL pointer dereference at virtual address 00000000
>>> [  166.608978] pgd = 34df813c
>>> [  166.611724] [00000000] *pgd=00000000
> 
> And now the oops...

It looks like the warnings and oops go together. I realised that v5.9
was fine, linux-5.9.y (stable) was not, so I did a bisect on that, and
found this commit (upstream commit in the description).

> $ git bisect good
> 4e57482e8440fac7137832629109730ea4b267aa is the first bad commit
> commit 4e57482e8440fac7137832629109730ea4b267aa
> Author: Thomas Tai <thomas.tai@oracle.com>
> Date:   Thu Sep 17 18:43:03 2020 +0200
> 
>     dma-direct: Fix potential NULL pointer dereference
> 
>     [ Upstream commit f959dcd6ddfd29235030e8026471ac1b022ad2b0 ]
> 
>     When booting the kernel v5.9-rc4 on a VM, the kernel would panic when
>     printing a warning message in swiotlb_map(). The dev->dma_mask must not
>     be a NULL pointer when calling the dma mapping layer. A NULL pointer
>     check can potentially avoid the panic.
> 
>     Signed-off-by: Thomas Tai <thomas.tai@oracle.com>
>     Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
>  include/linux/dma-direct.h |  3 ---
>  kernel/dma/mapping.c       | 11 +++++++++++
>  2 files changed, 11 insertions(+), 3 deletions(-)

So it sounds like setting the dev->dma_mask in the driver is the right
fix, as Pavel suggested. The commit returns an error when the mask is
NULL and that is probably what causes the oops later on. I'll try look
at fixing this soon, unless someone beats me to it. I suppose we'll want
this potential fix in the stable trees as well.

Regards,
Merlijn
