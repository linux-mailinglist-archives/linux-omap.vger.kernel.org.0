Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9117C2C7
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 17:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCFQT7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 11:19:59 -0500
Received: from muru.com ([72.249.23.125]:59078 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgCFQT7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 11:19:59 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 122998192;
        Fri,  6 Mar 2020 16:20:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] dts changes for omaps for v5.7
Date:   Fri,  6 Mar 2020 08:19:50 -0800
Message-Id: <pull-1583511417-919838@atomide.com-4>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <pull-1583511417-919838@atomide.com>
References: <pull-1583511417-919838@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/dt-signed

for you to fetch changes up to 89a7b191fcd17e3f1dba963eb2cba8262b45a4d2:

  ARM: dts: am4372: Add idle_states for cpuidle (2020-02-27 09:33:33 -0800)

----------------------------------------------------------------
Devicetree changes for omaps for v5.7 merge window

Few device tree changes for omaps for v5.7 to configure omap5
AESS module and to add idle_states for am335x and am437x cpuidle.

----------------------------------------------------------------
Dave Gerlach (2):
      ARM: dts: am33xx: Add idle_states for cpuidle
      ARM: dts: am4372: Add idle_states for cpuidle

Tony Lindgren (1):
      ARM: dts: Configure omap5 AESS

 arch/arm/boot/dts/am33xx.dtsi       | 12 ++++++++++++
 arch/arm/boot/dts/am4372.dtsi       | 12 ++++++++++++
 arch/arm/boot/dts/omap5-l4-abe.dtsi | 16 ++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)
