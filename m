Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B03BF8ABD
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfKLIix (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:38:53 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46650 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfKLIix (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:38:53 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8cpsw064915;
        Tue, 12 Nov 2019 02:38:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573547931;
        bh=6qfQNrD1iku8NGaNC5fqFpAnISUw7q+hcGjPovT1cZo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BD/n5NWjVsDIX0J6DcOofhUQun2Bd70pQPuqoJBiVxOcvbLdlm7sTlMcxpKe18q+a
         9WBihOu28gWxor94iOs6j1Iuaf6Ix6TDN+Ir2kwtG8JxCmz69k2oIEwIcQIzB4ZjrM
         4TVWgH0IktBiZpxF0XM7tztI8cyAi0YJrcJpHUhQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8cpLD005970
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:38:51 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:38:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:38:33 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8clxo017301;
        Tue, 12 Nov 2019 02:38:48 -0600
Subject: Re: [PATCH 11/17] remoteproc/omap: Check for undefined mailbox
 messages
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-12-t-kristo@ti.com> <20191111233919.GM3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <a66c1ed4-5a97-22bf-e58c-4a458b3104cd@ti.com>
Date:   Tue, 12 Nov 2019 10:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111233919.GM3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 01:39, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> 
>> From: Suman Anna <s-anna@ti.com>
>>
>> Add some checks in the mailbox callback function to limit
>> any processing in the mailbox callback function to only
>> certain currently valid messages, and drop all the remaining
>> messages. A debug message is added to print any such invalid
>> messages when the appropriate trace control is enabled.
>>
>> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
> 
> This should either have a "Co-developed-by" or Suman should be the first
> one.

Let me swap that.

-Tero

> 
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> ---
>>   drivers/remoteproc/omap_remoteproc.c | 6 ++++++
>>   drivers/remoteproc/omap_remoteproc.h | 7 +++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index e46bb4c790d7..016d5beda195 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -124,6 +124,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>>   		dev_info(dev, "received echo reply from %s\n", name);
>>   		break;
>>   	default:
>> +		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
>> +			return;
>> +		if (msg > oproc->rproc->max_notifyid) {
>> +			dev_dbg(dev, "dropping unknown message 0x%x", msg);
>> +			return;
>> +		}
>>   		/* msg contains the index of the triggered vring */
>>   		if (rproc_vq_interrupt(oproc->rproc, msg) == IRQ_NONE)
>>   			dev_dbg(dev, "no message was found in vqid %d\n", msg);
>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>> index 1e6fef753c4f..18f522617683 100644
>> --- a/drivers/remoteproc/omap_remoteproc.h
>> +++ b/drivers/remoteproc/omap_remoteproc.h
>> @@ -31,6 +31,12 @@
>>    *
>>    * @RP_MBOX_ABORT_REQUEST: a "please crash" request, used for testing the
>>    * recovery mechanism (to some extent).
>> + *
>> + * Introduce new message definitions if any here.
>> + *
>> + * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
>> + * This should be the last definition.
>> + *
>>    */
>>   enum omap_rp_mbox_messages {
>>   	RP_MBOX_READY		= 0xFFFFFF00,
>> @@ -39,6 +45,7 @@ enum omap_rp_mbox_messages {
>>   	RP_MBOX_ECHO_REQUEST	= 0xFFFFFF03,
>>   	RP_MBOX_ECHO_REPLY	= 0xFFFFFF04,
>>   	RP_MBOX_ABORT_REQUEST	= 0xFFFFFF05,
>> +	RP_MBOX_END_MSG		= 0xFFFFFF06,
>>   };
>>   
>>   #endif /* _OMAP_RPMSG_H */
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
