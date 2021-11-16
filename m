Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9D7452980
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 06:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhKPFX5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 00:23:57 -0500
Received: from muru.com ([72.249.23.125]:56730 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233571AbhKPFWr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Nov 2021 00:22:47 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 31EF8806C;
        Tue, 16 Nov 2021 05:20:23 +0000 (UTC)
Date:   Tue, 16 Nov 2021 07:19:43 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
Message-ID: <YZM/b2/F8xmK43vr@atomide.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen>
 <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
 <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Saravana Kannan <saravanak@google.com> [211115 20:19]:
> On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> > >
> > > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > > fw_devlink could end up creating device links for bus only devices.
> > > > However, bus only devices don't get probed and can block probe() or
> > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > devices using the simple-pm-bus driver.
> > > >
> > > > However, there are instances of devices that are not simple buses (they get
> > > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > > bus only compatible strings) in their compatible property to automatically
> > > > populate their child devices. We still want these devices to get probed by
> > > > their specific drivers. So, we make sure this driver only probes devices
> > > > that are only buses.
...
> > >
> > > This change is breaking the expected behavior for the already existent
> > > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > > devlink, the devices suspend sequence changes (and even breaks).
> > >
> > > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > > should've been reversed: keep the simple-bus as is and add another
> > > compatible, IDK, something like simple-trasnparent-bus, or something.
> >
> > The intent of this change IS to affect existing simple-bus nodes (but
> > not in the way it's affecting you). But if it's breaking stuff, we
> > obviously need to fix it.
> >
> > I have a hunch on what's going on in your case, but can you point me
> > to the specific simple-bus node that's getting affected? I'm expecting
> > it to be a simple-bus node that gets added AFTER this driver is
> > registered at device_initcall (module_init gets converted to
> > device_initcall).
> >
> > Also, can you try this hack patch to see if it helps your case?
> > https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
> >
> > I have some thoughts on how I could fix this, but I need to think
> > about a few cases.

Not sure if this is related.. Some drivers need to be updated from
builtin_platform_driver_probe() to use builtin_platform_driver() when
switching to simple-pm-bus because of deferred probe. See more info
in commit e259c2926c01 ("PCI: pci-dra7xx: Prepare for deferred probe
with module_platform_driver").

Regards,

Tony
