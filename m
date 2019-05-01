Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4993610B06
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 18:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfEAQPt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 12:15:49 -0400
Received: from muru.com ([72.249.23.125]:47726 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbfEAQPp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 12:15:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F3368805C;
        Wed,  1 May 2019 16:16:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] two fixes for omaps
Date:   Wed,  1 May 2019 09:15:36 -0700
Message-Id: <pull-1556727306-300309@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 81717283cf2c4c4d9bf8fd618cd6e5bdfe082edd:

  Merge commit '7d56bedb2730dc2ea8abf0fd7240ee99ecfee3c9' into omap-for-v5.1/fixes (2019-04-01 09:36:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.1/fixes-rc6

for you to fetch changes up to 6a38df676a0a06bfc7ff8607ac62ccd6d95969ad:

  ARM: dts: logicpd-som-lv: Fix MMC1 card detect (2019-04-30 08:49:25 -0700)

----------------------------------------------------------------
Two regression fixes for omaps

Two one-liners to fix board-ams-delta booting regression and
logicpd-som-lv MMC card detect to use GPIO_ACTIVE_LOW instead of
IRQ_TYPE_LEVEL_LOW. Note that the board-ams-delta regression has
been in there already since v5.0, so if necessary these can wait
for the merge window.

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: OMAP1: ams-delta: fix early boot crash when LED support is disabled

Adam Ford (1):
      ARM: dts: logicpd-som-lv: Fix MMC1 card detect

 arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi | 2 +-
 arch/arm/mach-omap1/board-ams-delta.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
