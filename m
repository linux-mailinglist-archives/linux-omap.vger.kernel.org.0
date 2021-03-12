Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C3C338895
	for <lists+linux-omap@lfdr.de>; Fri, 12 Mar 2021 10:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbhCLJZq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Mar 2021 04:25:46 -0500
Received: from muru.com ([72.249.23.125]:42294 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232840AbhCLJZa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 12 Mar 2021 04:25:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 78BCC8057;
        Fri, 12 Mar 2021 09:26:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Few clean-up patches after dropping legacy data
Date:   Fri, 12 Mar 2021 11:25:14 +0200
Message-Id: <20210312092516.42884-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are few clean-up patches after we are dropping the legacy data for
omap4/5 and dra7. These are against my omap-for-v5.13/genpd-drop-legacy
branch at [0].

Regards,

Tony


[0] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.13/genpd-drop-legacy

Tony Lindgren (2):
  ARM: OMAP2+: Stop building legacy code for dra7 and omap4/5
  bus: ti-sysc: Warn about old dtb for dra7 and omap4/5

 arch/arm/mach-omap2/Makefile       |  8 ++++----
 arch/arm/mach-omap2/io.c           |  7 ++++++-
 arch/arm/mach-omap2/omap_hwmod.h   | 13 +++++++++++++
 arch/arm/mach-omap2/pdata-quirks.c |  2 +-
 arch/arm/mach-omap2/sr_device.c    |  7 +++++++
 drivers/bus/ti-sysc.c              |  3 +++
 6 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.30.2
