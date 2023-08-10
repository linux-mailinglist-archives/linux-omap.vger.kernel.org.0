Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70731777448
	for <lists+linux-omap@lfdr.de>; Thu, 10 Aug 2023 11:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbjHJJTp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Aug 2023 05:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbjHJJTZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Aug 2023 05:19:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7D8449ED
        for <linux-omap@vger.kernel.org>; Thu, 10 Aug 2023 02:17:24 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8883D80A9;
        Thu, 10 Aug 2023 09:17:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/4] Devicetree binding changes for omaps for v6.6
Date:   Thu, 10 Aug 2023 12:16:50 +0300
Message-ID: <pull-1691658952-110529@atomide.com>
X-Mailer: git-send-email 2.41.0
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/dt-bindings-signed

for you to fetch changes up to c5a5583ecfa02a858983a0cad710201fe0eea03f:

  dt-bindings: omap: Partially convert omap.txt to yaml (2023-07-31 09:09:21 +0300)

----------------------------------------------------------------
Devicetree binding changes for omaps for v6.6

Just one change to get started on SoC yaml binding changes for omaps.

----------------------------------------------------------------
Andrew Davis (1):
      dt-bindings: omap: Partially convert omap.txt to yaml

 .../devicetree/bindings/arm/omap/omap.txt          |  99 ------------
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 176 +++++++++++++++++++++
 2 files changed, 176 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/ti/omap.yaml
