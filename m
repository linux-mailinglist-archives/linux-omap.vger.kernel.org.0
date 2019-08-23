Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4E49B887
	for <lists+linux-omap@lfdr.de>; Sat, 24 Aug 2019 00:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391574AbfHWWYr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 18:24:47 -0400
Received: from muru.com ([72.249.23.125]:58484 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731062AbfHWWYr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 23 Aug 2019 18:24:47 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 329518161;
        Fri, 23 Aug 2019 22:25:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] dts changes for omap variants for v5.4
Date:   Fri, 23 Aug 2019 15:24:42 -0700
Message-Id: <pull-1566599057-142651@atomide.com-2>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <pull-1566599057-142651@atomide.com>
References: <pull-1566599057-142651@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/dt-take2-signed

for you to fetch changes up to a27401cecf7795cda7e0c17751feb98fedbaa99d:

  ARM: dts: am335x-boneblue: Use of am335x-osd335x-common.dtsi (2019-08-13 04:51:31 -0700)

----------------------------------------------------------------
dts changes for omap variants for v5.4

Remove regulator-boot-off properties that we never had in the mainline
kernel so they won't do anything. We add stdout-path for gta04, and
make am335x-boneblue use am335x-osd335x-common.dtsi file.

----------------------------------------------------------------
David Lechner (1):
      ARM: dts: am335x-boneblue: Use of am335x-osd335x-common.dtsi

Ezequiel Garcia (2):
      ARM: dts: am335x-cm-t335: Remove regulator-boot-off property
      ARM: dts: omap3-n950-n9: Remove regulator-boot-off property

H. Nikolaus Schaller (1):
      ARM: dts: gta04: define chosen/stdout-path

 arch/arm/boot/dts/am335x-boneblue.dts | 92 +----------------------------------
 arch/arm/boot/dts/am335x-cm-t335.dts  |  1 -
 arch/arm/boot/dts/omap3-gta04.dtsi    |  4 ++
 arch/arm/boot/dts/omap3-n950-n9.dtsi  |  1 -
 4 files changed, 6 insertions(+), 92 deletions(-)
