Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8343725F512
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 10:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgIGI0K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 04:26:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50490 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgIGI0I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 04:26:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0878Q3Ur112929;
        Mon, 7 Sep 2020 03:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599467163;
        bh=o9xLQ9kZ5NZ6zB6xnUENqkDvTXvkT4Xdgxf6lIKPoUU=;
        h=From:To:CC:Subject:Date;
        b=oZq/LbKlXFdFJtOY+LM5GAWhsn0ul90FlFB5PwbpOVnbsySu9N0K3+xJBaT197jrq
         eGKOx8APew3HfJcBPnmpe1c0fgp6cazyYXOwstLOPZFvqn7NiY4cLImpPFymFka/gY
         hTouFxuaXDBD6C0Bwqly80XBtkzsrAJ7tY+kn45c=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0878Q2An128861;
        Mon, 7 Sep 2020 03:26:03 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 03:26:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 03:26:02 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0878Q1YG087957;
        Mon, 7 Sep 2020 03:26:01 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 0/3] clk: ti: minor fixes and add sha2 instance for dra7
Date:   Mon, 7 Sep 2020 11:25:57 +0300
Message-ID: <20200907082600.454-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series adds a couple of minor static checker fixes and new data
entry for second instance of SHA accelerator on dra7 SoC.

-Tero

---

Tero Kristo (3):
  clk: ti: autoidle: add checks against NULL pointer reference
  clk: ti: clockdomain: fix static checker warning
  clk: ti: dra7: add missing clkctrl register for SHA2 instance

 drivers/clk/ti/autoidle.c        | 14 ++++++++++++--
 drivers/clk/ti/clk-7xx.c         |  1 +
 drivers/clk/ti/clockdomain.c     |  2 ++
 include/dt-bindings/clock/dra7.h |  1 +
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
