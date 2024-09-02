Return-Path: <linux-omap+bounces-2075-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB096895A
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 16:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8991F22973
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 14:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0B020FAB0;
	Mon,  2 Sep 2024 14:03:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5575F19C57E;
	Mon,  2 Sep 2024 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285837; cv=none; b=Irg1w8JbaNI6WVVDE+Vf/uiYocmC90zlwo2sxlxcYwS9JInbmR+UhSb7vmzg/iOE4+8xwTWAd2O6WJ22qcPlr1E04raYqu40ECbTp0K7SLpL4tQuq1lEfATkysoXoobdAY2YVCGEacMJZF6x/Qj6RfyJtT0Kt/hFUOwVAFFEk9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285837; c=relaxed/simple;
	bh=FLEGEeqb7/NGeQ/JuWcr1oQrp15Fof0Mxb+7lG9qJR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ushCEnDtt4cJvWC7LvVRlbuR8bYip3CVVl2+DOI9PvZybvaw+HrCAnsWFDBNRjCRsczetPVNEefym1QbO6cSlNWyLr4aGvdZUd31m1u9yZBDuLHrY/VUMW24sO3ZqDZVBpKxVknJo5D8I+y4KOQok9ZBCePdFIpSs6CCG1LOvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d3f017f80eso26194277b3.1;
        Mon, 02 Sep 2024 07:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285834; x=1725890634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJmsA4p+7X25wuc98vjYvA3KiaiUMQubZl6vQ8Uo72Y=;
        b=QfwFqinoqsOKLqbn0MoOZzsFsWx3Z2KRFRlGar722bgOmgJ4HLy18fMckQixJukzjK
         8+141DEWiKfUHdulRUwFNgK+aqoiP4FsSKQtY9jsIAplFbzn0mj6r63ccD0ag8vLY4Pz
         rNoy2IiPOvaCnNc98mBmTUzbGhY3W71L+jAVPzYW8OXOso0Ds1whbabfGMQssvf9WaQQ
         YsfnMfrMwU2mrH4xQ4SgfX6UFTmFXOb1LRIwmcYJf0GdeM/OmaYBfxr4ub287pZEMFhr
         yxqOXHCZKYrA19+4KrVl7zNF8XGres+9bjrCo9RqTwR7DCSrPnkXvgWjTlGVAMWLG7LM
         egXg==
X-Forwarded-Encrypted: i=1; AJvYcCUyEzCblorIzuceCXJmLKxcC35iaFQWLT7mNzLLjM9fWoEjB4x7Iowt3wRFkxRsIZsCY5V8pD/74Mep@vger.kernel.org, AJvYcCVFVRbMyHrzx7cKXkOva56gzHYT8iFQU66/2YUwEHujfTuUJkL/lQ/w/h5WEV5DkO655TwruwnWr19u@vger.kernel.org, AJvYcCXI82aVY65wj9Ls5LV0FY1PL9tO5MID+RdBTDaBuRqN4XanxMmU3IE7Qi1St8kQ6H4uspQ7r24tb8OVJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaEclEwbwtcyWyhf/ifj7InpBI8XnhEGWxdUwyLBlSIClXG/ii
	xG17k4vfiOhtNKkR5g7/XZAlWIa1B21qJBrLsfoem5WsJ8FBf2Z4H4VCx31S
X-Google-Smtp-Source: AGHT+IEr/YRUDXu98Zd+KrHAmGF/sJNe59z7sf8t2cAxPKcvS25AvgrZ2ZA6BnslfTnCzhHn/R++xw==
X-Received: by 2002:a05:690c:dca:b0:62c:e939:2ffe with SMTP id 00721157ae682-6d40ee57cdcmr129873977b3.7.1725285833530;
        Mon, 02 Sep 2024 07:03:53 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d998ac7702sm2509077b3.46.2024.09.02.07.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 07:03:53 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a8ae00f5eso2372591276.0;
        Mon, 02 Sep 2024 07:03:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSxm5TYnYYPsVRvL0PrHITrjhIf5ebEk+J7vo06Fjlov9BjziTeMVQ8ixuQuDjKIUnnpfsC+WaVak7@vger.kernel.org, AJvYcCXHaOqrSycTcOsECRS/EoTW884xj5jrRcEmYmbq+Pf7/bmrEXrkL81nXEnzvrNgcWivWHDOvKFGTbkPzw==@vger.kernel.org, AJvYcCXm39G0ojdV2K3QzIcerzGwVCiJ3qvDxWA1n3uMO0KYUJAbwdPRL0zidQB2R4t8xOolTjV91A+GSzNZ@vger.kernel.org
X-Received: by 2002:a05:690c:d89:b0:6cf:8d6f:2c17 with SMTP id
 00721157ae682-6d40ee583b0mr103322017b3.8.1725285833043; Mon, 02 Sep 2024
 07:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213105730.5287-1-tony@atomide.com> <20240213105730.5287-2-tony@atomide.com>
In-Reply-To: <20240213105730.5287-2-tony@atomide.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Sep 2024 16:03:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZTmn7R8GQWAMFL_9C+VGu4SDfFuMN-8MJmi0AbPMx-g@mail.gmail.com>
Message-ID: <CAMuHMdXZTmn7R8GQWAMFL_9C+VGu4SDfFuMN-8MJmi0AbPMx-g@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: ti: Handle possible address in the node name
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Paul Walmsley <paul@pwsan.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Tue, Feb 13, 2024 at 11:59=E2=80=AFAM Tony Lindgren <tony@atomide.com> w=
rote:
> In order to use #address-cells =3D <1> and start making use of the
> standard reg property, let's prepare things to ignore the possible
> address in the clock node name.
>
> Unless the clock-output-names property is used, the legacy clocks still
> fall back to matching the clock data based on the node name.
>
> We use cleanup.h to simplify the return path for freeing tmp.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Thanks for your patch, which is now commit 3516338543cafb65 ("clk: ti:
Handle possible address in the node name") in v6.9-rc1.
This causes an early boot crash on BeagleBone Black:

    ti_dt_clocks_register: failed to lookup clock node
clk-24mhz-clkctrl:0000:0, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
clk-24mhz-clkctrl:0000:0, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l3-aon-clkctrl:0000:30, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l3-aon-clkctrl:0000:19, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l4-wkup-clkctrl:0008:18, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l4ls-clkctrl:0074:18, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l4ls-clkctrl:0078:18, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l4ls-clkctrl:007c:18, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l3-aon-clkctrl:0000:27, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l3-aon-clkctrl:0000:22, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l3-aon-clkctrl:0000:24, ret=3D-517
    ti_dt_clocks_register: failed to lookup clock node
l3-aon-clkctrl:0000:20, ret=3D-517
    8<--- cut here ---
    Unable to handle kernel paging request at virtual address fffffffe when=
 read
    [fffffffe] *pgd=3D9fdf6841, *pte=3D00000000, *ppte=3D00000000
    Internal error: Oops: 27 [#1] SMP ARM
    CPU: 0 PID: 0 Comm: swapper/0 Not tainted
6.8.0-rc1-boneblack-00001-g3516338543ca #119
    Hardware name: Generic AM33XX (Flattened Device Tree)
    PC is at clk_set_parent+0x2c/0x6c
    LR is at __lock_acquire+0x3f8/0x29d4
    pc : [<c06ecd4c>]    lr : [<c01b2b14>]    psr: a0000093
    sp : c1001fb0  ip : 00000000  fp : 00000000
    r10: c0f5da88  r9 : 00000000  r8 : 00000078
    r7 : ffffffff  r6 : c11ba000  r5 : fffffffe  r4 : c20a0700
    r3 : 00000000  r2 : c100c580  r1 : 00000001  r0 : c209ac00
    Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
    Control: 10c5387d  Table: 80004019  DAC: 00000051
    Register r0 information: slab kmalloc-192 start c209ac00 pointer
offset 0 size 192
    Register r1 information: non-paged memory
    Register r2 information: non-slab/vmalloc memory
    Register r3 information: NULL pointer
    Register r4 information: slab kmalloc-64 start c20a0700 pointer
offset 0 size 64
    Register r5 information: non-paged memory
    Register r6 information: non-slab/vmalloc memory
    Register r7 information: non-paged memory
    Register r8 information: non-paged memory
    Register r9 information: NULL pointer
    Register r10 information: non-slab/vmalloc memory
    Register r11 information: NULL pointer
    Register r12 information: NULL pointer
    Process swapper/0 (pid: 0, stack limit =3D 0x(ptrval))
    Stack: (0xc1001fb0 to 0xc1002000)
    1fa0:                                     c20a0700 c10093c0
c11ba000 c0f2ebdc
    1fc0: dfdffc40 c0f11380 dfdffc40 c0f01074 ffffffff ffffffff
00000000 c0f006f0
    1fe0: 00000000 c0f5da88 00000000 00000e05 00000000 00000000
00000000 00000000
     clk_set_parent from am33xx_dt_clk_init+0x84/0xa4
     am33xx_dt_clk_init from omap_init_time_of+0x8/0x10
     omap_init_time_of from start_kernel+0x430/0x638
     start_kernel from 0x0
    Code: e3530000 1a00000e e3550000 e5940000 (15955000)
    ---[ end trace 0000000000000000 ]---
    Kernel panic - not syncing: Attempted to kill the idle task!
    ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]=
---

Reverting the commit on top of a recent v6.11-rcX-based tree fixes
the issue.

BTW, bisecting this took a while as:
  1. The OMAP serial driver locks up when booted with "earlycon
     keep_bootcon",
  2. The TI SYSC sometimes crashes during early boot, too:

    Unhandled fault: external abort on non-linefetch (0x1008) at 0xe036d010
    [e036d010] *pgd=3D8276e811, *pte=3D47400653, *ppte=3D47400453
    Internal error: : 1008 [#1] SMP ARM
    Modules linked in:
    CPU: 0 PID: 33 Comm: kworker/u4:3 Not tainted
6.8.0-boneblack-05567-gaa7d6513d68b #78
    Hardware name: Generic AM33XX (Flattened Device Tree)
    Workqueue: events_unbound deferred_probe_work_func
    PC is at sysc_reset+0x118/0x210
    LR is at sysc_probe+0xe08/0x1440
    pc : [<c06d0ba8>]    lr : [<c06d1cd8>]    psr: 60000013

> --- a/drivers/clk/ti/clk.c
> +++ b/drivers/clk/ti/clk.c
> @@ -7,6 +7,7 @@
>   * Tero Kristo <t-kristo@ti.com>
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> @@ -114,20 +115,26 @@ int ti_clk_setup_ll_ops(struct ti_clk_ll_ops *ops)
>
>  /*
>   * Eventually we could standardize to using '_' for clk-*.c files to fol=
low the
> - * TRM naming and leave out the tmp name here.
> + * TRM naming.
>   */
>  static struct device_node *ti_find_clock_provider(struct device_node *fr=
om,
>                                                   const char *name)
>  {
> +       char *tmp __free(kfree) =3D NULL;
>         struct device_node *np;
>         bool found =3D false;
>         const char *n;
> -       char *tmp;
> +       char *p;
>
>         tmp =3D kstrdup_and_replace(name, '-', '_', GFP_KERNEL);
>         if (!tmp)
>                 return NULL;
>
> +       /* Ignore a possible address for the node name */
> +       p =3D strchr(tmp, '@');
> +       if (p)
> +               *p =3D '\0';
> +
>         /* Node named "clock" with "clock-output-names" */
>         for_each_of_allnodes_from(from, np) {
>                 if (of_property_read_string_index(np, "clock-output-names=
",
> @@ -140,7 +147,6 @@ static struct device_node *ti_find_clock_provider(str=
uct device_node *from,
>                         break;
>                 }
>         }
> -       kfree(tmp);
>
>         if (found) {
>                 of_node_put(from);
> @@ -148,7 +154,7 @@ static struct device_node *ti_find_clock_provider(str=
uct device_node *from,
>         }
>
>         /* Fall back to using old node name base provider name */
> -       return of_find_node_by_name(from, name);
> +       return of_find_node_by_name(from, tmp);
>  }
>
>  /**

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

