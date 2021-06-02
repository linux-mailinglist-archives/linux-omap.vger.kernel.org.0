Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA543980DD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 08:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhFBGBy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 02:01:54 -0400
Received: from muru.com ([72.249.23.125]:35214 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230319AbhFBGBx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 02:01:53 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 93D1B80E0;
        Wed,  2 Jun 2021 06:00:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] SATA regresion fix for TI dra7 for v5.13
Date:   Wed,  2 Jun 2021 09:00:05 +0300
Message-Id: <pull-1622613578-121536@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit d995d3d025bbd2d89abf12418f20d19bc0cb0130:

  bus: ti-sysc: Use kzalloc for allocating only one thing (2021-03-24 13:44:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-sata

for you to fetch changes up to db8e712e06874e37a1fdb9bb011618811fc96dbd:

  bus: ti-sysc: Fix missing quirk flags for sata (2021-05-07 14:21:32 +0300)

----------------------------------------------------------------
Regression fix for TI dra7 SATA not detecting drives

The SATA quirk flags are no missing With recent removal of legacy
platform data and we need to add the quirk flags to detect drives.

----------------------------------------------------------------
Tony Lindgren (1):
      bus: ti-sysc: Fix missing quirk flags for sata

 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
