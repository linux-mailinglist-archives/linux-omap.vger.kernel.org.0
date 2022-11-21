Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5538F632347
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 14:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiKUNSX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 08:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKUNSV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 08:18:21 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D03CC73BB8
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 05:18:20 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 727E080A7;
        Mon, 21 Nov 2022 13:08:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Regulator changes for am335x-pcm-953
Date:   Mon, 21 Nov 2022 15:18:17 +0200
Message-Id: <pull-1669036672-530717@atomide.com>
X-Mailer: git-send-email 2.38.1
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/am335x-pcm-953-regulators

for you to fetch changes up to 8950f345a67d8046d2472dd6ea81fa18ef5b4844:

  ARM: dts: am335x-pcm-953: Define fixed regulators in root node (2022-11-09 10:09:51 +0200)

----------------------------------------------------------------
Regulator changes for am335x-pcm-953

This is for deferred probe issue on am335x-pcm-953 sdhci-omap regulator.

----------------------------------------------------------------
Dominik Haller (1):
      ARM: dts: am335x-pcm-953: Define fixed regulators in root node

 arch/arm/boot/dts/am335x-pcm-953.dtsi | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)
