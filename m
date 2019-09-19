Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 671FAB72B2
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 07:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387972AbfISFbB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 01:31:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36770 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387589AbfISFbB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Sep 2019 01:31:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8J5Usqg107312;
        Thu, 19 Sep 2019 00:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568871054;
        bh=2OtrowgE9ndSQCOBZ8NXiS3tn45GXBmAzD6PSfkBktE=;
        h=To:CC:From:Subject:Date;
        b=AbTQUPPtLwhmMTWYjO6w7/tOO8v0QhButyErFMP8EphjYOY9Oudjnb7qXVWhgOMIG
         GPsxwWQE3X/gdDE1+FWb5PByb9jxWbQK1xqUL02BaDSWa6+4yA+MYaT6XivPvXdr1w
         09bq0KYiruGNYfJDtOCyMBW32X/AjQZleqgPVkFk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8J5Usj8031599
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 00:30:54 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 00:30:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 00:30:50 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8J5UpIc015454;
        Thu, 19 Sep 2019 00:30:52 -0500
To:     <hch@lst.de>, <bjorn.andersson@linaro.org>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Subject: remoteproc: don't allow modular build
Message-ID: <5bf9425f-4ea0-09db-70cc-415ac0031b95@ti.com>
Date:   Thu, 19 Sep 2019 11:01:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Christoph/Bjorn,

There are a bunch of defconfigs that rely on modular build of remoteproc.

If i do a git grep CONFIG_REMOTEPROC on linux-next:

arch/arm/configs/davinci_all_defconfig:CONFIG_REMOTEPROC=m
arch/arm/configs/multi_v7_defconfig:CONFIG_REMOTEPROC=m
arch/arm/configs/omap2plus_defconfig:CONFIG_REMOTEPROC=m
arch/arm/configs/qcom_defconfig:CONFIG_REMOTEPROC=y
arch/arm64/configs/defconfig:CONFIG_REMOTEPROC=m

All of them now stop building the remoteproc as a module and all the 
dependent modules consequently do not get built. Do you recommend all of 
them to get converted to built in?

That will be some magnitude of change.

Best Regards,
Keerthy
