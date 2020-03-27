Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7FF195F97
	for <lists+linux-omap@lfdr.de>; Fri, 27 Mar 2020 21:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgC0UXp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Mar 2020 16:23:45 -0400
Received: from muru.com ([72.249.23.125]:33316 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgC0UXp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Mar 2020 16:23:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CD05C809F;
        Fri, 27 Mar 2020 20:24:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] One N950/N9 boot regression fix
Date:   Fri, 27 Mar 2020 13:23:37 -0700
Message-Id: <pull-1585340588-558327@atomide.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit dfa7ea303f56a3a8b1ed3b91ef35af2da67ca4ee:

  ARM: dts: omap5: Add bus_dma_limit for L3 bus (2020-03-17 10:01:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/fixes-rc7-signed

for you to fetch changes up to 07bdc492cff6f555538df95e9812fe72e16d154a:

  ARM: dts: OMAP3: disable RNG on N950/N9 (2020-03-26 10:04:56 -0700)

----------------------------------------------------------------
Boot regression fix for N950/N9

We need to tag RNG as disabled for N950/N9 as it blocked by the secure
mode. We have a similar change done for N900, but I missed adding it
for N950/N9 with the recent RNG changes.

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: dts: OMAP3: disable RNG on N950/N9

 arch/arm/boot/dts/omap3-n950-n9.dtsi | 5 +++++
 1 file changed, 5 insertions(+)
