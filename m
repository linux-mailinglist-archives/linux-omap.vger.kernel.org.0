Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB48287306
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 09:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHIHdu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 03:33:50 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45072 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405761AbfHIHdu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 03:33:50 -0400
Received: by mail-qt1-f194.google.com with SMTP id f7so2045878qtq.12;
        Fri, 09 Aug 2019 00:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ON/xqYzzKXuXRxyKs1x68eVhu8CvgAUdmMapXGjP2EY=;
        b=N5tGSjT2avG3GdECqyQDJP2RmVwGxg7l/mpwI0sjxW14+WG5dXa8xlllKhI5KcoXu4
         08AStg7aK7SkMZmAxKqMnkrQwAe/5hse1i6m2ElqDhselxbsyYI+6NtSq6EeMGQRnB0d
         soTvaGoa2GsGgLbI/S2CPOOh9JAN+8Ivb2a8r5HuxY3Nvy5bUzdlZTpOphpgulJJqzZr
         FgGAtH8JwPetpqTesBW4+LI15dSKMveF/fvT3nMYk+CNmUVxgD9gg5GKoOPz77MD9xFk
         6SrKNPGuyg3q9iIwCaXF3f7cXlV190aTN4Nnhq31vuhaoEiKoujc8mgesI6obJqD6cSC
         XKQA==
X-Gm-Message-State: APjAAAWJQ9SaEJ4aEpEiVGooOmpT9d3f/8Sy9G9kY6BYpWW9Px4+B4Zb
        2J7HX99GdqhKmNVuyFh8u+HJGLSuW9NhxQS+9Jc=
X-Google-Smtp-Source: APXvYqwB0sAxZO9jp3JM+qdA+V7oGn7Em1pifk8qI0wN0R49zku5U8wwUBPF9nBoeNL4u7gsVezah3x6CgITVFfdFLo=
X-Received: by 2002:ac8:6684:: with SMTP id d4mr11580322qtp.204.1565336029037;
 Fri, 09 Aug 2019 00:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-12-arnd@arndb.de>
 <ba446856-0fa1-d06d-9e74-18ed9d630376@linaro.org>
In-Reply-To: <ba446856-0fa1-d06d-9e74-18ed9d630376@linaro.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Aug 2019 09:33:32 +0200
Message-ID: <CAK8P3a0cDSr=nyaTFPywnYzUNdeJEhNBDkmWxBhVgXL+2vSyfg@mail.gmail.com>
Subject: Re: [PATCH 11/22] clocksource: ti-dmtimer: avoid using mach/hardware.h
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 9, 2019 at 9:01 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 08/08/2019 23:22, Arnd Bergmann wrote:
> > As a preparation for future omap1 multiplatform support, stop
> > using mach/hardware.h and instead include the omap1-io.h
> > for low-level register access to MOD_CONF_CTRL_1.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
>
> Do you want me to apply it through me tree?

Sorry, I should have included you in the cover letter. I would
like to take the whole series through the soc tree, as there are
dependencies between the patches and this cannot be applied
by itself.

       Arnd
