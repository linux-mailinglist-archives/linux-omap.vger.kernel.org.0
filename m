Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FDE18A972
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 00:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCRXsP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 19:48:15 -0400
Received: from muru.com ([72.249.23.125]:60858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbgCRXsO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 19:48:14 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 36F8480B6;
        Wed, 18 Mar 2020 23:49:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.6-rc cycle
Date:   Wed, 18 Mar 2020 16:48:12 -0700
Message-Id: <pull-1584575254-461940@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit cfb5d65f25959f724081bae8445a0241db606af6:

  ARM: dts: dra7: Add bus_dma_limit for L3 bus (2020-03-13 07:40:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/fixes-rc6-signed

for you to fetch changes up to dfa7ea303f56a3a8b1ed3b91ef35af2da67ca4ee:

  ARM: dts: omap5: Add bus_dma_limit for L3 bus (2020-03-17 10:01:28 -0700)

----------------------------------------------------------------
Few more fixes for omaps

Just few dts fixes:

- A fix droid4 touchscreen stopping working with lost gpio interrupts

- Also limit omap5 dma range similar to what we've recently done for dra7

----------------------------------------------------------------
Roger Quadros (1):
      ARM: dts: omap5: Add bus_dma_limit for L3 bus

Tony Lindgren (1):
      ARM: dts: omap4-droid4: Fix lost touchscreen interrupts

 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
 arch/arm/boot/dts/omap5.dtsi                    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
