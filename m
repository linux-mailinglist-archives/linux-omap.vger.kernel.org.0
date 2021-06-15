Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820D83A82FE
	for <lists+linux-omap@lfdr.de>; Tue, 15 Jun 2021 16:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhFOOiC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Jun 2021 10:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFOOiB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Jun 2021 10:38:01 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D02C06175F
        for <linux-omap@vger.kernel.org>; Tue, 15 Jun 2021 07:35:57 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id x14so25324701ljp.7
        for <linux-omap@vger.kernel.org>; Tue, 15 Jun 2021 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telliq.com; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GbBjUIoFxvaBNvRzYWx5ZKwYntRTHGOfw5r31RdP6mA=;
        b=IMJSq8e5A+lG5eMcFWdHiHrDuLuqhIVnGW0T71EplYsa4Lur3IH8gUjOPcu9BHSbOj
         XOeed467PU2KrYTmMhj6ondu2QLwzwJgyUTSipsYXcmyA+7gM7XgRyzq/TGOYa/7Ktc+
         L7mVSftetjKU2ZmW+VilAwIMA0yj2t1lRGlJ8gpuSEQ7dC6+D1GayrR6FojZOFKWXplb
         wcZaKzZ8gB816jMkaNfn4+wFGf3w7TjerNTGMTZGj1mPO/lW0NaANLJlZ8zoJ8UL8FWY
         zxRSYfrNXVVkWw+vlAaHQcJBW1/BlE2MH1t6ed6AqZtP3HqD2AHgjVT1XxVwwWwSjEFO
         NwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GbBjUIoFxvaBNvRzYWx5ZKwYntRTHGOfw5r31RdP6mA=;
        b=J6584K6+In3hvFYPEFEQUw6XYfx7/j1cfd8Zs++ElTyjLrzgmAASAUw3SD80DmTKEm
         b8vCyTvG8bVst3AoAUEypQB5GIhbDFcsefTcrYBM7pdmvIfs2r9og744upuS4ZUOds7c
         gutRZVGz0+jWo4e5nXWwU5p8fXEMkdHpwPpA7FVTgnZztja+kpdDF7Glwj03BrxC5/7x
         z2yhj60N4E+yIy3zaWPN1IHJkVTWu20zBYtrSgEJkHwsJNJCK1aDz3GxNae723UuCJM6
         BeMZIYHwSmtMiQx10EL24331tIkXxSk3T9TDYlPsR40wdA0sitF9wAP7PU8gdHX9pogt
         un3w==
X-Gm-Message-State: AOAM532qGmQ4nnNUrVNdVwO/KqaeC55rLjFavgVigv5r44nYOr0GD9BZ
        FruCYjkPmngLKTk0r6F3MO5+Sg==
X-Google-Smtp-Source: ABdhPJyqTukCl34ZxxTUg+/JaHiogEsKb1WJUYNUJVIPVwBfYteGIrktkGf6WTUoEXJiOj01+8Gt8w==
X-Received: by 2002:a2e:b0e7:: with SMTP id h7mr18808677ljl.2.1623767753954;
        Tue, 15 Jun 2021 07:35:53 -0700 (PDT)
Received: from polera.kvasta (h77-53-209-86.cust.a3fiber.se. [77.53.209.86])
        by smtp.gmail.com with ESMTPSA id s21sm1824786lfc.269.2021.06.15.07.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 07:35:53 -0700 (PDT)
Subject: Re: [PATCH] arm: Define arch_is_kernel_initmem_freed() for lockdep
From:   Jan Kardell <jan.kardell@telliq.com>
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20210329175318.21393-1-jan.kardell@telliq.com>
Message-ID: <754bde27-df3b-d98e-2ca8-5b16ccdc5345@telliq.com>
Date:   Tue, 15 Jun 2021 16:35:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.7.1
MIME-Version: 1.0
In-Reply-To: <20210329175318.21393-1-jan.kardell@telliq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A ping on this as there is no reply yet. I'm not entirely sure who 
should be on the CC list, or maybe this patch is just forgotten for some 
reason, maybe I should have written a better subject? I don't mean to 
complain, I do know that core developers are very busy!

//Jan

Jan Kardell skrev:
> This fixes the warning:
>
> WARNING: CPU: 0 PID: 1994 at kernel/locking/lockdep.c:1119 alloc_netdev_mqs+0xb4/0x3b0
>
> This warning is because the check in static_obj() assumes that all
> memory within [_stext, _end] belongs to static objects. The init
> section is also part of this range, and freeing it allows the buddy
> allocator to allocate memory from it.
>
> To fix this, define arch_is_kernel_initmem_freed() for arm, it will
> return 1 if initmem has been freed and the address is in the range
> [__init_begin, __init_end], and this function is called by the
> static_obj() function in lockdep.
>
> Tested on TI am3352 (Cortex A8).
>
> This change is modelled after commit 7a5da02de8d6eafba995
> ("locking/lockdep: check for freed initmem in static_obj()") for s390 by
> Gerald Schaefer <gerald.schaefer@linux.ibm.com>
>
> Signed-off-by: Jan Kardell <jan.kardell@telliq.com>
> ---
>   arch/arm/include/asm/sections.h | 13 +++++++++++++
>   arch/arm/mm/init.c              |  6 +++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/include/asm/sections.h b/arch/arm/include/asm/sections.h
> index 700b8bcdf9bd..1dd64c90c1ac 100644
> --- a/arch/arm/include/asm/sections.h
> +++ b/arch/arm/include/asm/sections.h
> @@ -2,6 +2,8 @@
>   #ifndef _ASM_ARM_SECTIONS_H
>   #define _ASM_ARM_SECTIONS_H
>   
> +#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
> +
>   #include <asm-generic/sections.h>
>   
>   extern char _exiprom[];
> @@ -11,6 +13,17 @@ extern char __idmap_text_end[];
>   extern char __entry_text_start[];
>   extern char __entry_text_end[];
>   
> +extern bool initmem_freed;
> +
> +static inline int arch_is_kernel_initmem_freed(unsigned long addr)
> +{
> +	if (!initmem_freed)
> +		return 0;
> +	return addr >= (unsigned long)__init_begin &&
> +	       addr < (unsigned long)__init_end;
> +}
> +
> +
>   static inline bool in_entry_text(unsigned long addr)
>   {
>   	return memory_contains(__entry_text_start, __entry_text_end,
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 828a2561b229..cd7a4273797a 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -41,6 +41,8 @@
>   
>   #include "mm.h"
>   
> +bool initmem_freed;
> +
>   #ifdef CONFIG_CPU_CP15_MMU
>   unsigned long __init __clear_cr(unsigned long mask)
>   {
> @@ -523,8 +525,10 @@ void free_initmem(void)
>   	fix_kernmem_perms();
>   
>   	poison_init_mem(__init_begin, __init_end - __init_begin);
> -	if (!machine_is_integrator() && !machine_is_cintegrator())
> +	if (!machine_is_integrator() && !machine_is_cintegrator()) {
> +		initmem_freed = true;
>   		free_initmem_default(-1);
> +	}
>   }
>   
>   #ifdef CONFIG_BLK_DEV_INITRD

