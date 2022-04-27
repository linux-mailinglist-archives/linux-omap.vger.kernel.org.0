Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E625117E9
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 14:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbiD0MLt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 08:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbiD0MLs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 08:11:48 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 407335522E
        for <linux-omap@vger.kernel.org>; Wed, 27 Apr 2022 05:08:37 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 52502813D;
        Wed, 27 Apr 2022 12:05:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] Defconfig changes for omaps
Date:   Wed, 27 Apr 2022 15:08:26 +0300
Message-Id: <pull-1651061256-836848@atomide.com-2>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <pull-1651061256-836848@atomide.com>
References: <pull-1651061256-836848@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/defconfig-signed

for you to fetch changes up to 5c81cfb6a60a7abbfe7520fa13cabdad094d3d39:

  ARM: omap2plus_defconfig: Enable ISP176x USB driver (2022-04-21 15:00:49 +0300)

----------------------------------------------------------------
Defconfig changes for omaps

Changes to add tlv320aic3x and is176x drivers as loadable modules
to omap2plus_defconfig.

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Enable ISP176x USB driver

Merlijn Wajer (1):
      ARM: omap2plus_defconfig: enable TLV320AIC3X

 arch/arm/configs/omap2plus_defconfig | 3 +++
 1 file changed, 3 insertions(+)
