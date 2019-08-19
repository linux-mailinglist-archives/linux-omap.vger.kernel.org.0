Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69DC091FCF
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 11:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfHSJRc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 05:17:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45900 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbfHSJRc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 05:17:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J9HSst088485;
        Mon, 19 Aug 2019 04:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566206248;
        bh=prR8qDp+rNmaZd7/JHYj4GbUFH/B/KbxOEvT8xu4Q7A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aaa+nb0qKt8TgoCItrtorHjpsHf8TZrHbBj8si4cwasCK3Q6mhoolz4LEZwF1yQ2q
         grEozliQJ4D9fNwi6/1VrIpZYZXLSMxNMvlerB0e1pCd5Qptb7u1ZJ0CAOTPaHpJZg
         m6Ha/dVrfLPfnKCUVXqJOx7yCs+4ZONC+WGz+CtE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J9HSRU042870
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 04:17:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 04:17:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 04:17:25 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J9HNvm130587;
        Mon, 19 Aug 2019 04:17:24 -0500
Subject: Re: [PATCH 0/3] clk: ti: couple of fixes towards 5.4
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <20190807222514.059A0214C6@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <ae4d9e95-e56b-3641-c167-567f83ebff93@ti.com>
Date:   Mon, 19 Aug 2019 12:17:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807222514.059A0214C6@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2019 01:25, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-08-07 06:04:36)
>> Hi,
>>
>> Here are some TI clock fixes which can be queued for 5.4. These are
>> needed for getting remoteproc functionality working properly, as these
>> depend on reset handling also and timing out with clocks is bad for
>> them. The timer clock alias fix is needed for the same, as remoteprocs
>> depend on certain HW timers for their functionality.
>>
> 
> Looks ok to me. Are you going to add Fixes tags to any? Should I expect
> a PR or you want me to pick them up directly?

Either way is fine, let me resolve the comments from Suman before 
proceeding with these.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
