Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F143AC483
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 09:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbhFRHHS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 03:07:18 -0400
Received: from muru.com ([72.249.23.125]:48220 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhFRHHS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Jun 2021 03:07:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E3F56807E;
        Fri, 18 Jun 2021 07:05:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] USB4 regression fix for TI DRA74X
Date:   Fri, 18 Jun 2021 10:05:05 +0300
Message-Id: <pull-1623999845-180025@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bae989c4bc53f861cc1b706aab0194703e9907a8:

  ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power (2021-05-26 14:01:27 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-rc6-signed

for you to fetch changes up to 78b4b165280d3d70e7a217599f0c06a4c0bb11f9:

  ARM: dts: dra7: Fix duplicate USB4 target module node (2021-06-11 08:30:42 +0300)

----------------------------------------------------------------
Fix duplicate usb4 regression for dra74 variants

USB4 is only present in DRA74x variants, and I managed to add it for the
other variants too with the recent legacy platform data removal.

----------------------------------------------------------------
Gowtham Tammana (1):
      ARM: dts: dra7: Fix duplicate USB4 target module node

 arch/arm/boot/dts/am5718.dtsi  |  6 +--
 arch/arm/boot/dts/dra7-l4.dtsi | 22 ----------
 arch/arm/boot/dts/dra71x.dtsi  |  4 --
 arch/arm/boot/dts/dra72x.dtsi  |  4 --
 arch/arm/boot/dts/dra74x.dtsi  | 92 ++++++++++++++++++++++--------------------
 5 files changed, 50 insertions(+), 78 deletions(-)
