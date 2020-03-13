Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFC31185070
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 21:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgCMUkq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 16:40:46 -0400
Received: from muru.com ([72.249.23.125]:60108 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgCMUkp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Mar 2020 16:40:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D5A4E8087;
        Fri, 13 Mar 2020 20:41:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] ti-sysc fix for v5.6
Date:   Fri, 13 Mar 2020 13:40:42 -0700
Message-Id: <pull-1584132028-918607@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b2745d92bb015cc4454d4195c4ce6e2852db397e:

  bus: ti-sysc: Add support for PRUSS SYSC type (2020-03-04 07:54:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/ti-sysc-fix-signed

for you to fetch changes up to aef067e8e95d856bc09557a91e740b2d6a81a6ae:

  Merge branch 'fix-lcdc-quirk' into omap-for-v5.7/ti-sysc (2020-03-10 09:06:02 -0700)

----------------------------------------------------------------
Fix for ti-sysc suspend/resume issue on am335x for v5.7 merge window

Just merge in a ti-sysc fix for am335x lcdc suspend/resume issue, and
resolve merge conflict.

----------------------------------------------------------------
Tony Lindgren (2):
      bus: ti-sysc: Fix quirk flags for lcdc on am335x
      Merge branch 'fix-lcdc-quirk' into omap-for-v5.7/ti-sysc

 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
