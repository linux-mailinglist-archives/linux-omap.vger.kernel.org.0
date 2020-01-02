Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A9412E952
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 18:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgABRYu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 12:24:50 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38392 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbgABRYt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 12:24:49 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002HOjcV107718;
        Thu, 2 Jan 2020 11:24:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577985885;
        bh=8R/7KD37mImOhVgbKAz0f8LBJAniQTDmWoNz9vkICO4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LVK/VFNlHysZTiwj4MxJWX7GiaY/O/2/J7bF6bJ8WCgKBkjumOrc4RwxFk8y+50Xf
         CLzvXJ8sLZItg0MoRrxJZf3zn7TO4AqLmdiid6SuTJcG4uSio7YX5jABLnPPUspb+Y
         8PX98D9Ka2WvGBtXNsaozYjTv+eT4YofEdY63L78=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002HOjVU021141
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 11:24:45 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 11:24:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 11:24:45 -0600
Received: from [10.250.65.50] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002HOieR098162;
        Thu, 2 Jan 2020 11:24:44 -0600
Subject: Re: [PATCH v3 2/4] ARM: OMAP2+: Introduce check for OP-TEE in
 omap_secure_init()
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191230185004.32279-1-afd@ti.com>
 <20191230185004.32279-3-afd@ti.com>
 <b4773b91-9893-830d-7b1b-b63eb4077cf7@ti.com>
 <d7d6f381-be00-3072-0510-a18b736987e7@ti.com>
 <20200102171403.GC16702@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <d9dddbe0-f5c3-1413-8b27-d19e8e07f755@ti.com>
Date:   Thu, 2 Jan 2020 12:24:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102171403.GC16702@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/2/20 12:14 PM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191231 14:16]:
>> On 12/31/19 1:32 AM, Lokesh Vutla wrote:
>>> This doesn't guarantee that optee driver is probed successfully or firmware
>>> installed correctly. Isn't there a better way to detect? Doesn't tee core layer
>>> exposes anything?
>>
>> We don't actually need the kernel-side OP-TEE driver at all here, we are
>> making raw SMCCC calls which get handled by OP-TEE using platform
>> specific code then emulates the function previously handled by ROM[0]
>> and execution is returned. No driver involved for these types of calls.
>>
>> U-Boot will not add this node to the DT unless OP-TEE is installed
>> correctly, but you are right that is no perfect guarantee. OP-TEE's
>> kernel driver does do a handshake to verify it is working but this is
>> not exposed outside of that driver and happens *way* too late for our
>> uses here. Plus as above, we don't need the OP-TEE driver at all and we
>> should boot the same without it even enabled.
>>
>> So my opinion is that if DT says OP-TEE is installed, but it is not,
>> then that is a misconfiguration and we usually just have to trust DT for
>> most things. If DT is wrong here then the only thing that happens is
>> this call safely fails, a message is printed informing the user of the
>> problem, and kernel keeps booting (although probably not stable given we
>> need these calls for important system configuration).
> 
> OK, please add comments to omap_optee_init_check(), it's not obvious
> to anybody not dealing with optee directly.
> 


Okay, will add this comment and the one suggested by Lokesh for v4.

Andrew


> Regards,
> 
> Tony
> 
