Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCCD16B197
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgBXVKH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:07 -0500
Received: from muru.com ([72.249.23.125]:57108 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbgBXVKH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:07 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4CF8C8030;
        Mon, 24 Feb 2020 21:10:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 00/23] Drop platform data for omap DSS
Date:   Mon, 24 Feb 2020 13:09:36 -0800
Message-Id: <20200224210959.56146-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

This series configures dts data for omap display susbsystem (DSS)
and then drops the legacy platform data.

These patces are against v5.6-rc1, and depend on the following
two patch series:

[PATCH 0/7] ti-sysc driver fix for hdq1w and few improvments
[PATCH 0/3] ti-sysc changes for probing DSS with dts data

To make testing easier, I've pushed out these patches into a
temporary testing branch at [0][1] below.

So far I've tested this on omap4 (dsi and hdmi), omap5 (hdmi),
dra7 (hdmi) and am437x-sk-evm (dpi). Please test with your
use cases too.

Regards,

Tony

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.7/tmp-testing-drop-dss-pdata
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.7/tmp-testing-drop-dss-pdata

Tony Lindgren (23):
  ARM: dts: Configure interconnect target module for omap4 dss
  ARM: dts: Configure interconnect target module for omap4 dispc
  ARM: dts: Configure interconnect target module for omap4 rfbi
  ARM: dts: Configure interconnect target module for omap4 venc
  ARM: dts: Configure interconnect target module for omap4 dsi1
  ARM: dts: Configure interconnect target module for omap4 dsi2
  ARM: dts: Configure interconnect target module for omap4 hdmi
  ARM: OMAP2+: Drop legacy platform data for omap4 dss
  ARM: dts: Configure interconnect target module for omap5 dss
  ARM: dts: Configure interconnect target module for omap5 dispc
  ARM: dts: Configure interconnect target module for omap5 rfbi
  ARM: dts: Configure interconnect target module for omap5 dsi1
  ARM: dts: Configure interconnect target module for omap5 dsi2
  ARM: dts: Configure interconnect target module for omap5 hdmi
  ARM: OMAP2+: Drop legacy platform data for omap5 DSS
  ARM: dts: Configure interconnect target module for dra7 dss
  ARM: dts: Configure interconnect target module for dra7 dispc
  ARM: dts: Configure interconnect target module for dra7 hdmi
  ARM: OMAP2+: Drop legacy platform data for dra7 DSS
  ARM: dts: Move am437x dss to the interconnect target module in l4
  ARM: dts: Configure interconnect target module for am437x dispc
  ARM: dts: Configure interconnect target module for am437x rfbi
  ARM: OMAP2+: Drop legacy platform data for am437x DSS

 arch/arm/boot/dts/am4372.dtsi              |  32 --
 arch/arm/boot/dts/am437x-l4.dtsi           |  77 +++-
 arch/arm/boot/dts/dra7.dtsi                | 123 +++++--
 arch/arm/boot/dts/dra72x.dtsi              |   6 +-
 arch/arm/boot/dts/dra74x.dtsi              |  10 +-
 arch/arm/boot/dts/omap4-l4.dtsi            |   1 +
 arch/arm/boot/dts/omap4.dtsi               | 278 ++++++++++----
 arch/arm/boot/dts/omap5.dtsi               | 241 ++++++++----
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 101 ------
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 404 ---------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 288 ---------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  | 163 ---------
 12 files changed, 550 insertions(+), 1174 deletions(-)

-- 
2.25.1
