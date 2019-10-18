Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76544DD3E9
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2019 00:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404727AbfJRWV1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 18:21:27 -0400
Received: from muru.com ([72.249.23.125]:38178 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729186AbfJRWV0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 18:21:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DF3E1809F;
        Fri, 18 Oct 2019 22:21:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/2] Better voltage controller configuration for droid4
Date:   Fri, 18 Oct 2019 15:21:05 -0700
Message-Id: <20191018222107.32917-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are two more patches to change droid4 to use low-speed configuration
like the Motorola Mapphone Android Linux kernel does.

This gains us a power saving of 7mW bringing the whole device power
consumption in retention idle mode to about 32mW between wakeups with
screen blanked, modem off, usb and phy modules unloaded and wlan
connected. That's about the same number as I measured Android do in
flight mode suspended.

With the pending modem patches with modem online, I'm now seeing average
power consumption of about 60 - 70mW for the whole device as measured
once a minute from /sys/class/power_supply/battery/power_avg.

The patches are against v5.4-rc1 on top of the related patches:

[PATCH 0/8] Improve PM for omap4 devices

Regards,

Tony


Tony Lindgren (2):
  ARM: OMAP2+: Configure voltage controller for retention
  ARM: OMAP2+: Configure voltage controller for cpcap to low-speed

 arch/arm/mach-omap2/pmic-cpcap.c | 18 ++++++++++++-----
 arch/arm/mach-omap2/vc.c         | 34 ++++++++++++++++++++++++++++----
 arch/arm/mach-omap2/vc.h         |  2 +-
 3 files changed, 44 insertions(+), 10 deletions(-)

-- 
2.23.0
