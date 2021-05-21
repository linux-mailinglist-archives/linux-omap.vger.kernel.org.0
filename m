Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE1538D166
	for <lists+linux-omap@lfdr.de>; Sat, 22 May 2021 00:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhEUWZk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 18:25:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36978 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhEUWZi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 18:25:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LMOCW1121848;
        Fri, 21 May 2021 17:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621635852;
        bh=qj+rO69hfh08MDvq9nngRFc9iP7xAKWXrYElpcGRer4=;
        h=From:To:CC:Subject:Date;
        b=R9leKQAgsKOW4zvJyPZjpW8Mbleh670q9UfFiY5OoY5w0AiM+Fpx4rAo5x/ygVIAg
         M3FuZ73p2/PE+BzYHNVmB+P47+z45PCg2wjDw9X/gVjZWaEL/Y9HO5Xh7V/W6IvYe+
         PzKRAoxs4kqAExWqRLzbJF3m516UN3aLZlElrxTQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LMOClg105147
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 17:24:12 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 17:24:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 17:24:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LMOBHQ097343;
        Fri, 21 May 2021 17:24:12 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 0/3] ARM: dts: ti: fix ti,no-reset-on-init usage
Date:   Sat, 22 May 2021 01:24:08 +0300
Message-ID: <20210521222411.17547-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ti,no-reset-on-init flag need to be at the interconnect target module
level for the modules that have it defined.
The ti-sysc driver handles this case, but produces warning, not a critical
issue.

Grygorii Strashko (3):
  ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
  ARM: dts: am437x-gp-evm: fix ti,no-reset-on-init flag for gpios
  ARM: dts: am335x: fix ti,no-reset-on-init flag for gpios

 arch/arm/boot/dts/am335x-baltos.dtsi              | 4 ++--
 arch/arm/boot/dts/am335x-evmsk.dts                | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi | 2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                  | 2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts               | 5 ++++-
 arch/arm/boot/dts/am437x-l4.dtsi                  | 2 +-
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts         | 5 ++---
 arch/arm/boot/dts/dra7-l4.dtsi                    | 4 ++--
 9 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.17.1

