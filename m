Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E0E2C11ED
	for <lists+linux-omap@lfdr.de>; Mon, 23 Nov 2020 18:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733182AbgKWR1c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Nov 2020 12:27:32 -0500
Received: from muru.com ([72.249.23.125]:49210 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732710AbgKWR1c (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Nov 2020 12:27:32 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E239D809F;
        Mon, 23 Nov 2020 17:27:36 +0000 (UTC)
Date:   Mon, 23 Nov 2020 19:27:26 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Nishanth Menon <nm@ti.com>, SoC Team <soc@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking
 options for nfs boot
Message-ID: <20201123172726.GQ26857@atomide.com>
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
 <20201116090429.GB26857@atomide.com>
 <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@kernel.org> [201123 16:55]:
> On Mon, Nov 16, 2020 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Grygorii Strashko <grygorii.strashko@ti.com> [201030 14:47]:
> > > Enable networking options required for NFS boot on TI platforms, which is
> > > widely for automated test systems.
> > > - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> > > - enable TI DP83867 phy
> > > - explicitly enable PTP clock support to ensure dependent networking
> > > drivers will stay built-in.
> > >
> > > vmlinux size changes:
> > > - before:
> > >    text       data        bss        dec        hex    filename
> > > 14703736    8024602     444976    23173314    16198c2    ./omap-arm/vmlinux
> > >
> > > - after:
> > >    text       data        bss        dec        hex    filename
> > > 14727271    8029150     444528    23200949    16204b5    ./omap-arm/vmlinux
> > >
> > > diff: 27635 (dec)
> >
> > Thanks applying into omap-for-v5.11/defconfig.
> 
> Oops, I just applied it as well (as it was sent to soc@kernel.org it appeared
> in patchwork) and I  noticed too late that you already had it.
> Should I remove it at my end, can you just drop your copy?

Sure no problem, I'll drop my copy.

Regards,

Tony
