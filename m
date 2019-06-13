Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9427444492
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 18:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfFMQhs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 12:37:48 -0400
Received: from muru.com ([72.249.23.125]:52948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730631AbfFMHLD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Jun 2019 03:11:03 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7001381BD;
        Thu, 13 Jun 2019 07:11:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     arm@kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] ti-sysc dts changes for v5.3
Date:   Thu, 13 Jun 2019 00:10:53 -0700
Message-Id: <pull-1560399818-512977@atomide.com-4>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <pull-1560399818-512977@atomide.com>
References: <pull-1560399818-512977@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b6a53c4c872ab6870eb455d10a6f7ff0d99b1b1f:

  bus: ti-sysc: Detect uarts also on omap34xx (2019-05-28 05:19:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.3/ti-sysc-dt-signed

for you to fetch changes up to 22a7fc15cf1e742884fdc11a236fcd755225b4f0:

  ARM: dts: Drop legacy custom hwmods property for omap4 mmc (2019-05-28 05:19:17 -0700)

----------------------------------------------------------------
ti-sysc dts changes for v5.3

We can now drop the custom dts property "ti,hwmods" for drivers that
have the ti-sysc interconnect target module configured in dts.

Let's start with a minimal changes to omap4 uart and mmc. We use
omap4 as the starting point as it has runtime PM implemented and all
the omap variants after that are based on it with similar clkctrl
clock for the modules. More devices will be updated later on as they
get tested.

Note that these changes are based on the related ti-sysc driver
changes.

----------------------------------------------------------------
Tony Lindgren (2):
      ARM: dts: Drop legacy custom hwmods property for omap4 uart
      ARM: dts: Drop legacy custom hwmods property for omap4 mmc

 arch/arm/boot/dts/omap4-l4.dtsi | 9 ---------
 1 file changed, 9 deletions(-)
