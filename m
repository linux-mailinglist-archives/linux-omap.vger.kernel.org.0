Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 046D6564E80
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jul 2022 09:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbiGDHQb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jul 2022 03:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbiGDHQb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Jul 2022 03:16:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5557F26CB
        for <linux-omap@vger.kernel.org>; Mon,  4 Jul 2022 00:16:30 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C965980C1;
        Mon,  4 Jul 2022 07:11:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps
Date:   Mon,  4 Jul 2022 10:16:26 +0300
Message-Id: <pull-1656918942-515224@atomide.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.20/dt-signed

for you to fetch changes up to 6db372de959ac68b261cdbc2dd3c315f256c6d74:

  ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone Black (2022-06-27 13:56:06 +0300)

----------------------------------------------------------------
Devicetree changes omaps for v5.20 merge window

Just one devicetree change to add EEPROM regulator for BeagleBone Black.

----------------------------------------------------------------
Mark Brown (1):
      ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone Black

 arch/arm/boot/dts/am335x-boneblack.dts | 4 ++++
 1 file changed, 4 insertions(+)
