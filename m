Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C833EC5D3
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2019 16:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfKAPqt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Nov 2019 11:46:49 -0400
Received: from muru.com ([72.249.23.125]:40398 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbfKAPqt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 Nov 2019 11:46:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5FFD98140;
        Fri,  1 Nov 2019 15:47:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] prm reset control dts changes for omaps for v5.5
Date:   Fri,  1 Nov 2019 08:46:45 -0700
Message-Id: <pull-1572623173-281197@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5478f912d225a1745a4b3d5f564daa0004d35a42:

  soc: ti: omap-prm: add omap5 PRM data (2019-10-09 08:55:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/prm-signed

for you to fetch changes up to a868da75fd8f925caaf7f5381b2dccff2a244986:

  ARM: dts: omap5: Add PRM data (2019-10-10 07:22:36 -0700)

----------------------------------------------------------------
PRM reset control dts changes for v5.5 merge window

This series of changes adds the PRM reset driver nodes for am3/4, omap4/5
and dra7 SoCs. The reset driver changes make it easier to add support for
various accelerators for TI SoCs in a more generic way.

Note that this branch is based on the PRM reset driver changes branch.

----------------------------------------------------------------
Tero Kristo (5):
      ARM: dts: dra7: add PRM nodes
      ARM: dts: omap4: add PRM nodes
      ARM: dts: am33xx: Add PRM data
      ARM: dts: am43xx: Add PRM data
      ARM: dts: omap5: Add PRM data

 arch/arm/boot/dts/am33xx.dtsi   | 26 +++++++++++++++++++++
 arch/arm/boot/dts/am4372.dtsi   | 26 +++++++++++++++++++++
 arch/arm/boot/dts/dra7.dtsi     | 51 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap4-l4.dtsi |  2 +-
 arch/arm/boot/dts/omap4.dtsi    | 26 +++++++++++++++++++++
 arch/arm/boot/dts/omap5.dtsi    | 26 +++++++++++++++++++++
 6 files changed, 156 insertions(+), 1 deletion(-)
