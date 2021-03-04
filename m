Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB2D32CDC6
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 08:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhCDHii (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Mar 2021 02:38:38 -0500
Received: from muru.com ([72.249.23.125]:39326 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232707AbhCDHiY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Mar 2021 02:38:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D889F80A3;
        Thu,  4 Mar 2021 07:38:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 0/2] Fixes for for dra7 timer wrap errata i940
Date:   Thu,  4 Mar 2021 09:37:35 +0200
Message-Id: <20210304073737.15810-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are fixes for dra7 ARM architected timer wrap errata i940 where it
fails to wrap after 388 days. The workaround is to use two dmtimers as
the local timers instead.

Note that these patches depend on timer posted mode fixes series
"[PATCH 0/3] Fixes for timer-ti-dm systimer posted mode" for the write
status register check fix. Also the spurious timer interrupt fix is
good to have from that series.

Regards,

Tony


Tony Lindgren (2):
  clocksource/drivers/timer-ti-dm: Prepare to handle dra7 timer wrap
    issue
  clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940

 arch/arm/boot/dts/dra7-l4.dtsi             |   4 +-
 arch/arm/boot/dts/dra7.dtsi                |  20 +++
 drivers/clocksource/timer-ti-dm-systimer.c | 148 +++++++++++++++++----
 include/linux/cpuhotplug.h                 |   1 +
 4 files changed, 148 insertions(+), 25 deletions(-)

-- 
2.30.1
