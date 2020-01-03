Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA90612F584
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2020 09:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgACIdc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jan 2020 03:33:32 -0500
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110]:48949 "EHLO
        fgw23-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725972AbgACIdb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jan 2020 03:33:31 -0500
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jan 2020 03:33:31 EST
Received: from darkstar.musicnaut.iki.fi (85-76-105-219-nat.elisa-mobile.fi [85.76.105.219])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 7a28ac90-2e01-11ea-90c5-005056bdfda7;
        Fri, 03 Jan 2020 10:17:27 +0200 (EET)
Date:   Fri, 3 Jan 2020 10:17:26 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BISECTED, REGRESSION] OMAP3 onenand/DMA broken
Message-ID: <20200103081726.GD15023@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

When booting v5.4 (or v5.5-rc4) on N900, the console gets flooded with:

[    8.335754] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.365753] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.395751] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.425750] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.455749] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.485748] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.515777] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.545776] omap2-onenand 1000000.onenand: timeout waiting for DMA
[    8.575775] omap2-onenand 1000000.onenand: timeout waiting for DMA

making the system unusable.

Bisected to:

4689d35c765c696bdf0535486a990038b242a26b is the first bad commit
commit 4689d35c765c696bdf0535486a990038b242a26b
Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date:   Tue Jul 16 11:24:59 2019 +0300

    dmaengine: ti: omap-dma: Improved memcpy polling support

The commit does not revert cleanly anymore. Any ideas how to fix this?

A.
