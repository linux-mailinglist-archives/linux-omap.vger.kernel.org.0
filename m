Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2010EA0
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 23:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfEAVlr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 17:41:47 -0400
Received: from muru.com ([72.249.23.125]:47904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbfEAVlq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 17:41:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 13E82805C;
        Wed,  1 May 2019 21:42:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 0/2] Two ti-sysc driver fixes for v5.3 merge window
Date:   Wed,  1 May 2019 14:41:27 -0700
Message-Id: <20190501214129.12572-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are few fixes for the am335x d_can boot issue Sebastian reported for
Beaglebone.

Regards,

Tony


Tony Lindgren (2):
  ARM: dts: Configure osc clock for d_can on am335x
  bus: ti-sysc: Handle devices with no control registers

 arch/arm/boot/dts/am33xx-l4.dtsi | 14 ++++++--------
 arch/arm/boot/dts/am437x-l4.dtsi |  4 ----
 drivers/bus/ti-sysc.c            | 23 +++++++++++------------
 3 files changed, 17 insertions(+), 24 deletions(-)

-- 
2.21.0
