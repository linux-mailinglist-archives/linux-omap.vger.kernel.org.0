Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6AE45001A
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 09:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhKOIpN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 03:45:13 -0500
Received: from muru.com ([72.249.23.125]:56354 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230047AbhKOIpM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Nov 2021 03:45:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CB324806C;
        Mon, 15 Nov 2021 08:42:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCHv4 0/7] Serial port generic PM to fix 8250 PM
Date:   Mon, 15 Nov 2021 10:41:56 +0200
Message-Id: <20211115084203.56478-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are v4 patches for serial port generic PM. The scope has now expanded
a bit from the earlier attempts to get rid of pm_runtime_irq_safe() for
the 8250_omap driver. I've now picked up three patches from Andy's earlier
generic serial port PM series.

Regards,

Tony

Changes since v3:
- Pick three patches from Andy's earlier serial port PM series to handle
  issues pointed out by Johan

Chganges since v2:

- Use locking instead of atomic_t as suggested by Greg

Changes since v1:

- Separated out line discipline patches, n_tty -EAGAIN change I still
  need to retest

- Changed prep_tx() to more generic wakeup() as also flow control needs it

- Changed over to using wakeup() with device driver runtime PM instead
  of write_room()

- Added runtime_suspended flag for drivers and generic serial layer PM
  to use

Andy Shevchenko (3):
  serial: core: Add support of runtime PM
  serial: 8250_port: properly handle runtime PM in IRQ
  serial: 8250_port: Remove calls to runtime PM

Tony Lindgren (4):
  serial: core: Add wakeup() and start_pending_tx() for asynchronous
    wake
  serial: 8250: Implement wakeup for TX and use it for 8250_omap
  serial: 8250_omap: Require a valid wakeirq for deeper idle states
  serial: 8250_omap: Drop the use of pm_runtime_irq_safe()

 Documentation/driver-api/serial/driver.rst |   9 +
 drivers/tty/serial/8250/8250.h             |   3 -
 drivers/tty/serial/8250/8250_omap.c        |  44 +++--
 drivers/tty/serial/8250/8250_port.c        | 151 ++++++++--------
 drivers/tty/serial/serial_core.c           | 199 +++++++++++++++++++--
 include/linux/serial_core.h                |   3 +
 6 files changed, 305 insertions(+), 104 deletions(-)

-- 
2.33.1
