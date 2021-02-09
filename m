Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3171315826
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 22:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbhBIUzD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 15:55:03 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49664 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbhBIUqB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 15:46:01 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119JQFiB127294;
        Tue, 9 Feb 2021 13:26:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612898775;
        bh=Kn2NQi9sF+VnGztMC5VkN80zeqYjnmSH3dKOmRJUBU4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=W5uAU91+EqbgCvVkUiFlWIkIPG3J0vQknlbGynfQZBMocJtg6+5VYXQcP/abL2Px5
         DQ1FSg8zgUDSAWzzZMe5GvDZeGtNH8d1zXURLyXNrNBCeNkw/gU0w05WC80rUNu3qw
         /02/3F2I8PAf5hqs9TFq/yqpnvWxNyjuz8fiZlbo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119JQF61100131
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 13:26:15 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 13:26:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 13:26:15 -0600
Received: from [10.250.35.110] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119JQFhb005466;
        Tue, 9 Feb 2021 13:26:15 -0600
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: omap: Update binding for AM64x
 SoCs
To:     Rob Herring <robh@kernel.org>
CC:     Jassi Brar <jassisinghbrar@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210127195600.23501-1-s-anna@ti.com>
 <20210127195600.23501-2-s-anna@ti.com>
 <20210209192443.GA4192418@robh.at.kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <dd0c9946-06fd-2c61-b8a4-67b72287ab90@ti.com>
Date:   Tue, 9 Feb 2021 13:26:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209192443.GA4192418@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/9/21 1:24 PM, Rob Herring wrote:
> On Wed, Jan 27, 2021 at 01:55:59PM -0600, Suman Anna wrote:
>> Update the existing OMAP Mailbox binding to include the info for
>> AM64x SoCs. There are some minor IP integration differences between
>> the AM64x SoCs and the previous AM65x and J721E SoC families.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  .../bindings/mailbox/omap-mailbox.txt         | 22 +++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>> index 5fe80c1c19fc..c993d1a5c14a 100644
>> --- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>> +++ b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
>> @@ -28,6 +28,9 @@ SoCs has each of these instances form a cluster and combine multiple clusters
>>  into a single IP block present within the Main NavSS. The interrupt lines from
>>  all these clusters are multiplexed and routed to different processor subsystems
>>  over a limited number of common interrupt output lines of an Interrupt Router.
>> +The AM64x SoCS also uses a single IP block comprising of multiple clusters,
>> +but the number of clusters are smaller, and the interrupt output lines are
>> +connected directly to various processors.
>>  
>>  Mailbox Device Node:
>>  ====================
>> @@ -42,6 +45,7 @@ Required properties:
>>  			    "ti,omap4-mailbox" for OMAP44xx, OMAP54xx, AM33xx,
>>  						   AM43xx and DRA7xx SoCs
>>  			    "ti,am654-mailbox" for K3 AM65x and J721E SoCs
>> +			    "ti,am64-mailbox" for K3 AM64x SoCs
>>  - reg:			Contains the mailbox register address range (base
>>  			address and length)
>>  - interrupts:		Contains the interrupt information for the mailbox
>> @@ -178,3 +182,21 @@ mailbox: mailbox@480c8000 {
>>  		};
>>  	};
>>  };
>> +
>> +4. /* AM64x */
>> +&cbass_main {
> 
> Please don't add examples for just a new compatible.

Thanks, will keep this in mind for the future and drop this as well just like on
the HwSpinlock binding update.

regards
Suman

> 
>> +	mailbox0_cluster2: mailbox@29020000 {
>> +		compatible = "ti,am64-mailbox";
>> +		reg = <0x00 0x29020000 0x00 0x200>;
>> +		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
>> +		             <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>> +		#mbox-cells = <1>;
>> +		ti,mbox-num-users = <4>;
>> +		ti,mbox-num-fifos = <16>;
>> +
>> +		mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
>> +			ti,mbox-rx = <0 0 2>;
>> +			ti,mbox-tx = <1 0 2>;
>> +		};
>> +	};
>> +};
>> -- 
>> 2.29.2
>>

