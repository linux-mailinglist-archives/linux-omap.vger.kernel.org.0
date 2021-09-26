Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F199418962
	for <lists+linux-omap@lfdr.de>; Sun, 26 Sep 2021 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhIZORp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 26 Sep 2021 10:17:45 -0400
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110]:44043 "EHLO
        fgw23-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231743AbhIZORp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sun, 26 Sep 2021 10:17:45 -0400
X-Greylist: delayed 964 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Sep 2021 10:17:45 EDT
Received: from darkstar.musicnaut.iki.fi (85-76-143-163-nat.elisa-mobile.fi [85.76.143.163])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 0c2e5c44-1ed2-11ec-877a-005056bdfda7;
        Sun, 26 Sep 2021 17:00:04 +0300 (EEST)
Date:   Sun, 26 Sep 2021 17:00:03 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Bug report: Amstrad Delta IRQ hang (serio?) during boot
Message-ID: <20210926140003.GA2438@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I noticed that with the recent change to switch to asynchronous initramfs
unpacking (initramfs_async=1), the Amstrad Delta seems to occasinally
hang during the boot with the current mainline. This is probably some old
bug that gets now triggered more easily due to changes in the boot order.

It's a bit tricky to debug as adding printk()s may make the problem go
away, but so far I've noticed:

	- happens when ams-delta-serio and USB are being probed roughly
          in parallel,

	- the hang: omap1_handle_irq() loops forever with irqnr == 14.

I guess this has to do something the special handling of serio irqs on
this board. As a workaround switching back to initramfs_async=0 helps.
Also async=1 and disabling CONFIG_SERIO_AMS_DELTA works.

A.
