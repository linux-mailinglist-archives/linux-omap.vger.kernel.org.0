Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E0D34F3D8
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 23:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhC3V6U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Mar 2021 17:58:20 -0400
Received: from fgw22-4.mail.saunalahti.fi ([62.142.5.109]:27197 "EHLO
        fgw22-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232829AbhC3V6K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Mar 2021 17:58:10 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-72-22-nat.elisa-mobile.fi [85.76.72.22])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id beb0906a-91a0-11eb-88cb-005056bdf889;
        Wed, 31 Mar 2021 00:41:56 +0300 (EEST)
Date:   Wed, 31 Mar 2021 00:41:54 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org, tony@atomide.com, linux@armlinux.org.uk,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP1: fix incorrect kernel-doc comment syntax in
 file
Message-ID: <20210330214154.GB120746@darkstar.musicnaut.iki.fi>
References: <20210330205330.26345-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330205330.26345-1-yashsri421@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 02:23:30AM +0530, Aditya Srivastava wrote:
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

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

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
> -- 
> 2.17.1
> 
