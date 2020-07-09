Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E87521AB5F
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgGIXUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34574 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgGIXUG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:06 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK0Or053680;
        Thu, 9 Jul 2020 18:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336800;
        bh=L6EHhTZGwkAXNqimgQyMdIJygzgCJ7uhT1WiATJtN/Q=;
        h=From:To:CC:Subject:Date;
        b=P3DaTpWOquXEgY00eRYlAykrdNUdCGy/POvMQW0glO6lr8SqS/ztmG6AtLMrVOTVW
         GvuUyNxAqAFhV7K3m3Fb/eweRtxv72L/yOsx3Xi9r0jqh0GrtZLOr0hGVHuNMtkcPI
         kw6t2FOECQhCwJGsI6EM53p0JXoy7ZndqUmUf3Po=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NK0ph011329
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:00 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:19:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:19:59 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NJxOC030895;
        Thu, 9 Jul 2020 18:19:59 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NJxOY124312;
        Thu, 9 Jul 2020 18:19:59 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
Date:   Thu, 9 Jul 2020 18:19:41 -0500
Message-ID: <20200709231954.1973-1-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following series contains all the necessary DT pieces to boot the
IPU and DSP remote processors on OMAP4 and OMAP5 SoCs. They are
enabled specifically on the TI OMAP4 PandaBoard and OMAP5 uEVM boards.
This is the last DT piece that now completes the support for IPUs and
DSPs on all OMAP4+ SoCs, similar patches were merged for 5.8 covering
the DRA7xx/AM57xx SoCs. Appreciate it if you can pick up the series for
5.9 if it isn't too late.

There is one issue that I have run into while testing this series on
the latest kernel. I am seeing a l3_noc error for OMAP4 DSP when it
attempts to auto-suspend or stop after it is booted. The issue is a
L4CFG read error that happens in the sysc_disable_module() function
in ti-sysc code.

I do not have any issues on my downstream 5.4 based SDK kernel. I have
root-caused this to the OMAP4 voltage controller patches you added for
5.5 kernel through your omap-for-v5.5/pm branch, specifically the
commit 4873843718f9 ("ARM: OMAP2+: Initialize voltage controller for omap4").
The VOLTCTRL register value is 0x300 before that patch, and modifying
this register either through  omap4_vc_init_pmic_signaling() or
omap4_vc_set_pmic_signaling() will trigger this. A debug print in
sysc_disable_module() also seems to help.

regards
Suman

Suman Anna (13):
  ARM: dts: omap4: Add timer_sys_ck clocks for timers
  ARM: dts: omap5: Add timer_sys_ck clocks for timers
  ARM: dts: omap4: Update the DSP node
  ARM: dts: omap4: Add IPU DT node
  ARM: dts: omap4: Add aliases for rproc nodes
  ARM: dts: omap4-panda-common: Add CMA pools and enable IPU & DSP
  ARM: dts: omap4-panda-common:: Add system timers to DSP and IPU
  ARM: dts: omap5: Add DSP and IPU nodes
  ARM: dts: omap5: Add aliases for rproc nodes
  ARM: dts: omap5-uevm: Add CMA pools and enable IPU & DSP
  ARM: dts: omap5-uevm: Add system timers to DSP and IPU
  ARM: dts: omap4-panda-common: Add watchdog timers for IPU and DSP
  ARM: dts: omap5-uevm: Add watchdog timers for IPU and DSP

 arch/arm/boot/dts/omap4-l4-abe.dtsi       | 20 +++++++------
 arch/arm/boot/dts/omap4-l4.dtsi           | 35 ++++++++++++++---------
 arch/arm/boot/dts/omap4-panda-common.dtsi | 34 ++++++++++++++++++++++
 arch/arm/boot/dts/omap4.dtsi              | 29 ++++++++++++++++---
 arch/arm/boot/dts/omap5-l4-abe.dtsi       | 20 +++++++------
 arch/arm/boot/dts/omap5-l4.dtsi           | 35 ++++++++++++++---------
 arch/arm/boot/dts/omap5-uevm.dts          | 34 ++++++++++++++++++++++
 arch/arm/boot/dts/omap5.dtsi              | 25 ++++++++++++++++
 8 files changed, 184 insertions(+), 48 deletions(-)

-- 
2.26.0

