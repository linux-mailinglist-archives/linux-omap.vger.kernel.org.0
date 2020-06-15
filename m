Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178381F9BE6
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jun 2020 17:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730461AbgFOPWW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 11:22:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44302 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730276AbgFOPWW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Jun 2020 11:22:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FFMDxd017087;
        Mon, 15 Jun 2020 10:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592234533;
        bh=lFphuT9/fLqmMX5KQS/n4x1iHwg2iEXgSdymwnDbOug=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=luIhE+PLABzCVoOJA+VA5MPTSccrDdsmqbNpKI4mP/b4uHjeb5ee0bPTAwADd1lx1
         lvHCLa2lILwuSrHBKNoVPt4z/asl9mrJlrRrnG/kxt74hbN65nR6GqoFdsmEqNPgyO
         /pn0WA6uvxcX98O2IUYW2OCgCtmezfcdhG8cSTYY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FFMDFR015782;
        Mon, 15 Jun 2020 10:22:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 10:22:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 10:22:12 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FFMBRB075950;
        Mon, 15 Jun 2020 10:22:11 -0500
Subject: Re: [PATCH] ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode
To:     Drew Fustini <drew@beagleboard.org>
CC:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
References: <20200611220951.GA3355634@x1>
 <10637da2-8751-3c6f-cf1e-f0a53cca292d@ti.com> <20200615124506.GA3833448@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <6a7eb03a-933b-0f04-a42d-a457f3fa1d9f@ti.com>
Date:   Mon, 15 Jun 2020 18:22:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615124506.GA3833448@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 15/06/2020 15:45, Drew Fustini wrote:
> On Mon, Jun 15, 2020 at 12:34:57PM +0300, Grygorii Strashko wrote:
>>
>>
>> On 12/06/2020 01:09, Drew Fustini wrote:
>>> Since commit cd28d1d6e52e ("net: phy: at803x: Disable phy delay for
>>> RGMII mode") the networking is broken on the BeagleBone AI which has
>>> the AR8035 PHY for Gigabit Ethernet [0].  The fix is to switch from
>>> phy-mode = "rgmii" to phy-mode = "rgmii-rxid".
>>>
>>> Note: Grygorii Strashko made a similar phy-mode fix in 820f8a870f65 for
>>> other AM5729 boards.
>>
>> commit ref is incorrect
> 
> Do you mean commit ref 820f8a870f65 ?
> ("ARM: dts: am57xx: fix networking on boards with ksz9031 phy")
> 
> I thought it made sense to point to that commit as you seemed to be
> fixing a very similar issue, just for a different phy.

Yes. but you should use proper format for commit ref:
commit <12+ chars of sha1> (\"<title line>\")'

checkpatch should warn you.




-- 
Best regards,
grygorii
