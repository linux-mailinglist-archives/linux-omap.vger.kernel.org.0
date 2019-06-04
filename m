Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25CD233E77
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 07:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfFDFh5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 01:37:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56094 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfFDFh5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 01:37:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x545bs0U102550;
        Tue, 4 Jun 2019 00:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559626674;
        bh=AldrBYHNoxyeSd+IdVZbc6Bbp3fGBTC4NspR4ZBH60E=;
        h=To:CC:From:Subject:Date;
        b=VP1BYNB5z/7WRqW7X5MByPX9JK5Wl3yCO0oZa0M3Mk9gKtY9rZzF4GL+PRN+LLVSW
         ff4+K+z7PdiGv84tnvj7bo/Q5GJcFwV8P5Hc0hBMZzNU3fi8/2qZRh0TotaUxUr3ST
         zC8+NtWFpBWYPVAOT5K+5MqNSTN8bZMf11HYTcuM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x545bsMv115062
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 00:37:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 00:37:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 00:37:54 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x545bq5j121352;
        Tue, 4 Jun 2019 00:37:52 -0500
To:     Tony Lindgren <tony@atomide.com>, "Kristo, Tero" <t-kristo@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Subject: Kernel boot crash on latest next dated june 3
Message-ID: <aa22befb-227c-85fe-4eb9-c3775ee87c45@ti.com>
Date:   Tue, 4 Jun 2019 11:08:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

DRA7/71/76, AM4/3 are not able to boot with latest next branch.
The crash behavior is pretty similar on all the platforms.
Example log on DRA7-EVM:

https://pastebin.ubuntu.com/p/tNPZrpHZzV/

Regards,
Keerthy
