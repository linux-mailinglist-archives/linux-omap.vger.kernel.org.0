Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CB242EFA9
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 13:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbhJOL2k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 07:28:40 -0400
Received: from muru.com ([72.249.23.125]:44942 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233342AbhJOL2j (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 07:28:39 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 08AAB80F1;
        Fri, 15 Oct 2021 11:27:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv3 0/4] Get rid of pm_runtime_irq_safe() for 8250_omap
Date:   Fri, 15 Oct 2021 14:26:22 +0300
Message-Id: <20211015112626.35359-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are v3 patches to get rid of pm_runtime_irq_safe() for the 8250_omap
driver. Based on comments from Andy, Johan and Greg, I improved a bunch of
things as listed below.

For removing the pm_runtime_irq_safe() usage, serial TX is the last
remaining issue. We deal with TX by waking up the port and returning 0
bytes written from write_room() and write() if the port is not available
because of PM runtime autoidle.

This series also removes the dependency to Andy's pending generic serial
layer PM runtime patches, and hopefully makes that work a bit easier :)

Regards,

Tony

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


Tony Lindgren (4):
  serial: core: Add wakeup() and start_pending_tx() for power management
  serial: 8250: Implement wakeup for TX and use it for 8250_omap
  serial: 8250_omap: Require a valid wakeirq for deeper idle states
  serial: 8250_omap: Drop the use of pm_runtime_irq_safe()

 Documentation/driver-api/serial/driver.rst |  9 +++
 drivers/tty/serial/8250/8250_omap.c        | 44 ++++++++++----
 drivers/tty/serial/8250/8250_port.c        | 39 ++++++++++++-
 drivers/tty/serial/serial_core.c           | 68 +++++++++++++++++++++-
 include/linux/serial_core.h                |  3 +
 5 files changed, 149 insertions(+), 14 deletions(-)

-- 
2.33.0
