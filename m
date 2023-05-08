Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42C176FA1FF
	for <lists+linux-omap@lfdr.de>; Mon,  8 May 2023 10:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbjEHIUa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 May 2023 04:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjEHIUa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 May 2023 04:20:30 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1ED8E2705
        for <linux-omap@vger.kernel.org>; Mon,  8 May 2023 01:20:25 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3E9328111;
        Mon,  8 May 2023 08:20:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dhruva Gole <d-gole@ti.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 0/4] More console rebind changes for 8250_omap serial driver
Date:   Mon,  8 May 2023 11:20:10 +0300
Message-Id: <20230508082014.23083-1-tony@atomide.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are more serial console rebind improvments for 8250_omap. Turns out
there have been some life cycle issues in the driver for quite a while.
The issues rebinding the driver have certainly made debugging serial core
runtime PM changes a bit harder..

Probably only the first patch is needed as a fix for the stable kernels.

Not sure if folks have been hitting the other issues so far. These might
issues only if device tree overlays are being used for serial ports, and
I'm not aware of such cases so far with the mainline kernel.

Regards,

Tony


Tony Lindgren (4):
  serial: 8250: omap: Fix freeing of resources on failed register
  serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
  serial: 8250: omap: Fix life cycle issues for interrupt handlers
  serial: 8250: omap: Shut down on remove for console uart

 drivers/tty/serial/8250/8250_omap.c | 141 +++++++++++++++-------------
 1 file changed, 76 insertions(+), 65 deletions(-)

-- 
2.40.1
