Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B57511BC8F
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfLKTML (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:11 -0500
Received: from muru.com ([72.249.23.125]:45788 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTML (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:11 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EC55C80FA;
        Wed, 11 Dec 2019 19:12:49 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Benoit Parrot <bparrot@ti.com>, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 00/13] Drop more legacy platform data for omaps
Date:   Wed, 11 Dec 2019 11:11:53 -0800
Message-Id: <20191211191206.12190-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are more patches to drop legacy platform data for v5.6,
please test.

To make testing easier, I've pushed out all the related patches
I've posted over past few days into omap-for-5.6/ti-sysc-testing
branch at [0][1].

Regards,

Tony

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-5.6/ti-sysc-testing
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-5.6/ti-sysc-testing


Tony Lindgren (13):
  ARM: OMAP2+: Drop legacy platform data for am4 ocp2scp
  ARM: OMAP2+: Drop legacy platform data for omap4 ocp2scp
  ARM: OMAP2+: Drop legacy platform data for omap5 ocp2scp
  ARM: OMAP2+: Drop legacy platform data for dra7 ocp2scp
  ARM: OMAP2+: Drop legacy platform data for am4 vpfe
  ARM: OMAP2+: Drop legacy platform data for omap4 hsi
  ARM: OMAP2+: Drop legacy platform data for omap4 smartreflex
  ARM: OMAP2+: Drop legacy platform data for dra7 smartreflex
  ARM: OMAP2+: Drop legacy platform data for omap4 kbd
  ARM: OMAP2+: Drop legacy platform data for omap5 kbd
  ARM: OMAP2+: Drop legacy platform data for omap4 slimbus
  ARM: OMAP2+: Drop legacy platform data for dra7 rtcss
  ARM: OMAP2+: Drop legacy platform data for omap4 fdif

 arch/arm/boot/dts/am437x-l4.dtsi           |   4 -
 arch/arm/boot/dts/dra7-l4.dtsi             |   5 -
 arch/arm/boot/dts/omap4-l4.dtsi            |   8 -
 arch/arm/boot/dts/omap4.dtsi               |   1 -
 arch/arm/boot/dts/omap5-l4.dtsi            |   3 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 115 ------
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 423 ---------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 117 ------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  | 194 ----------
 9 files changed, 870 deletions(-)

-- 
2.24.1
