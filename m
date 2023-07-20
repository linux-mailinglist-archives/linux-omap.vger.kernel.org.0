Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194DF75A558
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jul 2023 07:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjGTFKc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Jul 2023 01:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTFKa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Jul 2023 01:10:30 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1364EC
        for <linux-omap@vger.kernel.org>; Wed, 19 Jul 2023 22:10:29 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4658980F7;
        Thu, 20 Jul 2023 05:10:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dhruva Gole <d-gole@ti.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 0/3] Serial core controller port device name fixes
Date:   Thu, 20 Jul 2023 08:10:13 +0300
Message-ID: <20230720051021.14961-1-tony@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A few issues have been found with device naming for the serial core
controller port device. These issues currently affect mostly the output
for /sys/bus/serial-base/devices, but need to be also fixed to avoid
port addressing issues later on. It would be good to get these fixes into
the -rc cycle to avoid folks possibly trying to use the incorrect sysfs
port device names for finding uart ports for example.

Regards,

Tony

Changes since v1:
- Port id cannot be negative as noted by Jiri

- Controller id cannot be negative as noted by Andy

- Port name is missing the controller instance as noted by Andy

Tony Lindgren (3):
  serial: core: Controller id cannot be negative
  serial: core: Fix serial core port id to not use port->line
  serial: core: Fix serial core controller port name to show controller
    id

 drivers/tty/serial/8250/8250_core.c  |  2 ++
 drivers/tty/serial/serial_base_bus.c | 33 ++++++++++++++++++----------
 include/linux/serial_core.h          |  3 ++-
 3 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.41.0
