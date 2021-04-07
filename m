Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58A63560A3
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 03:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241887AbhDGBRL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 21:17:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhDGBRK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 21:17:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8931613B8;
        Wed,  7 Apr 2021 01:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617758222;
        bh=zBigBeAVRRnBSblYtyRYt/CjlLIZ5EhRSivRJQIiig8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XA1UVdnGqPBxjfLV2XYA+Kk5KAJ5EurEyTpCNRhO3Z95dJbmGsdSpaKVBW4AnJH2G
         FPgD++bew9rlYPSH+I3syHrrtf7pTv2RvdcntSYqN2j/Wx++MHVUljAhCdadv43PvY
         /iwplBLrge0V3i4xzT2e8vv00eP4iSzoLGDCAvkOLiMUUHDi76Ks4qrBKwB2jxyuoE
         a3h0XgAnHi43gS+/yhqUJwNPwopGPpVEGClI/1BavxhVoGCM3Tx7P6gFAbERd/mtwi
         g+PKj3CyaAfqNEhUD5lVaMsj8OWfG2Y4gJhJsrufQBSw+2/ZuntuTaln69fi9aTKDw
         gfz7dnR5Rpw3Q==
Received: by mail-ed1-f49.google.com with SMTP id dd20so11553525edb.12;
        Tue, 06 Apr 2021 18:17:01 -0700 (PDT)
X-Gm-Message-State: AOAM532MEa0sm4EtZro/l/JaYRz8lOb8K+jb+LCsfkXv7dhkmzr1E2rU
        EWZM96SIl1LcJKy+KPtHHIEfrlijr0Z9kN2k2g==
X-Google-Smtp-Source: ABdhPJx7e0RDh+oY28QS2hpRLsqDzP7gWN95sa8k6OGQYV4Y9wj+aweFDC2W6/enfc0eeSHbRjLltO2gK/q2hwAQ0JM=
X-Received: by 2002:a05:6402:1b1c:: with SMTP id by28mr1392400edb.62.1617758220158;
 Tue, 06 Apr 2021 18:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210402192054.7934-1-dariobin@libero.it> <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
 <1727466283.11523.1617746554330@mail1.libero.it>
In-Reply-To: <1727466283.11523.1617746554330@mail1.libero.it>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 6 Apr 2021 20:16:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
Message-ID: <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
To:     Dario Binacchi <dariobin@libero.it>
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

On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
>
>
> > Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
> >
> >
> > On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
> > >
> > >
> > > The series comes from my commit in U-boot
> > > d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> > > and from the subsequent exchange of emails at the end of which I was
> > > suggested to send the patch to the linux kernel
> > > (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
> >
> > It's 'ranges' that determines translatable which is missing from the
> > DT. This should have not had a 0 size either though maybe we could
> > support that.
>
> I have replied to the email you sent to the u-boot mailing list
>
> >
> > Does the DT have to be updated anyways for your spread spectrum support?
>
> The spread spectrum support patch does not need this patch to work. They belong
> to two different series.

That's not what I asked. Is the spread spectrum support forcing a DT
update for users? If the DT has to be changed anyways (not really
great policy), then you could fix this in the DT at the same time.

Rob
