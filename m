Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04AE973AA
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 09:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfHUHgV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 03:36:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36226 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbfHUHgV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 03:36:21 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7L7aEgv094718;
        Wed, 21 Aug 2019 02:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566372974;
        bh=t9ppVPq7IC2TVAGLlqMcOquzMEQC6ajE6CYvZHvX3Vw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XuxHz71emVTmDAoK4lUezNKGhzbIt/mHV1V2ilZUZnGhmzoYABWU+5lcZ93OBH1Oe
         nVwlgh4JEiX/fDH3mMkrZOgDNotSlVEz3HzkVxAGGroqA1E2YWSVzT7w8f4LaU5Gfm
         QCPUi0AYYSXXkb5tudY3cyUuI3ZZkD3i4JDiDXwo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7L7aESb104418
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 21 Aug 2019 02:36:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 21
 Aug 2019 02:36:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 21 Aug 2019 02:36:14 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7L7aCOA058793;
        Wed, 21 Aug 2019 02:36:12 -0500
Subject: Re: [PATCH 7/8] soc: ti: omap-prm: add dra7 PRM data
To:     Suman Anna <s-anna@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-8-git-send-email-t-kristo@ti.com>
 <0e8aa351-4c58-ab6c-890f-094118b812ac@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <67a06e0c-f85d-bdc4-aedf-9a3c0e80fc6a@ti.com>
Date:   Wed, 21 Aug 2019 10:36:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0e8aa351-4c58-ab6c-890f-094118b812ac@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20.8.2019 22.03, Suman Anna wrote:
> Hi Tero,
> 
> On 8/7/19 2:48 AM, Tero Kristo wrote:
>> Add PRM data for dra7 family of SoCs.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/soc/ti/omap_prm.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>> index fadfc7f..05b7749 100644
>> --- a/drivers/soc/ti/omap_prm.c
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -73,6 +73,31 @@ struct omap_prm_data omap4_prm_data[] = {
>>   	{ },
>>   };
>>   
>> +static struct omap_prm_data dra7_prm_data[] = {
>> +	{ .name = "mpu", .base = 0x4ae06300, .pwstst = 0x4 },
>> +	{ .name = "dsp1", .base = 0x4ae06400, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
>> +	{ .name = "ipu", .base = 0x4ae06500, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14, .clkdm_name = "ipu1" },
>> +	{ .name = "coreaon", .base = 0x4ae06628, .pwstst = 0x4 },
> 
> Public TRM marks this region Reserved. Do you need it for anything?
This is copied from existing PRM data from kernel. However, I'll ditch 
these for now and only retain the reset enabled domains.

> 
>> +	{ .name = "core", .base = 0x4ae06700, .pwstst = 0x4, .rstctl = 0x210, .rstst = 0x214, .clkdm_name = "ipu2" },
>> +	{ .name = "iva", .base = 0x4ae06f00, .pwstst = 0x4 },
> 
> Missing rstctrl and rstst offsets.

Will add.

> 
>> +	{ .name = "cam", .base = 0x4ae07000, .pwstst = 0x4 },
>> +	{ .name = "dss", .base = 0x4ae07100, .pwstst = 0x4 },
>> +	{ .name = "gpu", .base = 0x4ae07200, .pwstst = 0x4 },
>> +	{ .name = "l3init", .base = 0x4ae07300, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
>> +	{ .name = "l4per", .base = 0x4ae07400, .pwstst = 0x4 },
>> +	{ .name = "custefuse", .base = 0x4ae07600, .pwstst = 0x4 },
>> +	{ .name = "wkupaon", .base = 0x4ae07724, .pwstst = 0x4 },
> 
> No pwstctrl and pwstst bits documented in TRM or are marked reserved.

Same as coreaon.

> 
>> +	{ .name = "emu", .base = 0x4ae07900, .pwstst = 0x4 },
>> +	{ .name = "dsp2", .base = 0x4ae07b00, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
>> +	{ .name = "eve1", .base = 0x4ae07b40, .pwstst = 0x4 },
>> +	{ .name = "eve2", .base = 0x4ae07b80, .pwstst = 0x4 },
>> +	{ .name = "eve3", .base = 0x4ae07bc0, .pwstst = 0x4 },
>> +	{ .name = "eve4", .base = 0x4ae07c00, .pwstst = 0x4 },
> 
> All EVEs are missing rstctrl and rstst fields.

Will add.

> 
>> +	{ .name = "rtc", .base = 0x4ae07c60, .pwstst = 0x4 },
> 
> Undocumented pwstctrl and pwstst registers.
> 
>> +	{ .name = "vpe", .base = 0x4ae07c80, .pwstst = 0x4 },
> 
> Missing "device" and "instr" PRM. The latter doesn't have any pwrstctl
> and pwrstst though.

Will ditch those.

-Tero

> 
> regards
> Suman
> 
>> +	{ },
>> +};
>> +
>>   struct omap_rst_map am3_wkup_rst_map[] = {
>>   	{ .rst = 3, .st = 5 },
>>   	{ .rst = -1 },
>> @@ -91,6 +116,7 @@ struct omap_prm_data am3_prm_data[] = {
>>   
>>   static const struct of_device_id omap_prm_id_table[] = {
>>   	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
>> +	{ .compatible = "ti,dra7-prm-inst", .data = dra7_prm_data },
>>   	{ .compatible = "ti,am3-prm-inst", .data = am3_prm_data },
>>   	{ },
>>   };
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
