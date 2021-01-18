Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5392F9AF5
	for <lists+linux-omap@lfdr.de>; Mon, 18 Jan 2021 09:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733270AbhARIE1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Jan 2021 03:04:27 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:36320 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733263AbhARIE0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Jan 2021 03:04:26 -0500
Received: by mail-oi1-f174.google.com with SMTP id 9so16908201oiq.3;
        Mon, 18 Jan 2021 00:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2X31+WqxR9I4AUuC3W8xEHJl1BsJSRWOR9O2fY9EG3c=;
        b=BNCENPYGjXolhxpN8Medv4GkkJ96c9aI1Z8UE0fNZTZdDN14yfWC9q2dIoeMUCElz+
         HEK7loeFO5A1vW5HtM4htDzDixZphav2hZNqgZdv93FNLubXYhepG0riWxM7V3Nl741l
         8dDfq4hTxwM4X5EQGR2om3K0SOaEXKEiL3VG0qyNEzWcuG9OvCZ6LmlJLIeCuY2HHTqD
         SZBZcJ741N9aB4ZIZgWgUYr19GrWs2tL1FjxiVRw0p2V7pX7grs4lScw1cWL1zbn6uVw
         lFsEH9IheSQCXOU7CtSEvYFYVAYK0o3p0vO9ixs8jUwvHPKgH1ZAIDgP0vmVHQvX62ts
         fxHg==
X-Gm-Message-State: AOAM532AhgofGWRkqYzKIW9/rFx5PELTQqzHQtXIdCfwdrAX+y1QyiDn
        IM4roHXoJpWvf8r3C4ERl7aYoedWBSBWLOyz48k1JDF9FrQ=
X-Google-Smtp-Source: ABdhPJwjRBDyAfs3ht+GoWPrW9KH2tViS2CPvJ/yaVAkWy3NhhsB8JPJy3dSseNhS+8YzCLDcMZim6/v3f3Wovc2mWE=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr12276013oia.148.1610957024702;
 Mon, 18 Jan 2021 00:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20210118073340.62141-1-tony@atomide.com>
In-Reply-To: <20210118073340.62141-1-tony@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jan 2021 09:03:33 +0100
Message-ID: <CAMuHMdXtMtmoLcRwMwOkmvHbvstoJsrqzxfTw8DPCJBqH-EAmw@mail.gmail.com>
Subject: Re: [PATCHv2] drivers: bus: simple-pm-bus: Fix compatibility with
 simple-bus for auxdata
To:     ext Tony Lindgren <tony@atomide.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 18, 2021 at 8:33 AM Tony Lindgren <tony@atomide.com> wrote:
> After converting am335x to probe devices with simple-pm-bus I noticed
> that we are not passing auxdata for of_platform_populate() like we do
> with simple-bus.
>
> While device tree using SoCs should no longer need platform data, there
> are still quite a few drivers that still need it as can be seen with
> git grep OF_DEV_AUXDATA. We want to have simple-pm-bus be usable as a
> replacement for simple-bus also for cases where OF_DEV_AUXDATA is still
> needed.
>
> Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
> That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
> And let's pass the auxdata for omaps to fix the issue for am335x.
>
> As an alternative solution, adding simple-pm-bus handling directly to
> drivers/of/platform.c was considered, but we would still need simple-pm-bus
> device driver. So passing auxdata as platform data seems like the simplest
> solution.
>
> Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
