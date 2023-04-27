Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD3E6F0140
	for <lists+linux-omap@lfdr.de>; Thu, 27 Apr 2023 09:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243013AbjD0HJc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Apr 2023 03:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242693AbjD0HJb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Apr 2023 03:09:31 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF5E269F
        for <linux-omap@vger.kernel.org>; Thu, 27 Apr 2023 00:09:30 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so1897203276.0
        for <linux-omap@vger.kernel.org>; Thu, 27 Apr 2023 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682579370; x=1685171370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwU1SnfpA6TdGEWxBhOgAmoAwAKXNFqPosaEgrLp2SY=;
        b=rPbtgLRFxauFA7M+GOMbn+RLEtUdhZEtXIluQmtJqseAvpaYOc5kXQtux/d6PZODgn
         0mpt39Ih/t/RVnWYwFCLL7hEuuFFvTKZNlIkgIaHrpLC/xm+wvk1RDTqExZHXUVXk67K
         UJ13rxIOOQBWFVjTXdT7Uh4hb1vn7QiFgZZbmL3AstGKX6F8XrHpwYPWv2u+2oA2d2A0
         nisJ1UpW8P55DUcqFanf4q4oOYfxTTbRHuxadBiI2rDqaKQ6R4dpBipOQIwAuNKYL8DI
         9ClLtu8gH9Kt/TwumKiW3rCQQJG50OsuNj/ew4TUVwTljJtYMwYIyYShkxYFSfWFD16f
         +heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682579370; x=1685171370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwU1SnfpA6TdGEWxBhOgAmoAwAKXNFqPosaEgrLp2SY=;
        b=lZuEGg3hdhduS18pT0rQnpLvwLBxb2HgRY19tymGl5fMNj5iWTGkANT0md0mKmCxIA
         0M7uUlW1A7po8I3cd8+1K64mxdZB4X/0UZ6xRUpi0jKcFPb1uVkJwlQDju+YMQsOPHK1
         GKhUZPmKIh7D/2YMB6rR6jk8gwYGLD5ZC5QabhcYBD7PA1+zlAbTqPOBGDKNMGecgkyW
         utu6sJZsDRO7aSpYbYTiJafXCjzQzM7UilhF/38KOTvLx95AfCng6BQPeKpgHuN4Yhra
         NLD8kNrUT5w3TXxeDT2m6JCRdzhyJdP7yG/kxyrcTZc+IE8g02VYQYfq8/GtKK/lU/ab
         xjxQ==
X-Gm-Message-State: AC+VfDyMeAONYcc8DEHiIWY96X2S3GEyaWttpcYc7/QOh8bfvdxLl4ja
        lPxjagODIqaT2IRdv2vi6rYwTjZr+6RPxSnVlRcs/w==
X-Google-Smtp-Source: ACHHUZ5djpGNhGxCvGFiN7+IJMrf6Bh9n7g4cxt1YqwQhc6q6nchf686VAPQUg95FROOFaifKcUarzuuoTh02fBcPSY=
X-Received: by 2002:a81:1d50:0:b0:54f:54c5:70d with SMTP id
 d77-20020a811d50000000b0054f54c5070dmr3622000ywd.20.1682579369842; Thu, 27
 Apr 2023 00:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230426203341.360155-1-linus.walleij@linaro.org> <20230426220159.GA881984@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230426220159.GA881984@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Apr 2023 09:09:18 +0200
Message-ID: <CACRpkdbGWqbVxVC7tYy2keqDA0OnOumeqXJ2ZyaBTqZF_FMbGQ@mail.gmail.com>
Subject: Re: [PATCH] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 27, 2023 at 12:02=E2=80=AFAM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:

> > Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
>
> Fixes should be 92bf78b33b0b ("gpio: omap: use dynamic allocation
> of base").

OK I fix Fixes.

> Thanks, the patch almost works - I can now boot all the way to rootfs
> (USB disk), and also ethernet works.

That's actually surprisingly good results... Then we can certainly
fix this up and get it working.

> However CF is not working:
>
> [    0.276947] (NULL device *): requested GPIO 0 (62) is out of range [0.=
.15] for chip gpio-0-15
> [    0.277130] Unable to get CF IRQ GPIO descriptor

Ooops no surprise there. Which gpiochips do you have on OMAP1?
Just a simple cat /sys/kernel/debug/gpio should give the answer.

Yours,
Linus Walleij
