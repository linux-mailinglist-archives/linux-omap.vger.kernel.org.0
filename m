Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621ED17B2F7
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 01:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCFAao (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 19:30:44 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34288 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgCFAao (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Mar 2020 19:30:44 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0260TlG3004717;
        Thu, 5 Mar 2020 18:29:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583454587;
        bh=MM2TeeUzDkVH6Jaz3FdkOyWt+8KGCQgxym5sFOmIbNs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GdI9kNUeGDoFFbibWxDSVaNzrnMVGFT/xtGPZBrcWLPKJxInG3mPNOMNoigiSxOXv
         G/bKnj3DQmj+jGX9fFSWJbGDq7UsbYzvXp1CMKMoRINYiR2MKOg/wBxDVrT4zLgUS6
         btNdiIem06vdcaTKvZhjlRymM0MrljUjKN3KarKw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0260TlFw126586
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Mar 2020 18:29:47 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 18:29:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 18:29:47 -0600
Received: from [128.247.81.254] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0260Tlg3085113;
        Thu, 5 Mar 2020 18:29:47 -0600
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
To:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
CC:     David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
References: <20200127231208.1443-1-s-anna@ti.com> <20200224100037.GK3494@dell>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <5efbb3c4-044d-0a8e-630a-0dd559f20669@ti.com>
Date:   Thu, 5 Mar 2020 18:29:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200224100037.GK3494@dell>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/24/20 4:00 AM, Lee Jones wrote:
> On Mon, 27 Jan 2020, Suman Anna wrote:
> 
>> The DT node full name is currently being used in regmap_config
>> which in turn is used to create the regmap debugfs directories.
>> This name however is not guaranteed to be unique and the regmap
>> debugfs registration can fail in the cases where the syscon nodes
>> have the same unit-address but are present in different DT node
>> hierarchies. Replace this logic using the syscon reg resource
>> address instead (inspired from logic used while creating platform
>> devices) to ensure a unique name is given for each syscon.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> v2: Fix build warning reported by kbuild test bot
>> v1: https://patchwork.kernel.org/patch/11346363/
>>
>>  drivers/mfd/syscon.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Waiting for Arnd to review.
> 

Hi Arnd,

Gentle ping, any comments?

regards
Suman

