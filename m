Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD4C4148ED1
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 20:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392280AbgAXTpb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 14:45:31 -0500
Received: from muru.com ([72.249.23.125]:52174 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390664AbgAXTpa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jan 2020 14:45:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5883780FA;
        Fri, 24 Jan 2020 19:46:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] few minor fixes for omaps
Date:   Fri, 24 Jan 2020 11:45:26 -0800
Message-Id: <pull-1579895109-287828@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 03729cfa0d543bc996bf959e762ec999afc8f3d2:

  soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot (2019-12-17 15:18:36 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-fixes-whenever-signed

for you to fetch changes up to b0b03951544534d6d9ad4aa2787eefec988fff20:

  ARM: dts: am43x-epos-evm: set data pin directions for spi0 and spi1 (2020-01-23 08:12:04 -0800)

----------------------------------------------------------------
Few minor fixes for omaps

Looks like we have wrong default memory size for beaglebone black,
it has at least 512 MB of RAM and not 256 MB. This causes an issue
when booted with GRUB2 that does not seem to pass memory info to
the kernel.

And for am43x-epos-evm the SPI pin directions need to be configured
for SPI to work.

----------------------------------------------------------------
Matwey V. Kornilov (1):
      ARM: dts: am335x-boneblack-common: fix memory size

Raag Jadav (1):
      ARM: dts: am43x-epos-evm: set data pin directions for spi0 and spi1

 arch/arm/boot/dts/am335x-boneblack-common.dtsi | 5 +++++
 arch/arm/boot/dts/am43x-epos-evm.dts           | 2 ++
 2 files changed, 7 insertions(+)
