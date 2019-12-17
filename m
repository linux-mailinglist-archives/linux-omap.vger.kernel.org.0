Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8963812331B
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 18:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfLQRB7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 12:01:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33008 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfLQRB7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 12:01:59 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHH1qd9022369;
        Tue, 17 Dec 2019 11:01:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576602112;
        bh=5Gu8nfKkOl/hnBbwSd+eghMyw6YcCCvlZo9bdaVH8Ic=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xW35THC9yjwYXWotChi18aC16XAkiLqwFM2FJ9IpCXb9oJJpm6zxz9RtY7lrnhaYA
         DSu/MDU/GgdSf7TObeBhA8FO5yWJ1X18XLEdPH2dAxcJL884WlG+hiw9WahOWXYs6C
         49i3lXWHo2LjZxpcwWk5WfbHazQblGL6vhVNALro=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHH1qA6098645
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 11:01:52 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 11:01:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 11:01:52 -0600
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHH1piC070260;
        Tue, 17 Dec 2019 11:01:51 -0600
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
To:     Tony Lindgren <tony@atomide.com>
CC:     Mark Rutland <mark.rutland@arm.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <7fa11037-8d33-2274-c8cc-80e9630b38b0@ti.com>
 <20191119192029.GP35479@atomide.com>
 <0ad31b32-712e-5bef-5645-0336dfec99cc@ti.com>
 <20191119194425.GQ35479@atomide.com>
 <f2f53e5e-6c95-e32f-d67a-284bb88e73e0@ti.com>
 <1ff8ae4b-5de3-4fdf-7318-d33398dc7fc8@ti.com>
 <20191216210407.GR35479@atomide.com>
 <9adad579-98b4-f228-caf3-f4996dcaecda@ti.com>
 <20191216224105.GS35479@atomide.com>
 <35e4b682-0d2f-23b1-6df4-428c6bcb4d59@ti.com>
 <20191217150732.GW35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <8d5d098f-26cb-c436-ec7b-bed0ed0a9ced@ti.com>
Date:   Tue, 17 Dec 2019 12:01:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217150732.GW35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/17/19 10:07 AM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191217 13:14]:
>> On 12/16/19 5:41 PM, Tony Lindgren wrote:
>>> Please just add omap_early_initcall() to omap-secure.c while at it
>>> to deal with this.
>>
>> omap_early_initcall()s are not called until after all the SMC calls have
>> already happened.
> 
> Oh OK. Then let's just add omap_secure_init() that's called from
> *_init_early() as late as possible. We will have more use for that
> init later on too.
> 


You mean add a call to this omap_secure_init() to every boards init
function?

Andrew


> Regards,
> 
> Tony
> 
