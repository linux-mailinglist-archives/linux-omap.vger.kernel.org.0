Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9651A2F4FEA
	for <lists+linux-omap@lfdr.de>; Wed, 13 Jan 2021 17:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbhAMQYZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Jan 2021 11:24:25 -0500
Received: from muru.com ([72.249.23.125]:44700 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727561AbhAMQYY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Jan 2021 11:24:24 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9719280A7;
        Wed, 13 Jan 2021 16:23:42 +0000 (UTC)
Date:   Wed, 13 Jan 2021 18:23:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
Message-ID: <X/8ei0o9ULpRdx7T@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
 <20201026112222.56894-14-tony@atomide.com>
 <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Geert Uytterhoeven <geert@linux-m68k.org> [210113 16:09]:
> Hi Tony,
> 
> On Mon, Oct 26, 2020 at 1:57 PM Tony Lindgren <tony@atomide.com> wrote:
> > We can now enable simple-pm-bus to use genpd.
> >
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Thanks for your patch, which is now commit 5a230524f87926f2 ("ARM:
> dts: Use simple-pm-bus for genpd for am3 l4_wkup") in v5.11-rc1.
> 
> I have bisected a boot failure on BeagleBone Black to this commit.
> Reverting this commit on top of a v5.11-rc3-based tree does not help.
> 
> With "earlycon keep_bootcon", I do get some output, the last line is
> 
>     l4-wkup-clkctrl:00d4:0: failed to disable
> 
> I have attached the kernel output of the previous (good) commit,
> and the failing one.
> 
> Do you have a clue?

Strange, bbb has been working for me with NFSroot, that's with
omap2plus_defconfig. Care to send your .config so I can give it a
try tomorrow?

Regards,

Tony
