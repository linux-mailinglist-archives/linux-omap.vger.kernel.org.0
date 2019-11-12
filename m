Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6149EF8AF9
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfKLIqU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:46:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44510 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfKLIqU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:46:20 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8kIw1036444;
        Tue, 12 Nov 2019 02:46:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573548378;
        bh=9S71m+P+SRdK9ZGt27v5uyTLtc0HU6AoMGe9MRJaPfs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DNWZzD8E5IZIikaMVUUycYxhxAqrTRvboHwmx7YkYid1JUnSisuMHcDlamC69XpKi
         nsJluBK5XYrqfM6IIlK3irMEkWSFL1UEYE+dB/TZpTOkvLsz90twMgoJqY+bQB0qPi
         pHDz/ke0JKS+E5cBnkQJ8fApzasbTsgrt3Ef17zA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8kIm7042462;
        Tue, 12 Nov 2019 02:46:18 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:46:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:46:00 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8kFTa118665;
        Tue, 12 Nov 2019 02:46:16 -0600
Subject: Re: [PATCH 15/17] remoteproc/omap: report device exceptions and
 trigger recovery
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-16-t-kristo@ti.com> <20191112062642.GP3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <a88ac4e2-ff00-f1d2-2339-72c3315687e4@ti.com>
Date:   Tue, 12 Nov 2019 10:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112062642.GP3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 08:26, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> 
>> From: Suman Anna <s-anna@ti.com>
>>
>> The OMAP remote processors send a special mailbox message
>> (RP_MBOX_CRASH) when they crash and detect an internal device
>> exception.
>>
>> Add support to the mailbox handling function upon detection of
>> this special message to report this crash to the remoteproc core.
>> The remoteproc core can trigger a recovery using the prevailing
>> recovery mechanism, already in use for MMU Fault recovery.
>>
>> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
> 
> You're missing a Co-developed-by

Yep, let me fix that.

-Tero

> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/remoteproc/omap_remoteproc.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index 8bd415c8fc86..6f797025bb6b 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -360,8 +360,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>>   
>>   	switch (msg) {
>>   	case RP_MBOX_CRASH:
>> -		/* just log this for now. later, we'll also do recovery */
>> +		/*
>> +		 * remoteproc detected an exception, notify the rproc core.
>> +		 * The remoteproc core will handle the recovery.
>> +		 */
>>   		dev_err(dev, "omap rproc %s crashed\n", name);
>> +		rproc_report_crash(oproc->rproc, RPROC_FATAL_ERROR);
>>   		break;
>>   	case RP_MBOX_ECHO_REPLY:
>>   		dev_info(dev, "received echo reply from %s\n", name);
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
