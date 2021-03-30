Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C4F34F2C0
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 23:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhC3VFf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Mar 2021 17:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbhC3VFd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Mar 2021 17:05:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3EFC061574;
        Tue, 30 Mar 2021 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=n6MY9RJyc519hB+O3xAcfsPoosUq/Ub7s3jI4orlYqg=; b=DGMpjjZdEM899ZiaIkxW/6v/64
        LKO23qZZwq5b7yd2zn8sTHoVyQMSEdX3+LFh/A6Y1bzYh1oN82dXRe3tqL3duDQAXVl1B3Y3/af/o
        7oi9QreFC2VfPwvG4vKkX49lTwYSLNfBaXSSdOjZxEyKXwaTKzAEgIwp2R2Wc/fjjU3ifUpXUNmUr
        06KP2XDCy+ufVBIuIcl2uxbOvrodIeFTrDPzDRZqpoBkB81BtBIX83eqyw/L2pH0ezHQwSisj+L4j
        g6obsVdTQY+srFsKrkMPB2+fKxPdXw3MmMavevyTCCDcT/FP2ueEZtpc/aMHS4pgPv0dW3lX7uP43
        ctyMm7TQ==;
Received: from [2601:1c0:6280:3f0::4557]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lRLY1-003bdb-Fy; Tue, 30 Mar 2021 21:05:15 +0000
Subject: Re: [PATCH] ARM: OMAP2+: fix incorrect kernel-doc comment syntax in
 file
To:     Aditya Srivastava <yashsri421@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     lukas.bulwahn@gmail.com, tony@atomide.com, linux@armlinux.org.uk,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210330205908.26800-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <553c1956-d6fa-0540-c3d6-c2aa59d8ccd7@infradead.org>
Date:   Tue, 30 Mar 2021 14:05:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330205908.26800-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 3/30/21 1:59 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for arch/arm/mach-omap2/omap_twl.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: wrong kernel-doc identifier on line:
>  * OMAP and TWL PMIC specific initializations."
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> * Applies perfectly on next-20210326
> 
>  arch/arm/mach-omap2/omap_twl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
> index a642d3b39e50..d4dab041324d 100644
> --- a/arch/arm/mach-omap2/omap_twl.c
> +++ b/arch/arm/mach-omap2/omap_twl.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * OMAP and TWL PMIC specific initializations.
>   *
>   * Copyright (C) 2010 Texas Instruments Incorporated.
> 


-- 
~Randy

