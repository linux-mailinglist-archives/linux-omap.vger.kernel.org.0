Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38446102BA0
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 19:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfKSSU2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 13:20:28 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50720 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfKSSU2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 13:20:28 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJIKLao086524;
        Tue, 19 Nov 2019 12:20:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574187621;
        bh=eTOm/PJb8uxCiGpcOsOtUMdxI3VbeWStYTwBJ6g8GGA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HQtUFce3EcVyIutPIljgCSnIEbb4mXDa6Y/ps7gBq/U6EvZIxeKRNwQmA11eXiwcm
         MiyymsXpOcfHiGCtlgLQ/cUIwpea/NQmBDQj3HFhYa3RnaTTvCh54hYuQvuCWB55vR
         FcqEvsbX8NtHH3lHrc2Peqbk7on1CBAqU9w0ZzWg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJIKLuZ083629
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 12:20:21 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 12:20:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 12:20:20 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJIKJCu090505;
        Tue, 19 Nov 2019 12:20:20 -0600
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
To:     Tony Lindgren <tony@atomide.com>
CC:     Mark Rutland <mark.rutland@arm.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191118165236.22136-1-afd@ti.com>
 <20191118215759.GD35479@atomide.com>
 <b86e1d66-1566-521c-a445-4f0ae2fd95d6@ti.com>
 <20191118223128.GE35479@atomide.com>
 <29db708e-119e-8a89-7d43-e38e2a10dc07@ti.com>
 <20191119162157.GJ35479@atomide.com>
 <6e009ae3-6aa2-409b-749f-4947303940d8@ti.com>
 <20191119164227.GL35479@atomide.com> <20191119180546.GM35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <9e15c170-c9fa-778c-d998-bd1111a6390d@ti.com>
Date:   Tue, 19 Nov 2019 13:20:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119180546.GM35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/19/19 1:05 PM, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [191119 16:43]:
>> What I'd like to have though is to make arm_smccc_smc()
>> work for optee and non-optee case for mach-omap2 as it
>> already has the features necessary to do the runtime
>> patching of the code for the quirks.
> 
> In any case sounds like we only need the r12 quirk when
> optee is _not_ enabled.
> 
> So a modified version of your earlier smccc-call.S patch
> modified to only enable the r12 quirk when no optee is
> loaded just might be all we need :)
> 


Doesn't change the reason the earlier patch was NAKd, we would still be
modifying the core SMCCC call to be non-compliant.

And doing it only when OP-TEE is not installed doesn't gain us anything,
we already have our own SMC calls for when OP-TEE is not available, this
patch is specifically so the OMAP2+ boot still works even when OP-TEE is
installed.

If you can get Mark to take my old patch then we can think about moving
more legacy SMC callers to the SMCCC, otherwise this patch is what we
need to get OP-TEE enabled OMAP2+ platforms to boot and we will just
stick to the custom SMC functions we already have for everything else.

Andrew


> Regards,
> 
> Tony
> 
