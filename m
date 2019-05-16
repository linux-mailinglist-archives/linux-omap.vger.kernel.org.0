Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C4B1FE7C
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 06:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEPEby (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 00:31:54 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34208 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfEPEbx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 00:31:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4G4Vpmh028510;
        Wed, 15 May 2019 23:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557981111;
        bh=3oLWMceFkC/C/VpOSO2Ug4Ii0O+CwBkVMXnEteYibvk=;
        h=From:To:CC:Subject:Date;
        b=JMkTMnVL+XW0i1fEz9ttUCRqECu1wVXDX43s3UsE4y90/PM96H61A1V5OTOWfFF02
         Y2RgwR+Kd+O7Pp6rn+P//Dg/J9IO3Wr6aqrFFa3yGZJqUIxL3txDsiFo6dp6GZKRbU
         gnHGg1bR6Wl4b3rharbBPYKQID2F0XPBBBjic8BI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4G4Vpgo042151
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 May 2019 23:31:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 15
 May 2019 23:31:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 15 May 2019 23:31:51 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4G4Vmil094857;
        Wed, 15 May 2019 23:31:49 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 0/3] mfd: lp87565: Add support for 4-phase lp87561 combination
Date:   Thu, 16 May 2019 10:02:15 +0530
Message-ID: <20190516043218.8222-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for 4-phase lp87561 combination.

Data Sheet: https://www.ti.com/lit/ds/symlink/lp87561-q1.pdf 

Keerthy (3):
  dt-bindings: mfd: lp87565: Add lp87561 configuration
  mfd: lp87565: Add support for 4-phase lp87561 combination
  regulator: lp87565: Add 4-phase lp87561 regulator support

 .../devicetree/bindings/mfd/lp87565.txt       | 36 +++++++++++++++++++
 drivers/mfd/lp87565.c                         |  4 +++
 drivers/regulator/lp87565-regulator.c         | 17 ++++++++-
 include/linux/mfd/lp87565.h                   |  2 ++
 4 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.17.1

