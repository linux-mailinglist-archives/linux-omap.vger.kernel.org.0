Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA0234F2BD
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 23:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhC3VFD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Mar 2021 17:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhC3VEm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Mar 2021 17:04:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7347C061574;
        Tue, 30 Mar 2021 14:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=euTTesbzVR00GDS4Ft/U7Wvk3VTeidIgD7ogYbyCtNE=; b=BRtMeFgVCupXz+esUdChwaKdY/
        ZdO7aY20v9OH0yPOUTyWxPY1xRBVGm46Cj6fW0V3pSgwMSP+QqzgFzK52eIlm6E1rLd4ksgYM6MBy
        5szLkRj0mQI6eQAFPTMzQKKgnwAOaNU0TT+NCyGaIQ2tY3dAEtHYa+jfjGD6YxVOPP9IlPraeeX4C
        p4f8TYDTXm3gp/Qa9zR/rbfjp62qs8iiu42rgGYAuHA9h+bJo60lRA7qGpIliqhRTajhwadEh4WTZ
        FabJ337qpFOouIe6xC5EoM8uhB6d46MLM9zvw0AiRwaZjzl41h2i2qNGn85nRZgsYlpVxC4boyBif
        a1ZMLzLw==;
Received: from [2601:1c0:6280:3f0::4557]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lRLWz-003bWm-QK; Tue, 30 Mar 2021 21:04:19 +0000
Subject: Re: [PATCH] ARM: OMAP1: fix incorrect kernel-doc comment syntax in
 file
To:     Aditya Srivastava <yashsri421@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     lukas.bulwahn@gmail.com, aaro.koskinen@iki.fi, tony@atomide.com,
        linux@armlinux.org.uk,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
References: <20210330205330.26345-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1a8710c7-e711-d0b7-229a-3b7ad207e678@infradead.org>
Date:   Tue, 30 Mar 2021 14:04:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330205330.26345-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 3/30/21 1:53 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for arch/arm/mach-omap1/timer.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: expecting prototype for OMAP1 Dual(). Prototype was for OMAP1610_GPTIMER1_BASE() instead"
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> * Applies perfectly on next-20210326
> 
>  arch/arm/mach-omap1/timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap1/timer.c b/arch/arm/mach-omap1/timer.c
> index 97fc2096b970..0411d5508d63 100644
> --- a/arch/arm/mach-omap1/timer.c
> +++ b/arch/arm/mach-omap1/timer.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * OMAP1 Dual-Mode Timers - platform device registration
>   *
>   * Contains first level initialization routines which internally
> 


-- 
~Randy

