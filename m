Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D9513F44B
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 19:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390002AbgAPSss (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 13:48:48 -0500
Received: from muru.com ([72.249.23.125]:51308 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389814AbgAPSsr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Jan 2020 13:48:47 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A652081A1;
        Thu, 16 Jan 2020 18:49:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] 
Date:   Thu, 16 Jan 2020 10:48:13 -0800
Message-Id: <pull-1579200367-372444@atomide.com-4>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <pull-1579200367-372444@atomide.com>
References: <pull-1579200367-372444@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bfe0237dd6c441f0ba531755ab24579eaee99be7:

  ARM: dts: am335x-icev2: Add support for OSD9616P0899-10 at i2c0 (2019-12-12 09:35:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/dt-part2-signed

for you to fetch changes up to 6bcc319fc6192cb03f3db41f0e266b796b0e424f:

  ARM: dts: Add omap3-echo (2020-01-13 10:11:40 -0800)

----------------------------------------------------------------
More dts changes for omaps for v5.6 merge window

Add basic support for first generation Amazon omap3-echo. This got
applied rather late as we discussed how to deal with SoC variants
with some accelerators unaccessible, and eventually ended up setting
up few more SoC specific dtsi files. Eventually we'll need to also
detect the disabled accelerators on driver init, but more patching
is needed for that.

----------------------------------------------------------------
André Hentschel (2):
      ARM: dts: Add dtsi files for AM3703, AM3715 and DM3725
      ARM: dts: Add omap3-echo

 arch/arm/boot/dts/Makefile       |   1 +
 arch/arm/boot/dts/am3703.dtsi    |  14 ++
 arch/arm/boot/dts/am3715.dtsi    |  10 +
 arch/arm/boot/dts/dm3725.dtsi    |  10 +
 arch/arm/boot/dts/omap3-echo.dts | 461 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 496 insertions(+)
 create mode 100644 arch/arm/boot/dts/am3703.dtsi
 create mode 100644 arch/arm/boot/dts/am3715.dtsi
 create mode 100644 arch/arm/boot/dts/dm3725.dtsi
 create mode 100644 arch/arm/boot/dts/omap3-echo.dts
