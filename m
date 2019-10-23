Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E80EE2220
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 19:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfJWRy6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 13:54:58 -0400
Received: from muru.com ([72.249.23.125]:39476 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730027AbfJWRy6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 13:54:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8B12080CF;
        Wed, 23 Oct 2019 17:55:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] omap2plus_defconfig changes for v5.5
Date:   Wed, 23 Oct 2019 10:54:48 -0700
Message-Id: <pull-1571853258-16998@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 96d49bbfe6c1a6bb43ccd00fb87aca100e32e5e2:

  ARM: omap2plus_defconfig: Fix selected panels after generic panel changes (2019-10-03 09:44:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/defconfig-signed

for you to fetch changes up to ec2b31267263cd7d5a7567d315f839796c2a8c87:

  configs: omap2plus: Enable VIDEO_MT9P031 module (2019-10-22 09:11:03 -0700)

----------------------------------------------------------------
Defconfig changes for omap2plus_defconfig for v5.5

A series of changes from Adam Ford to update for removed and moved items,
and then enable crypto devices and MT9P031 video as loadable modules.

Looks like I missed unifying the subject line for one commit, but I did
not want to mess with the commit after pushing it out.

----------------------------------------------------------------
Adam Ford (4):
      ARM: omap2plus_defconfig: Update for removed items
      ARM: omap2plus_defconfig: Update for moved item
      ARM: omap2plus_defconfig: Enable HW Crypto engine modules
      configs: omap2plus: Enable VIDEO_MT9P031 module

 arch/arm/configs/omap2plus_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
