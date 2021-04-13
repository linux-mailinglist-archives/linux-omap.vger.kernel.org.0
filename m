Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982C135E602
	for <lists+linux-omap@lfdr.de>; Tue, 13 Apr 2021 20:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhDMSLP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Apr 2021 14:11:15 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47938 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232787AbhDMSLO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Apr 2021 14:11:14 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DIAiJe052808;
        Tue, 13 Apr 2021 13:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1618337444;
        bh=KoiDK2KidPgCteZ/uBTBPBdbjAxSy9tKGfetUPIXR1M=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Za8qvdQ5/KBaFQVxpiBcb72084jvMh6zqgk9AHfA987QcYzOiT2rfsoU93IEovrps
         DGRXUJTVYYTqK4ed6UqrUMybf9IBRJfIdnNQ7IECRbwTNlv3G0NzlKELE7rdOYdoii
         yuMxWkKZXXaNvb2anGpI5xB7bgkO0ipBOV9DkDTA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DIAi0L052195
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Apr 2021 13:10:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 13:10:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 13:10:44 -0500
Received: from [10.250.68.143] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DIAh0j055635;
        Tue, 13 Apr 2021 13:10:43 -0500
Subject: Re: [PATCH v2 0/3] PRU firmware event/interrupt mapping fixes
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210407155641.5501-1-s-anna@ti.com>
Message-ID: <52942a19-c0f8-c376-9103-2e5020c49c3a@ti.com>
Date:   Tue, 13 Apr 2021 13:10:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210407155641.5501-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Bjorn,

On 4/7/21 10:56 AM, Suman Anna wrote:
> Hi All,
> 
> The following is a minor revised version of the series [1] that includes fixes
> for various different issues associated with the PRU firmware event/interrupt
> mapping configuration logic. Please see the v1 cover-letter [1] for additional
> details. 
> 
> There are currently no in-kernel dts nodes yet in mainline kernel (first
> nodes will appear in v5.13-rc1) so these can be picked up for either v5.13
> merge window or the current -rc cycle.
> 
> Changes in v2:
>  - Picked up Reviewed-by tags on Patches 1 and 2
>  - Revised Patch 3 to address additional error cleanup paths as
>    pointed out by Mathieu.

All patches are reviewed now, so can you please pick these up for the next merge
window if not already in your queue.

regards
Suman

> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20210323223839.17464-1-s-anna@ti.com/
> 
> Suman Anna (3):
>   remoteproc: pru: Fixup interrupt-parent logic for fw events
>   remoteproc: pru: Fix wrong success return value for fw events
>   remoteproc: pru: Fix and cleanup firmware interrupt mapping logic
> 
>  drivers/remoteproc/pru_rproc.c | 41 ++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 9 deletions(-)
> 

