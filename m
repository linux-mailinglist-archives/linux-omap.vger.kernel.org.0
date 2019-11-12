Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4016F923A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKLO0f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:26:35 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38850 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfKLO0f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:26:35 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEQV8S098659;
        Tue, 12 Nov 2019 08:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568791;
        bh=anO7SNWwiXlY2/qwTzzyhWcIR7ms5orGxlRME2mhQ+g=;
        h=From:To:CC:Subject:Date;
        b=E8IvR/WugdeprIvqxpg1Bhx+BJXkJCZL3Qx9SNZxfGmpKfdVr2wAN4aA8uFZszM1Q
         ZuU4/BL76BjcUIvwiIwK8/Kv99Cz4JAZ4nkZfe6xMJktdsOq8oliA2QnDBQR1EgGGk
         C7t91jOAg2GCZBJhi89IhPPXEMMhMGG5sICH0skE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEQVsK033636;
        Tue, 12 Nov 2019 08:26:31 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:26:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:26:30 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEQUtt040290;
        Tue, 12 Nov 2019 08:26:30 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 0/3] ARM: dts: am43x-vpfe/ov2659.patch
Date:   Tue, 12 Nov 2019 08:29:26 -0600
Message-ID: <20191112142929.23058-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch series adds the missing camera endpoint (ov2659) as well as
the required source clocks nodes for the sensor.

On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
clock nodes/tree was removed as it was unsed at the time, we are
re-adding the needed clock nodes here.

Changes since v1:
- Fix clock name to make it generic
- Add non-standard clock node naming to commit message as per Tony's
  comment
- Rename all clock nodes to use '-' instead of '_'

Benoit Parrot (2):
  ARM: dts: am437x-sk-evm: Add VPFE and OV2659 entries
  ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries

Tero Kristo (1):
  ARM: dts: am43xx: add support for clkout1 clock

 arch/arm/boot/dts/am437x-sk-evm.dts  | 27 +++++++++++++-
 arch/arm/boot/dts/am43x-epos-evm.dts | 23 +++++++++++-
 arch/arm/boot/dts/am43xx-clocks.dtsi | 54 ++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.17.1

