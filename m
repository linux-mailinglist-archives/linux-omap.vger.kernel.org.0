Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B291592D7
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 16:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgBKPVl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 10:21:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40280 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgBKPVl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 10:21:41 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BFLea0028422;
        Tue, 11 Feb 2020 09:21:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581434500;
        bh=Z6SBnRVWHyHIJvusUlkzMebfEuAkhV3DloNXL0KugJw=;
        h=From:To:CC:Subject:Date;
        b=jXQmMCsOZWvdTXXS6itYyTBHHkW0VAlcMMJVZD6OUgm2Suff28r6bMHrw3UUbTy1I
         aAsdvFfcfBah0ZirtFBn4l1tUDjCziXpsF3Go4fNoq/W/pmTpReRuN6hP/R2EVERwF
         J7O/oKP5XOQ/j+KhWgARvWkAycDI2tRZQlvfX7nE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BFLe90059166;
        Tue, 11 Feb 2020 09:21:40 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 09:21:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 09:21:39 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BFLbkc020993;
        Tue, 11 Feb 2020 09:21:38 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCHv6 00/14] remoteproc: updates for omap remoteproc support
Date:   Tue, 11 Feb 2020 17:21:11 +0200
Message-ID: <20200211152125.23819-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Couple of minor changes on this one, other than that just a rebase to
5.6-rc1:

- converted memory-regions to be an optional property both in the
  binding + driver
- added a warning in the driver if memory-regions are not provided in DT

The above changes only impact patch #1 and #6

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
