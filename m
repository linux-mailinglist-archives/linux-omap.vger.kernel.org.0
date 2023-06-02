Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0E471FEB3
	for <lists+linux-omap@lfdr.de>; Fri,  2 Jun 2023 12:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbjFBKNX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Jun 2023 06:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235247AbjFBKNV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Jun 2023 06:13:21 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B157C0
        for <linux-omap@vger.kernel.org>; Fri,  2 Jun 2023 03:13:18 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C82998111;
        Fri,  2 Jun 2023 10:13:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v6.5
Date:   Fri,  2 Jun 2023 13:13:07 +0300
Message-ID: <pull-1685700720-242492@atomide.com-3>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <pull-1685700720-242492@atomide.com>
References: <pull-1685700720-242492@atomide.com>
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

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/dt-signed

for you to fetch changes up to 445d5be64be82c11505c41d75a4bde3af41d619b:

  ARM: dts: omap4: add initial support for Epson Moverio BT-200 (2023-05-31 08:23:48 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.5

A non-urgent fix for gpmc,wait-pin property for am335x-myirtech-myc, and
initial support for Epson Moverio BT-200 AR glasses.

----------------------------------------------------------------
Alexander Shiyan (1):
      ARM: dts: am335x-myirtech: Add missing NAND wait pin definition

Andreas Kemnade (1):
      ARM: dts: omap4: add initial support for Epson Moverio BT-200

 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi |   1 +
 arch/arm/boot/dts/omap4-epson-embt2ws.dts  | 450 +++++++++++++++++++++++++++++
 3 files changed, 452 insertions(+)
 create mode 100644 arch/arm/boot/dts/omap4-epson-embt2ws.dts
