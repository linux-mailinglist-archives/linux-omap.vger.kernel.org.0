Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80515298AD4
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 11:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772277AbgJZK60 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 06:58:26 -0400
Received: from muru.com ([72.249.23.125]:46432 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1772258AbgJZK60 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DA18480AA;
        Mon, 26 Oct 2020 10:58:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Few ti-sysc related fixes
Date:   Mon, 26 Oct 2020 12:58:08 +0200
Message-Id: <20201026105812.38418-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are few fixes for ti-sysc interconnect target module driver related
issues.

Regards,

Tony


Tony Lindgren (4):
  ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
  ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
  bus: ti-sysc: Fix reset status check for modules with quirks
  bus: ti-sysc: Fix bogus resetdone warning for cpsw

 arch/arm/mach-omap2/Kconfig           |  3 ++-
 drivers/bus/ti-sysc.c                 | 28 ++++++++++++++++-----------
 include/linux/platform_data/ti-sysc.h |  1 +
 3 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.29.1
