Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936E621BC80
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 19:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgGJRnx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 13:43:53 -0400
Received: from muru.com ([72.249.23.125]:33322 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbgGJRnx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Jul 2020 13:43:53 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D309180E5;
        Fri, 10 Jul 2020 17:44:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Device tree changes for omaps for v5.9
Date:   Fri, 10 Jul 2020 10:43:46 -0700
Message-Id: <pull-1594402929-762188@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.9/dt-signed

for you to fetch changes up to e14d2c766392ff1f226017fd62f0b6283a53bd0c:

  ARM: dts: am335x-pocketbeagle: add gpio-line-names (2020-06-29 11:24:27 -0700)

----------------------------------------------------------------
Device tree changes for omaps for v5.9 merge window

This series of changes configures the GPIO line names for am335x beaglebone
black and pocketbeagle to make it easier to configure the pins. To make use
of the pins, we also add the gpio-ranges for am335x.

We also enable IPU and DSP repmoteproc for am5729-beaglebone-ai, and then
there are two non-urgent dtschema validator warning fixes.

----------------------------------------------------------------
Drew Fustini (3):
      ARM: dts: am33xx-l4: add gpio-ranges
      ARM: dts: am335x-boneblack: add gpio-line-names
      ARM: dts: am335x-pocketbeagle: add gpio-line-names

Krzysztof Kozlowski (2):
      ARM: dts: omap: Align L2 cache-controller nodename with dtschema
      ARM: dts: am: Align L2 cache-controller nodename with dtschema

Suman Anna (2):
      ARM: dts: am5729-beaglebone-ai: Enable IPU & DSP rprocs
      ARM: dts: am5729-beaglebone-ai: Disable ununsed mailboxes

 arch/arm/boot/dts/am335x-boneblack.dts    | 144 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am335x-pocketbeagle.dts | 144 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/am33xx-l4.dtsi          |  24 +++++
 arch/arm/boot/dts/am4372.dtsi             |   2 +-
 arch/arm/boot/dts/am5729-beagleboneai.dts |  73 +++++----------
 arch/arm/boot/dts/omap4.dtsi              |   2 +-
 6 files changed, 335 insertions(+), 54 deletions(-)
