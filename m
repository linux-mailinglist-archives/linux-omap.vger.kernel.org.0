Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80747B58BF
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 01:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfIQXsd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 19:48:33 -0400
Received: from mail.gallagher.co.nz ([203.167.229.98]:17317 "EHLO
        mail.gallagher.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfIQXsd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 19:48:33 -0400
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by mail.gallagher.co.nz  (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B5d8170ce0000>; Wed, 18 Sep 2019 11:48:30 +1200
Received: from ubuntu.localdomain ([10.60.3.76])
          by gglnzdom1.gallagher.local
          with ESMTP id 2019091811483001-33741 ;
          Wed, 18 Sep 2019 11:48:30 +1200 
From:   Ankur Tyagi <ankur.tyagi@gallagher.com>
To:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Update AM3/4 GPIO number as per datasheet
Date:   Tue, 17 Sep 2019 16:48:27 -0700
Message-Id: <20190917234829.91132-1-ankur.tyagi@gallagher.com>
X-TNEFEvaluated: 1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sitara technical reference manual numbers GPIO from 0 whereas
in code GPIO are numbered from 1.

Changes since v2:
- Split AM3 and AM4 changes into different patch
- Added missing dtsi changes to fix compilation failure

Changes since v1:
- Combine changes in single patch to avoid compilation failure
- Update AM4 GPIO numbers as well

Ankur Tyagi (2):
  clk: ti: am3: Update AM3 GPIO number as per datasheet
  clk: ti: am4: Update AM4 GPIO number as per datasheet

 arch/arm/boot/dts/am33xx-l4.dtsi | 24 ++++++++++-----------
 arch/arm/boot/dts/am437x-l4.dtsi | 36 ++++++++++++++++----------------
 drivers/clk/ti/clk-33xx-compat.c | 12 +++++------
 drivers/clk/ti/clk-33xx.c        | 12 +++++------
 drivers/clk/ti/clk-43xx-compat.c | 16 +++++++-------
 drivers/clk/ti/clk-43xx.c        | 16 +++++++-------
 include/dt-bindings/clock/am3.h  | 16 +++++++-------
 include/dt-bindings/clock/am4.h  | 24 ++++++++++-----------
 8 files changed, 78 insertions(+), 78 deletions(-)

-- 
2.17.1


###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
