Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E4744493
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 18:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfFMQhs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 12:37:48 -0400
Received: from muru.com ([72.249.23.125]:52940 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730630AbfFMHLC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Jun 2019 03:11:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4ACDF81B1;
        Thu, 13 Jun 2019 07:11:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/4] ti-sysc driver changes for v5.3
Date:   Thu, 13 Jun 2019 00:10:52 -0700
Message-Id: <pull-1560399818-512977@atomide.com-3>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <pull-1560399818-512977@atomide.com>
References: <pull-1560399818-512977@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4ee23cd76c0ce8622976b3da0e2bc89e6d94f6d4:

  Merge branch 'omap-for-v5.2/ti-sysc' into fixes (2019-05-20 08:33:03 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/ti-sysc-signed

for you to fetch changes up to 4e23be473e3063a9d3bc06bb0aee89885fffab0e:

  bus: ti-sysc: Add support for module specific reset quirks (2019-06-10 04:52:22 -0700)

----------------------------------------------------------------
ti-sysc interconnect target module driver changes for v5.3

This series of changes improves probing devices with ti-sysc to the
point where we can now probe most devices without the custom dts
property "ti,hwmods" and no legacy platform data :)

We add support for platform data callbacks for idling and unidling the
clockdomain the module belongs to. The rest of the series mostly adds
handling for the various quirks needed by old legacy modules such as
i2c and watchdog. Some quirk handling is still missing for few modules,
but those will be added as they get tested.

The related platform data and dts changes will be sent separately.

----------------------------------------------------------------
Tony Lindgren (12):
      bus: ti-sysc: Add support for missing clockdomain handling
      bus: ti-sysc: Support 16-bit writes too
      bus: ti-sysc: Make OCP reset work for sysstatus and sysconfig reset bits
      bus: ti-sysc: Allow QUIRK_LEGACY_IDLE even if legacy_mode is not set
      bus: ti-sysc: Enable interconnect target module autoidle bit on enable
      bus: ti-sysc: Handle clockactivity for enable and disable
      bus: ti-sysc: Handle swsup idle mode quirks
      bus: ti-sysc: Set ENAWAKEUP if available
      bus: ti-sysc: Add support for disabling module without legacy mode
      bus: ti-sysc: Do rstctrl reset handling in two phases
      bus: ti-sysc: Detect uarts also on omap34xx
      bus: ti-sysc: Add support for module specific reset quirks

 arch/arm/mach-omap2/omap_hwmod.c      |  39 +--
 arch/arm/mach-omap2/pdata-quirks.c    |  60 +++++
 drivers/bus/ti-sysc.c                 | 454 ++++++++++++++++++++++++++++------
 include/linux/platform_data/ti-sysc.h |  12 +
 4 files changed, 456 insertions(+), 109 deletions(-)
