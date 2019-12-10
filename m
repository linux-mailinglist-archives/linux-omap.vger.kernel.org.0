Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642F7119E9D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 23:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLJWyj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 17:54:39 -0500
Received: from muru.com ([72.249.23.125]:44978 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbfLJWyj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 17:54:39 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3E52D820B;
        Tue, 10 Dec 2019 22:55:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/6] Probe omap4 crypt accelerators with ti-sysc
Date:   Tue, 10 Dec 2019 14:54:27 -0800
Message-Id: <20191210225433.2720-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series updates omap4 crypto accelerators to probe with ti-sysc.

Note that this series depends on the following series:

[PATCH 0/5] Clock changes needed to probe rng on omap4 and 5

Regards,

Tony


Tony Lindgren (6):
  ARM: dts: Configure interconnect target module for omap4 sham
  ARM: dts: Configure interconnect target module for omap4 aes
  ARM: dts: Configure interconnect target module for omap4 des
  ARM: OMAP2+: Drop legacy platform data for omap4 aes
  ARM: OMAP2+: Drop legacy platform data for omap4 sham
  ARM: OMAP2+: Drop legacy platform data for omap4 des

 arch/arm/boot/dts/omap4-l4.dtsi            |  29 +++++
 arch/arm/boot/dts/omap4.dtsi               | 110 ++++++++++++-----
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 135 ---------------------
 3 files changed, 109 insertions(+), 165 deletions(-)

-- 
2.24.0
