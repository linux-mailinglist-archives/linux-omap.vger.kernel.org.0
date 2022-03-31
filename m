Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6214EE10F
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 20:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbiCaStk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 14:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbiCaStj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 14:49:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DEA232D06
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 11:47:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A019261935
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2E2C34110
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648752471;
        bh=7xDJaNRUpPqJLT84KClpQ7MSAGa9wdBl09p00xR3Vo0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tLzkp5pNGXfH3tDwY66LWZM0hzooyON2pNPpjjQXeumSQFm6QQdqu6MjqVlIFl8cU
         Re+8zmG0bnRGf/S0KuUChyXLGMMLUvblJuLu29i6gRyHLB+WCOcd6tc9jiJwpqGJAG
         s3vuSXVR3RxrW9Lqal2J4XEtn/d2mjTqnayuQjGqlWjRAxXt3uvcN+dcTAAFnXzZEF
         lfMnKHvVVkEi0UjP3/b+t7u1kuLYiTuMRHNRPMQ8AUZYtOK500xkvzSZagOZEOc30N
         UJgQAJ7xWmlZPFmAwp1tXflxivODa8Pxt53VeX1iiy127UGUAkE6gKUwnEKSLBYut0
         xTeLkinHnhm0g==
Received: by mail-oi1-f175.google.com with SMTP id 12so420636oix.12
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 11:47:51 -0700 (PDT)
X-Gm-Message-State: AOAM530hK57mF2k2qBAi1rNPk/pVErgMj62d+dRG+JxOqYb8MSpRinQS
        rKtTxqDfkOPGICq3j36LpY3McCS8TMfZzFxt8p0=
X-Google-Smtp-Source: ABdhPJySIurXYnBMANY1mR8bFrTM12SLiXt2Fg3wxVGbKd0Idw8yzEtrMsi0ifgkgKuLYnx9yo8sLadR/8wxWkiwMBU=
X-Received: by 2002:aca:674c:0:b0:2d9:c460:707c with SMTP id
 b12-20020aca674c000000b002d9c460707cmr3278589oiy.126.1648752470140; Thu, 31
 Mar 2022 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220331171737.48211-1-tony@atomide.com>
In-Reply-To: <20220331171737.48211-1-tony@atomide.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 31 Mar 2022 20:47:38 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEKj_LjA5JEHSD5swgERJyy691R-5YeEfaZteVvCVqPQA@mail.gmail.com>
Message-ID: <CAMj1kXEKj_LjA5JEHSD5swgERJyy691R-5YeEfaZteVvCVqPQA@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: OMAP2+: Fix regression for smc calls for vmap stack
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 31 Mar 2022 at 19:17, Tony Lindgren <tony@atomide.com> wrote:
>
> Commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
> systems") started triggering an issue with smc calls hanging on boot as
> VMAP_STACK is now enabled by default.
>
> Based on discussions on the #armlinux irc channel, Arnd noticed that omaps
> are using __pa() for stack for smc calls. This does not work with vmap
> stack.
>
> Let's fix the issue by changing the param arrays to use static param[5] for
> each function for __pa() to work. This consumes a bit more memory compared
> to adding a single static buffer, but avoids potential races with the smc
> calls initializing the shared buffer. For omap_secure_dispatcher(), we need
> to use a cpu specific buffer as there's nothing currently ensuring it only
> gets called from cpu0.
>
> Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/mach-omap2/omap-secure.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
> --- a/arch/arm/mach-omap2/omap-secure.c
> +++ b/arch/arm/mach-omap2/omap-secure.c
> @@ -59,8 +59,13 @@ static void __init omap_optee_init_check(void)
>  u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
>                                                          u32 arg3, u32 arg4)
>  {
> +       static u32 buf[NR_CPUS][5];
> +       u32 *param;
> +       int cpu;
>         u32 ret;
> -       u32 param[5];
> +
> +       cpu = get_cpu();
> +       param = buf[cpu];
>
>         param[0] = nargs;
>         param[1] = arg1;
> @@ -76,6 +81,8 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
>         outer_clean_range(__pa(param), __pa(param + 5));
>         ret = omap_smc2(idx, flag, __pa(param));
>
> +       put_cpu();
> +
>         return ret;
>  }
>
> @@ -119,8 +126,8 @@ phys_addr_t omap_secure_ram_mempool_base(void)
>  #if defined(CONFIG_ARCH_OMAP3) && defined(CONFIG_PM)
>  u32 omap3_save_secure_ram(void __iomem *addr, int size)
>  {
> +       static u32 param[5];
>         u32 ret;
> -       u32 param[5];
>
>         if (size != OMAP3_SAVE_SECURE_RAM_SZ)
>                 return OMAP3_SAVE_SECURE_RAM_SZ;
> @@ -153,8 +160,8 @@ u32 omap3_save_secure_ram(void __iomem *addr, int size)
>  u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
>                            u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>  {
> +       static u32 param[5];
>         u32 ret;
> -       u32 param[5];
>
>         param[0] = nargs+1; /* RX-51 needs number of arguments + 1 */
>         param[1] = arg1;
> --
> 2.35.1
