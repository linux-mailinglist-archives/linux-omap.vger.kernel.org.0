Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718C53E1086
	for <lists+linux-omap@lfdr.de>; Thu,  5 Aug 2021 10:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238372AbhHEIr0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 04:47:26 -0400
Received: from muru.com ([72.249.23.125]:35982 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239659AbhHEIrZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Aug 2021 04:47:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3C2E38131;
        Thu,  5 Aug 2021 08:47:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Driver changes for ti-sysc for v5.15
Date:   Thu,  5 Aug 2021 11:46:43 +0300
Message-Id: <pull-1628153040-834155@atomide.com-2>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628153040-834155@atomide.com>
References: <pull-1628153040-834155@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/ti-sysc-signed

for you to fetch changes up to fdc07ca0724dd8ad00c22909a1464dc73ed6783e:

  Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)

----------------------------------------------------------------
Driver changes for ti-sysc for v5.15

Few ti-sysc changes to handle quirk for McASP SIDLE mode, correct
documentation for sysc_ioremap(), and start using
pm_runtime_resume_and_get().

----------------------------------------------------------------
Lee Jones (1):
      bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'

Peter Ujfalusi (1):
      bus: ti-sysc: Add quirk for OMAP4 McASP to disable SIDLE mode

Tony Lindgren (1):
      Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc

Zhang Qilong (1):
      bus: ti-sysc: using pm_runtime_resume_and_get instead of pm_runtime_get_sync

 drivers/bus/ti-sysc.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)
