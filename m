Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1D341319C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbhIUKfW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:35:22 -0400
Received: from muru.com ([72.249.23.125]:35502 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231615AbhIUKfW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:35:22 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5BAAE80A8;
        Tue, 21 Sep 2021 10:34:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Get rid of pm_runtime_irq_safe() for 8250_omap
Date:   Tue, 21 Sep 2021 13:33:40 +0300
Message-Id: <20210921103346.64824-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are patches to get rid of pm_runtime_irq_safe() for the 8250_omap
driver.

For removing the pm_runtime_irq_safe() usage, serial TX is the last
remaining issue. We deal with TX by waking up the port and returning 0
bytes written from write_room() and write() if the port is not available
because of PM runtime autoidle.

This series also removes the dependency to Andy's pending generic serial
layer PM runtime patches, and hopefully makes that work a bit easier :)

Regards,

Tony


Tony Lindgren (6):
  n_tty: Start making use of -EAGAIN returned from
    process_output_block()
  tty: n_gsm: Don't ignore write return value in gsmld_output()
  serial: core: Add new prep_tx for power management
  serial: 8250: Implement prep_tx for power management
  serial: 8250_omap: Require a valid wakeirq for deeper idle states
  serial: 8250_omap: Drop the use of pm_runtime_irq_safe()

 Documentation/driver-api/serial/driver.rst |  9 ++++++
 drivers/tty/n_gsm.c                        |  5 ++-
 drivers/tty/n_tty.c                        |  8 +++--
 drivers/tty/serial/8250/8250_omap.c        | 36 +++++++++++++++-------
 drivers/tty/serial/8250/8250_port.c        | 24 +++++++++++++++
 drivers/tty/serial/serial_core.c           | 23 ++++++++++++++
 include/linux/serial_core.h                |  1 +
 7 files changed, 90 insertions(+), 16 deletions(-)

-- 
2.33.0
