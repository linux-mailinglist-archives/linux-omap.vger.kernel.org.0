Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEA01253DD
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfLRUuA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:50:00 -0500
Received: from mail.windriver.com ([147.11.1.11]:47925 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfLRUt7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:59 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0iS000214;
        Wed, 18 Dec 2019 12:49:00 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Daniel Ribeiro <drwyrm@gmail.com>,
        Graeme Gregory <gg@slimlogic.co.uk>,
        Haojian Zhuang <haojian.zhuang@marvell.com>,
        Harald Welte <laforge@openezx.org>, Ian Molton <spyro@f2s.com>,
        Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Mike Rapoport <mike@compulab.co.il>,
        Milo Kim <milo.kim@ti.com>,
        Misael Lopez Cruz <misael.lopez@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Rabin Vincent <rabin.vincent@stericsson.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <vireshk@kernel.org>, Yang@mail.windriver.com,
        Bin <bin.yang@intel.com>, Zhu@mail.windriver.com,
        Lejun <lejun.zhu@linux.intel.com>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/18] mfd: demodularization of non-modular drivers
Date:   Wed, 18 Dec 2019 15:48:39 -0500
Message-Id: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This group of MFD drivers are all controlled by "bool" Kconfig settings,
but contain module infrastructure like unused/orphaned "remove" and
__exit functions, use of <linux/module.h> and/or MODULE_ macros that
are no-ops in the non-modular case.

We can remove/replace all of the above.  We are trying to make driver
code consistent with the Makefiles/Kconfigs that control them.  This
means not using modular functions/macros for drivers that can never be
built as a module.  Some of the downfalls this leads to are:

 (1) it is easy to accidentally write unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other drivers and spreads quickly.

We've integrated hundreds of these type cleanups already, as the git
history will show.  This is just a continuation of that objective.

The ".remove" function linked into the device structure deserves an
extra comment.  While the normal execution path would be from a module
unload (if it was modular), it is theoretically possible that a person
could use the core driver infrastructure to manually push the driver off
the hardware; an "unbind" event -- which would run the ".remove" function.

Given that, in this series, when we delete a ".remove" function from
the driver struct, we also disable unbind.  Should there be a valid use
case out there that has been overlooked, this will ensure we get to see
it and can react/revert accordingly.

Build testing was done on drivers/mfd for allmodconfig on x86_64, ARM
and ARM-64 (on linux-next).

---

Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Daniel Ribeiro <drwyrm@gmail.com>
Cc: Graeme Gregory <gg@slimlogic.co.uk>
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: Harald Welte <laforge@openezx.org>
Cc: Ian Molton <spyro@f2s.com>
Cc: Jorge Eduardo Candelaria <jorge.candelaria@ti.com>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mike Rapoport <mike@compulab.co.il>
Cc: Milo Kim <milo.kim@ti.com>
Cc: Misael Lopez Cruz <misael.lopez@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Yang, Bin <bin.yang@intel.com>
Cc: Zhu, Lejun <lejun.zhu@linux.intel.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

Paul Gortmaker (18):
  mfd: stmpe-spi: Make it explicitly non-modular
  mfd: stmpe-i2c: Make it explicitly non-modular
  mfd: ezx-pcap: Make it explicitly non-modular
  mfd: 88pm860x-*: Make it explicitly non-modular
  mfd: tc3589: Make it explicitly non-modular
  mfd: tc6387xb: Make it explicitly non-modular
  mfd: tc6393xb: Make it explicitly non-modular
  mfd: twl4030-audio: Make it explicitly non-modular
  mfd: twl4030-power: Make it explicitly non-modular
  mfd: twl6040: Make it explicitly non-modular
  mfd: t7l66xb: Make it explicitly non-modular
  mfd: lp8788: Make it explicitly non-modular
  mfd: menelaus: Make it explicitly non-modular
  mfd: tps6586x: Make it explicitly non-modular
  mfd: omap-usb-tll: Make it explicitly non-modular
  mfd: omap-usb-host: Make it explicitly non-modular
  mfd: palmas: Make it explicitly non-modular
  mfd: intel_soc_pmic_core: Make it explicitly non-modular

 drivers/mfd/88pm860x-core.c       | 40 ++-------------------------------
 drivers/mfd/88pm860x-i2c.c        |  1 -
 drivers/mfd/ezx-pcap.c            | 42 +++-------------------------------
 drivers/mfd/intel_soc_pmic_core.c | 31 +++-----------------------
 drivers/mfd/lp8788.c              | 24 ++------------------
 drivers/mfd/menelaus.c            | 24 ++++----------------
 drivers/mfd/omap-usb-host.c       | 47 +++++----------------------------------
 drivers/mfd/omap-usb-tll.c        | 47 ++++-----------------------------------
 drivers/mfd/palmas.c              | 36 +-----------------------------
 drivers/mfd/stmpe-i2c.c           | 23 ++-----------------
 drivers/mfd/stmpe-spi.c           | 23 ++-----------------
 drivers/mfd/stmpe.c               | 14 ------------
 drivers/mfd/stmpe.h               |  1 -
 drivers/mfd/t7l66xb.c             | 37 ++++--------------------------
 drivers/mfd/tc3589x.c             | 26 ++--------------------
 drivers/mfd/tc6387xb.c            | 30 ++++---------------------
 drivers/mfd/tc6393xb.c            | 43 ++---------------------------------
 drivers/mfd/tps6586x.c            | 26 ++--------------------
 drivers/mfd/twl4030-audio.c       | 21 +++--------------
 drivers/mfd/twl4030-power.c       | 19 +++-------------
 drivers/mfd/twl6040.c             | 29 +++---------------------
 21 files changed, 51 insertions(+), 533 deletions(-)

-- 
2.7.4

