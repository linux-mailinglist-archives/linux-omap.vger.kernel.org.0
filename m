Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7300B23D461
	for <lists+linux-omap@lfdr.de>; Thu,  6 Aug 2020 02:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgHFAJg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 20:09:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47106 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgHFAJg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 20:09:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 075C8WYJ052997;
        Wed, 5 Aug 2020 07:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596629312;
        bh=bYN9YMMfBLPwBNbNiYnHPFmJhdJUzDpSUVoYpTUh52w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sWPzE31G5P5hKsv4rPXlmqJQQKC22yKVKcccDOeadD4omqWsXpF2dUqmKrdFtNGTH
         kGY5VBA2rk24Uhq1tnu6rSYDUEgOJz8w1IwVoEyyZvnPv/Qj4trMrJTb+L6nDnl1l6
         V8bHHuk3s6t6Dw8ZfPEoB722KezljuhKEou0moQc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 075C8W7u095378
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Aug 2020 07:08:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 5 Aug
 2020 07:08:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 5 Aug 2020 07:08:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 075C8Tt9037679;
        Wed, 5 Aug 2020 07:08:30 -0500
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, <kernel@pyra-handheld.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
References: <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
 <20200724012411.GJ21353@pendragon.ideasonboard.com>
 <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
 <20200801232259.hitcfosiq6f2i57y@earth.universe>
 <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
 <20200805112831.akufm5wxkwqehiff@earth.universe>
 <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com>
Date:   Wed, 5 Aug 2020 15:08:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/08/2020 14:49, H. Nikolaus Schaller wrote:
> Hi,
> 
>> Am 05.08.2020 um 13:28 schrieb Sebastian Reichel <sebastian.reichel@collabora.com>:
>>
>> Hi,
>>
>> On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus Schaller wrote:
>>> What I do not yet understand is how Laurent's patch should be able
>>> to break it.
>>
>> omapdrm will not probe successfully if any DT enabled component
>> does not probe correctly. Since the patch you identified touched
>> HDMI and VENC and you are probably using HDMI, I suggest looking
>> there first.
> 
> Yes, that is a very good explanation.
> 
> Maybe there is a subtle change in how the HDMI connector has to be defined
> which is missing in our (private) DTB. Maybe the OMAP5-uEVM DTS gives a hint.
> 
> A quick check shows last hdmi specific change for omap5-board-common or uevm
> was in 2017 but I may have missed something.
> 
> There are 715a5a978733f0 and 671ab615bd507f which arrived in v5.7-rc1 as well
> and are related to hdmi clocks. So this may be (or not) and influencing factor.

HDMI should "just work", and has been tested. But maybe there's some conflict with HDMI and DSI.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
