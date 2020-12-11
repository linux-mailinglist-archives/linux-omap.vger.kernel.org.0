Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839C12D71EE
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 09:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392150AbgLKIix (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 03:38:53 -0500
Received: from muru.com ([72.249.23.125]:50128 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391494AbgLKIic (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Dec 2020 03:38:32 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1696980EB;
        Fri, 11 Dec 2020 08:37:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Late defconfig changes for omaps for v5.11
Date:   Fri, 11 Dec 2020 10:37:42 +0200
Message-Id: <pull-1607675790-251347@atomide.com-2>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1607675790-251347@atomide.com>
References: <pull-1607675790-251347@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit eaf7697b6febe2b086503f525f070d8e3ca1ea0f:

  ARM: omap2plus_defconfig: Enable TI eQEP counter driver (2020-11-24 11:04:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/defconfig-late-signed

for you to fetch changes up to 2f6fc9e08bf79f11516edef855283c6212bbe78f:

  ARM: omap2plus_defconfig: enable SPI GPIO (2020-12-07 15:59:41 +0200)

----------------------------------------------------------------
Late defconfig changes for omaps for v5.11 merge window

Drop drop unused POWER_AVS option, and enable CONFIG_SPI_GPIO as
a loadable module so gta04 needs it for controlling the td028ttec1
panel.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable SPI GPIO

Andrey Zhizhikin (1):
      ARM: omap2plus_defconfig: drop unused POWER_AVS option

 arch/arm/configs/omap2plus_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
