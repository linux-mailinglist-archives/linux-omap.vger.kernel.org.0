Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F71E330FD5
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCHNqz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:55 -0500
Received: from muru.com ([72.249.23.125]:40906 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhCHNqd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:33 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9366B80D4;
        Mon,  8 Mar 2021 13:47:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/11] Drop legacy data for omap4
Date:   Mon,  8 Mar 2021 15:46:16 +0200
Message-Id: <20210308134627.13056-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are the changes to drop legacy data for omap4 as we can now boot with
devicetree data using genpd and simple-pm-bus.

These patches are against v5.12-rc2, and depend on the following series of
patches:

[PATCH 00/12] Update omap4 devicetree files to probe with genpd

Regards,

Tony


Tony Lindgren (11):
  ARM: OMAP2+: Drop legacy platform data for omap4 iss
  ARM: OMAP2+: Drop legacy platform data for omap4 control modules
  ARM: OMAP2+: Drop legacy platform data for omap4 dmm
  ARM: OMAP2+: Drop legacy platform data for omap4 emif
  ARM: OMAP2+: Drop legacy platform data for omap4 debugss
  ARM: OMAP2+: Drop legacy platform data for omap4 mpu
  ARM: OMAP2+: Drop legacy platform data for omap4 l4_wkup
  ARM: OMAP2+: Drop legacy platform data for omap4 l4_per
  ARM: OMAP2+: Drop legacy platform data for omap4 l4_cfg
  ARM: OMAP2+: Drop legacy platform data for omap4 l3
  ARM: OMAP2+: Drop legacy platform data for omap4 hwmod

 arch/arm/boot/dts/omap4-l4.dtsi            |   4 -
 arch/arm/boot/dts/omap4.dtsi               |   8 +-
 arch/arm/mach-omap2/Kconfig                |   1 -
 arch/arm/mach-omap2/Makefile               |   1 -
 arch/arm/mach-omap2/io.c                   |   1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 877 ---------------------
 6 files changed, 1 insertion(+), 891 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_44xx_data.c

-- 
2.30.1
