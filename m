Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40126C9AC5
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 11:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfJCJb6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 05:31:58 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42348 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728743AbfJCJb6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Oct 2019 05:31:58 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x939Vrnj054353;
        Thu, 3 Oct 2019 04:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570095113;
        bh=P9zTt6JVcLBVKsSp0EGZr4X1HHOjTST4nbJcuG2gmb0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ws2T/1ygmfuTnYSc0i15+fJsvQsMVPI1/XArSZ/lUPr90FyyLlP9GMblLFbXCfoL7
         nWup/dphJ872DsMqfjVZ2qGwTXdBUItyAS9ZJN1x+rf1ykG2NArC+pXUhHp7IUdPd4
         nQIW+2PJFqlf3Y3ShmGDC7NdoPHpvmGr4YK5kZLw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x939VrZ1082190
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Oct 2019 04:31:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 04:31:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 04:31:42 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x939VpeZ102890;
        Thu, 3 Oct 2019 04:31:51 -0500
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
To:     Jeroen Hofstee <jhofstee@victronenergy.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Koen Kooi <koen@dominion.thruhere.net>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
Date:   Thu, 3 Oct 2019 12:31:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 03/10/2019 11:16, Jeroen Hofstee wrote:
> Hello Grygorri,
> 
> On 10/2/19 4:48 PM, Grygorii Strashko wrote:
>>
>>
>> On 02/10/2019 12:54, Jeroen Hofstee wrote:
>>> cd28d1d6e52e: ("net: phy: at803x: Disable phy delay for RGMII mode")
>>> broke
>>> the ethernet networking on the beaglebone enhanced.
>>
>> Above commit is incorrect (by itself) and there are few more commits
>> on top of
>> it, so pls. update reference to commit(s)
>>
>> bb0ce4c1517d net: phy: at803x: stop switching phy delay config needlessly
>> 6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode
>>
>>
> I don't see why that is relevant. The mention patch introduces a
> backwards incompatibility for the device tree. 

Pls read https://patchwork.kernel.org/patch/10773389/
The patch you've mentioned here is buggy by itself and not related to your
fix, but final at803x behavior actually defined by above two commits.

I've posted this commit because I was confused when i've checked commit you referenced.

The patches you
> mention don't fix that and hence are unrelated to this patch.

No. but they define new at803x behavior which is:
After commits (see above) at803x driver disable RX RGMII delay
if phy-mode = "rgmii-txid"
or will disable TX RGMII delay
if phy-mode = "rgmii-rxid"

Before above commits, the at803x driver was keeping RX or TX RGMII delay setting
untouched as per bootloader or bootstraping configuration for "rgmii-txid"/"rgmii-rxid".

> 
> Furthermore 4.19 is fine, so there is no need to include it in stable
> and have a note to make sure also other patches are required etc.

Hence all above patches went in 5.1 it would be correct to mention only
6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode

-- 
Best regards,
grygorii
