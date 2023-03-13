Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A5C6B6FD6
	for <lists+linux-omap@lfdr.de>; Mon, 13 Mar 2023 08:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCMHJE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Mar 2023 03:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCMHJD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Mar 2023 03:09:03 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF9E30E88
        for <linux-omap@vger.kernel.org>; Mon, 13 Mar 2023 00:09:02 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id t4so10654853ybg.11
        for <linux-omap@vger.kernel.org>; Mon, 13 Mar 2023 00:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678691342;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNwUQbXdHVQ0YH3gmRL/hcOK8CLpa6MGCzRzUiFfZr4=;
        b=jTmoHPUFtjRyq0lBv7TRG+aUX1fCsYHWVRDPz59Q0R+Io9iSSd0gEF/JE5JiKCi0Cv
         NEFWgfkTrsMiHQtfo026gMLRklhBNY/4R7T2EK7dYu8JUb3Vcfv0btm+hn1C5Tihuiu7
         j7U6tMfou62fMWPvvITDusCyRB0AD7Kf4XH5lTlhNHNaqGnp3LiuuSHu+x1UVbgJCi0+
         UyuudrFJkBh7wmc1BiGG0agY+7qRBX3i+omN06lJTdJsm4aTdB9SAzwBGJVJEaZFR6xn
         UgHJgs1Tm/+egCyIsXib2VdwhVpCegLpQOw7taLmNGSH7rxfpgKYM738El1cOJoeIvgs
         k2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678691342;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNwUQbXdHVQ0YH3gmRL/hcOK8CLpa6MGCzRzUiFfZr4=;
        b=k/Ey5c55s6rDLXXT4fQHMVvZgOgXooQCybJwBljGtiSY4OW3TDyWd2Rvd0FSTAfb+p
         1ePgHv3aIWMtwh3FH2R4DWCtmLIz/eM9HHvHF6u+cjLPp2Jxrp75KPcRCANh5mUe6A2I
         tQrCrVJWthKLl9PHSm3ucgHAo35nA6DTj7n3WAfnmL5KtCD1oXuYfVxpOOxaho4H6PlU
         1QJKvWXUqX48izeKfUkPBcqDMxhHH30xu6XH0AZrjMXp0Q/L9cEhItAQc2/+RrXbvdGH
         7M0EUVDFLiMMZXh5QGSnTzaqnf0eHbKlgNrcDBeVcxQ+bDV9RwdrEUlv/PEQmmyBHYgb
         X53w==
X-Gm-Message-State: AO0yUKVTlzMd5O5OtdDa2K89plYt1XEaAK1TJ1mc8YxDzE9F1uzQsvUU
        16qtkOTab8J6XTXHHighMInsEbj5R21ArY91uNo=
X-Google-Smtp-Source: AK7set8E3VN1iq6WXbnmTEAE3ZOvv8kMWZ5urtSDQAreG3O2TiADc+wSuODnG4XSebnGHlC3+tsMZjuvj6vtPaFbJd4=
X-Received: by 2002:a5b:4ca:0:b0:aaf:b6ca:9a30 with SMTP id
 u10-20020a5b04ca000000b00aafb6ca9a30mr20488080ybp.6.1678691341732; Mon, 13
 Mar 2023 00:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
 <20230306074200.GD7501@atomide.com> <CAGm1_ktJH21qk=eRH_xJgwkf_pGCgp1z7Jrp5M2orZ-eNRNg=Q@mail.gmail.com>
 <20230309073000.GG7501@atomide.com> <20230310223541.xa372p4gbfqg4dh2@iaqt7>
In-Reply-To: <20230310223541.xa372p4gbfqg4dh2@iaqt7>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 13 Mar 2023 08:08:50 +0100
Message-ID: <CAGm1_kvffnb2jYtY5NzMUkekTf4eOc7D2r2dHuf0_bOEqZEu=A@mail.gmail.com>
Subject: Re: am335x: performnce issues with FTDI and LOW_LATENCY
To:     Bin Liu <b-liu@ti.com>, Tony Lindgren <tony@atomide.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Mar 10, 2023 at 11:35=E2=80=AFPM Bin Liu <b-liu@ti.com> wrote:
>
> On Thu, Mar 09, 2023 at 09:30:00AM +0200, Tony Lindgren wrote:
> > * Yegor Yefremov <yegorslists@googlemail.com> [230307 09:53]:
> > > On Mon, Mar 6, 2023 at 8:42 AM Tony Lindgren <tony@atomide.com> wrote=
:
> > > >
> > > > * Yegor Yefremov <yegorslists@googlemail.com> [230228 08:01]:
> > > > > Any idea why the performance drop is so big?
> > > >
> > > > Maybe lots of interrupts and dma not being used for musb in this ca=
se?
> > >
> > > Using "irqtop -d 1", I get the following results:
> > >
> > > 3.18.1 LATENCY_OFF (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-c=
ontroller
> > > 3.18.1 LATENCY_ON (16 ports): ca. 4000 IRQs/s INTC 17 47400000.dma-co=
ntroller
> > >
> > > 6.2.1 LATENCY_OFF (16 ports): ca. 300 IRQs/s INTC 17 47400000.dma-con=
troller
> > > 6.2.1 LATENCY_ON (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-con=
troller
> >
> > Hmm I wonder what's causing that. Earlier the Ethernet gadget had some
> > alignment define tweak that made transfers faster. What kind of data
> > transfer are you testing with?
> >
> > > #zcat /proc/config.gz | grep CPP
> > > CONFIG_USB_TI_CPPI41_DMA=3Dy
> > > CONFIG_TI_CPPI41=3Dy
> >
> > From what I recall musb still handles short transfers with PIO, I think
> > this is the case also for cppi41 dma. Sounds like that does not explain
> > the difference you're seeing between 3.18 and 6.2 kernels though.
>
> I quickly scanned the changes on musb_cppi41.c and dma/cppi41.c between
> v3.18 and v5.4, but nothing stands out. I am wondering if this is
> something caused by outside of usb subsystem...

As for the network transfer, here is some background info. The devices
use SNMP (also internally) to handle device configuration data. This
issue was first detected as devices with 8 serial ports reacted really
slow when opening their web interface (on a 16 port device, opening a
web page lasted more than 2 minutes). Profiling showed the system was
busy handling UDP transactions (internal UDP requests to collect data
for the web interface).

The devices that were using OMAP UARTs only (one and two port devices)
didn't show this behavior. So the root cause was found: FTDIs. To
examine their impact on the system without our firmware, I have
written a small program where I can open as many ports as I need and
also specify the LOW_LATENCY flag. iperf3 with default settings (TCP)
could exactly show the influence of the LOW_LATENCY flag.

"modprobe mtd_speedtest" shows 50% performance degradation with 16
ports open and the LOW_LATENCY flag.

Any idea how I can get more info about what's going on in the kernel?

Yegor
