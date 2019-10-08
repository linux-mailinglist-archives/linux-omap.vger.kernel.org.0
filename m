Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0CACF466
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 10:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbfJHIBX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 04:01:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40120 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730209AbfJHIBW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 04:01:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9880p9t036430;
        Tue, 8 Oct 2019 03:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570521651;
        bh=FWioGr4ELPedw5yLZN0glAJiCpBKMpmwpEpTET1yGIo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=B1x/ldCxB66ZUpuPJpUxmtRWsYrHRxba1ZKSxMLWf4ptaPhgOrzD7JbWIF7S3k8Vt
         w1/Wx8AKYuna+bZlw7Zn5+sUT5iFry61bAKz3yzEv6JTLia0gnafFqiphxtzDO3fgX
         gg9buOmxgbSCKqsS7CdG5krErXbRUiTICD3b4FUw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9880pjA000674
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 03:00:51 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 03:00:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 03:00:50 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9880k2A084775;
        Tue, 8 Oct 2019 03:00:47 -0500
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Adam Ford <aford173@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?UTF-8?Q?Filip_Matijevi=c4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        <kernel@pyra-handheld.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, <maemo-leste@lists.dyne.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com>
 <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
 <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
 <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
 <20191007155252.GQ5610@atomide.com>
 <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com>
 <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com>
Date:   Tue, 8 Oct 2019 11:00:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com>
Content-Type: multipart/mixed;
        boundary="------------7ED48B5A386B4ABAF462F2A2"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--------------7ED48B5A386B4ABAF462F2A2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2019 22:24, H. Nikolaus Schaller wrote:
> Hi Tero,
> 
>> Am 07.10.2019 um 21:18 schrieb Tero Kristo <t-kristo@ti.com>:
>>
>> On 07/10/2019 18:52, Tony Lindgren wrote:
>>> Hi,
>>> * H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
>>> Please try with Tero's current github branch at github.com/t-kristo/linux-pm.git
>>> 5.4-rc1-ipc from few days ago, the earlier versions had still issues.
>>
>> Yeah, this one should be fixed now.
> 
> Ok! Will try asap.
> 
>>
>>>> * OMAP5 (Pyra): fails to enable the clocks (did work with the previous version)
>>>> [  304.140363] clock-controller:clk:0000:0: failed to enable
>>>> [  304.147388] PVR_K:(Error): EnableSGXClocks: pm_runtime_get_sync failed (16)
>>> Hmm no idea what might be up with this one. Did some clkctrl clock
>>> fixes maybe cause a regression here? Tero do you have any ideas?
>>
>> So, this one I am not too sure, I haven't looked at omap5 graphics clocking. I don't think it has anything to do with reset handling though.
>>
>> Is there some simple way to try this out on board; without PVR module that is?
> 
> Yes, I have also seen it when just running the commands in the original commit message [1]:
> 
> # echo on > $(find /sys -name control | grep \/5600)
> # rwmem 0x5600fe00	# OCP Revision
> 0x5600fe00 = 0x40000000
> # echo auto > $(find /sys -name control | grep \/5600)
> # rwmem 0x5600fe10
> # rwmem 0x56000024
> 
> But I have not yet tested with 5.4-rc2, just 5.4-rc1.

Ok, there is a one liner DTS data fix for this issue, attached.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--------------7ED48B5A386B4ABAF462F2A2
Content-Type: text/x-patch;
	name="0001-ARM-dts-omap5-fix-gpu_cm-clock-provider-name.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-ARM-dts-omap5-fix-gpu_cm-clock-provider-name.patch"

From 57f9fecb167c0ef9f1ae2a1aa93a05ca8add52a2 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Tue, 8 Oct 2019 10:56:42 +0300
Subject: [PATCH 1/1] ARM: dts: omap5: fix gpu_cm clock provider name

The clkctrl code searches for the parent clockdomain based on the name
of the CM provider node. The introduction of SGX node for omap5 made
the node name for the gpu_cm to be clock-controller. There is no
clockdomain named like this, so the lookup fails. Fix by changing
the node name properly.

Fixes: 394534cb07d8 ("ARM: dts: Configure sgx for omap5")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
index 939ec7dfc366..db9885103099 100644
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -1160,7 +1160,7 @@
 		};
 	};
 
-	gpu_cm: clock-controller@1500 {
+	gpu_cm: gpu_cm@1500 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1500 0x100>;
 		#address-cells = <1>;
-- 
2.17.1


--------------7ED48B5A386B4ABAF462F2A2--
