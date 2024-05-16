Return-Path: <linux-omap+bounces-1382-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 827368C72E6
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2024 10:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40521C2136B
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2024 08:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152E4140E50;
	Thu, 16 May 2024 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RNvEgPTB"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7194140E4D;
	Thu, 16 May 2024 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715848350; cv=none; b=oBevpRI9uOYxO9v+xU82X+kZgDUlUPTbUv34F8yfx1YX+hnd10NxbRY+ClF77TjQ0xShaFj95MjUrz7JsGfoBLscW9HDFVGLmbz8P9SQMBoOGw7LPZl9myXrJ2DNKdbofXSck/NGdVQQC/HRM8S3tzOiGQuvXBprjDEbthTTLY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715848350; c=relaxed/simple;
	bh=n3wfwXdLhgrZfXaFpbTErMq4VZLJenZ0wJJ6hu+fpmM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KH/i6JBR64xgThZ668h5bKdE0rlOpFk8aOCOa4FQ4ogYlv38lfyCFwkuJ/oZb14+Ft7PbJfXZUBtJ8Bn6K1lZjheq25ldFBc7SfFvEHoDdCOPiwRMsS+F2mxgxHM8muBKRBhH14/bBQsVsd+hGKZzrliltcQFjK4kSIqxXH30E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RNvEgPTB; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44G8Pni2048592;
	Thu, 16 May 2024 03:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715847949;
	bh=clZL/8Y8uccnbJaVKNewC7vniy/6nA7aPUL53Va0yB4=;
	h=From:To:CC:Subject:Date;
	b=RNvEgPTBrPhcZFllUq05yk/cQwXGO0/fk97hQsSWphVsIvw0E1Kg3vlX03MKuBLEJ
	 2mYsXIYWzUU9el/Yc77bkTebRDt6nhG5nOtBe0TOjCvDv35KjEJ2TCydRstTv0FNd4
	 ACv3/IMiMggkgw9kD+KaS7qi7TlNG00/evUVZn6g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44G8PnJr036001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 May 2024 03:25:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 May 2024 03:25:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 May 2024 03:25:48 -0500
Received: from uda0500640.dal.design.ti.com (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44G8PkQt072837;
	Thu, 16 May 2024 03:25:47 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <netdev@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-vadapalli@ti.com>, <rogerq@kernel.org>, <r-gunasekaran@ti.com>
Subject: [PATCH] MAINTAINERS: net: Update reviewers for TI's Ethernet drivers
Date: Thu, 16 May 2024 13:55:45 +0530
Message-ID: <20240516082545.6412-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Remove myself as reviewer for TI's ethernet drivers

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85025e859d57..9698b8b19197 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22463,7 +22463,6 @@ F:	drivers/counter/ti-eqep.c
 
 TI ETHERNET SWITCH DRIVER (CPSW)
 R:	Siddharth Vadapalli <s-vadapalli@ti.com>
-R:	Ravi Gunasekaran <r-gunasekaran@ti.com>
 R:	Roger Quadros <rogerq@kernel.org>
 L:	linux-omap@vger.kernel.org
 L:	netdev@vger.kernel.org

base-commit: dbd9e2e056d8577375ae4b31ada94f8aa3769e8a
-- 
2.17.1


