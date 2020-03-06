Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E54317C2C6
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 17:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgCFQT7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 11:19:59 -0500
Received: from muru.com ([72.249.23.125]:59070 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgCFQT7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 11:19:59 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C86538161;
        Fri,  6 Mar 2020 16:20:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] ti-sysc driver changes for v5.7
Date:   Fri,  6 Mar 2020 08:19:49 -0800
Message-Id: <pull-1583511417-919838@atomide.com-3>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <pull-1583511417-919838@atomide.com>
References: <pull-1583511417-919838@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit aec551c7a00fb7eae049c0c4cc3208ca53e26355:

  bus: ti-sysc: Fix 1-wire reset quirk (2020-02-26 10:03:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/ti-sysc-signed

for you to fetch changes up to b2745d92bb015cc4454d4195c4ce6e2852db397e:

  bus: ti-sysc: Add support for PRUSS SYSC type (2020-03-04 07:54:57 -0800)

----------------------------------------------------------------
Driver changes for ti-sysc for v5.7 merge window

Driver changes for ti-sysc interconnect target module driver mostly
to be able to probe display subsystem (DSS) without platform data:

- Rename clk_enable/disable quirks to less confusing pre and post
  reset quirks

- Enable module reset to work with modules with no sysconfig register

- Also consider non-existing module register when matching quirks

- Don't warn with nested ti-sysc devices

- Implement basic SoC revision handling

- Detect DSS related devices

- Implement DSS reset quirks

Note that there is also a DSS driver specific probe fix to allow
probing devices configured for interconnect target module data that
was agreed to be merged along with the ti-sysc driver changes.

And then there also changes to handle RTC, EDMA and PRUSS:

- Add module unlock quirk for RTC

- Detect EDMA modules

- Add support for handling PRUSS

----------------------------------------------------------------
Roger Quadros (1):
      dt-bindings: bus: ti-sysc: Add support for PRUSS SYSC type

Suman Anna (1):
      bus: ti-sysc: Add support for PRUSS SYSC type

Tony Lindgren (12):
      drm/omap: Prepare DSS for probing without legacy platform data
      bus: ti-sysc: Rename clk related quirks to pre_reset and post_reset quirks
      bus: ti-sysc: Improve reset to work with modules with no sysconfig
      bus: ti-sysc: Consider non-existing registers too when matching quirks
      bus: ti-sysc: Don't warn about legacy property for nested ti-sysc devices
      bus: ti-sysc: Implement SoC revision handling
      bus: ti-sysc: Handle module unlock quirk needed for some RTC
      bus: ti-sysc: Detect display subsystem related devices
      bus: ti-sysc: Implement display subsystem reset quirk
      Merge branch 'omap-for-v5.7/dss-probe' into omap-for-v5.7/ti-sysc
      bus: ti-sysc: Fix wrong offset for display subsystem reset quirk
      bus: ti-sysc: Detect EDMA and set quirk flags for tptc

 Documentation/devicetree/bindings/bus/ti-sysc.txt |   1 +
 arch/arm/mach-omap2/pdata-quirks.c                |   6 +
 drivers/bus/ti-sysc.c                             | 604 ++++++++++++++++++----
 drivers/gpu/drm/omapdrm/dss/dss.c                 |  25 +-
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c   |  25 +-
 include/dt-bindings/bus/ti-sysc.h                 |   4 +
 include/linux/platform_data/ti-sysc.h             |   5 +
 7 files changed, 570 insertions(+), 100 deletions(-)
