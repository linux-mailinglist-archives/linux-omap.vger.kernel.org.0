Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81B11687D3
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 20:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgBUTxH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 14:53:07 -0500
Received: from muru.com ([72.249.23.125]:56834 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgBUTxH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 14:53:07 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EB03B807E;
        Fri, 21 Feb 2020 19:53:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/7] ti-sysc driver fix for hdq1w and few improvments
Date:   Fri, 21 Feb 2020 11:52:49 -0800
Message-Id: <20200221195256.54016-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are some ti-sysc interconnect target module driver fixes and
improvments.

There's a fix for 1-wire reset, the rest can wait for v5.7 merge
window.

Regards,

Tony



Tony Lindgren (7):
  bus: ti-sysc: Fix 1-wire reset quirk
  bus: ti-sysc: Rename clk related quirks to pre_reset and post_reset
    quirks
  ti-sysc: Improve reset to work with modules with no sysconfig
  bus: ti-sysc: Consider non-existing registers too when matching quirks
  bus: ti-sysc: Don't warn about legacy property for nested ti-sysc
    devices
  bus: ti-sysc: Implement SoC revision handling
  bus: ti-sysc: Handle module unlock quirk needed for some RTC

 arch/arm/mach-omap2/pdata-quirks.c    |   6 +
 drivers/bus/ti-sysc.c                 | 430 ++++++++++++++++++++------
 include/linux/platform_data/ti-sysc.h |   2 +
 3 files changed, 348 insertions(+), 90 deletions(-)

-- 
2.25.1
