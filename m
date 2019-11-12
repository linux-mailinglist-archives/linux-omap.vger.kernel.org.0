Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE53F9729
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 18:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfKLRdI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 12:33:08 -0500
Received: from muru.com ([72.249.23.125]:41902 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbfKLRdI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 12:33:08 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1E6B280F3;
        Tue, 12 Nov 2019 17:33:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] few more dts changes for omaps for v5.5
Date:   Tue, 12 Nov 2019 09:33:01 -0800
Message-Id: <pull-1573579927-542764@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fedc8844d5004ffa69d3e320081bfd59979e1937:

  Merge branch 'omap-for-v5.5/droid4' into omap-for-v5.5/dt (2019-10-23 10:34:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/dt-late-signed

for you to fetch changes up to abb0e36b434d784864fe0e4d5dedd17f4d72f3e3:

  ARM: dts: logicpd-torpedo: Disable USB Host (2019-11-11 13:03:06 -0800)

----------------------------------------------------------------
Few late dts changes for omaps for v5.5 merge window

Let's configure omap3 rng as we can now easily do it with a dts change
only by tagging it with status = "disabled" for n900 where it's not
accessible. This improves the boot-up time with distros quite a bit with
proper entropy source around.

There's also another minor update for logicpd-torpedo that does not have
USB host pins wired.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: logicpd-torpedo: Disable USB Host

Tony Lindgren (2):
      ARM: dts: Configure omap3 rng
      Merge branch 'rng' into omap-for-v5.5/dt

 arch/arm/boot/dts/am3517.dtsi                   |  6 ++++++
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi      |  5 +++++
 arch/arm/boot/dts/omap3-n900.dts                |  5 +++++
 arch/arm/boot/dts/omap3.dtsi                    | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi |  2 +-
 5 files changed, 42 insertions(+), 1 deletion(-)
