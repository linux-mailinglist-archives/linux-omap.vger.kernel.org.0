Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9201330CD6
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 12:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhCHL4q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 06:56:46 -0500
Received: from muru.com ([72.249.23.125]:40746 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230202AbhCHL4m (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 06:56:42 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2811B80D4;
        Mon,  8 Mar 2021 11:57:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] Two omap4/5 fixes
Date:   Mon,  8 Mar 2021 13:56:29 +0200
Message-Id: <20210308115631.44270-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here two fixes noticed while testing my pending patches to drop legacy
data in favor of device tree data for omap4/5.

Regards,

Tony


Tony Lindgren (2):
  ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race
  ARM: dts: Fix moving mmc devices with aliases for omap4 & 5

 arch/arm/boot/dts/omap4.dtsi           | 5 +++++
 arch/arm/boot/dts/omap44xx-clocks.dtsi | 8 --------
 arch/arm/boot/dts/omap5.dtsi           | 5 +++++
 3 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.30.1
