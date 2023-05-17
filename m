Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0DD707377
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjEQVC1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjEQVC0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:02:26 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB0F40EB
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:02:25 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-b9e27684b53so1130114276.0
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684357345; x=1686949345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9JnXjOK4o901YK6gncmhl3deYaJ7AAOewWeZnkRUIg=;
        b=btvSSSiXl3AJsE/vHIEM+4k9TDUSWVAaqX2FyT65Yo5+MUld3bnCmC6dbzGlJaizMX
         Zs3BAWjifCtnNfMeWZCsMHcDiYpmvVQoldkjlsv5PqSGIyo3jikzNWX+3tQV/OvCm6fA
         lUHTqg9lcebwFi/ZHMzMcg3v1qXZQCGM8e1GkGhwTDOABMvhHkqBpUc+DTwXXqcH5Huv
         RczpRm2JSMx+ez/DhcLnqniIlwFUyHBwCCW2R+uw60xnxuxYg9mMceevKdT/SMVF369R
         qSVR//mPcSTKpvT5dj266fh4C003CLtIcBlKIkA/uFCyXKRgtRY9kBndATXK2tf79Jol
         XhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357345; x=1686949345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9JnXjOK4o901YK6gncmhl3deYaJ7AAOewWeZnkRUIg=;
        b=GIlSsKJunf6gDTew3qHYSdCDTepuJ+VlAoyXuhJxKEBiMaQapzz82/waxc/kHCxgqe
         6ymXe5KELVfEXEkqK5sLu/yXOLVqNmsx4biN/OuWp3RRkYpDjBZu71xvGty4dPTGoSFy
         23ZtwNY2mK++Sdh+eTVdHpsTeXGwOpHu4mHK6mOhKfsehLrHKQ6D4uX6WByQ5fOAoWO4
         t3q3psv/eZwTHpWd0gH75l0nrHZo5by4/MT7T7OHm5TtVTgZWyWvrmM22i1NMSQil6sL
         uXa7Inqt43MhC9JjVN32GDIzdzQ1oKY3zWOkFVKgj00eXi4IwdQYdj2flIyiE7igYNcj
         bZrw==
X-Gm-Message-State: AC+VfDx+PWn0DEzjaT13SyZ/QPxtE1g3OGe5P3CE0fK5p8ZNvpAPq2Ps
        Jw2iFt8yQTxh9rVsa2J6DdJ5KwpLcgpi8X56+2/pDqCVlnvVCJ/Q
X-Google-Smtp-Source: ACHHUZ6YOWAn/1WaZvAlDgMYozThEVGcDaZ/nluhy+UQTAEbNm54ZZXj/lz0JtGmh0acIQGqUKPZcQb4vboGI0LTLzQ=
X-Received: by 2002:a81:4810:0:b0:54f:752e:9e60 with SMTP id
 v16-20020a814810000000b0054f752e9e60mr40990080ywa.37.1684357344711; Wed, 17
 May 2023 14:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230430175130.574971-1-linus.walleij@linaro.org>
 <20230517180344.GE271152@darkstar.musicnaut.iki.fi> <20230517190648.GF271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517190648.GF271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 May 2023 23:02:13 +0200
Message-ID: <CACRpkdb_SwjqEk-_14bBZPHSheaMbVFRGRTa45E9kzedOzy76g@mail.gmail.com>
Subject: Re: [PATCH] ARM: omap1: Make serial wakeup GPIOs use descriptors
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 17, 2023 at 9:06=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:
> On Wed, May 17, 2023 at 09:03:49PM +0300, Aaro Koskinen wrote:

> > This patch (now also in gpio-descriptors-omap branch) does not
> > compile:
> >
> > On Sun, Apr 30, 2023 at 07:51:30PM +0200, Linus Walleij wrote:
> > > +           pr_err("No interrupt for UART%d wake GPIO\n" idx + 1);
> >
> > Comma is missing.                                          ^^^

Hm I wonder what happened. Allright fixed it up.

> And when tested something goes wrong:
>
> [    2.555725] (NULL device *): using lookup tables for GPIO lookup
> [    2.561950] (NULL device *): No GPIO consumer wakeup found
> [    2.567871] Unable to get UART wakeup GPIO descriptor
> [    2.573272] (NULL device *): using lookup tables for GPIO lookup
> [    2.579498] (NULL device *): No GPIO consumer wakeup found
> [    2.585357] Unable to get UART wakeup GPIO descriptor
> [    2.590576] (NULL device *): using lookup tables for GPIO lookup
> [    2.596954] (NULL device *): No GPIO consumer wakeup found
> [    2.602813] Unable to get UART wakeup GPIO descriptor
>
> There are now two tables with the NULL device - one in the board file,
> and another in serial.c. Maybe that does not work?

Hm I pushed it down to each boardfile NULL device instead.

I sent out a v2, I will update the branch in my git as well as soon
as I looked into your other review comments.

Yours,
Linus Walleij
