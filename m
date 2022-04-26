Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7BC50F4EB
	for <lists+linux-omap@lfdr.de>; Tue, 26 Apr 2022 10:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbiDZIkf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Apr 2022 04:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345777AbiDZIja (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Apr 2022 04:39:30 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBC8D4474C
        for <linux-omap@vger.kernel.org>; Tue, 26 Apr 2022 01:31:00 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0B3E480C0;
        Tue, 26 Apr 2022 08:27:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Binding changes for omaps
Date:   Tue, 26 Apr 2022 11:30:54 +0300
Message-Id: <pull-1650961799-428630@atomide.com>
X-Mailer: git-send-email 2.35.2
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/bindings-signed

for you to fetch changes up to fc3d39d5758dc001662df5aac825b2b6bcb6476f:

  dt-bindings: clock: ti: Add clock-output-names for TI composite clocks (2022-04-11 16:02:50 +0300)

----------------------------------------------------------------
Clock binding updates for omaps

Minor clock binding changes to document clock-output-names usage for omaps
so we can fix lots of related dt bindings check warnings. The related driver
changes already got merged for v5.18.

----------------------------------------------------------------
Tony Lindgren (3):
      dt-bindings: omap: Add clock-output-names and #clock-cells
      dt-bindings: clock: ti: Add clock-output-names for clockctrl
      dt-bindings: clock: ti: Add clock-output-names for TI composite clocks

 Documentation/devicetree/bindings/arm/omap/prcm.txt               | 7 ++++++-
 Documentation/devicetree/bindings/clock/ti-clkctrl.txt            | 4 +++-
 Documentation/devicetree/bindings/clock/ti/clockdomain.txt        | 3 +++
 Documentation/devicetree/bindings/clock/ti/composite.txt          | 3 +++
 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt | 1 +
 Documentation/devicetree/bindings/clock/ti/gate.txt               | 1 +
 Documentation/devicetree/bindings/clock/ti/interface.txt          | 1 +
 Documentation/devicetree/bindings/clock/ti/mux.txt                | 1 +
 8 files changed, 19 insertions(+), 2 deletions(-)
