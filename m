Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACC2A09DD
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfH1SpP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:45:15 -0400
Received: from muru.com ([72.249.23.125]:59038 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbfH1SpP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 14:45:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 77A1A80C5;
        Wed, 28 Aug 2019 18:45:43 +0000 (UTC)
Date:   Wed, 28 Aug 2019 11:45:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
Message-ID: <20190828184511.GF52127@atomide.com>
References: <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi>
 <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
 <20190814074918.GA52127@atomide.com>
 <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
 <20190816083403.GB1952@darkstar.musicnaut.iki.fi>
 <CAK8P3a3jqNxoihQ+UFvOZMg=AcF2yzHXs5ay6X1TZX8L3zQ3rg@mail.gmail.com>
 <20190827190453.GJ30291@darkstar.musicnaut.iki.fi>
 <CAK8P3a1PeBMRuweAmzrTQC85CmwdZPirG3HPg9aJ99p2U7zknQ@mail.gmail.com>
 <20190828182318.GL30291@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828182318.GL30291@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Aaro Koskinen <aaro.koskinen@iki.fi> [190828 18:23]:
> On Wed, Aug 28, 2019 at 03:02:36PM +0200, Arnd Bergmann wrote:
> > I assume you checked that the uart output wasn't already broken
> > by one of the earlier patches, right?
> 
> Correct, it's only with the mapping change patch it hangs.
> 
> > Also, looking at arch/arm/mach-omap1/include/mach/uncompress.h
> > it seems that SX1 normally uses UART3, not UART1.
> > Is that different in qemu?
> 
> In QEMU all uarts can be used, trying with UART3 as early console
> hangs as well. (It prints Uncompressing... done. but I guess that's
> done with the physical address.)

Hmm maybe we now need to get rid of the machine based
detection code for DEBUGLL like we did for mach-omap2.

Just get rid of arch_decomp_setup() in mach-omap1
uncompress.h file and make sure the assembly code
only relies on the the Kconfig options only.

That needs to be done at least for device tree based
support since we use a generic machine ID. But maybe
with multiarch support we need to rely on generic
uncompress.h and assembly.

Regards,

Tony
