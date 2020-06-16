Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B561FBB2B
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 18:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731824AbgFPQRW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 12:17:22 -0400
Received: from muru.com ([72.249.23.125]:57986 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730912AbgFPPjX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Jun 2020 11:39:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CDD828123;
        Tue, 16 Jun 2020 15:40:15 +0000 (UTC)
Date:   Tue, 16 Jun 2020 08:39:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Enoksson <enok@lysator.liu.se>
Cc:     linux-omap@vger.kernel.org
Subject: Re: WL1271 on CM-T3730
Message-ID: <20200616153921.GA37466@atomide.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Oskar Enoksson <enok@lysator.liu.se> [200615 21:15]:
> Hello all, sorry to bother, I'm urgently in need of some help/hints.
> 
> I'm trying to make wifi work on an Compulab CM-T3730, an old OMAP3 board
> with WL1271 Wifi chip connected to an mmc via SDIO.
> 
> Everything works with the kernel supported by Texas Instruments 3.0.87 but I
> need a newer kernel. There is a device tree file omap3-cm-t3730.dts in the
> Linux mainline sourcees, but it doesn't work for me, the Wifi chip is not
> detected on the SDIO bus. I'm using mainline linux 5.6.18, but I also tried
> 4.14, 4.9 and 3.16 with similar results.
> 
> What could be the problem?

Well it should work in general, maybe there's a regression somewhere.
I can confirm that cm-t3730 works with v5.3 at least, have not bothered
to update it for a while. Maybe you just need to update your firmware for
/lib/firmware/ti-connectivity for it?

Regards,

Tony
