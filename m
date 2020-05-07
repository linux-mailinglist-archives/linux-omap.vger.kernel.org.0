Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED41A1C97F1
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 19:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgEGRfl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 13:35:41 -0400
Received: from muru.com ([72.249.23.125]:53456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgEGRfk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 May 2020 13:35:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B9CBE80CD;
        Thu,  7 May 2020 17:36:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.7-rc cycle
Date:   Thu,  7 May 2020 10:35:26 -0700
Message-Id: <pull-1588872844-804667@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.6/fixes-rc4

for you to fetch changes up to 738b150ecefbffb6e55cfa8a3b66a844f777d8fb:

  ARM: dts: omap4-droid4: Fix occasional lost wakeirq for uart1 (2020-05-05 10:19:39 -0700)

----------------------------------------------------------------
Fixes for omaps for v5.6-rc cycle

Few device tree fixes for various devices:

- A regression fix for non-existing can device on am534x-idk

- Fix missing dma-ranges for dra7 pcie

- Fix flakey wlan on droid4 where some devices would not connect
  at all because of internal pull being used with an external pull

- Fix occasional missed wake-up events on droid4 modem uart

----------------------------------------------------------------
Faiz Abbas (1):
      ARM: dts: am574x-idk: Disable m_can node

Kishon Vijay Abraham I (1):
      ARM: dts: dra7: Fix bus_dma_limit for PCIe

Tony Lindgren (3):
      Merge branch 'fixes-v5.7' into fixes
      ARM: dts: omap4-droid4: Fix flakey wlan by disabling internal pull for gpio
      ARM: dts: omap4-droid4: Fix occasional lost wakeirq for uart1

 arch/arm/boot/dts/am574x-idk.dts                |  4 +++
 arch/arm/boot/dts/dra7.dtsi                     |  4 +--
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 43 +++++++++++++++++++++++--
 arch/arm/boot/dts/omap3-n950-n9.dtsi            |  5 +++
 4 files changed, 51 insertions(+), 5 deletions(-)
