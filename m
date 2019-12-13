Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186FF11DD0B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 05:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731821AbfLMEQU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 23:16:20 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39198 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfLMEQU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 23:16:20 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GCZb015201;
        Thu, 12 Dec 2019 22:16:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576210572;
        bh=wC9RBQmFmSj7MlFhLB/gvP67wVficio8GAklPgNPB/4=;
        h=From:To:CC:Subject:Date;
        b=I8cP+vaEknExtIYo3C8JYF+imFXekdgOy/4EWhsAnud5wQsKNa3KAKOTrRy5FKycr
         xRsz5ZlffLDGvlAdteTuiWUIhXdgVhSv+z647Chfz6h9y2Yq3CgwKaksNmhws7iQKq
         k8rR/oGKeNogyHCCX2dV0qOMlzDd1ST6lQrQNdm4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBD4GCSF120254
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 22:16:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 22:16:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 22:16:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GCcV011374;
        Thu, 12 Dec 2019 22:16:12 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH 0/2] ARM: dts: am33xx/am4372: Add cpuidle dt states
Date:   Thu, 12 Dec 2019 22:17:23 -0600
Message-ID: <20191213041725.16831-1-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,
This series adds DT idle states for TI am33xx and am4372 platforms.
The mpu_gate is added for both platforms which gates the MPU clock
to save power during idle. It depends on the driver series sent
here [1].

Regards,
Dave

[1] https://marc.info/?l=linux-kernel&m=157620644400324&w=2

Dave Gerlach (2):
  ARM: dts: am33xx: Add idle_states for cpuidle
  ARM: dts: am4372: Add idle_states for cpuidle

 arch/arm/boot/dts/am33xx.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/am4372.dtsi | 12 ++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.20.1

