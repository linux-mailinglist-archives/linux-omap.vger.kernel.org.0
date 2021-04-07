Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02531356CB1
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 14:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352476AbhDGMwv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 08:52:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352473AbhDGMwu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 7 Apr 2021 08:52:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CB3561362;
        Wed,  7 Apr 2021 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617799961;
        bh=/Aj9ToFr5Y0Mp0vdEWHWke3cHo+D6lrPdkJwkg5yL9U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fopuVWEfqUbU8nVLFT5OpvoeEKpqH2T2URgTJTVKEC/GPfSFaTYbi7BXCGv2cABab
         Eg9k88fk0VseeW7s20EuCrgq2acxumplScVQuCCzjs2pfv0t9cz5Pz4or2bwxBVTvX
         U4s0eOXF+E93tjnJebYUYg7ClUqLskikTHNuYT6dkivK70Oawq2QJp03kycTHIP1Fy
         /BMk784EtOrbD0KEgHDerOGMBBcvRUIC0pcAO/UEiJGUC5Gbl1xYfwx8WgvVt2ZyLz
         BtXGt+ffRfaieCvA5VuAjRz1XWeRioYwlOfdBzG2NqyaXWxlIElKKmr+u9xUCEOlgh
         spNuy81doKcWw==
Received: by mail-ej1-f45.google.com with SMTP id r9so4944328ejj.3;
        Wed, 07 Apr 2021 05:52:40 -0700 (PDT)
X-Gm-Message-State: AOAM532/AE899ecnJY/4yCxnb7VQEWQOc43uNiQKDYl2LEZJjf0zyO7Z
        9nsdZ5wXBJslQbDMcrZ5QisgRiLSmUzMDGX+1Q==
X-Google-Smtp-Source: ABdhPJzKzLmcyyeHWH7Ez1rGHI2pJz806QzVhSghuT5iXBesrSOuMERFtUiJ9ViiwISTQu1nJy0kKCOjwkNwwYomYGM=
X-Received: by 2002:a17:906:55c9:: with SMTP id z9mr3470090ejp.360.1617799959659;
 Wed, 07 Apr 2021 05:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210402192054.7934-1-dariobin@libero.it> <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
 <1727466283.11523.1617746554330@mail1.libero.it> <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
 <1044574275.383115.1617779265390@mail1.libero.it>
In-Reply-To: <1044574275.383115.1617779265390@mail1.libero.it>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 7 Apr 2021 07:52:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
Message-ID: <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
To:     Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Apr 7, 2021 at 2:07 AM Dario Binacchi <dariobin@libero.it> wrote:
>
>
> > Il 07/04/2021 03:16 Rob Herring <robh+dt@kernel.org> ha scritto:
> >
> >
> > On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
> > >
> > >
> > > > Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
> > > >
> > > >
> > > > On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
> > > > >
> > > > >
> > > > > The series comes from my commit in U-boot
> > > > > d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> > > > > and from the subsequent exchange of emails at the end of which I was
> > > > > suggested to send the patch to the linux kernel
> > > > > (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
> > > >
> > > > It's 'ranges' that determines translatable which is missing from the
> > > > DT. This should have not had a 0 size either though maybe we could
> > > > support that.
> > >
> > > I have replied to the email you sent to the u-boot mailing list
> > >
> > > >
> > > > Does the DT have to be updated anyways for your spread spectrum support?
> > >
> > > The spread spectrum support patch does not need this patch to work. They belong
> > > to two different series.
> >
> > That's not what I asked. Is the spread spectrum support forcing a DT
> > update for users?
>
> Yes, the deltam and modfreq registers must be added to the DPLL clocks.

That's a shame given this dts has been mostly untouched since 2013.

> > If the DT has to be changed anyways (not really
> > great policy), then you could fix this in the DT at the same time.
>
> I could put the fix to the device tree in that series, although I wouldn't
> create a single patch to fix and add the SSC registers. First the size-cells = <0>
> fix patch and then the SSC patch.
> Do you agree?

By at the same time, I really just meant within 1 release.

But I'd like to hear TI maintainers' thoughts on this.

Rob
