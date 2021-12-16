Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7437477297
	for <lists+linux-omap@lfdr.de>; Thu, 16 Dec 2021 14:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbhLPNEs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Dec 2021 08:04:48 -0500
Received: from muru.com ([72.249.23.125]:39124 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237207AbhLPNEs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Dec 2021 08:04:48 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1C17580DB;
        Thu, 16 Dec 2021 13:05:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v5.17
Date:   Thu, 16 Dec 2021 15:04:41 +0200
Message-Id: <pull-1639659798-679261@atomide.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.17/dt-signed

for you to fetch changes up to fa0fdb78cb5d4cde00430ec481f09fbe7c029376:

  ARM: dts: am335x: Use correct vendor prefix for Asahi Kasei Corp. (2021-12-09 10:06:42 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.17 merge window

These changes are mostly minor non-urgent fixes for typos and binding checks.
The system-power-controller gets configured for more am3 devices as it's not
am335x-boneblack speicif. For for am437x we add magnetic card reader support.

Note that the asahi-kasei,ak8975 binding changes may produce a new binding
check warning as the binding related change is merged separately.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: dts: elpida_ecb240abacn: Change Elpida compatible

Drew Fustini (2):
      ARM: dts: am335x-boneblack-common: move system-power-controller
      ARM: dts: am335x-icev2: Add system-power-controller to RTC node

Geert Uytterhoeven (1):
      ARM: dts: motorola-mapphone: Drop second ti,wlcore compatible value

Miquel Raynal (3):
      ARM: dts: am437x-cm-t43: Use a correctly spelled DT property
      ARM: dts: am43xx: Describe the magnetic reader/ADC1 hardware module
      ARM: dts: am437x-gp-evm: enable ADC1

Thierry Reding (1):
      ARM: dts: am335x: Use correct vendor prefix for Asahi Kasei Corp.

 arch/arm/boot/dts/am335x-bone-common.dtsi       |  1 +
 arch/arm/boot/dts/am335x-boneblack-common.dtsi  |  4 ----
 arch/arm/boot/dts/am335x-boneblue.dts           |  2 +-
 arch/arm/boot/dts/am335x-icev2.dts              |  4 ++++
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts     |  2 +-
 arch/arm/boot/dts/am437x-cm-t43.dts             |  2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts             |  8 +++++++
 arch/arm/boot/dts/am437x-l4.dtsi                | 31 +++++++++++++++++++++++--
 arch/arm/boot/dts/am43xx-clocks.dtsi            |  7 ++++++
 arch/arm/boot/dts/elpida_ecb240abacn.dtsi       |  2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi |  2 +-
 11 files changed, 54 insertions(+), 11 deletions(-)
