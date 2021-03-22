Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC4C34489C
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 16:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhCVPFn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 11:05:43 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:39750 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbhCVPFU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 11:05:20 -0400
Received: by mail-ua1-f53.google.com with SMTP id x8so5636144ual.6;
        Mon, 22 Mar 2021 08:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKcelu+NmBcULRnt/75BGuY/1w8xytannxFSZVcT4b8=;
        b=llZv96kktIHOjydl5JKy5J7X51A5MZAfTFYcE5gFCr7w/DL63KuWPDv/0Umj6vzCKm
         XPcsXX4UjBfu2ojyJeU1qsi3e5jq6/oRfWiUJwC/EmVT8RkPPHhPzEcJ6mUM5OrWFs8r
         IDMxuqoQCh46TY07DYfFTGIoeQh2vOgfUXRd9en/7bY6DPXzIldE5ZcycgIc8qIlKdZs
         6PdgEs17lqNIdj0C4glClTNki80e6PqIPU9LDopbwl9X+5iJP2jZTruwKT5/1PoZfSGP
         GNWEgXF8+l6BkBfTNYhHFhR60Mj4Q7UHxvGVZaXabdaaj73B/MmnUzeXvJev5OW4zDgO
         MQQA==
X-Gm-Message-State: AOAM530tnN6KVmvpCh8NMR9ekq7Tz+eDvYIWYc6+GB9wGatvgUwedPeH
        8J0IlWfAHaVxs0QnHRoHpjSTxNgnz+jNHJ0/Sy60r6eC
X-Google-Smtp-Source: ABdhPJz0b1s1oTOxCucwqAxWp5R67A8XGklstumBCcjoVt+uAGLhQvuzSA30ih2KS6v8elIzwhSfkW8ymWhFpvRQgjg=
X-Received: by 2002:ab0:30b3:: with SMTP id b19mr307821uam.58.1616425518872;
 Mon, 22 Mar 2021 08:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105307.1291840-1-arnd@kernel.org>
In-Reply-To: <20210322105307.1291840-1-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Mar 2021 16:05:07 +0100
Message-ID: <CAMuHMdUrALGRaxgrOMUjhEzYUrHataDDNaMr8qs+EMwjrr9hfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] fbdev: omapfb: avoid -Wempty-body warning
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Mar 22, 2021 at 11:54 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building with 'make W=1' shows a few harmless warnings:
>
> drivers/video/fbdev/omap2/omapfb/omapfb-main.c: In function 'omapfb_calc_addr':
> drivers/video/fbdev/omap2/omapfb/omapfb-main.c:823:56: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   823 |                     var->xoffset, var->yoffset, offset);
>       |                                                        ^
> drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: In function 'omapfb_ioctl':
> drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c:911:45: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   911 |                 DBG("ioctl failed: %d\n", r);
>
> Avoid these by using no_printk(), which adds format string checking as
> well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
