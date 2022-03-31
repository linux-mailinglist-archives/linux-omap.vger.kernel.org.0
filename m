Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654FE4EDDA8
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 17:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbiCaPqG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 11:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239394AbiCaPpz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 11:45:55 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4460B1E3E12
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 08:40:28 -0700 (PDT)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N6bwO-1o6Em62lt0-0186vg for <linux-omap@vger.kernel.org>; Thu, 31 Mar
 2022 17:27:12 +0200
Received: by mail-wr1-f52.google.com with SMTP id d7so270749wrb.7
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 08:27:12 -0700 (PDT)
X-Gm-Message-State: AOAM5324dNn4+xaJufFZgEon2F5e1Ey9B29ZPX4m6QjD3jokzhHelhY1
        KtXsA3dnXwNhUGW1LaP7iHGk4ni7rz+bBa/ny4g=
X-Google-Smtp-Source: ABdhPJwNSM0UPgMK82zCcXQokJhVgb7Jdyd+nDEsdwbJizQMKYr7d7Nzx0eIP307bNx4hdcIfywaECIL/l0my3kSiyY=
X-Received: by 2002:adf:e54e:0:b0:205:a9be:c66e with SMTP id
 z14-20020adfe54e000000b00205a9bec66emr4509725wrm.192.1648740432273; Thu, 31
 Mar 2022 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220331144225.56553-1-tony@atomide.com>
In-Reply-To: <20220331144225.56553-1-tony@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 31 Mar 2022 17:26:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2-ik1e+DZV5g9hera8qzpBOURPLrPHPst3UKhwLKEOMg@mail.gmail.com>
Message-ID: <CAK8P3a2-ik1e+DZV5g9hera8qzpBOURPLrPHPst3UKhwLKEOMg@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix regression for smc calls for vmap stack
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XWKdJwgeCfkyGxSfUOs/qz0lg7A9h+iA8DQUrQSksUQHGpBycXy
 ofzaVphw08RN6xiWknzdDjifng3EpStQoVqvdrFVsqnRJXPYoCtghiwJuc9ZBcbGk5eUl7/
 8Q0GGFpKgILob4x+UfUdUrN9LBQoPvu/FrtyPD/zdKXkzBy//7SVinePk5Y2Ym4u77XmmH9
 JZTwnc03y912gUmhhaSZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p3yEiktZ40A=:JO7dgI1K7T/+Tn8mWtJF8d
 uRqXIIOIyYZ9wxiSXWfHcMWBL7igoZFM2t+BQ3AcK3nu8Jdj6y3oF+tGsrt1o3c+Z5NSgI4UF
 AyR73esUCn3bUuMRaOUQ5rghKCF3JesUN+2Ku1wKhHLbWlTjDqDI8dkJ1SVCFZ1m5LVTqNs4g
 5QEJ/vgYuFCrykYxI+UoMRy/zXR5iQ2i/Vw3wGxwIDhwZTO+ud2l5FbvTZuoauGXqi9ZB7jno
 494pcQO7uCToVHzZVPhgm3h3g2MirKvQyTrrLJ5kDGGOEKAEc+BMxH8U5ijSnYtZeNvoOKN/I
 YdrS81cDGcHqlrfptLnum5idANA260fjiqOpMxZ0JkB+TQNQB/UXjzYwhBQzjbtmhM+7x5rse
 ymu96G8fYBOUyZdkAuptmLPcmKR/LkY86dDBLg3D6MeV8CsVupCaTXEsm1KdMSxaVfurVwdrK
 Fo/cYvPk0S7S9Zdf/a6i7wi+L3lbe3GBT2j1JtsziPxBDGkslwc98xXNM3eN3Ga+strDzV5lP
 gzpaPwSRtftfEp7CnpLGkcl3/CATHOzaYLdLvkgtJXQs626R4KE5QovsJ6xZlGsgF9zImDdti
 ToSQYjyCCUBp/MBQkLw8lUHyjIWI5L69yQDz+nyjTALlsWQXBX1f7V2cVTloVCTkQbpNIvjZh
 DZZvWLoiYd75aXRkdE0OS4oWdnn/tj+eGcJi5ogYDWIK550vf+7VW5zW9NKqZbVjuNFo=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Mar 31, 2022 at 4:42 PM Tony Lindgren <tony@atomide.com> wrote:
> diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
> --- a/arch/arm/mach-omap2/omap-secure.c
> +++ b/arch/arm/mach-omap2/omap-secure.c
> @@ -59,8 +59,8 @@ static void __init omap_optee_init_check(void)
>  u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
>                                                          u32 arg3, u32 arg4)
>  {
> +       static u32 param[5];
>         u32 ret;
> -       u32 param[5];

I think for this one, you do need to use a DEFINE_PER_CPU() to make it
work when multiple cores run into the function concurrently. This is entered
on OMAP44xx from irq_notifier() with cmd==CPU_CLUSTER_PM_ENTER
and from start_secondary(). I suspect that one can show these never happen
on more than one CPU at a time, but I have not been able to prove that
myself.

> @@ -119,8 +119,8 @@ phys_addr_t omap_secure_ram_mempool_base(void)
>  #if defined(CONFIG_ARCH_OMAP3) && defined(CONFIG_PM)
>  u32 omap3_save_secure_ram(void __iomem *addr, int size)
>  {
> +       static u32 param[5];
>         u32 ret;
> -       u32 param[5];
>
>         if (size != OMAP3_SAVE_SECURE_RAM_SZ)
>                 return OMAP3_SAVE_SECURE_RAM_SZ;
> @@ -153,8 +153,8 @@ u32 omap3_save_secure_ram(void __iomem *addr, int size)
>  u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
>                            u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>  {
> +       static u32 param[5];
>         u32 ret;
> -       u32 param[5];
>
>         param[0] = nargs+1; /* RX-51 needs number of arguments + 1 */
>         param[1] = arg1;

These look good, as they are clearly only run on single-core SoCs
with preemption disabled.

         Arnd
