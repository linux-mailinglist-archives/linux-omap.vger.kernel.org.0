Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E070810262C
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 15:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfKSORC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 09:17:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47260 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfKSORB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 09:17:01 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJEH0cW128198;
        Tue, 19 Nov 2019 08:17:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574173020;
        bh=nGL+xcmjiAdxXQX0bc5dlV6JtO6JcpMQGzaqANFB+WQ=;
        h=From:To:CC:Subject:Date;
        b=umOcv352EnUHeMSxZngvWydKwdkY+JUqNoxpITujezcrP9pqJAOdMe6uUcNf+yhSf
         olKRUSN3jMHrU3arL0uvoCnZ1PaYOPVoxqzoqnCXfxrnYsEGM8n3QZas5BFgbL/Y6f
         WBhN1Z6mLlSvQJwtLFwrxVE+IrnkRv8ElqCg26XM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJEH0iB099924
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 08:17:00 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:16:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:16:59 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJEGvYr027070;
        Tue, 19 Nov 2019 08:16:58 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
Subject: [PATCHv2 00/15] Remoteproc: updates for OMAP remoteproc support
Date:   Tue, 19 Nov 2019 16:16:30 +0200
Message-ID: <20191119141645.19777-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This is v2 of the series [1], addressing comments from Bjorn and Rob.
Bindings patch is funnily v2.5, as I posted v2 already and wanted to
keep this somehow in sync. Individual patches contain comments about the
changes, or Reviewed-by tags provided if there are no changes.

I also dropped the conversion patch to SPDX licensing until I can
confirm the license we want to use. Lets just keep the existing in place
until that.

This series still depends on the reset + clock patches posted earlier,
but both of those dependencies are in linux-next now.

-Tero

[1] https://patchwork.kernel.org/cover/11215421/



--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
