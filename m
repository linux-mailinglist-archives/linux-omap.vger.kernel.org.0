Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6BE3458FE
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 08:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCWHnh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 03:43:37 -0400
Received: from muru.com ([72.249.23.125]:45918 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhCWHnb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Mar 2021 03:43:31 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3F05480E5;
        Tue, 23 Mar 2021 07:44:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCHv2 0/2] Fixes for for dra7 timer wrap errata i940
Date:   Tue, 23 Mar 2021 09:43:24 +0200
Message-Id: <20210323074326.28302-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here is v2 set of fixes for dra7 ARM architected timer wrap errata i940
where the timer fails to wrap after 388 days. The workaround is to use two
dmtimers as the local timers instead.

Note that these patches depend on timer posted mode fixes series
"[PATCH 0/3] Fixes for timer-ti-dm systimer posted mode" for the write
status register check fix. Also the spurious timer interrupt fix is
good to have from that series.

Regards,

Tony

Changes since v1:
- Drop pointless irqflags and IRQF_NOBALANCING as noted by Daniel

Tony Lindgren (2):
  clocksource/drivers/timer-ti-dm: Prepare to handle dra7 timer wrap
    issue
  clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940

 arch/arm/boot/dts/dra7-l4.dtsi             |   4 +-
 arch/arm/boot/dts/dra7.dtsi                |  20 +++
 drivers/clocksource/timer-ti-dm-systimer.c | 142 +++++++++++++++++----
 include/linux/cpuhotplug.h                 |   1 +
 4 files changed, 142 insertions(+), 25 deletions(-)

-- 
2.31.0
