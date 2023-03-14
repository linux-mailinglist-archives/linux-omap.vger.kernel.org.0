Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD29E6BA111
	for <lists+linux-omap@lfdr.de>; Tue, 14 Mar 2023 21:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCNU5n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Mar 2023 16:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjCNU5m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Mar 2023 16:57:42 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6CA3D0B4
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 13:57:39 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id v196so9749339ybe.9
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678827459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3ztFzbMFz4GgzdRrfMvLDzmZX+459984qycma9uQHw=;
        b=VBpwWDrzYdEp1ft+FUN1m8JOwEf3D9QrYed13Hd/fLcV8BAAaY7S64+WXm01N9LyiF
         2wxqBQkPY50ykfD76rFUUjZxZ+jHSUC9Np1vaived7mXq5jeN8kaHyhchCZDDRCJXR7h
         gDVe5fRvPC2dYmJ4FEHTMVaAaP3Bpp7DTIA8Pdp6iouBcOk8RKu2oEMdfXiUbt4kWUx9
         Bwq4QLVh345FqKVO7DFOqGLlT0IYBJYFUU3Tse/IDY+DcDamO/aC4QtmHYRkXy14yVed
         TpqE934TK4t3/j5Pk9ohKlDeK7aprdHNaiNAwohWKtB/XERrq9tTtnJAP2xApJ8ywpUS
         uuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678827459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3ztFzbMFz4GgzdRrfMvLDzmZX+459984qycma9uQHw=;
        b=wdP07Wxle2VOSmAjmCkFGsRz8DtR+iJ8f9jISUD7LiwoqYK4zuBIcmjuMVUKD5SUEY
         LmjW2J4J77hV4gYzX0hcsTAusVSV/WY0SVmEqW0uO/Mar3W+KYuIWPFG6QTo1ZCyZd+O
         NKQrwfdoOL//SW+29dO1mE7ir9UwEUR3fqtV+gWvMFDI0dGaIpWg0TS5Uc9ValOhO4zD
         AM+fLK3Ks7OVTS0vKXIAV+EPwdchShVFspyHLxMhzaa2lIDNs9sOHtMWBR6B85W6Q/BX
         4lri1MZ9g1swggZMeDIT87tJ+iA3aOmtMtSM/xkynd/hnia+9xK27D37St29rDPzEYqJ
         +WAw==
X-Gm-Message-State: AO0yUKXj3p0ZmIO861nscW1bkHPXD56OEXn7QNAXRPucAl3sgjJSTw+U
        kRIc8wp0f/FV0H4E3Vk5D+b5KLA61mQecco4qU8TWRV1Soo+wv//
X-Google-Smtp-Source: AK7set8aHSVUvaWYOjwHasl69xJtuRoR6g+KV1DjiIgNas25tUZm0ME8ujF4OKJjodfSvxp2Mc1ZXbScJJQhu9jA14c=
X-Received: by 2002:a5b:1cb:0:b0:a6b:bc64:a0af with SMTP id
 f11-20020a5b01cb000000b00a6bbc64a0afmr24420478ybp.4.1678827458614; Tue, 14
 Mar 2023 13:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230314115940.411939-1-linus.walleij@linaro.org> <ZBDZLgb1+2aMTE7A@duo.ucw.cz>
In-Reply-To: <ZBDZLgb1+2aMTE7A@duo.ucw.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Mar 2023 21:57:27 +0100
Message-ID: <CACRpkda1gHeBYnZgMgrF3h=FJ=1NZ5RVgoquYbp75Y3zcs8=gQ@mail.gmail.com>
Subject: Re: [PATCH] leds: Delete GPIO LED trigger
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Mar 14, 2023 at 9:29=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:

> > We have since moved to dynamic allocation of GPIO numbers
> > and there is no real guarantee that a GPIO number will stay
> > consistent even across a reboot: consider a USB attached
> > GPIO controller for example. Or two. Or the effect of
> > probe order after adding -EPROBE_DEFER to the kernel.
>
> So... what? If your system is one of those with single GPIO
> controller, you can still use it. If you have modern "complex" system,
> your userspace can find out desired GPIO number and then use it.

It's not about the complexity of the GPIO controller but
whether it uses static GPIO number allocations.
One of the GPIO controllers that nowadays use dynamic
GPIO number allocation is the OMAP controller.

> Likely noone will miss this trigger, but correct way is to mark it as
> deprecated / broken in Kconfig, first, and see who screams.

OK fair enough I'll send a patch like that.

Yours,
Linus Walleij
